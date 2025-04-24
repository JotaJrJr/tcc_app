import '../entities/note.dart';
import '../repositories/note_repository.dart';

class UpdateNote {
  final NoteRepository _repo;
  UpdateNote(this._repo);

  Future<bool> call(Note note) {
    return _repo.update(note);
  }
}
