import 'package:flutter_test/flutter_test.dart';
import 'package:saja/screens/app.dart';
import 'package:saja/main.dart';
import 'package:saja/screens/main_app.dart';

void main() {
  testWidgets('has a curved navigation bar', (WidgetTester tester) async {
    await tester.pumpWidget(
      App(),
    );

    expect(find.byType(MainAppScreen), findsOneWidget);
  });
}
