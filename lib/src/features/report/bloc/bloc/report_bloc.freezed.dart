// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'report_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ReportEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOutletList,
    required TResult Function(String outletId) getProductOutletList,
    required TResult Function(String jabatan) getUserReport,
    required TResult Function(Map<String, dynamic> params) sendReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOutletList,
    TResult? Function(String outletId)? getProductOutletList,
    TResult? Function(String jabatan)? getUserReport,
    TResult? Function(Map<String, dynamic> params)? sendReport,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOutletList,
    TResult Function(String outletId)? getProductOutletList,
    TResult Function(String jabatan)? getUserReport,
    TResult Function(Map<String, dynamic> params)? sendReport,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ReportEvent.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOutletList,
    required TResult Function(String outletId) getProductOutletList,
    required TResult Function(String jabatan) getUserReport,
    required TResult Function(Map<String, dynamic> params) sendReport,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOutletList,
    TResult? Function(String outletId)? getProductOutletList,
    TResult? Function(String jabatan)? getUserReport,
    TResult? Function(Map<String, dynamic> params)? sendReport,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOutletList,
    TResult Function(String outletId)? getProductOutletList,
    TResult Function(String jabatan)? getUserReport,
    TResult Function(Map<String, dynamic> params)? sendReport,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started implements ReportEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc

class _$_getOutletList implements _getOutletList {
  const _$_getOutletList();

  @override
  String toString() {
    return 'ReportEvent.getOutletList()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOutletList,
    required TResult Function(String outletId) getProductOutletList,
    required TResult Function(String jabatan) getUserReport,
    required TResult Function(Map<String, dynamic> params) sendReport,
  }) {
    return getOutletList();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOutletList,
    TResult? Function(String outletId)? getProductOutletList,
    TResult? Function(String jabatan)? getUserReport,
    TResult? Function(Map<String, dynamic> params)? sendReport,
  }) {
    return getOutletList?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOutletList,
    TResult Function(String outletId)? getProductOutletList,
    TResult Function(String jabatan)? getUserReport,
    TResult Function(Map<String, dynamic> params)? sendReport,
    required TResult orElse(),
  }) {
    if (getOutletList != null) {
      return getOutletList();
    }
    return orElse();
  }
}

abstract class _getOutletList implements ReportEvent {
  const factory _getOutletList() = _$_getOutletList;
}

/// @nodoc

class _$_getProductOutletList implements _getProductOutletList {
  const _$_getProductOutletList(this.outletId);

  @override
  final String outletId;

  @override
  String toString() {
    return 'ReportEvent.getProductOutletList(outletId: $outletId)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOutletList,
    required TResult Function(String outletId) getProductOutletList,
    required TResult Function(String jabatan) getUserReport,
    required TResult Function(Map<String, dynamic> params) sendReport,
  }) {
    return getProductOutletList(outletId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOutletList,
    TResult? Function(String outletId)? getProductOutletList,
    TResult? Function(String jabatan)? getUserReport,
    TResult? Function(Map<String, dynamic> params)? sendReport,
  }) {
    return getProductOutletList?.call(outletId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOutletList,
    TResult Function(String outletId)? getProductOutletList,
    TResult Function(String jabatan)? getUserReport,
    TResult Function(Map<String, dynamic> params)? sendReport,
    required TResult orElse(),
  }) {
    if (getProductOutletList != null) {
      return getProductOutletList(outletId);
    }
    return orElse();
  }
}

abstract class _getProductOutletList implements ReportEvent {
  const factory _getProductOutletList(final String outletId) =
      _$_getProductOutletList;

  String get outletId;
}

/// @nodoc

class _$_getUserReport implements _getUserReport {
  const _$_getUserReport(this.jabatan);

  @override
  final String jabatan;

  @override
  String toString() {
    return 'ReportEvent.getUserReport(jabatan: $jabatan)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOutletList,
    required TResult Function(String outletId) getProductOutletList,
    required TResult Function(String jabatan) getUserReport,
    required TResult Function(Map<String, dynamic> params) sendReport,
  }) {
    return getUserReport(jabatan);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOutletList,
    TResult? Function(String outletId)? getProductOutletList,
    TResult? Function(String jabatan)? getUserReport,
    TResult? Function(Map<String, dynamic> params)? sendReport,
  }) {
    return getUserReport?.call(jabatan);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOutletList,
    TResult Function(String outletId)? getProductOutletList,
    TResult Function(String jabatan)? getUserReport,
    TResult Function(Map<String, dynamic> params)? sendReport,
    required TResult orElse(),
  }) {
    if (getUserReport != null) {
      return getUserReport(jabatan);
    }
    return orElse();
  }
}

abstract class _getUserReport implements ReportEvent {
  const factory _getUserReport(final String jabatan) = _$_getUserReport;

  String get jabatan;
}

/// @nodoc

class _$_sendReport implements _sendReport {
  const _$_sendReport(final Map<String, dynamic> params) : _params = params;

