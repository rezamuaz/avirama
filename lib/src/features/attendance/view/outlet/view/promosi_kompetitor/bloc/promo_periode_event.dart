part of 'promo_periode_bloc.dart';

@freezed
class PromoPeriodeEvent with _$PromoPeriodeEvent {
  const factory PromoPeriodeEvent.started() = _Started;
  const factory PromoPeriodeEvent.addPromoPeriode(Map<String, dynamic> params) =
      _AddPromoPeriode;
  const factory PromoPeriodeEvent.editPromoPeriode(
      Map<String, dynamic> params) = _EditPromoPeriode;
  const factory PromoPeriodeEvent.getPromoPeriode(Map<String, dynamic> params) =
      _GetPromoPeriode;
  const factory PromoPeriodeEvent.deletePromoPeriode(String id) =
      _DeletePromoPeriode;
}
