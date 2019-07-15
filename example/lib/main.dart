import 'package:flutter/material.dart';
import 'package:super_pager/super_pager.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter Wizard',
      home: Scaffold(
          body: PageViewIndicator(
        child: PageView(children: _pageView()),
        onSkip: (ctx) => _showDialog(ctx),
        showNextButton: true,
        defaultDotColor: Colors.deepOrange,
        currentDotColor: Colors.pinkAccent,
        buttonsColor: Colors.lime,
        backgroundColor: Colors.blueGrey,
      )),
    );
  }

  _pageView() => Iterable<int>.generate(5)
      .map(
        (index) => Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Page',
                style: TextStyle(
                    fontSize: 36.0, color: Theme.of(context).primaryColorDark),
              ),
              Text(
                '${index + 1}',
                style: TextStyle(
                    fontSize: 256.0, color: Theme.of(context).primaryColorDark),
              ),
            ],
          ),
        ),
      )
      .toList();

  _showDialog(BuildContext ctx) => showDialog(
        context: ctx,
        builder: (ctx) => AlertDialog(
          title: Text('PageView skipped!'),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () => Navigator.pop(ctx),
            )
          ],
          content: Text(
              'Implement your own navigation logic and pass it as onSkip property.'),
        ),
      );
}
