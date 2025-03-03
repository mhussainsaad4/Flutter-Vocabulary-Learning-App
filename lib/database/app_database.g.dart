// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $VocabularyTableTable extends VocabularyTable
    with TableInfo<$VocabularyTableTable, VocabularyTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VocabularyTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _wordMeta = const VerificationMeta('word');
  @override
  late final GeneratedColumn<String> word = GeneratedColumn<String>(
      'word', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _definitionMeta =
      const VerificationMeta('definition');
  @override
  late final GeneratedColumn<String> definition = GeneratedColumn<String>(
      'definition', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _exampleSentenceMeta =
      const VerificationMeta('exampleSentence');
  @override
  late final GeneratedColumn<String> exampleSentence = GeneratedColumn<String>(
      'example_sentence', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _masteredMeta =
      const VerificationMeta('mastered');
  @override
  late final GeneratedColumn<bool> mastered = GeneratedColumn<bool>(
      'mastered', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("mastered" IN (0, 1))'),
      defaultValue: const Constant(false));
  @override
  List<GeneratedColumn> get $columns =>
      [id, word, definition, exampleSentence, mastered];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vocabulary_table';
  @override
  VerificationContext validateIntegrity(
      Insertable<VocabularyTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('word')) {
      context.handle(
          _wordMeta, word.isAcceptableOrUnknown(data['word']!, _wordMeta));
    } else if (isInserting) {
      context.missing(_wordMeta);
    }
    if (data.containsKey('definition')) {
      context.handle(
          _definitionMeta,
          definition.isAcceptableOrUnknown(
              data['definition']!, _definitionMeta));
    } else if (isInserting) {
      context.missing(_definitionMeta);
    }
    if (data.containsKey('example_sentence')) {
      context.handle(
          _exampleSentenceMeta,
          exampleSentence.isAcceptableOrUnknown(
              data['example_sentence']!, _exampleSentenceMeta));
    }
    if (data.containsKey('mastered')) {
      context.handle(_masteredMeta,
          mastered.isAcceptableOrUnknown(data['mastered']!, _masteredMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VocabularyTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VocabularyTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      word: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}word'])!,
      definition: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}definition'])!,
      exampleSentence: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}example_sentence']),
      mastered: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mastered'])!,
    );
  }

  @override
  $VocabularyTableTable createAlias(String alias) {
    return $VocabularyTableTable(attachedDatabase, alias);
  }
}

