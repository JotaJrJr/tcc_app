// import 'package:flutter_test/flutter_test.dart';
// import 'package:integration_test/integration_test.dart';
// import 'package:flutter/material.dart';
// import 'package:list_benchmark/main.dart' as app;
// import 'package:integration_test/proto/trace.pb.dart';
// import 'package:integration_test/common.dart';

// void main() {
//   IntegrationTestWidgetsFlutterBinding.ensureInitialized();

//   testWidgets('benchmark all lists', (WidgetTester tester) async {
//     app.main();
//     await tester.pumpAndSettle();

//     // Record a timeline while we scroll each tab
//     final timeline = await IntegrationTestWidgetsFlutterBinding.instance!.traceAction(() async {
//       for (final index in List.generate(8, (i) => i)) {
//         // switch to tab
//         await tester.tap(find.byType(Tab).at(index));
//         await tester.pumpAndSettle();
//         // do a fling to scroll down
//         await tester.fling(find.byType(Scrollable), const Offset(0, -300), 1000);
//         await tester.pumpAndSettle(const Duration(seconds: 1));
//       }
//     });

//     final summary = TimelineSummary.summarize(timeline);
//     // Create files under build/
//     summary.writeSummaryToFile('benchmark_summary', pretty: true);
//     summary.writeTimelineToFile('benchmark_timeline', pretty: true);
//   });
// }
