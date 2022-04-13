import 'package:dawa/dawa.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DawaAutocompleteWidget', () {
    testWidgets('should build without exploding', (WidgetTester tester) async {
      await tester.pumpWidget(
          MaterialApp(home: Scaffold(body: DawaAutocompleteWidget())));
    });
  });
}