  final Map<String, dynamic> _params;
  @override
  Map<String, dynamic> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  @override
  String toString() {
    return 'ReportEvent.sendReport(params: $params)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getOutletList,
    required TResult Function(String outletId) getProductOutletList,
    required TResult Function(String jabatan) getUserReport,
    required TResult Function(Map<String, dynamic> params) sendReport,
  }) {
    return sendReport(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getOutletList,
    TResult? Function(String outletId)? getProductOutletList,
    TResult? Function(String jabatan)? getUserReport,
    TResult? Function(Map<String, dynamic> params)? sendReport,
  }) {
    return sendReport?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getOutletList,
    TResult Function(String outletId)? getProductOutletList,
    TResult Function(String jabatan)? getUserReport,
    TResult Function(Map<String, dynamic> params)? sendReport,
    required TResult orElse(),
  }) {
    if (sendReport != null) {
      return sendReport(params);
    }
    return orElse();
  }
}

abstract class _sendReport implements ReportEvent {
  const factory _sendReport(final Map<String, dynamic> params) = _$_sendReport;

  Map<String, dynamic> get params;
}

/// @nodoc
mixin _$ReportState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Initial implements _Initial {
  const _$_Initial();

  @override
  String toString() {
    return 'ReportState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial implements ReportState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc

class _$_isLoading implements _isLoading {
  const _$_isLoading();

  @override
  String toString() {
    return 'ReportState.isLoading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }
}

abstract class _isLoading implements ReportState {
  const factory _isLoading() = _$_isLoading;
}

/// @nodoc

class _$_sendReportLoading implements _sendReportLoading {
  const _$_sendReportLoading();

  @override
  String toString() {
    return 'ReportState.sendReportLoading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return sendReportLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return sendReportLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (sendReportLoading != null) {
      return sendReportLoading();
    }
    return orElse();
  }
}

abstract class _sendReportLoading implements ReportState {
  const factory _sendReportLoading() = _$_sendReportLoading;
}

/// @nodoc

class _$_outletListLoaded implements _outletListLoaded {
  const _$_outletListLoaded(final List<OutletReport> data) : _data = data;

  final List<OutletReport> _data;
  @override
  List<OutletReport> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ReportState.outletListLoaded(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return outletListLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return outletListLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (outletListLoaded != null) {
      return outletListLoaded(data);
    }
    return orElse();
  }
}

abstract class _outletListLoaded implements ReportState {
  const factory _outletListLoaded(final List<OutletReport> data) =
      _$_outletListLoaded;

  List<OutletReport> get data;
}

/// @nodoc

class _$_productListLoaded implements _productListLoaded {
  const _$_productListLoaded(this.data);

  @override
  final ProductOutletPaging data;

  @override
  String toString() {
    return 'ReportState.productListLoaded(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return productListLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return productListLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (productListLoaded != null) {
      return productListLoaded(data);
    }
    return orElse();
  }
}

abstract class _productListLoaded implements ReportState {
  const factory _productListLoaded(final ProductOutletPaging data) =
      _$_productListLoaded;

  ProductOutletPaging get data;
}

/// @nodoc

class _$_userReportLoaded implements _userReportLoaded {
  const _$_userReportLoaded(final List<UserReport> data) : _data = data;

  final List<UserReport> _data;
  @override
  List<UserReport> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ReportState.userReportLoaded(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return userReportLoaded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return userReportLoaded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (userReportLoaded != null) {
      return userReportLoaded(data);
    }
    return orElse();
  }
}

abstract class _userReportLoaded implements ReportState {
  const factory _userReportLoaded(final List<UserReport> data) =
      _$_userReportLoaded;

  List<UserReport> get data;
}

/// @nodoc

class _$_reportSended implements _reportSended {
  const _$_reportSended(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'ReportState.reportSended(message: $message)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return reportSended(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return reportSended?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (reportSended != null) {
      return reportSended(message);
    }
    return orElse();
  }
}

abstract class _reportSended implements ReportState {
  const factory _reportSended(final String message) = _$_reportSended;

  String get message;
}

/// @nodoc

class _$_isError implements _isError {
  const _$_isError(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'ReportState.isError(networkExceptions: $networkExceptions)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function() sendReportLoading,
    required TResult Function(List<OutletReport> data) outletListLoaded,
    required TResult Function(ProductOutletPaging data) productListLoaded,
    required TResult Function(List<UserReport> data) userReportLoaded,
    required TResult Function(String message) reportSended,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return isError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function()? sendReportLoading,
    TResult? Function(List<OutletReport> data)? outletListLoaded,
    TResult? Function(ProductOutletPaging data)? productListLoaded,
    TResult? Function(List<UserReport> data)? userReportLoaded,
    TResult? Function(String message)? reportSended,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return isError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function()? sendReportLoading,
    TResult Function(List<OutletReport> data)? outletListLoaded,
    TResult Function(ProductOutletPaging data)? productListLoaded,
    TResult Function(List<UserReport> data)? userReportLoaded,
    TResult Function(String message)? reportSended,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(networkExceptions);
    }
    return orElse();
  }
}

abstract class _isError implements ReportState {
  const factory _isError(final NetworkExceptions networkExceptions) =
      _$_isError;

  NetworkExceptions get networkExceptions;
}
