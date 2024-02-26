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

@TestOn('chrome')

import 'package:test/test.dart';
import 'package:web/web.dart' as web;

import 'package:crawler_detector/crawler_detector.dart';
import 'package:crawler_detector/src/user_agent.dart';

const Map<String, String> crawlerUserAgents = <String, String>{
  'Yahoo': 'Mozilla/5.0 (compatible; Yahoo! Slurp; http://help.yahoo.com/help/us/ysearch/slurp)',
  'Bing': 'Mozilla/5.0 (compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm)',
  'Yandex': 'Mozilla/5.0 (compatible; YandexBot/3.0; +http://yandex.com/bots)',
  'Google': 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/W.X.Y.Z Mobile Safari/537.36 (compatible; Googlebot/2.1; +http://www.google.com/bot.html)',
  'Google Storebot': 'Mozilla/5.0 (X11; Linux x86_64; Storebot-Google/1.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/79.0.3945.88 Safari/537.36',
  'Google AdsBot': 'Mozilla/5.0 (Linux; Android 6.0.1; Nexus 5X Build/MMB29P) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/W.X.Y.Z Mobile Safari/537.36 (compatible; AdsBot-Google-Mobile; +http://www.google.com/mobile/adsbot.html)',
  'Google AdSense': 'Mediapartners-Google',
  'DuckDuckGo': 'DuckDuckBot-Https/1.1; (+https://duckduckgo.com/duckduckbot)',
  'Baidu': 'Mozilla/5.0 (compatible; Baiduspider/2.0; +http://www.baidu.com/search/spider.html)',
};

const Map<String, String> nonCrawlerUserAgents = <String, String>{
  'Chrome for Android': 'Mozilla/5.0 (Linux; Android 10; K) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Mobile Safari/537.36',
  'Chrome for Windows': 'Mozilla/5.0 (Windows NT 10.0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/104.0.0.0 Safari/537.36',
  'Chrome for macOS': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/121.0.0.0 Safari/537.36',
  'Firefox for Windows': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:99.0) Gecko/20100101 Firefox/99.0',
  'Firefox for macOS': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:101.0) Gecko/20100101 Firefox/101.0',
  'Edge for Windows': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/120.0.0.0 Safari/537.36 Edg/120.0.0.0',
  'Safari for macOS': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/17.3.1 Safari/605.1.15',
  'Safari for iOS': 'Mozilla/5.0 (iPhone; CPU iPhone OS 12_0 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.0 Mobile/15E148 Safari/604.1',
};

void main() {
  // Create a dummy HTML element to make sure the test only runs on the web.
  web.document.createElement('div');

  test('detectCrawler detects a web crawler', () {
    String testUserAgentString = '';

    getUserAgent = () => testUserAgentString;
    addTearDown(() {
      getUserAgent = defaultGetUserAgent;
    });

    for (final MapEntry<String, String> testAgent in crawlerUserAgents.entries) {
      testUserAgentString = testAgent.value;
      expect(
        reason: '${testAgent.key} is a crawler',
        detectCrawler(),
        isTrue,
      );
    }
  });

  test('detectCrawler does not detect a web crawler', () {
    String testUserAgentString = '';

    getUserAgent = () => testUserAgentString;
    addTearDown(() {
      getUserAgent = defaultGetUserAgent;
    });

    for (final MapEntry<String, String> testAgent in nonCrawlerUserAgents.entries) {
      testUserAgentString = testAgent.value;
      expect(
        reason: '${testAgent.key} is not a crawler',
        detectCrawler(),
        isFalse,
      );
    }
  });
}
