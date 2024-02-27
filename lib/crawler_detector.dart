// Copyright 2024 `package:crawler_detector` authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

/// Detects web crawlers.
library;

import 'src/detector_io.dart' if (dart.library.js_util) 'src/detector_web.dart'
    as impl;

/// Detects if the current user agent (e.g. browser) is a web crawler.
///
/// If a crawler is detected, returns `true`. Otherwise, returns `false`.
///
/// Always returns `false` when compiled to a non-web Dart compilation target,
/// including:
///
/// - Command-line Dart programs
/// - Flutter for Android
/// - Flutter for iOS
/// - Flutter for Desktop (Windows, Linux, macOS)
bool detectCrawler() {
  return impl.detectCrawler();
}
