// test/features/home_page/home_page_mobile_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:provider/provider.dart';
import 'package:todo_app_tcc/domain/entities/note.dart';
import 'package:todo_app_tcc/domain/use_cases/add_note.dart';
import 'package:todo_app_tcc/domain/use_cases/update_note.dart';
import 'package:todo_app_tcc/features/home/home_view_model.dart';
import 'package:todo_app_tcc/features/home/view/home_page_mobile.dart';

import '../../mocks.dart';

void main() {
  late MockGetAllNotes mockGetAll;
  late MockDeleteNote mockDelete;
  late MockAddNote mockAdd;
  late MockUpdateNote mockUpdate;
  late HomeViewModel viewModel;

  setUp(() {
    mockGetAll = MockGetAllNotes();
    mockDelete = MockDeleteNote();
    mockAdd = MockAddNote();
    mockUpdate = MockUpdateNote();
    viewModel = HomeViewModel(mockGetAll, mockDelete);
  });

  Widget makeTestable() => MultiProvider(
    providers: [Provider<AddNote>.value(value: mockAdd), Provider<UpdateNote>.value(value: mockUpdate)],
    child: MaterialApp(home: HomePageMobile(viewModel: viewModel)),
  );

  testWidgets('exibe CircularProgressIndicator quando loading=true', (tester) async {
    viewModel.isLoading.value = true;

    await tester.pumpWidget(makeTestable());

    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });

  testWidgets('exibe mensagem Nenhuma nota quando lista vazia', (tester) async {
    when(() => mockGetAll()).thenAnswer((_) async => []);
    await tester.pumpWidget(makeTestable());

    await tester.runAsync(() => viewModel.loadNotes());
    await tester.pumpAndSettle();

    expect(find.text('Nenhuma nota'), findsOneWidget);
  });

  testWidgets('exibe notas quando lista possui itens', (tester) async {
    final note = Note.create(title: 'Teste', content: '...');
    when(() => mockGetAll()).thenAnswer((_) async => [note]);

    await tester.pumpWidget(makeTestable());
    await tester.runAsync(() => viewModel.loadNotes());
    await tester.pumpAndSettle();

    expect(find.text('Teste'), findsOneWidget);
  });

  testWidgets('deletar remove item da lista e chama use-case', (tester) async {
    final note = Note.create(title: 'Del', content: '');
    when(() => mockGetAll()).thenAnswer((_) async => [note]);
    when(() => mockDelete(note.id!)).thenAnswer((_) async => true);

    await tester.pumpWidget(makeTestable());
    await tester.runAsync(() => viewModel.loadNotes());
    await tester.pumpAndSettle();

    await tester.tap(find.byIcon(Icons.delete));
    await tester.pumpAndSettle();

    expect(find.text('Del'), findsNothing);
    verify(() => mockDelete(note.id!)).called(1);
  });
}
