part of 'product_outlet_bloc.dart';

@freezed
class ProductOutletEvent with _$ProductOutletEvent {
  const factory ProductOutletEvent.started() = _Started;
  const factory ProductOutletEvent.addProduct(
      {required Map<String, dynamic> params}) = _addProduct;
  const factory ProductOutletEvent.updateProduct(
      {required Map<String, dynamic> params}) = _updateProduct;
  const factory ProductOutletEvent.detailProduct(
      {required String outletId,
      required String productId,
      required String userId,
      required String dateToday}) = _detailProduct;
  const factory ProductOutletEvent.deleteProduct(
      {required String outletId, required String productId}) = _deleteProduct;
  const factory ProductOutletEvent.getProduct({required int outletId}) =
      _getProduct;
  const factory ProductOutletEvent.getMasterProduct(
      {required int pageNumber, required String search}) = _getMasterProduct;
  const factory ProductOutletEvent.reloadPage() = _reloadPage;
}
