import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app_tcc/domain/entities/note.dart';
import 'package:todo_app_tcc/domain/use_cases/get_note_by_id.dart';

import '../mocks.dart';

void main() {
  late MockNoteRepository repo;
  late GetNoteById useCase;

  setUp(() {
    repo = MockNoteRepository();
    useCase = GetNoteById(repo);

    registerFallbackValue(Note.create(title: '', content: ''));
  });

  test('retorna nota quando encontrada', () async {
    final note = Note.create(id: 'abc', title: 'title', content: 'x');
    when(() => repo.getById('abc')).thenAnswer((_) async => note);

    final result = await useCase('abc');

    expect(result, equals(note));
    verify(() => repo.getById('abc')).called(1);
  });

  test('lança NoteNotFoundException quando não existe', () {
    when(() => repo.getById('404')).thenThrow(NoteNotFoundException('404'));

    expect(() => useCase('404'), throwsA(isA<NoteNotFoundException>()));
  });

  test('exceção no repositório - merda no db', () {
    when(() => repo.getById(any())).thenThrow(Exception('db-fail'));

    expect(() => useCase('xyz'), throwsException);
  });
}

class NoteNotFoundException implements Exception {
  final String id;

  NoteNotFoundException(this.id);

  @override
  String toString() => 'NoteNotFoundException: Note with id $id not found';
}
