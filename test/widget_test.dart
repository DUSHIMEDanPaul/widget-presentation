import 'package:flutter_test/flutter_test.dart';
import 'package:fitted_fractional_demo/main.dart';

void main() {
  testWidgets('App shows both demo tabs', (WidgetTester tester) async {
    await tester.pumpWidget(const WidgetPresentationApp());

    expect(find.text('FittedBox'), findsOneWidget);
    expect(find.text('FractionallySizedBox'), findsOneWidget);
  });
}
