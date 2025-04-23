// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_db.dart';

// ignore_for_file: type=lint
class $NoteTableTable extends NoteTable
    with TableInfo<$NoteTableTable, NoteTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $NoteTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'ID',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _titleMeta = const VerificationMeta('title');
  @override
  late final GeneratedColumn<String> title = GeneratedColumn<String>(
    'TITLE',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _contentMeta = const VerificationMeta(
    'content',
  );
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
    'CONTENT',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<int> createdAt = GeneratedColumn<int>(
    'CREATED_AT',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [id, title, content, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'note_table';
  @override
  VerificationContext validateIntegrity(
    Insertable<NoteTableData> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('ID')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['ID']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('TITLE')) {
      context.handle(
        _titleMeta,
        title.isAcceptableOrUnknown(data['TITLE']!, _titleMeta),
      );
    } else if (isInserting) {
      context.missing(_titleMeta);
    }
    if (data.containsKey('CONTENT')) {
      context.handle(
        _contentMeta,
        content.isAcceptableOrUnknown(data['CONTENT']!, _contentMeta),
      );
    } else if (isInserting) {
      context.missing(_contentMeta);
    }
    if (data.containsKey('CREATED_AT')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['CREATED_AT']!, _createdAtMeta),
      );
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  NoteTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return NoteTableData(
      id:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}ID'],
          )!,
      title:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}TITLE'],
          )!,
      content:
          attachedDatabase.typeMapping.read(
            DriftSqlType.string,
            data['${effectivePrefix}CONTENT'],
          )!,
      createdAt:
          attachedDatabase.typeMapping.read(
            DriftSqlType.int,
            data['${effectivePrefix}CREATED_AT'],
          )!,
    );
  }

  @override
  $NoteTableTable createAlias(String alias) {
    return $NoteTableTable(attachedDatabase, alias);
  }
}

class NoteTableData extends DataClass implements Insertable<NoteTableData> {
  final String id;
  final String title;
  final String content;
  final int createdAt;
  const NoteTableData({
    required this.id,
    required this.title,
    required this.content,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['ID'] = Variable<String>(id);
    map['TITLE'] = Variable<String>(title);
    map['CONTENT'] = Variable<String>(content);
    map['CREATED_AT'] = Variable<int>(createdAt);
    return map;
  }

  NoteTableCompanion toCompanion(bool nullToAbsent) {
    return NoteTableCompanion(
      id: Value(id),
      title: Value(title),
      content: Value(content),
      createdAt: Value(createdAt),
    );
  }

  factory NoteTableData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return NoteTableData(
      id: serializer.fromJson<String>(json['id']),
      title: serializer.fromJson<String>(json['title']),
      content: serializer.fromJson<String>(json['content']),
      createdAt: serializer.fromJson<int>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'title': serializer.toJson<String>(title),
      'content': serializer.toJson<String>(content),
      'createdAt': serializer.toJson<int>(createdAt),
    };
  }

