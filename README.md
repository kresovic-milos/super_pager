SuperPager is made to extend Flutter's PageView with some additional features.

# Table of contents

- [Features](#features)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Documentation](#documentation)
  - [PageViewIndicator Class](#pageViewIndicator-class)
- [License](#license)

# Features

- Page indicator.

- Next button.

- Skip button.

# Getting Started

You should ensure that you add the `super_pager` as a dependency in your flutter project.

```yaml
dependencies:
  super_pager: '^0.0.1'
```

You should then run `flutter packages get` in your terminal so as to get the package.

# Usage

- Just wrap your `PageView` widget with `PageViewIndicator` , and add some parameters.

  ```dart
  PageViewIndicator(
        child: PageView(children: _getPages()),
        onSkip: (ctx) => _navigateToOtherRoute(ctx),
        showNextButton: true,
        defaultDotColor: Colors.deepOrange,
        currentDotColor: Colors.pinkAccent,
        buttonsColor: Colors.lime,
        backgroundColor: Colors.blueGrey,
      )),
  ```

# Documentation

### PageViewIndicator Class

| Dart attribute  | Datatype     | Description                                              |           Default Value            |
| :-------------- | :----------- | :------------------------------------------------------- | :--------------------------------: |
| child           | PageView     | PageView to be wrapped.                                  |             @required              |
| onSkip          | VoidCallback | Method executes on tapping done button.                  |                Null                |
| showNextButton  | Bool         | Show the Next button at the end of the indicator footer. |                true                |
| defaultDotColor | Color        | Set the indicator default dot color.                     |   Theme.of(context).primaryColor   |
| currentDotColor | Color        | Set the current step indicator dot color.                | Theme.of(context).primaryColorDark |
| buttonsColor    | Color        | Set the color of the Next and Skip buttons.              |                Null                |
| backgroundColor | Color        | Set the color of the footer's background.                |                Null                |

For help on editing package code, view the [flutter documentation](https://flutter.io/developing-packages/).

# License

**SuperPager** is licensed under `MIT license`.
