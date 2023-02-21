part of 'competitor_act_bloc.dart';

@freezed
class CompetitorActState with _$CompetitorActState {
  const factory CompetitorActState.initial() = _initial;
  const factory CompetitorActState.loading() = _loading;
  const factory CompetitorActState.competitorActivityAll(
      List<KompetitorAktivitas> data) = _competitorActivityAll;
  const factory CompetitorActState.addedCompetitorActivity(Response data) =
      _addedCompetitorActivity;
  const factory CompetitorActState.isError(
      NetworkExceptions networkExceptions) = _Error;
}
