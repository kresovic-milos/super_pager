import 'package:flutter/material.dart';
import 'package:super_pager/ui/dot.dart';
import 'package:super_pager/ui/pager_state_provider.dart';
import 'package:super_pager/utils/constants.dart';

class IndicatorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = PagerStateProvider.of(context);
    final btnTextStyle = TextStyle(
        fontSize: Constants.BUTTON_FONT_SIZE,
        color: state.buttonsColor ?? Theme.of(context).primaryColorDark);

    return Container(
      color: state.backgroundColor ?? Theme.of(context).scaffoldBackgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: state.onSkipWizard != null,
            child: FlatButton(
              child: Text('Skip', style: btnTextStyle),
              onPressed: () => state.onSkipWizard(context),
            ),
          ),
          Expanded(
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      state.stepsCount,
                      (index) => Dot(
                            index: index,
                          )).toList())),
          Visibility(
            maintainSize: true,
            maintainAnimation: true,
            maintainState: true,
            visible: state.showNextButton,
            child: FlatButton(
              key: Key('nextButton'),
              child: Text('Next', style: btnTextStyle),
              onPressed: state.onNextStep,
              textColor: Theme.of(context).primaryColorDark,
            ),
          ),
        ],
      ),
    );
  }
}