class VocabularyTableData extends DataClass
    implements Insertable<VocabularyTableData> {
  final int id;
  final String word;
  final String definition;
  final String? exampleSentence;
  final bool mastered;
  const VocabularyTableData(
      {required this.id,
      required this.word,
      required this.definition,
      this.exampleSentence,
      required this.mastered});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['word'] = Variable<String>(word);
    map['definition'] = Variable<String>(definition);
    if (!nullToAbsent || exampleSentence != null) {
      map['example_sentence'] = Variable<String>(exampleSentence);
    }
    map['mastered'] = Variable<bool>(mastered);
    return map;
  }

  VocabularyTableCompanion toCompanion(bool nullToAbsent) {
    return VocabularyTableCompanion(
      id: Value(id),
      word: Value(word),
      definition: Value(definition),
      exampleSentence: exampleSentence == null && nullToAbsent
          ? const Value.absent()
          : Value(exampleSentence),
      mastered: Value(mastered),
    );
  }

  factory VocabularyTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VocabularyTableData(
      id: serializer.fromJson<int>(json['id']),
      word: serializer.fromJson<String>(json['word']),
      definition: serializer.fromJson<String>(json['definition']),
      exampleSentence: serializer.fromJson<String?>(json['exampleSentence']),
      mastered: serializer.fromJson<bool>(json['mastered']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'word': serializer.toJson<String>(word),
      'definition': serializer.toJson<String>(definition),
      'exampleSentence': serializer.toJson<String?>(exampleSentence),
      'mastered': serializer.toJson<bool>(mastered),
    };
  }

  VocabularyTableData copyWith(
          {int? id,
          String? word,
          String? definition,
          Value<String?> exampleSentence = const Value.absent(),
          bool? mastered}) =>
      VocabularyTableData(
        id: id ?? this.id,
        word: word ?? this.word,
        definition: definition ?? this.definition,
        exampleSentence: exampleSentence.present
            ? exampleSentence.value
            : this.exampleSentence,
        mastered: mastered ?? this.mastered,
      );
  VocabularyTableData copyWithCompanion(VocabularyTableCompanion data) {
    return VocabularyTableData(
      id: data.id.present ? data.id.value : this.id,
      word: data.word.present ? data.word.value : this.word,
      definition:
          data.definition.present ? data.definition.value : this.definition,
      exampleSentence: data.exampleSentence.present
          ? data.exampleSentence.value
          : this.exampleSentence,
      mastered: data.mastered.present ? data.mastered.value : this.mastered,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyTableData(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('definition: $definition, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('mastered: $mastered')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, word, definition, exampleSentence, mastered);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VocabularyTableData &&
          other.id == this.id &&
          other.word == this.word &&
          other.definition == this.definition &&
          other.exampleSentence == this.exampleSentence &&
          other.mastered == this.mastered);
}

class VocabularyTableCompanion extends UpdateCompanion<VocabularyTableData> {
  final Value<int> id;
  final Value<String> word;
  final Value<String> definition;
  final Value<String?> exampleSentence;
  final Value<bool> mastered;
  const VocabularyTableCompanion({
    this.id = const Value.absent(),
    this.word = const Value.absent(),
    this.definition = const Value.absent(),
    this.exampleSentence = const Value.absent(),
    this.mastered = const Value.absent(),
  });
  VocabularyTableCompanion.insert({
    this.id = const Value.absent(),
    required String word,
    required String definition,
    this.exampleSentence = const Value.absent(),
    this.mastered = const Value.absent(),
  })  : word = Value(word),
        definition = Value(definition);
  static Insertable<VocabularyTableData> custom({
    Expression<int>? id,
    Expression<String>? word,
    Expression<String>? definition,
    Expression<String>? exampleSentence,
    Expression<bool>? mastered,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (word != null) 'word': word,
      if (definition != null) 'definition': definition,
      if (exampleSentence != null) 'example_sentence': exampleSentence,
      if (mastered != null) 'mastered': mastered,
    });
  }

  VocabularyTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? word,
      Value<String>? definition,
      Value<String?>? exampleSentence,
      Value<bool>? mastered}) {
    return VocabularyTableCompanion(
      id: id ?? this.id,
      word: word ?? this.word,
      definition: definition ?? this.definition,
      exampleSentence: exampleSentence ?? this.exampleSentence,
      mastered: mastered ?? this.mastered,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (word.present) {
      map['word'] = Variable<String>(word.value);
    }
    if (definition.present) {
      map['definition'] = Variable<String>(definition.value);
    }
    if (exampleSentence.present) {
      map['example_sentence'] = Variable<String>(exampleSentence.value);
    }
    if (mastered.present) {
      map['mastered'] = Variable<bool>(mastered.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VocabularyTableCompanion(')
          ..write('id: $id, ')
          ..write('word: $word, ')
          ..write('definition: $definition, ')
          ..write('exampleSentence: $exampleSentence, ')
          ..write('mastered: $mastered')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VocabularyTableTable vocabularyTable =
      $VocabularyTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [vocabularyTable];
}

typedef $$VocabularyTableTableCreateCompanionBuilder = VocabularyTableCompanion
    Function({
  Value<int> id,
  required String word,
  required String definition,
  Value<String?> exampleSentence,
  Value<bool> mastered,
});
typedef $$VocabularyTableTableUpdateCompanionBuilder = VocabularyTableCompanion
    Function({
  Value<int> id,
  Value<String> word,
  Value<String> definition,
  Value<String?> exampleSentence,
  Value<bool> mastered,
});

class $$VocabularyTableTableFilterComposer
    extends Composer<_$AppDatabase, $VocabularyTableTable> {
  $$VocabularyTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get definition => $composableBuilder(
      column: $table.definition, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get mastered => $composableBuilder(
      column: $table.mastered, builder: (column) => ColumnFilters(column));
}

class $$VocabularyTableTableOrderingComposer
    extends Composer<_$AppDatabase, $VocabularyTableTable> {
  $$VocabularyTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get word => $composableBuilder(
      column: $table.word, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get definition => $composableBuilder(
      column: $table.definition, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get mastered => $composableBuilder(
      column: $table.mastered, builder: (column) => ColumnOrderings(column));
}

class $$VocabularyTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $VocabularyTableTable> {
  $$VocabularyTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get word =>
      $composableBuilder(column: $table.word, builder: (column) => column);

  GeneratedColumn<String> get definition => $composableBuilder(
      column: $table.definition, builder: (column) => column);

  GeneratedColumn<String> get exampleSentence => $composableBuilder(
      column: $table.exampleSentence, builder: (column) => column);

  GeneratedColumn<bool> get mastered =>
      $composableBuilder(column: $table.mastered, builder: (column) => column);
}

class $$VocabularyTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $VocabularyTableTable,
    VocabularyTableData,
    $$VocabularyTableTableFilterComposer,
    $$VocabularyTableTableOrderingComposer,
    $$VocabularyTableTableAnnotationComposer,
    $$VocabularyTableTableCreateCompanionBuilder,
    $$VocabularyTableTableUpdateCompanionBuilder,
    (
      VocabularyTableData,
      BaseReferences<_$AppDatabase, $VocabularyTableTable, VocabularyTableData>
    ),
    VocabularyTableData,
    PrefetchHooks Function()> {
  $$VocabularyTableTableTableManager(
      _$AppDatabase db, $VocabularyTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VocabularyTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VocabularyTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VocabularyTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> word = const Value.absent(),
            Value<String> definition = const Value.absent(),
            Value<String?> exampleSentence = const Value.absent(),
            Value<bool> mastered = const Value.absent(),
          }) =>
              VocabularyTableCompanion(
            id: id,
            word: word,
            definition: definition,
            exampleSentence: exampleSentence,
            mastered: mastered,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String word,
            required String definition,
            Value<String?> exampleSentence = const Value.absent(),
            Value<bool> mastered = const Value.absent(),
          }) =>
              VocabularyTableCompanion.insert(
            id: id,
            word: word,
            definition: definition,
            exampleSentence: exampleSentence,
            mastered: mastered,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$VocabularyTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $VocabularyTableTable,
    VocabularyTableData,
    $$VocabularyTableTableFilterComposer,
    $$VocabularyTableTableOrderingComposer,
    $$VocabularyTableTableAnnotationComposer,
    $$VocabularyTableTableCreateCompanionBuilder,
    $$VocabularyTableTableUpdateCompanionBuilder,
    (
      VocabularyTableData,
      BaseReferences<_$AppDatabase, $VocabularyTableTable, VocabularyTableData>
    ),
    VocabularyTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VocabularyTableTableTableManager get vocabularyTable =>
      $$VocabularyTableTableTableManager(_db, _db.vocabularyTable);
}
