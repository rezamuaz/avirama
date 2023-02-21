part of 'report_bloc.dart';

@freezed
class ReportState with _$ReportState {
  const factory ReportState.initial() = _Initial;
  const factory ReportState.isLoading() = _isLoading;
  const factory ReportState.sendReportLoading() = _sendReportLoading;
  const factory ReportState.outletListLoaded(List<OutletReport> data) =
      _outletListLoaded;
  const factory ReportState.productListLoaded(ProductOutletPaging data) =
      _productListLoaded;
  const factory ReportState.userReportLoaded(List<UserReport> data) =
      _userReportLoaded;
  const factory ReportState.reportSended(String message) = _reportSended;
  const factory ReportState.isError(NetworkExceptions networkExceptions) =
      _isError;
}
