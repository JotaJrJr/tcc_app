import 'package:todo_app_tcc/data/app_db.dart';

import '../../domain/entities/note.dart';

extension NoteMapperEntity on NoteTableData {
  Note toDomain() {
    return Note(id: id, title: title, content: content, createdAt: createdAt);
  }
}

extension NoteMapperData on Note {
  NoteTableData toData() {
    return NoteTableData(id: id!, title: title!, content: content!, createdAt: createdAt!);
  }
}
