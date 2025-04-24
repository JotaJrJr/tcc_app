import 'package:todo_app_tcc/data/app_db.dart';
import 'package:todo_app_tcc/data/daos/note_dao.dart';
import 'package:todo_app_tcc/data/mapper/note_mapper.dart';
import 'package:todo_app_tcc/domain/entities/note.dart';
import 'package:todo_app_tcc/domain/repositories/note_repository.dart';

class NoteRepositoryImpl implements NoteRepository {
  final NoteDao _dao;
  NoteRepositoryImpl(AppDb db) : _dao = db.noteDao;

  @override
  Future<void> add(Note note) async {
    await _dao.insertNote(note.toData());
  }

  @override
  Future<bool> delete(Note note) async {
    final count = await _dao.deleteById(note.id!);
    return count > 0;
  }

  @override
  Future<bool> deleteById(String id) async {
    final count = await _dao.deleteById(id);
    return count > 0;
  }

  @override
  Future<Note> getById(String id) async {
    final data = await _dao.queryById(id);
    if (data == null) throw Exception('Note not found');
    return data.toDomain();
  }

  @override
  Future<List<Note>> query() async {
    final rows = await _dao.getAll();
    return rows.map((row) => row.toDomain()).toList();
  }

  @override
  Future<bool> update(Note note) async {
    return await _dao.modify(note.toData());
  }
}
