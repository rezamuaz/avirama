import 'dart:async';
import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_activity.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_brand.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_product.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_promo.dart';
import 'package:absensi_app/src/network/model/outlet/master_product.dart';
import 'package:absensi_app/src/network/model/outlet/outlet.dart';
import 'package:absensi_app/src/network/model/outlet/outlet_info.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet_detail.dart';
import 'package:absensi_app/src/network/model/outlet/product_outlet_response.dart';
import 'package:absensi_app/src/network/model/outlet/promo_periode.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:logger/logger.dart';
import '../../model/common/pagination_type.dart';
import '../common/http.dart';
import 'outlet_repository.dart';

class OutletRepositoryImpl implements OutletRepository {
  late XHttp http;

  OutletRepositoryImpl() {
    http = XHttp(
      xBaseUrl: dotenv.env['LARAJET_API_BASE_URL'],
    );
  }

  @override
  Future<ApiResult<PaginationType<SelectOutlet>>> index({
    required String pageNumber,
  }) async {
    return await http.get(
      "/store/list?page[number]=$pageNumber",
      onSuccess: (response) => PaginationType<SelectOutlet>.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }

  @override
  Future<ApiResult<Outlet>> detail({
    required int pageNumber,
  }) async {
    return await http.get(
      "/store/detail/page[number]=$pageNumber",
      onSuccess: (response) => Outlet.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }

//ANCHOR - get Outlet Dashboard Info
  @override
  Future<ApiResult<OutletInfo>> outletDashboard({
    required Map<String, dynamic> params,
  }) async {
    return await http.post(
      "/store/dashboard",
      data: params,
      onSuccess: (response) => OutletInfo.fromJson(
        response.data,
      ),
    );
  }

//ANCHOR - Get Product Outlet by Id
  @override
  Future<ApiResult<ProductOutletPaging>> productOutletById(
      {required String outletId}) async {
    return await http.get(
      "/product-assign-outlet/outlet/?outlet_id=$outletId",
      onSuccess: (response) => ProductOutletPaging.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }

  //ANCHOR - Fetch Product Outlet Detail
  @override
  Future<ApiResult<ProductOutletDetail>> productOutletDetail(
      {required String productId,
      required String outletId,
      required String userId,
      required String date}) async {
    return await http.get(
      "/product-assign-outlet-details?outlet_id=$outletId&product_id=$productId&user_id=$userId&date=$date",
      onSuccess: (response) => ProductOutletDetail.fromJson(
        response.data['data'],
      ),
      authorization: true,
    );
  }

//ANCHOR - Fetch Master Products
  @override
  Future<ApiResult<MasterProductPaging>> masterProduct(
      {required int pageNumber, required String search}) async {
    return await http.get(
      "/produk/?page=$pageNumber&cari=$search",
      onSuccess: (response) => MasterProductPaging.fromJson(
        response.data,
      ),
      authorization: true,
    );
  }

//ANCHOR - Added Product Outlet
  @override
  Future<ApiResult<ProductOutletAdd>> addProduct(
      {required Map<String, dynamic> params}) async {
    return await http.post("/product-assign-outlet/store",
        data: params,
        onSuccess: (response) => ProductOutletAdd.fromJson(
              response.data,
            ));
  }

//ANCHOR - Deleted Product Outlet
  @override
  Future<ApiResult<ProductOutletResponse>> deleteProduct(
      {required String outletId, required String productId}) async {
    return await http.delete(
        "/product-assign-outlet/destroy?outlet_id=$outletId&product_id=$productId",
        onSuccess: (response) => ProductOutletResponse.fromJson(
              response.data,
            ));
  }

//ANCHOR - Edit Product Outlet
  @override
  Future<ApiResult<Response>> editProduct(
      {required Map<String, dynamic> params}) async {
    return await http.post(
      "/product-assign-outlet-details/store",
      data: params,
      onSuccess: (response) => response,
    );
  }

//==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--==--

  //ANCHOR - Add Competitor Product
  @override
  Future<ApiResult<Response>> addCompetitorProduct(
      {required FormData params}) async {
    return await http.post(
      "/produk-kompetitor",
      data: params,
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Get Competitor Product by outletId
  @override
  Future<ApiResult<List<KompetitorProduct>>> competitorProducts(
      {required Map<String, dynamic> params}) async {
    return await http.post(
      "/produk-kompetitor/all",
      data: params,
      onSuccess: (response) => (response.data['data'] as List)
          .map((e) => KompetitorProduct.fromJson(e))
          .toList(),
    );
  }

  //ANCHOR - Delete Competitor Product by outletId
  @override
  Future<ApiResult<Response>> deleteCompetitorProduct(
      {required String idProduct}) async {
    return await http.delete(
      "/produk-kompetitor/$idProduct",
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Update Competitor Product by outletId
  @override
  Future<ApiResult<Response>> updateCompetitorProduct(
      {required FormData params}) async {
    return await http.post(
      "/produk-kompetitor/update",
      data: params,
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Get Competitor Brand
  @override
  Future<ApiResult<List<KompetitorBrand>>> getCompetitorProductBrand() async {
    return await http.get(
      "/produk-kompetitor/getbrand",
      authorization: true,
      onSuccess: (response) => (response.data["data"] as List)
          .map((e) => KompetitorBrand.fromJson(e))
          .toList(),
    );
  }

  //ANCHOR - Get Competitor Activity All by outletId
  @override
  Future<ApiResult<List<KompetitorAktivitas>>> getCompetitorActivityAll(
      {required Map<String, dynamic> params}) async {
    return await http.post(
      "/aktifitas-kompetitor/all",
      data: params,
      onSuccess: (response) => (response.data["data"] as List)
          .map((e) => KompetitorAktivitas.fromJson(e))
          .toList(),
    );
  }

  //ANCHOR - Add Competitor Activity by outletId
  @override
  Future<ApiResult<Response>> addCompetitorActivity(
      {required FormData params}) async {
    return await http.post(
      "/aktifitas-kompetitor",
      data: params,
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Get Competitor Promo by outletId
  @override
  Future<ApiResult<List<KompetitorPromo>>> getPromoCompetitorAll(
      {required FormData params}) async {
    return await http.post(
      "/promosi-kompetitor/all",
      data: params,
      onSuccess: (response) => (response.data["data"] as List)
          .map((e) => KompetitorPromo.fromJson(e))
          .toList(),
    );
  }

  //ANCHOR - Add Competitor Promo by outletId
  @override
  Future<ApiResult<Response>> addPromoCompetitor(
      {required FormData params}) async {
    return await http.post(
      "/promosi-kompetitor",
      data: params,
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Delete Competitor Promo by outletId
  @override
  Future<ApiResult<Response>> deletePromoCompetitor(
      {required String id}) async {
    return await http.delete(
      "/promosi-kompetitor/$id",
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Update Competitor Promo by outletId
  @override
  Future<ApiResult<Response>> updatePromoCompetitor(
      {required FormData params}) async {
    return await http.post(
      "/promosi-kompetitor/update",
      data: params,
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Add Periode Promo by outletId
  @override
  Future<ApiResult<Response>> addPeriodePromo(
      {required Map<String, dynamic> params}) async {
    return await http.post(
      "/periode-promosi",
      data: params,
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Edit Periode Promo by outletId
  @override
  Future<ApiResult<Response>> editPeriodePromo(
      {required Map<String, dynamic> params}) async {
    return await http.post(
      "/periode-promosi/update",
      data: params,
      onSuccess: (response) => response,
    );
  }

  //ANCHOR - Get Periode Promo by outletId
  @override
  Future<ApiResult<List<PromoPeriode>>> getPeriodePromoAll(
      {required Map<String, dynamic> params}) async {
    return await http.post(
      "/periode-promosi/all",
      data: params,
      onSuccess: (response) => (response.data["data"] as List)
          .map((e) => PromoPeriode.fromJson(e))
          .toList(),
    );
  }

  //ANCHOR - Delete Periode Promo by outletId
  @override
  Future<ApiResult<Response>> deletePeriodePromo({required String id}) async {
    return await http.delete(
      "/periode-promosi/$id",
      onSuccess: (response) => response,
    );
  }
}
