import 'package:freezed_annotation/freezed_annotation.dart';

part 'role.freezed.dart';
part 'role.g.dart';

@freezed
class Role with _$Role {
  const factory Role({
    required String name,
  }) = _Role;

  const Role._();

  factory Role.fromJson(Map<String, dynamic> map) => _$RoleFromJson(map);
}
