// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'error_response_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ErrorResponseMessage _$$_ErrorResponseMessageFromJson(
        Map<String, dynamic> json) =>
    _$_ErrorResponseMessage(
      message: json['message'] as String?,
      errors: json['errors'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$_ErrorResponseMessageToJson(
        _$_ErrorResponseMessage instance) =>
    <String, dynamic>{
      'message': instance.message,
      'errors': instance.errors,
    };
