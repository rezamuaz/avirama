part of 'competitor_bloc.dart';

@freezed
class CompetitorEvent with _$CompetitorEvent {
  const factory CompetitorEvent.started() = _Started;
  const factory CompetitorEvent.addCompetitor(FormData params) = _addCompetitor;
  const factory CompetitorEvent.getCompetitorProducts(String idOutlet) =
      _getCompetitorProducts;
  const factory CompetitorEvent.deleteCompetitorProduct(String idProduct) =
      _deleteCompetitorProduct;
  const factory CompetitorEvent.updateCompetitorProduct(FormData params) =
      _updateCompetitorProduct;
  const factory CompetitorEvent.getCompetitorProductBrand() =
      _getCompetitorProductBrand;
}
