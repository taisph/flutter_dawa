import 'package:dawa_example/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Example', () {
    testWidgets('should build without exploding', (WidgetTester tester) async {
      await tester.pumpWidget(const MyApp());
    });
  });
}
