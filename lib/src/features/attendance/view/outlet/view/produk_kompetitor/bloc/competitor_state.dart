part of 'competitor_bloc.dart';

@freezed
class CompetitorState with _$CompetitorState {
  const factory CompetitorState.initial() = _Initial;
  const factory CompetitorState.isLoading() = _Loading;
  const factory CompetitorState.isLoadingActivity() = _LoadingActivity;
  const factory CompetitorState.addedCompetitor(Response data) =
      _addedCompetitor;
  const factory CompetitorState.competitorProducts(
      List<KompetitorProduct> data) = _competitorProducts;
  const factory CompetitorState.deletedCompetitorProduct(Response data) =
      _deletedCompetitorProduct;
  const factory CompetitorState.updatedCompetitorProduct(Response data) =
      _updatedCompetitorProduct;
  const factory CompetitorState.competitorProductBrand(
      List<KompetitorBrand> data) = _competitorProductBrand;
  const factory CompetitorState.isError(NetworkExceptions networkExceptions) =
      _Error;
}
