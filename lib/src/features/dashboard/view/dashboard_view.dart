import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stylish_bottom_bar/model/bar_items.dart';
import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

import '../../../dialogs/alert_wrapper.dart';
import '../../../localization/localization_utils.dart';
import '../../../router/auto_router.gr.dart';
import '../../../theme/colors.dart';
import '../../common/logic/lifecycle_mixin.dart';
import '../logic/dashboard_bloc.dart';

class DashBoardView extends StatefulWidget {
  const DashBoardView({Key? key}) : super(key: key);

  @override
  State<DashBoardView> createState() => _DashBoardViewState();
}

class _DashBoardViewState extends State<DashBoardView> with LifecycleMixin {
  final DashBoardBloc bloc = DashBoardBloc();

  Future<bool> _onWillPop() async {
    if (bloc.tabsRouter?.activeIndex == TapIndex.home.index) {
      return XAlert.onWillPop(S.text.common_are_you_sure_you_want_to_close);
    } else {
      bloc.setActiveIndex(TapIndex.home.index);
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => bloc),
      ],
      child: BlocBuilder<DashBoardBloc, DashBoardState>(
        builder: (context, state) {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: AutoTabsScaffold(
              routes: const [
                HomeRouter(),
                AccountRouter(),
              ],
              bottomNavigationBuilder: (_, TabsRouter tabsRouter) {
                bloc.tabsRouter = tabsRouter;
                return StylishBottomBar(
                  option: AnimatedBarOptions(iconStyle: IconStyle.animated),
                  currentIndex: tabsRouter.activeIndex,
                  elevation: 0.5,
                  onTap: (index) =>
                      bloc.setActiveIndex(index, context: context),
                  items: [
                    ...TapIndex.values
                        .map(
                          (e) => BottomBarItem(
                              selectedColor: XAppColors.primary,
                              unSelectedColor: XColors.grey_60,
                              title: Text(e.nameOf()),
                              icon: Icon(e.iconOf())),
                        )
                        .toList(),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  void onPause() {}

  @override
  void onResume() {}
}
