Helps Flutter and Dart apps detect when they are being crawled by a web crawler.

## Features

This package pattern-matches the user agent string against a list of known
patterns to detect a crawler.

The implementation can detect crawlers in all Dart web targets, including
[Flutter Web](https://flutter.dev/multi-platform/web) apps, and DOM-based Dart
apps (e.g. those using [Jaspr](https://pub.dev/packages/jaspr) or
[AngularDart](https://angulardart.xyz)).

Dart VM targets are not web targets, and therefore you can never detect a
crawler from within the Dart VM (e.g. command-line Dart apps, Flutter mobile or
desktop apps).

## Usage

Add a dependency to `pubspec.yaml`:

```
dependencies:
  crawler_detector: any
```

Import the package and use it:

```dart
import 'package:crawler_detector/crawler_detector.dart';

void main() {
  final bool isCrawlerUserAgent = detectCrawler();
  print('The current user agent is${isCrawlerUserAgent ? '' : ' not'} a crawler.');
}
```
