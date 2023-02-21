import 'dart:math';
import 'dart:ui';
import 'package:absensi_app/src/config/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../gen/assets.gen.dart';
import '../../../config/constants/keys.dart';
import '../../../localization/localization_utils.dart';
import '../../../router/coordinator.dart';
import '../../../router/router_name.dart';
import '../../../theme/colors.dart';
import '../widgets/header.dart';
import '../widgets/next_page_button.dart';
import '../widgets/onboarding_page_indicator.dart';
import '../widgets/ripple.dart';
import '../widgets/text_column.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({Key? key}) : super(key: key);

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView>
    with TickerProviderStateMixin {
  late final AnimationController _cardsAnimationController;
  late final AnimationController _pageIndicatorAnimationController;
  late final AnimationController _rippleAnimationController;

  late Animation<double> _pageIndicatorAnimation;
  late Animation<double> _rippleAnimation;

  late List<Image> _images;
  int _currentPage = 1;

  @override
  void initState() {
    super.initState();
    _images = [
      Image.asset(
        Assets.images.onboarding.slideOne.path,
        fit: BoxFit.cover,
      ),
      Image.asset(
        Assets.images.onboarding.slideTwo.path,
        fit: BoxFit.cover,
      ),
      Image.asset(
        Assets.images.onboarding.slideThree.path,
        fit: BoxFit.cover,
      ),
    ];

    _cardsAnimationController = AnimationController(
      vsync: this,
      duration: Constants.kCardAnimationDuration,
    );

    _pageIndicatorAnimationController = AnimationController(
      vsync: this,
      duration: Constants.kButtonAnimationDuration,
    );
    _rippleAnimationController = AnimationController(
      vsync: this,
      duration: Constants.kRippleAnimationDuration,
    );

    var pixelRatio = window.devicePixelRatio;

//Size in logical pixels
    var logicalScreenSize = window.physicalSize / pixelRatio;
    var logicalHeight = logicalScreenSize.height;

//Safe area paddings in logical pixels
    var paddingBottom = window.padding.bottom / window.devicePixelRatio;

    _rippleAnimation = Tween<double>(
      begin: 0.0,
      end: logicalHeight - paddingBottom,
    ).animate(
      CurvedAnimation(
        parent: _rippleAnimationController,
        curve: Curves.easeIn,
      ),
    );

    _setPageIndicatorAnimation();
    _setCardsSlideOutAnimation();
  }

  @override
  void dispose() {
    _cardsAnimationController.dispose();
    _pageIndicatorAnimationController.dispose();
    _rippleAnimationController.dispose();
    super.dispose();
  }

  bool get isFirstPage => _currentPage == 1;

  void _setCardsSlideInAnimation() {
    setState(() {
      _cardsAnimationController.reset();
    });
  }

  void _setCardsSlideOutAnimation() {
    setState(() {
      _cardsAnimationController.reset();
    });
  }

  void _setPageIndicatorAnimation({bool isClockwiseAnimation = true}) {
    final multiplicator = isClockwiseAnimation ? 2 : -2;

    setState(() {
      _pageIndicatorAnimation = Tween(
        begin: 0.0,
        end: multiplicator * pi,
      ).animate(
        CurvedAnimation(
          parent: _pageIndicatorAnimationController,
          curve: Curves.easeIn,
        ),
      );
      _pageIndicatorAnimationController.reset();
    });
  }

  void _setNextPage(int nextPageNumber) {
    setState(() {
      _currentPage = nextPageNumber;
    });
  }

  Future<void> _nextPage() async {
    switch (_currentPage) {
      case 1:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(2);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
          _setCardsSlideOutAnimation();
          _setPageIndicatorAnimation(isClockwiseAnimation: false);
        }
        break;
      case 2:
        if (_pageIndicatorAnimation.status == AnimationStatus.dismissed) {
          _pageIndicatorAnimationController.forward();
          await _cardsAnimationController.forward();
          _setNextPage(3);
          _setCardsSlideInAnimation();
          await _cardsAnimationController.forward();
        }
        break;
      case 3:
        if (_pageIndicatorAnimation.status == AnimationStatus.completed) {
          await _goToHome();
        }
        break;
    }
  }

  Future<void> _goToHome() async {
    await _rippleAnimationController.forward();
    GetStorage().write(XKeys.showOnboarding, false);

    XCoordinator.rootRouter.replaceNamed(XRoutes.dashBoard);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        AnimatedSwitcher(
          duration: Constants.kCardAnimationDuration,
          child: Container(
            key: ValueKey<int>(_currentPage),
            width: double.infinity,
            height: double.infinity,
            color: XAppColors.primary,
            child: _images[_currentPage - 1],
          ),
        ),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(0.6),
                    Colors.transparent,
                  ],
                  begin: const FractionalOffset(1.0, 1.0),
                  end: const FractionalOffset(0.0, 0.0),
                  stops: const [0.0, 1.0],
                ),
              ),
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(Constants.kPaddingL),
                  child: Column(
                    children: <Widget>[
                      XHeader(onSkip: _goToHome),
                      const Spacer(),
                      _getContent(),
                      const SizedBox(
                        height: Constants.kPaddingL,
                      ),
                      AnimatedBuilder(
                        animation: _pageIndicatorAnimation,
                        builder: (_, Widget? child) {
                          return XOnboardingPageIndicator(
                            angle: _pageIndicatorAnimation.value,
                            currentPage: _currentPage,
                            child: child!,
                          );
                        },
                        child: XNextPageButton(onPressed: _nextPage),
                      ),
                      const SizedBox(
                        height: Constants.kPaddingXL + Constants.kPaddingS,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedBuilder(
              animation: _rippleAnimation,
              builder: (_, Widget? child) {
                return XRipple(radius: _rippleAnimation.value);
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _getContent() {
    switch (_currentPage) {
      case 1:
        return XTextColumnOnboarding(
          key: const ValueKey<int>(1),
          title: S.text.onboarding_slide_one_title,
          text: S.text.onboarding_slide_one_description,
        );
      case 2:
        return XTextColumnOnboarding(
          key: const ValueKey<int>(2),
          title: S.text.onboarding_slide_two_title,
          text: S.text.onboarding_slide_two_description,
        );
      case 3:
        return XTextColumnOnboarding(
          key: const ValueKey<int>(3),
          title: S.text.onboarding_slide_three_title,
          text: S.text.onboarding_slide_three_description,
        );
      default:
        throw Exception("Content with number '$_currentPage' does not exist.");
    }
  }
}
