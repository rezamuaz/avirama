import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_profile.freezed.dart';
part 'update_profile.g.dart';

@freezed
class UpdateProfile with _$UpdateProfile {
  const factory UpdateProfile({
    required String name,
  }) = _UpdateProfile;

  const UpdateProfile._();

  factory UpdateProfile.fromJson(Map<String, dynamic> map) =>
      _$UpdateProfileFromJson(map);
}
