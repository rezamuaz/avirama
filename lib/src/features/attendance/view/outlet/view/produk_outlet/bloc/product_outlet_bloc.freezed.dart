// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'product_outlet_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ProductOutletEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc

class _$_Started implements _Started {
  const _$_Started();

  @override
  String toString() {
    return 'ProductOutletEvent.started()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }
}

abstract class _Started implements ProductOutletEvent {
  const factory _Started() = _$_Started;
}

/// @nodoc

class _$_addProduct implements _addProduct {
  const _$_addProduct({required final Map<String, dynamic> params})
      : _params = params;

  final Map<String, dynamic> _params;
  @override
  Map<String, dynamic> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  @override
  String toString() {
    return 'ProductOutletEvent.addProduct(params: $params)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) {
    return addProduct(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) {
    return addProduct?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) {
    if (addProduct != null) {
      return addProduct(params);
    }
    return orElse();
  }
}

abstract class _addProduct implements ProductOutletEvent {
  const factory _addProduct({required final Map<String, dynamic> params}) =
      _$_addProduct;

  Map<String, dynamic> get params;
}

/// @nodoc

class _$_updateProduct implements _updateProduct {
  const _$_updateProduct({required final Map<String, dynamic> params})
      : _params = params;

  final Map<String, dynamic> _params;
  @override
  Map<String, dynamic> get params {
    if (_params is EqualUnmodifiableMapView) return _params;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_params);
  }

  @override
  String toString() {
    return 'ProductOutletEvent.updateProduct(params: $params)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) {
    return updateProduct(params);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) {
    return updateProduct?.call(params);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) {
    if (updateProduct != null) {
      return updateProduct(params);
    }
    return orElse();
  }
}

abstract class _updateProduct implements ProductOutletEvent {
  const factory _updateProduct({required final Map<String, dynamic> params}) =
      _$_updateProduct;

  Map<String, dynamic> get params;
}

/// @nodoc

class _$_detailProduct implements _detailProduct {
  const _$_detailProduct(
      {required this.outletId,
      required this.productId,
      required this.userId,
      required this.dateToday});

  @override
  final String outletId;
  @override
  final String productId;
  @override
  final String userId;
  @override
  final String dateToday;

  @override
  String toString() {
    return 'ProductOutletEvent.detailProduct(outletId: $outletId, productId: $productId, userId: $userId, dateToday: $dateToday)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) {
    return detailProduct(outletId, productId, userId, dateToday);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) {
    return detailProduct?.call(outletId, productId, userId, dateToday);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) {
    if (detailProduct != null) {
      return detailProduct(outletId, productId, userId, dateToday);
    }
    return orElse();
  }
}

abstract class _detailProduct implements ProductOutletEvent {
  const factory _detailProduct(
      {required final String outletId,
      required final String productId,
      required final String userId,
      required final String dateToday}) = _$_detailProduct;

  String get outletId;
  String get productId;
  String get userId;
  String get dateToday;
}

/// @nodoc

class _$_deleteProduct implements _deleteProduct {
  const _$_deleteProduct({required this.outletId, required this.productId});

  @override
  final String outletId;
  @override
  final String productId;

