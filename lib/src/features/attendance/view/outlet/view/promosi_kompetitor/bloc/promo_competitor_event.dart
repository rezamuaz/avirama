part of 'promo_competitor_bloc.dart';

@freezed
class PromoCompetitorEvent with _$PromoCompetitorEvent {
  const factory PromoCompetitorEvent.started() = _Started;
  const factory PromoCompetitorEvent.addPromoCompetitor(FormData params) =
      _AddPromoCompetitor;
  const factory PromoCompetitorEvent.getPromoCompetitor(FormData params) =
      _GetPromoCompetitor;
  const factory PromoCompetitorEvent.deletePromoCompetitor(String id) =
      _DeletePromoCompetitor;
  const factory PromoCompetitorEvent.updatePromoCompetitor(FormData params) =
      _updatePromoCompetitor;
}
