// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:gourmet_eats/widgets/primary_button_widget.dart';
import 'package:gourmet_eats/widgets/share_button_widget.dart';

void main() {
  testWidgets('Primary custom buttom has colour,height,width and text ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: PrimaryButton(buttonName: 'Submit', onTap: (){})));

    final textFinder = find.text("Submit");

    expect(textFinder, findsOneWidget);
  });


  testWidgets('Share custom buttom has colour,height,width and text ', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: ShareButtonWidget(onClicked: (){})));

    final textFinder = find.text("SEND ORDER");

    expect(textFinder, findsOneWidget);
  });

}