  @override
  String toString() {
    return 'ProductOutletEvent.deleteProduct(outletId: $outletId, productId: $productId)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) {
    return deleteProduct(outletId, productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) {
    return deleteProduct?.call(outletId, productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) {
    if (deleteProduct != null) {
      return deleteProduct(outletId, productId);
    }
    return orElse();
  }
}

abstract class _deleteProduct implements ProductOutletEvent {
  const factory _deleteProduct(
      {required final String outletId,
      required final String productId}) = _$_deleteProduct;

  String get outletId;
  String get productId;
}

/// @nodoc

class _$_getProduct implements _getProduct {
  const _$_getProduct({required this.outletId});

  @override
  final int outletId;

  @override
  String toString() {
    return 'ProductOutletEvent.getProduct(outletId: $outletId)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) {
    return getProduct(outletId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) {
    return getProduct?.call(outletId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) {
    if (getProduct != null) {
      return getProduct(outletId);
    }
    return orElse();
  }
}

abstract class _getProduct implements ProductOutletEvent {
  const factory _getProduct({required final int outletId}) = _$_getProduct;

  int get outletId;
}

/// @nodoc

class _$_getMasterProduct implements _getMasterProduct {
  const _$_getMasterProduct({required this.pageNumber, required this.search});

  @override
  final int pageNumber;
  @override
  final String search;

  @override
  String toString() {
    return 'ProductOutletEvent.getMasterProduct(pageNumber: $pageNumber, search: $search)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) {
    return getMasterProduct(pageNumber, search);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) {
    return getMasterProduct?.call(pageNumber, search);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) {
    if (getMasterProduct != null) {
      return getMasterProduct(pageNumber, search);
    }
    return orElse();
  }
}

abstract class _getMasterProduct implements ProductOutletEvent {
  const factory _getMasterProduct(
      {required final int pageNumber,
      required final String search}) = _$_getMasterProduct;

  int get pageNumber;
  String get search;
}

/// @nodoc

class _$_reloadPage implements _reloadPage {
  const _$_reloadPage();

  @override
  String toString() {
    return 'ProductOutletEvent.reloadPage()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(Map<String, dynamic> params) addProduct,
    required TResult Function(Map<String, dynamic> params) updateProduct,
    required TResult Function(
            String outletId, String productId, String userId, String dateToday)
        detailProduct,
    required TResult Function(String outletId, String productId) deleteProduct,
    required TResult Function(int outletId) getProduct,
    required TResult Function(int pageNumber, String search) getMasterProduct,
    required TResult Function() reloadPage,
  }) {
    return reloadPage();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(Map<String, dynamic> params)? addProduct,
    TResult? Function(Map<String, dynamic> params)? updateProduct,
    TResult? Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult? Function(String outletId, String productId)? deleteProduct,
    TResult? Function(int outletId)? getProduct,
    TResult? Function(int pageNumber, String search)? getMasterProduct,
    TResult? Function()? reloadPage,
  }) {
    return reloadPage?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(Map<String, dynamic> params)? addProduct,
    TResult Function(Map<String, dynamic> params)? updateProduct,
    TResult Function(
            String outletId, String productId, String userId, String dateToday)?
        detailProduct,
    TResult Function(String outletId, String productId)? deleteProduct,
    TResult Function(int outletId)? getProduct,
    TResult Function(int pageNumber, String search)? getMasterProduct,
    TResult Function()? reloadPage,
    required TResult orElse(),
  }) {
    if (reloadPage != null) {
      return reloadPage();
    }
    return orElse();
  }
}

abstract class _reloadPage implements ProductOutletEvent {
  const factory _reloadPage() = _$_reloadPage;
}

/// @nodoc
mixin _$ProductOutletState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
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
    return 'ProductOutletState.initial()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }
}

abstract class _Initial implements ProductOutletState {
  const factory _Initial() = _$_Initial;
}

/// @nodoc

class _$_isLoading implements _isLoading {
  const _$_isLoading();

  @override
  String toString() {
    return 'ProductOutletState.isLoading()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return isLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return isLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (isLoading != null) {
      return isLoading();
    }
    return orElse();
  }
}

abstract class _isLoading implements ProductOutletState {
  const factory _isLoading() = _$_isLoading;
}

/// @nodoc

class _$_productById implements _productById {
  const _$_productById(this.data);

  @override
  final ProductOutletPaging data;

  @override
  String toString() {
    return 'ProductOutletState.productById(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return productById(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return productById?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (productById != null) {
      return productById(data);
    }
    return orElse();
  }
}

abstract class _productById implements ProductOutletState {
  const factory _productById(final ProductOutletPaging data) = _$_productById;

  ProductOutletPaging get data;
}

/// @nodoc

class _$_productAdded implements _productAdded {
  const _$_productAdded(this.data);

  @override
  final ProductOutletAdd data;

  @override
  String toString() {
    return 'ProductOutletState.productAdded(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return productAdded(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return productAdded?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (productAdded != null) {
      return productAdded(data);
    }
    return orElse();
  }
}

abstract class _productAdded implements ProductOutletState {
  const factory _productAdded(final ProductOutletAdd data) = _$_productAdded;

  ProductOutletAdd get data;
}

/// @nodoc

class _$_productUpdated implements _productUpdated {
  const _$_productUpdated();

  @override
  String toString() {
    return 'ProductOutletState.productUpdated()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return productUpdated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return productUpdated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (productUpdated != null) {
      return productUpdated();
    }
    return orElse();
  }
}

