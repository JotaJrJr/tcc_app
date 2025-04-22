import 'package:drift/drift.dart';

class NoteTable extends Table {
  TextColumn get id => text().named('ID')();
  TextColumn get title => text().named('TITLE')();
  TextColumn get content => text().named('CONTENT')();
  IntColumn get createdAt => integer().named('CREATED_AT')();
}
