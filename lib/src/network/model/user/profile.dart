import 'package:freezed_annotation/freezed_annotation.dart';

part 'profile.freezed.dart';
part 'profile.g.dart';

@Freezed(copyWith: true)
class Profile with _$Profile {
  const factory Profile({
    required String name,
  }) = _Profile;

  const Profile._();

  factory Profile.fromJson(Map<String, dynamic> map) => _$ProfileFromJson(map);
}