abstract class _productUpdated implements ProductOutletState {
  const factory _productUpdated() = _$_productUpdated;
}

/// @nodoc

class _$_productDetailed implements _productDetailed {
  const _$_productDetailed(this.data);

  @override
  final ProductOutletDetail data;

  @override
  String toString() {
    return 'ProductOutletState.productDetailed(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return productDetailed(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return productDetailed?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (productDetailed != null) {
      return productDetailed(data);
    }
    return orElse();
  }
}

abstract class _productDetailed implements ProductOutletState {
  const factory _productDetailed(final ProductOutletDetail data) =
      _$_productDetailed;

  ProductOutletDetail get data;
}

/// @nodoc

class _$_productDeleted implements _productDeleted {
  const _$_productDeleted(this.data);

  @override
  final ProductOutletResponse data;

  @override
  String toString() {
    return 'ProductOutletState.productDeleted(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return productDeleted(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return productDeleted?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (productDeleted != null) {
      return productDeleted(data);
    }
    return orElse();
  }
}

abstract class _productDeleted implements ProductOutletState {
  const factory _productDeleted(final ProductOutletResponse data) =
      _$_productDeleted;

  ProductOutletResponse get data;
}

/// @nodoc

class _$_productMaster implements _productMaster {
  const _$_productMaster(this.data);

  @override
  final MasterProductPaging data;

  @override
  String toString() {
    return 'ProductOutletState.productMaster(data: $data)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return productMaster(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return productMaster?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (productMaster != null) {
      return productMaster(data);
    }
    return orElse();
  }
}

abstract class _productMaster implements ProductOutletState {
  const factory _productMaster(final MasterProductPaging data) =
      _$_productMaster;

  MasterProductPaging get data;
}

/// @nodoc

class _$_pageReloaded implements _pageReloaded {
  const _$_pageReloaded();

  @override
  String toString() {
    return 'ProductOutletState.pageReloaded()';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return pageReloaded();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return pageReloaded?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (pageReloaded != null) {
      return pageReloaded();
    }
    return orElse();
  }
}

abstract class _pageReloaded implements ProductOutletState {
  const factory _pageReloaded() = _$_pageReloaded;
}

/// @nodoc

class _$_isError implements _isError {
  const _$_isError(this.networkExceptions);

  @override
  final NetworkExceptions networkExceptions;

  @override
  String toString() {
    return 'ProductOutletState.isError(networkExceptions: $networkExceptions)';
  }

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() isLoading,
    required TResult Function(ProductOutletPaging data) productById,
    required TResult Function(ProductOutletAdd data) productAdded,
    required TResult Function() productUpdated,
    required TResult Function(ProductOutletDetail data) productDetailed,
    required TResult Function(ProductOutletResponse data) productDeleted,
    required TResult Function(MasterProductPaging data) productMaster,
    required TResult Function() pageReloaded,
    required TResult Function(NetworkExceptions networkExceptions) isError,
  }) {
    return isError(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? isLoading,
    TResult? Function(ProductOutletPaging data)? productById,
    TResult? Function(ProductOutletAdd data)? productAdded,
    TResult? Function()? productUpdated,
    TResult? Function(ProductOutletDetail data)? productDetailed,
    TResult? Function(ProductOutletResponse data)? productDeleted,
    TResult? Function(MasterProductPaging data)? productMaster,
    TResult? Function()? pageReloaded,
    TResult? Function(NetworkExceptions networkExceptions)? isError,
  }) {
    return isError?.call(networkExceptions);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? isLoading,
    TResult Function(ProductOutletPaging data)? productById,
    TResult Function(ProductOutletAdd data)? productAdded,
    TResult Function()? productUpdated,
    TResult Function(ProductOutletDetail data)? productDetailed,
    TResult Function(ProductOutletResponse data)? productDeleted,
    TResult Function(MasterProductPaging data)? productMaster,
    TResult Function()? pageReloaded,
    TResult Function(NetworkExceptions networkExceptions)? isError,
    required TResult orElse(),
  }) {
    if (isError != null) {
      return isError(networkExceptions);
    }
    return orElse();
  }
}

abstract class _isError implements ProductOutletState {
  const factory _isError(final NetworkExceptions networkExceptions) =
      _$_isError;

  NetworkExceptions get networkExceptions;
}
