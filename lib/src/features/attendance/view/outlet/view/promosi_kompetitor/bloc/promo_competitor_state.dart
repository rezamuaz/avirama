part of 'promo_competitor_bloc.dart';

@freezed
class PromoCompetitorState with _$PromoCompetitorState {
  const factory PromoCompetitorState.initial() = _Initial;
  const factory PromoCompetitorState.loading() = _Loading;
  const factory PromoCompetitorState.competitorPromos(
      List<KompetitorPromo> data) = _competitorPromos;
  const factory PromoCompetitorState.addedCompetitorPromo(Response data) =
      _addedCompetitorPromo;
  const factory PromoCompetitorState.deletedCompetitorPromo(Response data) =
      _deletedCompetitorPromo;
  const factory PromoCompetitorState.updatedCompetitorPromo(Response data) =
      _updatedCompetitorPromo;
  const factory PromoCompetitorState.isErrorAdded(
      NetworkExceptions networkExceptions) = _isErrorAdded;
  const factory PromoCompetitorState.isErrorUpdated(
      NetworkExceptions networkExceptions) = _isErrorUpdated;
  const factory PromoCompetitorState.isError(
      NetworkExceptions networkExceptions) = _isError;
}
