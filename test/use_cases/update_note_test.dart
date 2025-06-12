import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app_tcc/domain/entities/note.dart';
import 'package:todo_app_tcc/domain/use_cases/update_note.dart';

import '../mocks.dart';

void main() {
  late MockNoteRepository repo;
  late UpdateNote useCase;

  setUp(() {
    repo = MockNoteRepository();
    useCase = UpdateNote(repo);

    registerFallbackValue(Note.create(title: '', content: ''));
  });

  test('deve chamar repo.update com nota correta', () async {
    final note = Note.create(id: '1', title: 'old', content: 'old');

    when(() => repo.update(note)).thenAnswer((_) async => false);

    await useCase(note);

    verify(() => repo.update(note)).called(1);
  });

  test('exceção no repositório - merda no db', () {
    final note = Note.create(id: '2', title: 'X', content: 'Y');
    when(() => repo.update(any())).thenThrow(Exception('db-fail'));

    expect(() => useCase(note), throwsException);
  });
}
