part of 'dashboard_bloc.dart';

enum TapIndex {
  home,
  account,
}

extension ETapIndex on TapIndex {
  String nameOf() {
    return nameAt(index);
  }

  IconData iconOf() {
    switch (this) {
      case TapIndex.home:
        return Icons.home_rounded;
      default:
        return Icons.person;
    }
  }

  static String nameAt(int index) {
    if (index == TapIndex.account.index) {
      return S.text.account;
    } else {
      return S.text.home;
    }
  }
}

class DashBoardState extends Equatable {
  const DashBoardState();

  @override
  List<Object?> get props => [];
}
