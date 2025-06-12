import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app_tcc/domain/entities/note.dart';
import 'package:todo_app_tcc/domain/use_cases/get_all_notes.dart';

import '../mocks.dart';

void main() {
  late MockNoteRepository repo;
  late GetAllNotes useCase;

  setUp(() {
    repo = MockNoteRepository();
    useCase = GetAllNotes(repo);

    registerFallbackValue(Note.create(title: '', content: ''));
  });

  test('retorna lista de notas vinda do repositório', () async {
    final notes = [Note.create(id: '1', title: 'A', content: 'B'), Note.create(id: '2', title: 'C', content: 'D')];
    when(() => repo.query()).thenAnswer((_) async => notes);

    final result = await useCase();

    expect(result, equals(notes));
    verify(() => repo.query()).called(1);
  });

  test('exceção no repositório - merda no db', () {
    when(() => repo.query()).thenThrow(Exception('db-fail'));

    expect(() => useCase(), throwsException);
  });
}
