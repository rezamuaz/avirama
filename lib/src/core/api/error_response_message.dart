import 'package:freezed_annotation/freezed_annotation.dart';

part 'error_response_message.freezed.dart';
part 'error_response_message.g.dart';

@freezed
class ErrorResponseMessage with _$ErrorResponseMessage {
  const factory ErrorResponseMessage({
    String? message,
    Map<String, dynamic>? errors,
  }) = _ErrorResponseMessage;

  const ErrorResponseMessage._();

  factory ErrorResponseMessage.fromJson(Map<String, dynamic> map) =>
      _$ErrorResponseMessageFromJson(map);
}
