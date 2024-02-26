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

@TestOn('vm')

import 'dart:io' as io;
import 'package:test/test.dart';

import 'package:crawler_detector/crawler_detector.dart';

void main() {
  // Create a dummy file to make sure this test only runs on the Dart VM.
  io.File('dummy.txt');

  test('detectCrawler always returns false on the Dart VM', () {
    expect(detectCrawler(), isFalse);
  });
}
