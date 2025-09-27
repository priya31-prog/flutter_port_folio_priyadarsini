// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:port_folio/Screens/home_page.dart';
import 'package:port_folio/main.dart';
import 'package:port_folio/state_management/bloc_provider.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  // Widget loadImage(String path, {double? width, double? height, BoxFit? fit}) {
  //   return Image.asset(path, width: width, height: height, fit: fit);
  // }

  setUpAll(() {
    // WidgetsFlutterBinding.ensureInitialized();
  });
  testWidgets('Portfolio sample test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    // expect(find.text('0'), findsOneWidget);
    expect(find.byType(MaterialApp), findsOneWidget);
    expect(find.byType(HomePage), findsOneWidget);
    expect(find.byType(BlocProvider<PortFolioBloc>), findsOneWidget);
  });

  // testWidgets('Home Page test',) async{

  // }
}
