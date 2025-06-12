import 'package:mocktail/mocktail.dart';
import 'package:todo_app_tcc/domain/repositories/note_repository.dart';
import 'package:todo_app_tcc/domain/use_cases/get_all_notes.dart';
import 'package:todo_app_tcc/domain/use_cases/add_note.dart';
import 'package:todo_app_tcc/domain/use_cases/delete_note.dart';
import 'package:todo_app_tcc/domain/use_cases/update_note.dart';

class MockNoteRepository extends Mock implements NoteRepository {}

class MockGetAllNotes extends Mock implements GetAllNotes {}

class MockAddNote extends Mock implements AddNote {}

class MockDeleteNote extends Mock implements DeleteNote {}

class MockUpdateNote extends Mock implements UpdateNote {}
