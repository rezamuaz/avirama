import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/core/api/network_exceptions.dart';
import 'package:absensi_app/src/network/data/outlet/outlet_repository_impl.dart';
import 'package:absensi_app/src/network/model/outlet/master_product.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet_detail.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logger/logger.dart';

part 'product_outlet_event.dart';
part 'product_outlet_state.dart';
part 'product_outlet_bloc.freezed.dart';

class ProductOutletBloc extends Bloc<ProductOutletEvent, ProductOutletState> {
  ProductOutletBloc() : super(const _Initial()) {
    on<ProductOutletEvent>((event, emit) async {
      await event.when(
          started: () async {},
          //ANCHOR - Add Product Outlet from MasterProduct data
          addProduct: (Map<String, dynamic> params) async {
            emit(const ProductOutletState.isLoading());
            final ApiResult<ProductOutletAdd> apiResult =
                await OutletRepositoryImpl().addProduct(params: params);
            apiResult.when(
                success: (data) => emit(ProductOutletState.productAdded(data)),
                failure: (error) => emit(getErrorAddProduct(error)));
          },
          //ANCHOR - Update Product in Outlet
          updateProduct: (Map<String, dynamic> params) async {
            emit(const ProductOutletState.isLoading());
            final ApiResult<Response> apiResult =
                await OutletRepositoryImpl().editProduct(params: params);
            apiResult.when(
                success: (data) =>
                    emit(const ProductOutletState.productUpdated()),
                failure: (error) => emit(getErrorUpdateProduct(error)));
          },
          //ANCHOR - Get Detail Product for Outlet
          detailProduct: (String outletId, String productId, String userId,
              String dateToday) async {
            emit(const ProductOutletState.isLoading());
            final ApiResult<ProductOutletDetail> apiResult =
                await OutletRepositoryImpl().productOutletDetail(
                    productId: productId,
                    outletId: outletId,
                    userId: userId,
                    date: dateToday);
            apiResult.when(
                success: (data) =>
                    emit(ProductOutletState.productDetailed(data)),
                failure: (error) => emit(getErrorDetailProduct(error)));
          },
          //ANCHOR - Delete Product Outlet by Id
          deleteProduct: (String outletId, String productId) async {
            emit(const ProductOutletState.isLoading());
            final ApiResult<ProductOutletResponse> apiResult =
                await OutletRepositoryImpl()
                    .deleteProduct(outletId: outletId, productId: productId);
            apiResult.when(
                success: (data) =>
                    emit(ProductOutletState.productDeleted(data)),
                failure: (error) => emit(getErrorDelete(error)));
          },
          //ANCHOR - Get Master Product for Outlet
          getMasterProduct: (int pageNumber, String search) async {
            emit(const ProductOutletState.isLoading());
            final ApiResult<MasterProductPaging> apiResult =
                await OutletRepositoryImpl()
                    .masterProduct(pageNumber: pageNumber, search: search);

            apiResult.when(
                success: (data) => emit(ProductOutletState.productMaster(data)),
                failure: (error) => emit(getErrorMasterProduct(error)));
          },
          //ANCHOR - Get Product Outlet by Outlet id
          getProduct: (int outletId) async {
            emit(const ProductOutletState.isLoading());
            final ApiResult<ProductOutletPaging> apiResult =
                await OutletRepositoryImpl()
                    .productOutletById(outletId: outletId.toString());
            apiResult.when(success: (data) {
              emit(ProductOutletState.productById(data));
            }, failure: (error) {
              emit(getErrorOutletProdukById(error));
            });
          },
          reloadPage: () async {});
    });
  }
  @override
  void onChange(Change<ProductOutletState> change) {
    Logger().e(change);
    super.onChange(change);
  }
}

ProductOutletState getErrorAddProduct(NetworkExceptions networkExceptions) {
  Logger().e('getErrorAddProduct');
  return ProductOutletState.isError(networkExceptions);
}

ProductOutletState getErrorMasterProduct(NetworkExceptions networkExceptions) {
  Logger().e('getErrorMasterProduct');
  return ProductOutletState.isError(networkExceptions);
}

ProductOutletState getErrorUpdateProduct(NetworkExceptions networkExceptions) {
  Logger().e('getErrorUpdateProduct');
  return ProductOutletState.isError(networkExceptions);
}

ProductOutletState getErrorDetailProduct(NetworkExceptions networkExceptions) {
  Logger().e('getErrorDetailProduct');
  return ProductOutletState.isError(networkExceptions);
}

ProductOutletState getErrorOutletProdukById(
    NetworkExceptions networkExceptions) {
  Logger().e('getErrorOutletProdukById');
  return ProductOutletState.isError(networkExceptions);
}

ProductOutletState getErrorDelete(NetworkExceptions networkExceptions) {
  Logger().e('getErrorDelete');
  return ProductOutletState.isError(networkExceptions);
}
