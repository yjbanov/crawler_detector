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

import 'user_agent.dart';

// User agent string patterns used by crawlers detected by this library.
//
// The goal is to capture all of the known important crawlers, so this list may
// grow over time.
//
// How to add a new crawler to this list:
//
// 1. Add the URL to the authoritative documentation that describes how the
//    crawler announces itself to web sites in its user agent string.
// 2. Add the list of regular expressions that match on the user agent string.
//    Watch for conflicts and redundancy with other regular expressions.
final List<RegExp> _crawlerRegexes = <RegExp>[
  // Covers the search engine and various specialized crawlers: https://developers.google.com/search/docs/crawling-indexing/overview-google-crawlers
  RegExp(r'googlebot'),
  RegExp(r'\-google'),

  // https://www.bing.com/webmasters/help/which-crawlers-does-bing-use-8c184ec0
  RegExp(r'bingbot'),

  // https://help.yahoo.com/kb/SLN22600.html?guccounter=1&guce_referrer=aHR0cHM6Ly93d3cuZ29vZ2xlLmNvbS8&guce_referrer_sig=AQAAAHYCkkIs7cZnhukSWyF2fm5fvmF4O0hHyVAfflpLGgpkUyKE_oPtyuTbPEnHEw9hJfgfyD5mnYtUdWngKIq-aUwiRz_Kz7G_5I7jbyvZyiXyObYZlltmEazI-97JcSOG-AbDLdNMATVgEW23LgFVADYtPkr8VcsKfMem8B0eZBWA
  RegExp(r'slurp'),

  // https://duckduckgo.com/duckduckbot
  RegExp(r'duckduckbot'),

  // http://www.baidu.com/search/spider.html
  RegExp(r'spider'),

  // https://yandex.com/support/webmaster/robot-workings/user-agent.html
  RegExp(r'yandexbot'),

  // The StackOverflow wisdom is to include "crawl" in the detection logic as
  // well, albeit at the time of this writing I wasn't aware of any concrete
  // crawlers that used this substring.
  //
  // https://stackoverflow.com/questions/20084513/detect-search-crawlers-via-javascript
  RegExp(r'crawl'),
];

/// The web implementation.
///
/// See also `detector_io.dart` for the fake non-web implementation.
bool detectCrawler() {
  final String userAgent = getUserAgent().toLowerCase();
  return _crawlerRegexes.any((RegExp regexp) => regexp.hasMatch(userAgent));
}
