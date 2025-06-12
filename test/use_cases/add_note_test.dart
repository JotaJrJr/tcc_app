import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app_tcc/domain/entities/note.dart';
import 'package:todo_app_tcc/domain/use_cases/add_note.dart';

import '../mocks.dart';

void main() {
  late MockNoteRepository repo;
  late AddNote useCase;

  setUp(() {
    repo = MockNoteRepository();
    useCase = AddNote(repo);

    registerFallbackValue(Note.create(id: '123', title: 'title', content: 'content'));
  });

  test('deve chamar o repo.add com a nota correta', () async {
    final note = Note.create(id: '123', title: 'title', content: 'content');

    when(() => repo.add(note)).thenAnswer((_) async => {});

    await useCase(note);

    expect(() => repo.add(note), returnsNormally);

    verify(() => repo.add(note));
  });

  test('exceção no repositório - merda no db', () async {
    final note = Note.create(title: 'title', content: 'content');
    when(() => repo.add(any())).thenThrow(Exception('db-fail'));

    expect(() => useCase(note), throwsException);
  });
}
