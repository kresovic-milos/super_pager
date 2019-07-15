import 'package:flutter/material.dart';

class PagerStateProvider extends InheritedWidget {
  final Widget child;
  final int stepsCount;
  final double currentStep;
  final Function onSkipWizard;
  final Function onNextStep;
  final bool showNextButton;
  final Color defaultDotColor;
  final Color currentDotColor;
  final Color buttonsColor;
  final Color backgroundColor;

  bool isCurrentStep(int index) => this.currentStep.round() == index;

  PagerStateProvider({
    @required this.child,
    this.stepsCount,
    this.currentStep,
    this.onSkipWizard,
    this.onNextStep,
    this.showNextButton,
    this.defaultDotColor,
    this.currentDotColor,
    this.buttonsColor,
    this.backgroundColor,
  });

  @override
  bool updateShouldNotify(PagerStateProvider oldWidget) => true;

  static PagerStateProvider of(BuildContext context) =>
      context.inheritFromWidgetOfExactType(PagerStateProvider);
}
