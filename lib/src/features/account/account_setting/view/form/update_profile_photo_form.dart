import 'dart:io';

import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/widgets/image/cache_network_image.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../../widgets/common/bottom_select_option.dart';
import '../../../../../../widgets/common/bottom_sheet.dart';
import '../../../../../config/constants/keys.dart';
import '../../../../../localization/localization_utils.dart';
import '../../../../../network/model/user/user.dart';
import '../../../../../services/auth_service.dart';
import '../../../../../theme/colors.dart';
import '../../logic/account_setting_bloc.dart';

class UpdateProfilePhotoForm extends StatefulWidget {
  const UpdateProfilePhotoForm({Key? key}) : super(key: key);

  @override
  State<UpdateProfilePhotoForm> createState() => _UpdateProfilePhotoFormState();
}

class _UpdateProfilePhotoFormState extends State<UpdateProfilePhotoForm> {
  late String profilePhotoUrl;
  late User user;
  final GetStorage box = GetStorage();

  final _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    user = Auth.instance.user as User;
    profilePhotoUrl = user.profilePhotoUrl ?? Constants.defaultProfilePhotoUrl;
  }

  void _blocListener(BuildContext context, AccountSettingState state) {
    state.whenOrNull(
      isError: (e) => FlashMessage.error(context: context, error: e),
      successUpdateProfilePhoto: (imagePath) => _onSuccess(context, imagePath),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AccountSettingBloc, AccountSettingState>(
      listener: _blocListener,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: Constants.kPaddingL,
            vertical: Constants.kPaddingL,
          ),
          child: _form(context, state),
        );
      },
    );
  }

  void _showPickerOptions(BuildContext context) {
    hideKeyboard(context);
    XBottomSelectOption.show(
      items: [
        XBottomSelectOptionItem(
          icon: Icons.photo_library,
          label: S.text.gallery,
          onTap: () => _getImage(source: ImageSource.gallery),
        ),
        XBottomSelectOptionItem(
          icon: Icons.camera_alt,
          label: S.text.camera,
          onTap: () => _getImage(source: ImageSource.camera),
        ),
      ],
    );
  }

  Future<void> _getImage({required ImageSource source}) async {
    try {
      final XFile? pickedFile = await _picker.pickImage(source: source);
      if (pickedFile != null) {
        final File? croppedFile = await _cropPhoto(pickedFile);
        if (croppedFile != null) {
          if (mounted) {
            _onButtonConfirmPress(croppedFile.path);
          }
        }
      }
    } on PlatformException catch (_) {
      FlashMessage.error(context: context);
    } catch (e) {
      XToast.show(e.toString());
    }
  }

  Future<File?> _cropPhoto(XFile pickedFile) async {
    final result = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.square,
      ],
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: S.text.adjust_image,
          toolbarColor: XAppColors.primary,
          activeControlsWidgetColor: XAppColors.primary,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.square,
          lockAspectRatio: true,
        )
      ],
    );

    return result != null ? File(result.path) : null;
  }

  Widget _form(BuildContext context, AccountSettingState state) {
    const double imageWidth = 120;

    return Row(
      children: [
        Stack(
          children: <Widget>[
            Hero(
              tag: "XProfilePhoto#",
              child: state.maybeWhen(
                uploadingImage: () => Shimmer.fromColors(
                  baseColor: XColors.shimmerBaseColor,
                  highlightColor: XColors.shimmerHighlightColor,
                  child: Container(
                    height: imageWidth,
                    width: imageWidth,
                    decoration: const BoxDecoration(
                      color: XColors.grey_20,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                orElse: () => ClipRRect(
                  borderRadius: BorderRadius.circular(Constants.kRadiusXL * 3),
                  child: XCacheNetworkImage(
                    size: const Size(imageWidth, imageWidth),
                    imageUrl: profilePhotoUrl,
                    shimmerShape: BoxShape.circle,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: Constants.kPaddingXS * 0.5,
              right: Constants.kPaddingXS * 0.5,
              child: state.maybeWhen(
                uploadingImage: () => const SizedBox(),
                isLoading: () => const SizedBox(),
                orElse: () => InkWell(
                  onTap: () => _showPickerOptions(context),
                  child: CircleAvatar(
                    backgroundColor: XAppColors.primary.withOpacity(0.75),
                    child: const Icon(
                      Icons.add_a_photo_outlined,
                      color: XColors.white,
                      size: Constants.kFontSizeXXL,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: Constants.kPaddingL),
        Expanded(
          child: Text(
            S.text.post_a_nice_photo,
            style: Theme.of(context).textTheme.bodyText2,
          ),
        ),
      ],
    );
  }

  void _onButtonConfirmPress(String imagePath) {
    context.read<AccountSettingBloc>().add(
          AccountSettingEvent.updateProfilePhoto(imagePath),
        );
  }

  Future<void> _onSuccess(
    BuildContext context,
    String newProfilePhotoUrl,
  ) async {
    profilePhotoUrl = newProfilePhotoUrl;

    await XBottomSheet.show(
      StateWidget.success(
        message: S.text.your_profile_photo_has_been_updated,
        buttonLabel: S.text.common_back,
        onButtonTap: () {
          XBottomSheet.hide();
          context.router.navigateBack();
        },
      ),
    );

    GetStorage().write(
      XKeys.userData,
      user.copyWith(profilePhotoUrl: newProfilePhotoUrl),
    );
  }
}
