import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:super_pager/super_pager.dart';
import 'package:super_pager/ui/indicator_widget.dart';
import 'package:super_pager/ui/pager_state_provider.dart';

void main() {
  PageView pageView;

  setUp(() {
    return pageView = PageView(
      children: [
        Container(
          color: Colors.deepOrangeAccent,
          child: Center(
            child: Text("Page 1"),
          ),
        ),
        Container(
          color: Colors.deepOrangeAccent,
          child: Center(
            child: Text("Page 2"),
          ),
        ),
        Container(
          color: Colors.deepOrangeAccent,
          child: Center(
            child: Text("Page 3"),
          ),
        ),
        Container(
          color: Colors.deepOrangeAccent,
          child: Center(
            child: Text("Page 4"),
          ),
        ),
      ],
    );
  });

  testWidgets('current step is incremented on next',
      (WidgetTester tester) async {
    const wizardKey = Key('wizard');
    await tester.pumpWidget(MaterialApp(
        home: PageViewIndicator(
      key: wizardKey,
      child: pageView,
      onSkip: () {},
    )));

    await tester.pump();

    await tester.tap(find.byKey(Key('nextButton')));

    await tester.pumpAndSettle();

    final PagerStateProvider element =
        tester.widget(find.byType(PagerStateProvider));

    expect(element.currentStep, 1.0);
  });

  testWidgets('has exactly one PageView', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: PageViewIndicator(
      child: pageView,
      onSkip: () {},
    )));

    await tester.pumpAndSettle();

    expect(find.byType(PageView), findsOneWidget);
  });

  testWidgets('has exactly one IndicatorWidget', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
        home: PageViewIndicator(
      child: pageView,
      onSkip: () {},
    )));

    await tester.pumpAndSettle();

    expect(find.byType(IndicatorWidget), findsOneWidget);
  });

  testWidgets('initial current step is 0.0', (WidgetTester tester) async {
    const wizardKey = Key('wizard');
    await tester.pumpWidget(MaterialApp(
        home: PageViewIndicator(
      key: wizardKey,
      child: pageView,
      onSkip: () {},
    )));

    await tester.pumpAndSettle();

    final PagerStateProvider element =
        tester.widget(find.byType(PagerStateProvider));

    expect(element.currentStep, 0.0);
  });
}
