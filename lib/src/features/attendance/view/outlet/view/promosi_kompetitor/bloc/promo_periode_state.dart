part of 'promo_periode_bloc.dart';

@freezed
class PromoPeriodeState with _$PromoPeriodeState {
  const factory PromoPeriodeState.initial() = _Initial;
  const factory PromoPeriodeState.loading() = _Loading;
  const factory PromoPeriodeState.addedPromoPeriode(Response data) =
      _AddedPromoPeriode;
  const factory PromoPeriodeState.editedPromoPeriode(Response data) =
      _EditedPromoPeriode;
  const factory PromoPeriodeState.promoPeriodeAll(List<PromoPeriode> data) =
      _PromoPeriodeAll;
  const factory PromoPeriodeState.deletedPromoPeriode(Response data) =
      _DeletedPromoPeriode;
  const factory PromoPeriodeState.errorAddedPeriode(NetworkExceptions error) =
      _ErrorAddPeriode;
  const factory PromoPeriodeState.errorEditedPeriode(NetworkExceptions error) =
      _ErrorEditedPeriode;
  const factory PromoPeriodeState.error(NetworkExceptions error) = _Error;
}
