part of 'competitor_act_bloc.dart';

@freezed
class CompetitorActEvent with _$CompetitorActEvent {
  const factory CompetitorActEvent.started() = _Started;
  const factory CompetitorActEvent.getCompetitorActivityAll(
      Map<String, dynamic> params) = _getCompetitorActivityAll;
  const factory CompetitorActEvent.addCompetitorActivity(FormData params) =
      _addCompetitorActivity;
}