  NoteTableData copyWith({
    String? id,
    String? title,
    String? content,
    int? createdAt,
  }) => NoteTableData(
    id: id ?? this.id,
    title: title ?? this.title,
    content: content ?? this.content,
    createdAt: createdAt ?? this.createdAt,
  );
  NoteTableData copyWithCompanion(NoteTableCompanion data) {
    return NoteTableData(
      id: data.id.present ? data.id.value : this.id,
      title: data.title.present ? data.title.value : this.title,
      content: data.content.present ? data.content.value : this.content,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('NoteTableData(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, title, content, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is NoteTableData &&
          other.id == this.id &&
          other.title == this.title &&
          other.content == this.content &&
          other.createdAt == this.createdAt);
}

class NoteTableCompanion extends UpdateCompanion<NoteTableData> {
  final Value<String> id;
  final Value<String> title;
  final Value<String> content;
  final Value<int> createdAt;
  final Value<int> rowid;
  const NoteTableCompanion({
    this.id = const Value.absent(),
    this.title = const Value.absent(),
    this.content = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  NoteTableCompanion.insert({
    required String id,
    required String title,
    required String content,
    required int createdAt,
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       title = Value(title),
       content = Value(content),
       createdAt = Value(createdAt);
  static Insertable<NoteTableData> custom({
    Expression<String>? id,
    Expression<String>? title,
    Expression<String>? content,
    Expression<int>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'ID': id,
      if (title != null) 'TITLE': title,
      if (content != null) 'CONTENT': content,
      if (createdAt != null) 'CREATED_AT': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  NoteTableCompanion copyWith({
    Value<String>? id,
    Value<String>? title,
    Value<String>? content,
    Value<int>? createdAt,
    Value<int>? rowid,
  }) {
    return NoteTableCompanion(
      id: id ?? this.id,
      title: title ?? this.title,
      content: content ?? this.content,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['ID'] = Variable<String>(id.value);
    }
    if (title.present) {
      map['TITLE'] = Variable<String>(title.value);
    }
    if (content.present) {
      map['CONTENT'] = Variable<String>(content.value);
    }
    if (createdAt.present) {
      map['CREATED_AT'] = Variable<int>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('NoteTableCompanion(')
          ..write('id: $id, ')
          ..write('title: $title, ')
          ..write('content: $content, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDb extends GeneratedDatabase {
  _$AppDb(QueryExecutor e) : super(e);
  $AppDbManager get managers => $AppDbManager(this);
  late final $NoteTableTable noteTable = $NoteTableTable(this);
  late final NoteDao noteDao = NoteDao(this as AppDb);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [noteTable];
}

typedef $$NoteTableTableCreateCompanionBuilder =
    NoteTableCompanion Function({
      required String id,
      required String title,
      required String content,
      required int createdAt,
      Value<int> rowid,
    });
typedef $$NoteTableTableUpdateCompanionBuilder =
    NoteTableCompanion Function({
      Value<String> id,
      Value<String> title,
      Value<String> content,
      Value<int> createdAt,
      Value<int> rowid,
    });

class $$NoteTableTableFilterComposer
    extends Composer<_$AppDb, $NoteTableTable> {
  $$NoteTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );
}

class $$NoteTableTableOrderingComposer
    extends Composer<_$AppDb, $NoteTableTable> {
  $$NoteTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get title => $composableBuilder(
    column: $table.title,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get content => $composableBuilder(
    column: $table.content,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$NoteTableTableAnnotationComposer
    extends Composer<_$AppDb, $NoteTableTable> {
  $$NoteTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get title =>
      $composableBuilder(column: $table.title, builder: (column) => column);

  GeneratedColumn<String> get content =>
      $composableBuilder(column: $table.content, builder: (column) => column);

  GeneratedColumn<int> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$NoteTableTableTableManager
    extends
        RootTableManager<
          _$AppDb,
          $NoteTableTable,
          NoteTableData,
          $$NoteTableTableFilterComposer,
          $$NoteTableTableOrderingComposer,
          $$NoteTableTableAnnotationComposer,
          $$NoteTableTableCreateCompanionBuilder,
          $$NoteTableTableUpdateCompanionBuilder,
          (
            NoteTableData,
            BaseReferences<_$AppDb, $NoteTableTable, NoteTableData>,
          ),
          NoteTableData,
          PrefetchHooks Function()
        > {
  $$NoteTableTableTableManager(_$AppDb db, $NoteTableTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer:
              () => $$NoteTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer:
              () => $$NoteTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer:
              () => $$NoteTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> title = const Value.absent(),
                Value<String> content = const Value.absent(),
                Value<int> createdAt = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => NoteTableCompanion(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String title,
                required String content,
                required int createdAt,
                Value<int> rowid = const Value.absent(),
              }) => NoteTableCompanion.insert(
                id: id,
                title: title,
                content: content,
                createdAt: createdAt,
                rowid: rowid,
              ),
          withReferenceMapper:
              (p0) =>
                  p0
                      .map(
                        (e) => (
                          e.readTable(table),
                          BaseReferences(db, table, e),
                        ),
                      )
                      .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$NoteTableTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDb,
      $NoteTableTable,
      NoteTableData,
      $$NoteTableTableFilterComposer,
      $$NoteTableTableOrderingComposer,
      $$NoteTableTableAnnotationComposer,
      $$NoteTableTableCreateCompanionBuilder,
      $$NoteTableTableUpdateCompanionBuilder,
      (NoteTableData, BaseReferences<_$AppDb, $NoteTableTable, NoteTableData>),
      NoteTableData,
      PrefetchHooks Function()
    >;

class $AppDbManager {
  final _$AppDb _db;
  $AppDbManager(this._db);
  $$NoteTableTableTableManager get noteTable =>
      $$NoteTableTableTableManager(_db, _db.noteTable);
}
