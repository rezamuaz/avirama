part of 'product_outlet_bloc.dart';

@freezed
class ProductOutletState with _$ProductOutletState {
  const factory ProductOutletState.initial() = _Initial;
  const factory ProductOutletState.isLoading() = _isLoading;
  const factory ProductOutletState.productById(ProductOutletPaging data) =
      _productById;
  const factory ProductOutletState.productAdded(ProductOutletAdd data) =
      _productAdded;
  const factory ProductOutletState.productUpdated() = _productUpdated;
  const factory ProductOutletState.productDetailed(ProductOutletDetail data) =
      _productDetailed;
  const factory ProductOutletState.productDeleted(ProductOutletResponse data) =
      _productDeleted;
  const factory ProductOutletState.productMaster(MasterProductPaging data) =
      _productMaster;
  const factory ProductOutletState.pageReloaded() = _pageReloaded;
  const factory ProductOutletState.isError(
      NetworkExceptions networkExceptions) = _isError;
}
