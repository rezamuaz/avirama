import 'package:freezed_annotation/freezed_annotation.dart';
part 'activity.freezed.dart';
part 'activity.g.dart';

@freezed
class ListActivity with _$ListActivity {
  const factory ListActivity({
    List<Activity>? data,
  }) = _ListActivity;
  const ListActivity._();
  factory ListActivity.fromJson(Map<String, dynamic> map) =>
      _$ListActivityFromJson(map);
}

@freezed
class Activity with _$Activity {
  const factory Activity({
    required int id,
    required String photo,
    required String description,
  }) = _Activity;
  const Activity._();
  factory Activity.fromJson(Map<String, dynamic> map) =>
      _$ActivityFromJson(map);
}

@freezed
class ActivityResult with _$ActivityResult {
  const factory ActivityResult({
    required bool status,
    required String message,
  }) = _ActivityResult;
  const ActivityResult._();
  factory ActivityResult.fromJson(Map<String, dynamic> map) =>
      _$ActivityResultFromJson(map);
}
