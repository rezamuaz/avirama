import 'dart:developer';
import 'dart:io';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/features/attendance/bloc/attendance_bloc.dart';
import 'package:absensi_app/src/features/attendance/view/watermark_foto_view.dart';
import 'package:absensi_app/src/network/model/attendance/attendance.dart';
import 'package:absensi_app/src/theme/colors.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:logger/logger.dart';
import '../../../../gen/assets.gen.dart';
import '../../../../widgets/common/bottom_select_option.dart';
import '../../../../widgets/common/card.dart';
import '../../../localization/localization_utils.dart';
import '../../../network/model/activity/activity.dart';
import '../../../router/auto_router.gr.dart';
import '../../../router/coordinator.dart';

class AddPhotoBeforeAfterView extends StatefulWidget {
  const AddPhotoBeforeAfterView({super.key, required this.attendance});
  final Attendance attendance;
  @override
  State<AddPhotoBeforeAfterView> createState() =>
      _AddPhotBeforeAfterViewState();
}

class _AddPhotBeforeAfterViewState extends State<AddPhotoBeforeAfterView> {
  bool isGetInRange = false;
  bool toogleRefresh = false;
  final _picker = ImagePicker();
  String? imagePath;
  XFile? pickedFile;
  int? beforeAfterEntity;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    context.read<BeforeAfterPhotoBloc>().add(
          AttendanceEvent.showBeforeAfter(
            widget.attendance.id,
          ),
        );
  }

  void _showPickerOptions(BuildContext context) {
    XBottomSelectOption.show(
      items: [
        XBottomSelectOptionItem(
          icon: Icons.camera_alt,
          label: S.text.camera,
          onTap: () => _getImage(source: ImageSource.camera),
        ),
      ],
    );
  }

  Future<File?> _cropPhoto(XFile pickedFile) async {
    final result = await ImageCropper().cropImage(
      sourcePath: pickedFile.path,
      aspectRatioPresets: [
        CropAspectRatioPreset.ratio4x3,
      ],
      compressQuality: 70,
      maxWidth: 700,
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

  void _goToView(PageRouteInfo<dynamic> route) {
    XCoordinator.rootRouter.pop(route);
  }

  void _goToAttendanceReview() {
    if (imagePath == null) return;
    _goToView(AttendanceReviewRoute(attendance: widget.attendance));
  }

  void _onButtonConfirmPress(String photoPath) async {
    log('confirmed s');

    String description = 'before after';
    beforeAfterEntity! + 1;
    if (beforeAfterEntity != null) {
      if (beforeAfterEntity! % 2 == 0) {
        description =
            'before ${beforeAfterEntity! + (1 - beforeAfterEntity! ~/ 2)}';
      } else {
        description =
            'after ${beforeAfterEntity! + (1 - beforeAfterEntity! ~/ 2) - 1}';
      }
    }
    log('desx $description');
    // return;
    context.read<BeforeAfterPhotoBloc>().add(
          AttendanceEvent.addFotoBeforeAfter(
            widget.attendance.id,
            photoPath,
            description,
          ),
        );
    Future.delayed(const Duration(seconds: 5))
        .then((value) => {_goToAttendanceReview()});
    imagePath = photoPath;
  }

  void onRefresh() {
    context.read<BeforeAfterPhotoBloc>().add(
          AttendanceEvent.showBeforeAfter(widget.attendance.id),
        );
  }

  Future<void> _getImage(
      {required ImageSource source, bool mounted = true}) async {
    try {
      pickedFile = await _picker.pickImage(
          source: source,
          preferredCameraDevice: CameraDevice.rear,
          maxWidth: 700,
          maxHeight: 700);
      if (pickedFile != null) {
        if (mounted) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (_) => WaterMarkFotoView(
                      pickedFile!.path,
                      widget.attendance.outlet,
                      (beforeAfterEntity! % 2 == 0)
                          ? "FOTO BEFORE"
                          : "FOTO AFTER"))).then((value) {
            if (value != null && value == true) {
              _onButtonConfirmPress(pickedFile!.path);
            }
          });
        }
      }
    } on PlatformException catch (_) {
      FlashMessage.error(context: context);
    } catch (e) {
      XToast.show(e.toString());
    }
  }

  Future<bool> _willPopCallback() async {
    log('onwillpop');
    context
        .read<BeforeAfterPhotoBloc>()
        .add(AttendanceEvent.beforeAfterCountEvent(widget.attendance.id));
    context
        .read<BeforeAfterPhotoBloc>()
        .add(AttendanceEvent.dailyPhotoCountEvent(widget.attendance.id));
    return Future.value(true); // return true if the route to be popped
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopCallback,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Tambah foto Before After',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: XAppColors.primary,
        ),
        body: _buildBody(context),
      ),
    );
  }

  Widget _buildBody(BuildContext context) {
    return BlocBuilder<BeforeAfterPhotoBloc, AttendanceState>(
      bloc: context.read<BeforeAfterPhotoBloc>()
        ..add(
          AttendanceEvent.showBeforeAfter(widget.attendance.id),
        ),
      builder: (context, state) {
        return state.maybeWhen(
          orElse: () {
            return Container();
          },
          isLoading: () => const Center(child: CircularProgressIndicator()),
          loadedBeforeAfterPhoto: (listActivity) {
            listActivity ??= [];
            beforeAfterEntity = listActivity.length;
            return Column(
              children: [
                Expanded(
                  child: XBeforeAfterItem(
                    listActivity: listActivity,
                    showPickerOption: _showPickerOptions,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: Constants.kPaddingL,
                    vertical: 16,
                  ),
                  child: XButton(
                    onPressed: () {
                      if (listActivity!.length > 7) return;
                      _showPickerOptions(context);
                    },
                    backgroundColor: listActivity.length > 7
                        ? XAppColors.primaryLight.withOpacity(0.5)
                        : XAppColors.primaryLight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(Icons.camera_alt),
                        SizedBox(width: Constants.kPaddingS),
                        Text('Tambah Foto Before After'),
                      ],
                    ),
                  ),
                )
              ],
            );
          },
        );
      },
    );
  }
}

