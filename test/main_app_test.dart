import 'package:flutter_test/flutter_test.dart';
import 'package:saja/main.dart';

void main() {
  testWidgets('has a Text widget', (WidgetTester tester) async {
    await tester.pumpWidget(MainApp());

    expect(find.text('Hello World!'), findsOneWidget);
  });
}
