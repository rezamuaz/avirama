import 'package:absensi_app/src/core/api/api_result.dart';
import 'package:absensi_app/src/network/model/common/pagination_type.dart';
import 'package:absensi_app/src/network/model/outlet/kompetitor_activity.dart';
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

import '../../model/outlet/kompetitor_brand.dart';

abstract class OutletRepository {
  Future<ApiResult<PaginationType<SelectOutlet>>> index({
    required String pageNumber,
  });
  Future<ApiResult<Outlet>> detail({
    required int pageNumber,
  });

  Future<ApiResult<OutletInfo>> outletDashboard(
      {required Map<String, dynamic> params});

  Future<ApiResult<ProductOutletPaging>> productOutletById(
      {required String outletId});

  Future<ApiResult<ProductOutletDetail>> productOutletDetail(
      {required String productId,
      required String outletId,
      required String userId,
      required String date});

  Future<ApiResult<MasterProductPaging>> masterProduct(
      {required int pageNumber, required String search});

  Future<ApiResult<ProductOutletAdd>> addProduct(
      {required Map<String, dynamic> params});

  Future<ApiResult<ProductOutletResponse>> deleteProduct(
      {required String outletId, required String productId});

  Future<ApiResult<Response>> editProduct(
      {required Map<String, dynamic> params});

  Future<ApiResult<Response>> addCompetitorProduct({required FormData params});

  Future<ApiResult<List<KompetitorProduct>>> competitorProducts(
      {required Map<String, dynamic> params});

  Future<ApiResult<Response>> deleteCompetitorProduct(
      {required String idProduct});

  Future<ApiResult<Response>> updateCompetitorProduct(
      {required FormData params});

  Future<ApiResult<List<KompetitorBrand>>> getCompetitorProductBrand();

  Future<ApiResult<List<KompetitorAktivitas>>> getCompetitorActivityAll(
      {required Map<String, dynamic> params});

  Future<ApiResult<Response>> addCompetitorActivity({required FormData params});

  Future<ApiResult<List<KompetitorPromo>>> getPromoCompetitorAll(
      {required FormData params});

  Future<ApiResult<Response>> addPromoCompetitor({required FormData params});

  Future<ApiResult<Response>> deletePromoCompetitor({required String id});

  Future<ApiResult<Response>> updatePromoCompetitor({required FormData params});

  Future<ApiResult<Response>> addPeriodePromo(
      {required Map<String, dynamic> params});

  Future<ApiResult<Response>> editPeriodePromo(
      {required Map<String, dynamic> params});

  Future<ApiResult<List<PromoPeriode>>> getPeriodePromoAll(
      {required Map<String, dynamic> params});

  Future<ApiResult<Response>> deletePeriodePromo({required String id});
}
