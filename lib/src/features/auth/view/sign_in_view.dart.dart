import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:absensi_app/src/core/api/error_response_message.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/dialogs/flash_message_wrapper.dart';
import 'package:absensi_app/src/dialogs/toast_wrapper.dart';
import 'package:absensi_app/src/utils/dismiss_keyboard.dart';
import 'package:absensi_app/src/utils/log_utils.dart';
import 'package:absensi_app/widgets/button/button.dart';
import 'package:absensi_app/widgets/common/text_divider.dart';
import 'package:absensi_app/widgets/forms/input.dart';
import 'package:absensi_app/src/core/exception/arstate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validator/form_validator.dart';
import 'package:logger/logger.dart';
import 'package:unique_identifier/unique_identifier.dart';

import '../../../localization/localization_utils.dart';
import '../../../network/model/auth/sign_in/sign_in.dart';
import '../../../network/model/user/user.dart';
import '../../../router/auto_router.gr.dart';
import '../../../router/coordinator.dart';
import '../../../theme/colors.dart';
import '../common/expand_size.dart';
import '../logic/auth_bloc.dart';
import '../router/auth_router.dart';
import '../widget/custom_auth_scaffold.dart';
import '../widget/dont_have_account.dart';
// import '../widget/sign_in_with_google_button.dart';
// import '../widget/sign_in_with_phone_number_button.dart';

class SignInView extends StatefulWidget {
  const SignInView({Key? key, this.onResult}) : super(key: key);

  final Function(bool)? onResult;

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  ErrorResponseMessage? _error;
  String? imei = '';

  final _emailController = TextEditingController();
  final _emailValidator = ValidationBuilder().required().email().build();

  final _passwordController = TextEditingController();
  final _passwordValidator =
      ValidationBuilder().required().minLength(8).build();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _authBlocListener(BuildContext context, AuthState state) {
    state.whenOrNull(
      isError: (e) => _onRequestError(e),
      loggedIn: (u) => _onLoggedIn(u),
    );
  }

  void _onRequestError(NetworkExceptions e) {
    _passwordController.text = '';
    e.maybeWhen(
      orElse: () => FlashMessage.error(context: context, error: e),
      unprocessableEntity: (m) => _error = m,
    );
  }

  void _onLoggedIn(User? user) {
    if (!isNullOrEmpty(user)) {
      XToast.show(S.text.you_have_successfully_logged_in_as(user!.name));
    }

    widget.onResult?.call(true);

    final router = XCoordinator.rootRouter;
    if (router.canNavigateBack) {
      // remove route auth
      router.pop();
    } else {
      showHome();
    }
  }

  Future<bool> _onWillPop() async {
    if (isNullOrEmpty(widget.onResult)) {
      return true;
    } else {
      showHome();
      return false;
    }
  }

  void showHome() {
    XCoordinator.rootRouter.replaceAll([const DashboardRouter()]);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: CustomAuthScaffold(
        appLogo: true,
        description: S.text.sign_in_to_your_account,
        child: BlocConsumer<AuthBloc, AuthState>(
          listener: _authBlocListener,
          builder: (context, state) {
            return Column(
              children: [
                _form(context, state),
                _signInButton(state),
                XTextDivider(
                  text: S.text.or,
                  vertical: Constants.kPaddingL,
                ),
                // XSignInWithGoogleButton(
                //   isLoading: state.maybeWhen(
                //     isLoading: () => true,
                //     orElse: () => false,
                //   ),
                // ),
                // const SizedBox(height: Constants.kPaddingM),
                // XSignInWithPhoneNumberButton(
                //   isLoading: state.maybeWhen(
                //     isLoading: () => true,
                //     orElse: () => false,
                //   ),
                // ),
                const SizedBox(height: Constants.kPaddingL),
                const XDontHaveAccount(),
                Text(
                  "$imei",
                  style: Theme.of(context).textTheme.bodyText2?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                ),
                TextButton(
                  onPressed: () async {
                    if (imei!.isEmpty) {
                      imei = await UniqueIdentifier.serial;
                      setState(() {});
                    } else {
                      Clipboard.setData(ClipboardData(text: "$imei")).then((_) {
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                                content: Text('Copied to your clipboard !')));
                      });
                    }
                  },
                  child: Text(
                    (imei!.isEmpty) ? "Cek Imei" : "Copy",
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: XAppColors.primary,
                        ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Form _form(BuildContext context, AuthState state) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          SizedBox(height: expandedSize(context)),
          XInputCustom(
            labelText: S.text.field_email,
            prefixIcon: Icons.email,
            controller: _emailController,
            errorText: _error.message("email"),
            keyboardType: TextInputType.emailAddress,
            validator: _emailValidator,
            textInputAction: TextInputAction.next,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          const SizedBox(
            height: Constants.kPaddingL,
          ),
          XInputCustom(
            labelText: S.text.field_password,
            prefixIcon: Icons.password_rounded,
            controller: _passwordController,
            errorText: _error.message("password"),
            keyboardType: TextInputType.visiblePassword,
            validator: _passwordValidator,
            obscureText: true,
            readOnly: state.maybeWhen(
              isLoading: () => true,
              orElse: () => false,
            ),
          ),
          _forgotPassword(context),
          SizedBox(
            height: expandedSize(context) -
                (Theme.of(context).textTheme.bodyText2?.fontSize ?? 0),
          ),
        ],
      ),
    );
  }

  Widget _forgotPassword(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton(
          onPressed: () => XCoordinator.rootRouter.pushNamed(
            AuthRouters.forgotPassword,
          ),
          child: Text(
            S.text.forgot_password,
            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                  color: XAppColors.primary,
                ),
          ),
        ),
      ],
    );
  }

  XButton _signInButton(AuthState state) {
    return XButton(
      onPressed: () => _onButtonSignInPress(context),
      busy: state.maybeWhen(
        isLoading: () => true,
        orElse: () => false,
      ),
      title: S.text.sign_in,
    );
  }

  void _onButtonSignInPress(BuildContext context) {
    UniqueIdentifier.serial.then((value) {
      hideKeyboard(context);
      if (_formKey.currentState!.validate()) {
        _error = null;
        final requests = SignIn(
          email: _emailController.text.toString(),
          password: _passwordController.text.toString(),
          imei: value ?? '',
        );

        context.read<AuthBloc>().add(
              AuthEvent.signIn(requests),
            );
      }
    });
  }
}
