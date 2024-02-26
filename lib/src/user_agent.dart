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

import 'package:web/web.dart' as web;

/// The signature of [getUserAgent].
typedef UserAgentGetter = String Function();

/// Returns the current user agent string.
///
/// This function is read-writable, so it can be overridden in tests.
UserAgentGetter getUserAgent = defaultGetUserAgent;

/// The default implementation of [getUserAgent].
String defaultGetUserAgent() {
  return web.window.navigator.userAgent;
}
