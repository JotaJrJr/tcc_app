import '../repositories/note_repository.dart';

class DeleteNote {
  final NoteRepository _repo;
  DeleteNote(this._repo);

  Future<bool> call(String id) {
    return _repo.deleteById(id);
  }
}
