import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:todo_app_tcc/domain/use_cases/delete_note.dart';

import '../mocks.dart';

void main() {
  late MockNoteRepository repo;
  late DeleteNote useCase;

  setUp(() {
    repo = MockNoteRepository();
    useCase = DeleteNote(repo);
  });

  test('deve chamar repo.deleteById com id correto', () async {
    const id = '123';
    when(() => repo.deleteById(id)).thenAnswer((_) async => true);

    final result = await useCase(id);

    expect(result, isTrue);
    verify(() => repo.deleteById(id)).called(1);
  });

  test('exceção no repositório - merda no db', () {
    const id = '404';
    when(() => repo.deleteById(id)).thenThrow(Exception('db-fail'));

    expect(() => useCase(id), throwsException);
  });
}
