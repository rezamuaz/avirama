import 'package:freezed_annotation/freezed_annotation.dart';

part 'phone_number_request.freezed.dart';
part 'phone_number_request.g.dart';

@freezed
class PhoneNumberRequest with _$PhoneNumberRequest {
  const factory PhoneNumberRequest({
    @JsonKey(name: "firebase_verify_id_token")
        required String firebaseVerifyIdToken,
  }) = _PhoneNumberRequest;

  const PhoneNumberRequest._();

  factory PhoneNumberRequest.fromJson(Map<String, dynamic> map) =>
      _$PhoneNumberRequestFromJson(map);
}
