import 'package:todo_app_tcc/domain/entities/note.dart';

abstract class NoteRepository {
  Future<List<Note>> query();
  Future<void> add(Note note);
  Future<bool> update(Note note);
  Future<bool> delete(Note note);
  Future<bool> deleteById(String id);
  Future<Note> getById(String id);
}
