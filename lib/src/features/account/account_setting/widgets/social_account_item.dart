import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/utils/string_extension.dart';
import 'package:absensi_app/widgets/common/preload_lottie_asset.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../../../../gen/assets.gen.dart';
import '../../../../dialogs/alert_wrapper.dart';
import '../../../../localization/localization_utils.dart';
import '../../../../network/model/account_setting/social_account/social_account.dart';
import '../../../../theme/colors.dart';
import '../logic/account_setting_bloc.dart';

class XSocialAccountItem extends StatefulWidget {
  const XSocialAccountItem(
      {Key? key, required this.socialAccount, this.separatorPadding})
      : super(key: key);

  final SocialAccount socialAccount;
  final EdgeInsetsGeometry? separatorPadding;

  @override
  State<XSocialAccountItem> createState() => _XSocialAccountItemState();
}

class _XSocialAccountItemState extends State<XSocialAccountItem> {
  @override
  Widget build(BuildContext context) {
    final String createdAtFormated = DateFormat.yMMMd()
        .format(DateTime.parse(widget.socialAccount.createdAt))
        .toString();

    return Padding(
      padding: widget.separatorPadding ?? EdgeInsets.zero,
      child: Row(
        children: [
          _buildItemIcon(widget.socialAccount.provider),
          const SizedBox(width: Constants.kPaddingS),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.socialAccount.provider.capitalize()} | ${widget.socialAccount.name}",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  createdAtFormated,
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontSize: Constants.kFontSizeS,
                        color: XColors.grey_80,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(width: Constants.kPaddingS),
          IconButton(
            tooltip: S.text.common_delete,
            onPressed: () => _deleteConfirmation(),
            icon: const Icon(
              Icons.delete,
              color: XColors.grey_60,
              size: Constants.kFontSizeL,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteConfirmation() async {
    bool alertConfirmation = await XAlert.onWillPop(
      S.text.are_you_sure_to_delete,
    );

    if (alertConfirmation) _delete();
  }

  void _delete() {
    context.read<AccountSettingBloc>().add(
          AccountSettingEvent.deleteSocialAccount(
            widget.socialAccount.id,
          ),
        );
  }

  Widget _buildItemIcon(name) {
    switch (name) {
      case 'google':
        return SizedBox(
          width: Constants.kFontSizeXX,
          child: XPreloadLottieAsset(lottiePath: Assets.lotties.googleLogo),
        );
      default:
        return const Icon(
          Icons.question_mark_outlined,
          size: Constants.kFontSizeXX,
          color: XColors.grey_60,
        );
    }
  }
}