class XBeforeAfterItem extends StatelessWidget {
  const XBeforeAfterItem({
    super.key,
    this.listActivity,
    required this.showPickerOption,
  });
  final List<Activity>? listActivity;
  final Function(BuildContext) showPickerOption;

  @override
  Widget build(BuildContext context) {
    if (listActivity == null) {
      return GridView.builder(
        itemCount: 1,
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return XPhotoFrameItem(
            index: index,
            listActivity: listActivity!,
            showPickerOption: showPickerOption,
          );
        },
      );
    } else {
      return GridView.builder(
        itemCount: listActivity!.length + 1,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, childAspectRatio: 0.65),
        itemBuilder: (context, index) {
          return XPhotoFrameItem(
            index: index,
            listActivity: listActivity!,
            showPickerOption: showPickerOption,
          );
        },
      );
    }
  }
}

class XPhotoFrameItem extends StatelessWidget {
  const XPhotoFrameItem({
    super.key,
    required this.index,
    required this.listActivity,
    required this.showPickerOption,
  });
  final int index;
  final List<Activity> listActivity;
  final Function(BuildContext) showPickerOption;

  @override
  Widget build(BuildContext context) {
    if (index < listActivity.length) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              XCard(
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(Constants.kRadiusS),
                child: CachedNetworkImage(
                  imageUrl: listActivity[index].photo,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                bottom: 5,
                right: 20,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(Constants.kRadiusL),
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    color: Colors.blueAccent,
                    child: const Icon(
                      Icons.camera_alt_rounded,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: Constants.kPaddingXS),
          Padding(
            padding: const EdgeInsets.only(left: Constants.kPaddingL),
            child: Text(
              (index % 2 == 0)
                  ? 'Foto before ${index + (1 - index ~/ 2)}'
                  : 'Foto after ${index + (1 - index ~/ 2) - 1}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      );
    } else {
      if (listActivity.length <= 7) {
        return GestureDetector(
          onTap: () {
            showPickerOption(context);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              XCard(
                padding: EdgeInsets.zero,
                borderRadius: BorderRadius.circular(Constants.kRadiusS),
                child: Assets.svgs.noImage.svg(),
              ),
              const SizedBox(height: Constants.kPaddingXS),
              Padding(
                padding: const EdgeInsets.only(left: Constants.kPaddingL),
                child: Text(
                  (index == 0 || index % 2 == 0)
                      ? 'Foto before ${index + (1 - index ~/ 2)}'
                      : 'Foto after ${index + (1 - index ~/ 2 - 1)}',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              )
            ],
          ),
        );
      } else {
        return Container();
      }
    }
  }
}
