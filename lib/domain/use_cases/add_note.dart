import '../entities/note.dart';
import '../repositories/note_repository.dart';

class AddNote {
  final NoteRepository _repo;
  AddNote(this._repo);

  Future<void> call(Note note) {
    return _repo.add(note);
  }
}
