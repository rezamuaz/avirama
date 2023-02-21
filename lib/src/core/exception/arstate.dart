library arstate;

import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/core/api/state_content_type.dart';
import 'package:absensi_app/src/core/api/state_wrapper_argument.dart';
import 'package:absensi_app/src/dialogs/state_wrapper_widget.dart';
import 'package:absensi_app/widgets/common/preload_lottie_asset.dart';
import 'package:absensi_app/widgets/messages/en_messages.dart';
import 'package:absensi_app/widgets/messages/id_messages.dart';
import 'package:absensi_app/widgets/messages/lookupmessages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../gen/assets.gen.dart';
part 'network_exception_extension.dart';

String _default = 'en';

Map<String, LookupMessages> _lookupMessagesMap = {
  'en': EnMessages(),
  'id': IdMessages(),
};

/// Sets the default [locale]. By default it is `en`.
///
/// Example
/// ```
/// setLocaleMessages('fr', FrMessages());
/// setDefaultLocale('fr');
/// ```
void setDefaultLocale(String locale) {
  assert(_lookupMessagesMap.containsKey(locale),
      '[locale] must be a registered locale');
  _default = locale;
}

/// Sets a [locale] with the provided [lookupMessages] to be available when
/// using the [format] function.
///
/// Example:
/// ```dart
/// setLocaleMessages('fr', FrMessages());
/// ```
///
/// If you want to define locale message implement [LookupMessages] interface
/// with the desired messages
///
void setLocaleMessages(String locale, LookupMessages lookupMessages) {
  _lookupMessagesMap[locale] = lookupMessages;
}

LookupMessages get lookupMessages {
  if (_lookupMessagesMap[_default] == null) {
    if (kDebugMode) {
      print(
        "Locale has not been added, using [$_default] as fallback. To add a locale use [setLocaleMessages]",
      );
    }
  }
  return _lookupMessagesMap[_default] ?? EnMessages();
}

class StateWidget extends StatelessWidget {
  const StateWidget({Key? key, required this.args}) : super(key: key);

  final StateWrapperArgument args;

  static Widget success({
    String? title,
    String? message,
    String? buttonLabel,
    VoidCallback? onButtonTap,
    StateWrapperArgument? args,
  }) {
    return StateWrapperWidget(
      args: (args ??= const StateWrapperArgument()).copyWith(
        title: title ?? args.title ?? lookupMessages.success(),
        description: message ?? args.description,
        buttonLabel: buttonLabel ?? args.buttonLabel ?? lookupMessages.back(),
        onButtonTap: onButtonTap ?? args.onButtonTap,
        iconWidth: args.iconWidth ?? double.infinity,
        icon: XPreloadLottieAsset(
          lottiePath: Assets.lotties.success,
          package: 'arstate',
        ),
      ),
    );
  }

  static Widget error({
    dynamic error,
    String? title,
    String? message,
    VoidCallback? onRetry,
    StateContentType? stateContentType,
    StateWrapperArgument? args,
    Widget? icon,
  }) {
    if (error is NetworkExceptions) {
      title = title ??= error.message();
      message = message ??= error.messageDescription();
      icon = icon ??= error.icon();
    }

    return StateWrapperWidget(
      args: (args ??= const StateWrapperArgument()).copyWith(
        stateContentType: stateContentType ?? args.stateContentType,
        title: title ?? args.title ?? lookupMessages.somethingWhenWrong(),
        description: message ?? args.description,
        onButtonTap: onRetry ?? args.onButtonTap,
        icon: icon,
      ),
    );
  }

  static Widget noData({
    String? title,
    VoidCallback? onRetry,
    StateWrapperArgument? args,
  }) {
    return StateWrapperWidget(
      args: (args ??= const StateWrapperArgument()).copyWith(
        titlePositionOnTop: true,
        title: title ?? args.title ?? lookupMessages.noData(),
        color: args.color ?? const Color(0xFFADB3BC),
        onButtonTap: onRetry ?? args.onButtonTap,
        icon: XPreloadLottieAsset(
          lottiePath: Assets.lotties.noData,
          package: 'arstate',
        ),
      ),
    );
  }

  static Widget noResult({
    String? title,
    VoidCallback? onButtonTap,
    StateWrapperArgument? args,
  }) {
    return StateWrapperWidget(
      args: (args ??= const StateWrapperArgument()).copyWith(
        titlePositionOnTop: true,
        title: title ?? args.title ?? lookupMessages.noResult(),
        color: args.color ?? const Color(0xFFADB3BC),
        onButtonTap: onButtonTap ?? args.onButtonTap,
        icon: XPreloadLottieAsset(
          lottiePath: Assets.lotties.noResult,
          package: 'arstate',
        ),
      ),
    );
  }

  static Widget searching({
    String? title,
    VoidCallback? onButtonTap,
    StateWrapperArgument? args,
  }) {
    return StateWrapperWidget(
      args: (args ??= const StateWrapperArgument()).copyWith(
        titlePositionOnTop: true,
        title: title ?? args.title ?? lookupMessages.searching(),
        color: args.color ?? const Color(0xFFADB3BC),
        icon: XPreloadLottieAsset(
          lottiePath: Assets.lotties.searching,
          package: 'arstate',
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return StateWrapperWidget(
      args: args,
    );
  }
}
