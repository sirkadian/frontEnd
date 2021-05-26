// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:sirkadian_project/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}

// Container(
          //   child: DraggableScrollableSheet(
          //     initialChildSize: 0.1,
          //     maxChildSize: 0.2,
          //     minChildSize: 0.1,
          //     builder: (context, scrollController) {
          //       return Container(
          //         padding: EdgeInsets.only(left: 25, top: 10, right: 25),
          //         decoration: BoxDecoration(
          //             color: Colors.grey.withOpacity(0.5),
          //             borderRadius: BorderRadius.only(
          //                 topLeft: Radius.circular(10),
          //                 topRight: Radius.circular(10))),
          //         child: ListView(
          //           controller: scrollController,
          //           children: [
          //             Center(
          //               child: Container(
          //                 height: 5,
          //                 width: 50,
          //                 decoration: BoxDecoration(
          //                     color: Colors.grey,
          //                     borderRadius: BorderRadius.circular(10)),
          //               ),
          //             ),
          //             // SizedBox(
          //             //   height: 5,
          //             // ),
          //             Center(
          //               child: TextButton(
          //                 // style: ButtonStyle(
          //                 //     backgroundColor:
          //                 //         MaterialStateProperty.all(Colors.black)),
          //                 onPressed: () {},
          //                 child: Text('Mulai Sarapan',
          //                     style: Theme.of(context).textTheme.bodyText1),
          //               ),
          //             )
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),