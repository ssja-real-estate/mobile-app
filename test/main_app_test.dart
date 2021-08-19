import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:saja/main.dart';

void main() {
  testWidgets('has a curved navigation bar', (WidgetTester tester) async {
    await tester.pumpWidget(
      MainApp(),
    );

    expect(find.byType(CurvedNavigationBar), findsOneWidget);
  });
}
