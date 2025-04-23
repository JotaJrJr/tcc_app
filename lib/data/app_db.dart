import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

import 'dao_list.dart';
import 'table_list.dart';

///TABLES
import 'package:todo_app_tcc/data/tables/note_table.dart';

///DAOS
import 'package:todo_app_tcc/data/daos/note_dao.dart';

part 'app_db.g.dart';

@DriftDatabase(tables: TableList.tables, daos: DaoList.daos)
class AppDb extends _$AppDb {
  AppDb() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'app_db');
  }
}
