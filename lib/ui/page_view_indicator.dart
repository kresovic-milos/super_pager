import 'package:flutter/material.dart';
import 'package:super_pager/ui/indicator_widget.dart';
import 'package:super_pager/ui/pager_state_provider.dart';
import 'package:super_pager/utils/constants.dart';

class PageViewIndicator extends StatefulWidget {
  final PageView child;
  final Function onSkip;
  final bool showNextButton;
  final Color defaultDotColor;
  final Color currentDotColor;
  final Color buttonsColor;
  final Color backgroundColor;

  PageViewIndicator({
    Key key,
    @required this.child,
    this.onSkip,
    this.showNextButton = true,
    this.defaultDotColor,
    this.currentDotColor,
    this.buttonsColor,
    this.backgroundColor,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PageViewIndicatorState();
}

class _PageViewIndicatorState extends State<PageViewIndicator>
    with SingleTickerProviderStateMixin {
  VoidCallback _onPageChange;
  double _currentStep;

  @override
  void initState() {
    _currentStep = 0.0;

    Future.delayed(Duration.zero, () {
      _onPageChange = () {
        if (widget.child.controller.page % 1 == 0) {
          setState(() => _currentStep = widget.child.controller.page);
        }
      };
      widget.child.controller.addListener(_onPageChange);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Directionality(
              textDirection: TextDirection.ltr,
              child: Flexible(child: widget.child)),
          PagerStateProvider(
            currentStep: _currentStep,
            stepsCount: widget.child.childrenDelegate.estimatedChildCount,
            showNextButton: widget.showNextButton,
            onNextStep: () => widget.child.controller?.nextPage(
                duration: Duration(milliseconds: Constants.TRANSITION_DURATION),
                curve: Curves.ease),
            onSkipWizard: widget.onSkip,
            defaultDotColor: widget.defaultDotColor,
            currentDotColor: widget.currentDotColor,
            buttonsColor: widget.buttonsColor,
            backgroundColor: widget.backgroundColor,
            child: IndicatorWidget(),
          ),
        ],
      ),
    );
  }
}
