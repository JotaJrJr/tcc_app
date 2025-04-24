import 'package:todo_app_tcc/domain/repositories/note_repository.dart';

import '../entities/note.dart';

class GetAllNotes {
  final NoteRepository _noteRepository;
  GetAllNotes(this._noteRepository);
  Future<List<Note>> call() => _noteRepository.query();
}
