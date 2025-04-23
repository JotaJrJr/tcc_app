import 'package:drift/drift.dart';
import 'package:todo_app_tcc/data/app_db.dart';
import 'package:todo_app_tcc/data/tables/note_table.dart';

part 'note_dao.g.dart';

@DriftAccessor(tables: [NoteTable])
class NoteDao extends DatabaseAccessor<AppDb> with _$NoteDaoMixin {
  final AppDb _db;

  NoteDao(this._db) : super(_db);

  //   Future<List<ProdutoTableData>> getAll() => select(produtoTable).get();

  //   Future<void> deleteAll() => delete(produtoTable).go();

  //   Future insert(Insertable<ProdutoTableData> data) async {
  //     return into(produtoTable).insert(data);
  //   }

  //   Future<ProdutoTableData?> queryById(String id) async {
  //     return (select(produtoTable)..where((tbl) => tbl.id.equals(id))).getSingleOrNull();
  //   }

  //   Future<bool> deleteById(String id) async {
  //     final deleteResult = await (delete(produtoTable)..where((tbl) => tbl.id.equals(id))).go();
  //     return deleteResult > 0;
  //   }

  //   Future<bool> modify(ProdutoTableData data) async {
  //     return update(produtoTable).replace(data);
  //   }
}
