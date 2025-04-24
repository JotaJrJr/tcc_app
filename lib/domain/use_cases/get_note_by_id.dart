import '../entities/note.dart';
import '../repositories/note_repository.dart';

class GetNoteById {
  final NoteRepository _repo;
  GetNoteById(this._repo);

  Future<Note> call(String id) {
    return _repo.getById(id);
  }
}
