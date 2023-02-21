import 'package:form_validator/form_validator.dart';
import 'localization_utils.dart';

class XValidationLocale extends FormValidatorLocale {
  @override
  String name() => S.text.validation_name;

  @override
  String minLength(String v, int n) => S.text.validation_minLength(n);

  @override
  String maxLength(String v, int n) => S.text.validation_maxLength(n);

  @override
  String email(String v) => S.text.validation_email;

  @override
  String phoneNumber(String v) => S.text.validation_phoneNumber;

  @override
  String required() => S.text.validation_required;

  @override
  String ip(String v) => S.text.validation_ip;

  @override
  String ipv6(String v) => S.text.validation_ipv6;

  @override
  String url(String v) => S.text.validation_url;
}
