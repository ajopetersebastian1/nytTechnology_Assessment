# nytimes

this project created in flutter supports both web and mobile, clone the rep mentioned below:

* For Clone: https://github.com/ajopetersebastian1/nytTechnology_Assessment.git


## Getting Started

The New York Times offers a Developer API Portal, which allows developers to access and use the data from the newspaper's archives, including articles, reviews, photos, and more. The API provides a wide range of functionality, including search and filtering, content retrieval, and data analysis. Developers can use the API to build applications, integrate data into their websites, or perform data analysis. The New York Times Developer API offers a wide range of endpoints and is accessible via RESTful HTTP requests, with data returned in JSON format. The API is available to developers for free with certain limitations, and there are paid plans available for higher usage limits and more features. The New York Times also offers extensive documentation, sample code, and a developer forum to assist developers with using the API.

## How to Use 
### go to The New York Times offers a Developer API Portal
```
https://developer.nytimes.com/get-started
```


Get started using the APIs in four steps:

### Create an Account
If you don't already have an account create one:

### Click Sign In.
Click Create account and follow prompts to register.
# Sign In
### To sign in to the portal:

### Click Sign In.
Enter your email address and password.
### Click Sign In.
# Register apps
## To register an app:

Select My Apps from the user drop-down.
Click + New App to create a new app.
Enter a name and description for the app in the New App dialog.
Click Create.
Click the APIs tab.
Click the access toggle to enable or disable access to an API product from the app.
Access the API keys
### Select My Apps from th user drop-down.
### Click the app in the list.
### View the API key on the App Details tab.
### Confirm that the status of the API key is Approved.
# APIs
## The APIs page has information on the different APIs. The documentation for each API includes an interactive reference for trying out the API.
**Step 1:**

Download or clone this repo by using the link below:

```
https://github.com/ajopetersebastian1/nytTechnology_Assessment.git
```

**Step 2:**

Go to project root and execute the following command in console to get the required dependencies: 

```
flutter pub get 
```

**Step 3:**

This project uses `Get` library that used for Statemanagement, execute the following command to generate files:

```
flutter pub add get
```

or watch command in order to keep the source code synced automatically:

```
flutter pub get
```

##  Features:

most poppular mews Articles from NY times


### Up-Coming Features:
  *  recent news Articles
  * one week Ago
  * one month ago

### Packages & Tools Used

