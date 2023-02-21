import 'package:freezed_annotation/freezed_annotation.dart';

part 'link.freezed.dart';

part 'link.g.dart';

@freezed
class Link with _$Link {
  const factory Link({
    String? first,
    String? last,
    String? prev,
    String? next,
  }) = _Link;

  const Link._();

  factory Link.fromJson(Map<String, dynamic> map) => _$LinkFromJson(map);
}
