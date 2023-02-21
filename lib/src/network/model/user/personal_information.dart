import 'package:freezed_annotation/freezed_annotation.dart';

part 'personal_information.freezed.dart';
part 'personal_information.g.dart';

@Freezed(copyWith: true)
class PersonalInformation with _$PersonalInformation {
  const factory PersonalInformation({
    String? gender,
    @JsonKey(name: 'phone_number') String? phoneNumber,
    @JsonKey(name: 'place_of_birth') String? placeOfBirth,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
  }) = _PersonalInformation;

  const PersonalInformation._();

  factory PersonalInformation.fromJson(Map<String, dynamic> map) =>
      _$PersonalInformationFromJson(map);
}
