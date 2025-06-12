import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app_tcc/domain/entities/note.dart';
import 'package:todo_app_tcc/features/home/home_view_model.dart';

import '../../mocks.dart';

void main() {
  late MockGetAllNotes getAllNotes;
  late MockDeleteNote deleteNote;
  late HomeViewModel viewModel;

  setUp(() {
    getAllNotes = MockGetAllNotes();
    deleteNote = MockDeleteNote();
    viewModel = HomeViewModel(getAllNotes, deleteNote);
  });

  test('deve carregar notas', () async {
    final notes = [
      Note.create(id: '1', title: 'title 1', content: 'content 1'),
      Note.create(id: '2', title: 'title 2', content: 'content 2'),
    ];
    when(() => getAllNotes()).thenAnswer((_) async => notes);

    await viewModel.loadNotes();

    expect(viewModel.notes.value, equals(notes));
  });

  test('deve carregar notas - sem nada', () async {
    List<Note> notes = [];

    when(() => getAllNotes()).thenAnswer((_) async => notes);

    await viewModel.loadNotes();

    expect(viewModel.notes.value, isEmpty);
  });

  test('deve deletar nota', () async {
    final note = Note.create(title: 'title 1', content: 'content 1');
    final notes = [note];

    when(() => getAllNotes()).thenAnswer((_) async => notes);
    when(() => deleteNote(note.id!)).thenAnswer((_) async => true);

    await viewModel.loadNotes();
    await viewModel.delete(note.id!);

    expect(viewModel.notes.value, isNot(contains(note)));
    verify(() => deleteNote(note.id!)).called(1);
  });
}
