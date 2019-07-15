import 'package:flutter/material.dart';
import 'package:super_pager/ui/pager_state_provider.dart';
import 'package:super_pager/utils/constants.dart';

class Dot extends StatelessWidget {
  final int index;

  const Dot({Key key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final state = PagerStateProvider.of(context);
    final isCurrent = state.isCurrentStep(this.index);

    final dimens =
        isCurrent ? Constants.CURRENT_DOT_DIMENS : Constants.DEFUALT_DOT_DIMENS;
    final defaultColor =
        state.defaultDotColor ?? Theme.of(context).primaryColor;
    final currentColor =
        state.currentDotColor ?? Theme.of(context).primaryColorDark;
    final color = isCurrent ? currentColor : defaultColor;
    final horizontalMargin = dimens * 2 / state.stepsCount;

    return Container(
      child: Center(
        child: Material(
          color: color,
          type: MaterialType.circle,
          child: Container(
            margin: EdgeInsets.only(
                left: horizontalMargin, right: horizontalMargin),
            width: dimens,
            height: dimens,
          ),
        ),
      ),
    );
  }
}