* [http](https://pub.dev/packages/http) (A composable, Future-based library for making HTTP requests.)
* [GetX](https://github.com/jonataslaw/getx) (State Management)
* [flutter_inappwebview](https://pub.dev/packages/flutter_inappwebview) (A Flutter plugin that allows you to add an inline webview)

### Folder Structure
Here is the core folder structure which flutter provides.

```
flutter-app/
|- android
|- build
|- ios
|- lib
|- test
```

Here is the folder structure we have been using in this project

```
lib/
|- base/
|- constants/
|- helpers/
|- stores/
|- screens/
|- widgets/
|- main.dart
```

Now, lets dive into the lib folder which has the main code for the application.

```
1- base - Contains the bae controller and base view.
2- constants - All the application level constants are defined in this directory with-in their respective files. This directory contains the constants for `theme`, `dimentions`, `api endpoints`, `preferences` and `strings`.
3- helpers - Contains the helpers for format the date and time 
4- screens — Contains all the ui of your project, contains sub directory for each screen.
5- widgets — Contains the common widgets for your applications. For example, Button, TextField etc.
6- routes.dart — This file contains all the routes for your application.
7- main.dart - This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.
```


### Routes

This file contains all the routes for your application.

```dart
import 'package:get/get.dart';
import 'package:nytimes/screens/news_det_screen/binding/news_det_binding.dart';
import 'package:nytimes/screens/news_det_screen/news_det_screen.dart';
import 'package:nytimes/screens/news_screen/binding/news_binding.dart';
import 'package:nytimes/screens/news_screen/news_screen.dart';

const newsScreen = '/news-screen';
const newsDetScreen = '/news-det-screen';
final routes = [
  GetPage(
    name: newsScreen,
    page: () => const NewsScreen(),
    binding: NewsArticlesBinding(),
  ),
    GetPage(
    name: newsDetScreen,
    page: () =>  NewsDetScreen( ),
    binding: NewsDetBinding(),
  ),
];

```

### Main

This is the starting point of the application. All the application level configurations are defined in this file i.e, theme, routes, title, orientation etc.

```dart
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:nytimes/helpers/route.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: routes,
      debugShowCheckedModeBanner: false,
      initialRoute: newsScreen,
    );
  }
}
```
# test_coverage

A simple command-line tool to collect test coverage information from
Dart VM tests. It is useful if you need to generate coverage reports
locally during development.

## Usage

Add dev dependency to your `pubspec.yaml`:

```yaml
dev_dependencies:
  test_coverage: ^0.4.2
```

Run `pub get` to install. Then, in the root of your project run:

```bash
pub run test_coverage
```

Result is saved in `coverage/lcov.info`. If you have `lcov` tool
installed on your system (for Mac it's `brew install lcov`) you can
generate coverage reports using `genhtml` command:

```bash
genhtml -o coverage coverage/lcov.info
# Open in the default browser (mac):
open coverage/index.html
```

## Integrations

Resulting `coverage/lcov.info` file is ready to be consumed by
Codecov command-line tool, so no extra step is needed.

This library was not tested with coveralls yet.

## Generating badge image

![Coverage](https://raw.githubusercontent.com/ajopetersebastian1/nytTechnology_Assessment/test-coverage/master/coverage_badge.svg?sanitize=true)

Coverage badge SVG image is automatically generated and saved to `coverage_badge.svg` in your
project root directory. You can add it to Git and use in README.md on Github as follows:

```md
![Coverage](https://raw.githubusercontent.com/ajopetersebastian1/nytTechnology_Assessment/master/coverage_badge.svg?sanitize=true)
```

If you don't need it you can pass `--no-badge` flag when running test coverage.

## Known limitations

* This library was created to run Dart VM tests. It has not been tested
  and likely won't work for Dart code targeting web platform (compiled
  to JavaScript). There is no need to use this tool for Flutter as it
  allows collecting coverage information with `flutter test --coverage`.

## How it works

The tool performs following steps:

### 1. Generates `test/.test_coverage.dart` file (a "test all" script).

Scans your `test/` directory to find all `*_test.dart` files and creates `test/.test_coverage.dart`
which imports all found test files and runs corresponding `main()` of all tests functions within
the same file (and process), which simplifies collection of coverage information.

It is recommended to add this file to your `.gitignore`.

Below is an example of `test/.test_coverage.dart`:

```dart
// Auto-generated by test_coverage. Do not edit by hand.
// Consider adding this file to your .gitignore.

import 'some_test.dart' as some_test;
import 'nested/other_test.dart' as other_test;
import 'some_other_test.dart' as some_other_test;

void main() {
  some_test.main();
  other_test.main();
  some_other_test.main();
}
```

### 2. Runs the tests

Following command is used to run the tests:

```
dart --pause-isolates-on-exit --enable_asserts --enable-vm-service \
  test/.test_coverage.dart
```

### 3. Collects and formats coverage information

When test execution is completed the tool uses functionality of the
`coverage` package to collect and format coverage report.

Feel free to file feature requests and bug reports at the
[issue tracker][].

[issue tracker]: https://github.com/ajopetersebastian1/test-coverage/issues

### 4. Minimal coverage percentage

Set minimal coverage percentage to pass
`min-coverage` percentage value of coverage.

### 5. See test output
`print-test-output` to show test output.

Show output of tests

## Conclusion

I will be happy to answer any questions that you may have on this approach, and if you want to lend a hand with the boilerplate then please feel free to submit an issue and/or pull request 🙂

Again to note, this is example can appear as over-architectured for what it is - but it is an example only. If you liked my work, don’t forget to ⭐ star the repo to show your support.

