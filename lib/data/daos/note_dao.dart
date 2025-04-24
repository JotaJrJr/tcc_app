import 'package:drift/drift.dart';
import 'package:todo_app_tcc/data/app_db.dart';
import 'package:todo_app_tcc/data/tables/note_table.dart';

part 'note_dao.g.dart';

@DriftAccessor(tables: [NoteTable])
class NoteDao extends DatabaseAccessor<AppDb> with _$NoteDaoMixin {
  final AppDb _db;

  NoteDao(this._db) : super(_db);

  Future<List<NoteTableData>> getAll() => select(noteTable).get();

  Future<NoteTableData?> queryById(String id) =>
      (select(noteTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();

  Future<int> insertNote(Insertable<NoteTableData> data) => into(noteTable).insert(data);

  Future<bool> modify(NoteTableData data) => update(noteTable).replace(data);

  Future<int> deleteById(String id) => (delete(noteTable)..where((tbl) => tbl.id.equals(id))).go();
}
