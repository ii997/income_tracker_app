// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $IncomeCategoriesTable extends IncomeCategories
    with TableInfo<$IncomeCategoriesTable, IncomeCategory> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeCategoriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _categoryIdMeta = const VerificationMeta(
    'categoryId',
  );
  @override
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _categoryNameMeta = const VerificationMeta(
    'categoryName',
  );
  @override
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 50,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _categoryDescriptionMeta =
      const VerificationMeta('categoryDescription');
  @override
  late final GeneratedColumn<String> categoryDescription =
      GeneratedColumn<String>(
        'category_description',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      );
  static const VerificationMeta _categoryisActiveStatusMeta =
      const VerificationMeta('categoryisActiveStatus');
  @override
  late final GeneratedColumn<bool> categoryisActiveStatus =
      GeneratedColumn<bool>(
        'categoryis_active_status',
        aliasedName,
        false,
        type: DriftSqlType.bool,
        requiredDuringInsert: false,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("categoryis_active_status" IN (0, 1))',
        ),
        defaultValue: const Constant(true),
      );
  static const VerificationMeta _categoryCreatedAtMeta = const VerificationMeta(
    'categoryCreatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> categoryCreatedAt =
      GeneratedColumn<DateTime>(
        'category_created_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _categoryUpdatedAtMeta = const VerificationMeta(
    'categoryUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> categoryUpdatedAt =
      GeneratedColumn<DateTime>(
        'category_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    categoryId,
    categoryName,
    categoryDescription,
    categoryisActiveStatus,
    categoryCreatedAt,
    categoryUpdatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_categories';
  @override
  VerificationContext validateIntegrity(
    Insertable<IncomeCategory> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('category_id')) {
      context.handle(
        _categoryIdMeta,
        categoryId.isAcceptableOrUnknown(data['category_id']!, _categoryIdMeta),
      );
    }
    if (data.containsKey('category_name')) {
      context.handle(
        _categoryNameMeta,
        categoryName.isAcceptableOrUnknown(
          data['category_name']!,
          _categoryNameMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryNameMeta);
    }
    if (data.containsKey('category_description')) {
      context.handle(
        _categoryDescriptionMeta,
        categoryDescription.isAcceptableOrUnknown(
          data['category_description']!,
          _categoryDescriptionMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_categoryDescriptionMeta);
    }
    if (data.containsKey('categoryis_active_status')) {
      context.handle(
        _categoryisActiveStatusMeta,
        categoryisActiveStatus.isAcceptableOrUnknown(
          data['categoryis_active_status']!,
          _categoryisActiveStatusMeta,
        ),
      );
    }
    if (data.containsKey('category_created_at')) {
      context.handle(
        _categoryCreatedAtMeta,
        categoryCreatedAt.isAcceptableOrUnknown(
          data['category_created_at']!,
          _categoryCreatedAtMeta,
        ),
      );
    }
    if (data.containsKey('category_updated_at')) {
      context.handle(
        _categoryUpdatedAtMeta,
        categoryUpdatedAt.isAcceptableOrUnknown(
          data['category_updated_at']!,
          _categoryUpdatedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {categoryId};
  @override
  IncomeCategory map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeCategory(
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      categoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_name'],
      )!,
      categoryDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_description'],
      )!,
      categoryisActiveStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}categoryis_active_status'],
      )!,
      categoryCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}category_created_at'],
      )!,
      categoryUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}category_updated_at'],
      )!,
    );
  }

  @override
  $IncomeCategoriesTable createAlias(String alias) {
    return $IncomeCategoriesTable(attachedDatabase, alias);
  }
}

class IncomeCategory extends DataClass implements Insertable<IncomeCategory> {
  final int categoryId;
  final String categoryName;
  final String categoryDescription;
  final bool categoryisActiveStatus;
  final DateTime categoryCreatedAt;
  final DateTime categoryUpdatedAt;
  const IncomeCategory({
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
    required this.categoryisActiveStatus,
    required this.categoryCreatedAt,
    required this.categoryUpdatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['category_id'] = Variable<int>(categoryId);
    map['category_name'] = Variable<String>(categoryName);
    map['category_description'] = Variable<String>(categoryDescription);
    map['categoryis_active_status'] = Variable<bool>(categoryisActiveStatus);
    map['category_created_at'] = Variable<DateTime>(categoryCreatedAt);
    map['category_updated_at'] = Variable<DateTime>(categoryUpdatedAt);
    return map;
  }

  IncomeCategoriesCompanion toCompanion(bool nullToAbsent) {
    return IncomeCategoriesCompanion(
      categoryId: Value(categoryId),
      categoryName: Value(categoryName),
      categoryDescription: Value(categoryDescription),
      categoryisActiveStatus: Value(categoryisActiveStatus),
      categoryCreatedAt: Value(categoryCreatedAt),
      categoryUpdatedAt: Value(categoryUpdatedAt),
    );
  }

  factory IncomeCategory.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeCategory(
      categoryId: serializer.fromJson<int>(json['categoryId']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      categoryDescription: serializer.fromJson<String>(
        json['categoryDescription'],
      ),
      categoryisActiveStatus: serializer.fromJson<bool>(
        json['categoryisActiveStatus'],
      ),
      categoryCreatedAt: serializer.fromJson<DateTime>(
        json['categoryCreatedAt'],
      ),
      categoryUpdatedAt: serializer.fromJson<DateTime>(
        json['categoryUpdatedAt'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'categoryId': serializer.toJson<int>(categoryId),
      'categoryName': serializer.toJson<String>(categoryName),
      'categoryDescription': serializer.toJson<String>(categoryDescription),
      'categoryisActiveStatus': serializer.toJson<bool>(categoryisActiveStatus),
      'categoryCreatedAt': serializer.toJson<DateTime>(categoryCreatedAt),
      'categoryUpdatedAt': serializer.toJson<DateTime>(categoryUpdatedAt),
    };
  }

  IncomeCategory copyWith({
    int? categoryId,
    String? categoryName,
    String? categoryDescription,
    bool? categoryisActiveStatus,
    DateTime? categoryCreatedAt,
    DateTime? categoryUpdatedAt,
  }) => IncomeCategory(
    categoryId: categoryId ?? this.categoryId,
    categoryName: categoryName ?? this.categoryName,
    categoryDescription: categoryDescription ?? this.categoryDescription,
    categoryisActiveStatus:
        categoryisActiveStatus ?? this.categoryisActiveStatus,
    categoryCreatedAt: categoryCreatedAt ?? this.categoryCreatedAt,
    categoryUpdatedAt: categoryUpdatedAt ?? this.categoryUpdatedAt,
  );
  IncomeCategory copyWithCompanion(IncomeCategoriesCompanion data) {
    return IncomeCategory(
      categoryId: data.categoryId.present
          ? data.categoryId.value
          : this.categoryId,
      categoryName: data.categoryName.present
          ? data.categoryName.value
          : this.categoryName,
      categoryDescription: data.categoryDescription.present
          ? data.categoryDescription.value
          : this.categoryDescription,
      categoryisActiveStatus: data.categoryisActiveStatus.present
          ? data.categoryisActiveStatus.value
          : this.categoryisActiveStatus,
      categoryCreatedAt: data.categoryCreatedAt.present
          ? data.categoryCreatedAt.value
          : this.categoryCreatedAt,
      categoryUpdatedAt: data.categoryUpdatedAt.present
          ? data.categoryUpdatedAt.value
          : this.categoryUpdatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCategory(')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('categoryDescription: $categoryDescription, ')
          ..write('categoryisActiveStatus: $categoryisActiveStatus, ')
          ..write('categoryCreatedAt: $categoryCreatedAt, ')
          ..write('categoryUpdatedAt: $categoryUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    categoryId,
    categoryName,
    categoryDescription,
    categoryisActiveStatus,
    categoryCreatedAt,
    categoryUpdatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeCategory &&
          other.categoryId == this.categoryId &&
          other.categoryName == this.categoryName &&
          other.categoryDescription == this.categoryDescription &&
          other.categoryisActiveStatus == this.categoryisActiveStatus &&
          other.categoryCreatedAt == this.categoryCreatedAt &&
          other.categoryUpdatedAt == this.categoryUpdatedAt);
}

class IncomeCategoriesCompanion extends UpdateCompanion<IncomeCategory> {
  final Value<int> categoryId;
  final Value<String> categoryName;
  final Value<String> categoryDescription;
  final Value<bool> categoryisActiveStatus;
  final Value<DateTime> categoryCreatedAt;
  final Value<DateTime> categoryUpdatedAt;
  const IncomeCategoriesCompanion({
    this.categoryId = const Value.absent(),
    this.categoryName = const Value.absent(),
    this.categoryDescription = const Value.absent(),
    this.categoryisActiveStatus = const Value.absent(),
    this.categoryCreatedAt = const Value.absent(),
    this.categoryUpdatedAt = const Value.absent(),
  });
  IncomeCategoriesCompanion.insert({
    this.categoryId = const Value.absent(),
    required String categoryName,
    required String categoryDescription,
    this.categoryisActiveStatus = const Value.absent(),
    this.categoryCreatedAt = const Value.absent(),
    this.categoryUpdatedAt = const Value.absent(),
  }) : categoryName = Value(categoryName),
       categoryDescription = Value(categoryDescription);
  static Insertable<IncomeCategory> custom({
    Expression<int>? categoryId,
    Expression<String>? categoryName,
    Expression<String>? categoryDescription,
    Expression<bool>? categoryisActiveStatus,
    Expression<DateTime>? categoryCreatedAt,
    Expression<DateTime>? categoryUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (categoryId != null) 'category_id': categoryId,
      if (categoryName != null) 'category_name': categoryName,
      if (categoryDescription != null)
        'category_description': categoryDescription,
      if (categoryisActiveStatus != null)
        'categoryis_active_status': categoryisActiveStatus,
      if (categoryCreatedAt != null) 'category_created_at': categoryCreatedAt,
      if (categoryUpdatedAt != null) 'category_updated_at': categoryUpdatedAt,
    });
  }

  IncomeCategoriesCompanion copyWith({
    Value<int>? categoryId,
    Value<String>? categoryName,
    Value<String>? categoryDescription,
    Value<bool>? categoryisActiveStatus,
    Value<DateTime>? categoryCreatedAt,
    Value<DateTime>? categoryUpdatedAt,
  }) {
    return IncomeCategoriesCompanion(
      categoryId: categoryId ?? this.categoryId,
      categoryName: categoryName ?? this.categoryName,
      categoryDescription: categoryDescription ?? this.categoryDescription,
      categoryisActiveStatus:
          categoryisActiveStatus ?? this.categoryisActiveStatus,
      categoryCreatedAt: categoryCreatedAt ?? this.categoryCreatedAt,
      categoryUpdatedAt: categoryUpdatedAt ?? this.categoryUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (categoryId.present) {
      map['category_id'] = Variable<int>(categoryId.value);
    }
    if (categoryName.present) {
      map['category_name'] = Variable<String>(categoryName.value);
    }
    if (categoryDescription.present) {
      map['category_description'] = Variable<String>(categoryDescription.value);
    }
    if (categoryisActiveStatus.present) {
      map['categoryis_active_status'] = Variable<bool>(
        categoryisActiveStatus.value,
      );
    }
    if (categoryCreatedAt.present) {
      map['category_created_at'] = Variable<DateTime>(categoryCreatedAt.value);
    }
    if (categoryUpdatedAt.present) {
      map['category_updated_at'] = Variable<DateTime>(categoryUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeCategoriesCompanion(')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('categoryDescription: $categoryDescription, ')
          ..write('categoryisActiveStatus: $categoryisActiveStatus, ')
          ..write('categoryCreatedAt: $categoryCreatedAt, ')
          ..write('categoryUpdatedAt: $categoryUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $IncomeSourcesTable extends IncomeSources
    with TableInfo<$IncomeSourcesTable, IncomeSource> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeSourcesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _sourceIdMeta = const VerificationMeta(
    'sourceId',
  );
  @override
  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
    'source_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _sourceNameMeta = const VerificationMeta(
    'sourceName',
  );
  @override
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
    'source_name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 100,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _sourceCategoryIdMeta = const VerificationMeta(
    'sourceCategoryId',
  );
  @override
  late final GeneratedColumn<int> sourceCategoryId = GeneratedColumn<int>(
    'source_category_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES income_categories (category_id)',
    ),
  );
  static const VerificationMeta _sourceisActiveStatusMeta =
      const VerificationMeta('sourceisActiveStatus');
  @override
  late final GeneratedColumn<bool> sourceisActiveStatus = GeneratedColumn<bool>(
    'sourceis_active_status',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sourceis_active_status" IN (0, 1))',
    ),
    defaultValue: const Constant(true),
  );
  static const VerificationMeta _sourceCreatedAtMeta = const VerificationMeta(
    'sourceCreatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> sourceCreatedAt =
      GeneratedColumn<DateTime>(
        'source_created_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  static const VerificationMeta _sourceUpdatedAtMeta = const VerificationMeta(
    'sourceUpdatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> sourceUpdatedAt =
      GeneratedColumn<DateTime>(
        'source_updated_at',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: false,
        defaultValue: currentDateAndTime,
      );
  @override
  List<GeneratedColumn> get $columns => [
    sourceId,
    sourceName,
    sourceCategoryId,
    sourceisActiveStatus,
    sourceCreatedAt,
    sourceUpdatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_sources';
  @override
  VerificationContext validateIntegrity(
    Insertable<IncomeSource> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('source_id')) {
      context.handle(
        _sourceIdMeta,
        sourceId.isAcceptableOrUnknown(data['source_id']!, _sourceIdMeta),
      );
    }
    if (data.containsKey('source_name')) {
      context.handle(
        _sourceNameMeta,
        sourceName.isAcceptableOrUnknown(data['source_name']!, _sourceNameMeta),
      );
    } else if (isInserting) {
      context.missing(_sourceNameMeta);
    }
    if (data.containsKey('source_category_id')) {
      context.handle(
        _sourceCategoryIdMeta,
        sourceCategoryId.isAcceptableOrUnknown(
          data['source_category_id']!,
          _sourceCategoryIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_sourceCategoryIdMeta);
    }
    if (data.containsKey('sourceis_active_status')) {
      context.handle(
        _sourceisActiveStatusMeta,
        sourceisActiveStatus.isAcceptableOrUnknown(
          data['sourceis_active_status']!,
          _sourceisActiveStatusMeta,
        ),
      );
    }
    if (data.containsKey('source_created_at')) {
      context.handle(
        _sourceCreatedAtMeta,
        sourceCreatedAt.isAcceptableOrUnknown(
          data['source_created_at']!,
          _sourceCreatedAtMeta,
        ),
      );
    }
    if (data.containsKey('source_updated_at')) {
      context.handle(
        _sourceUpdatedAtMeta,
        sourceUpdatedAt.isAcceptableOrUnknown(
          data['source_updated_at']!,
          _sourceUpdatedAtMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {sourceId};
  @override
  IncomeSource map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeSource(
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_id'],
      )!,
      sourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_name'],
      )!,
      sourceCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_category_id'],
      )!,
      sourceisActiveStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sourceis_active_status'],
      )!,
      sourceCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}source_created_at'],
      )!,
      sourceUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}source_updated_at'],
      )!,
    );
  }

  @override
  $IncomeSourcesTable createAlias(String alias) {
    return $IncomeSourcesTable(attachedDatabase, alias);
  }
}

class IncomeSource extends DataClass implements Insertable<IncomeSource> {
  final int sourceId;
  final String sourceName;
  final int sourceCategoryId;
  final bool sourceisActiveStatus;
  final DateTime sourceCreatedAt;
  final DateTime sourceUpdatedAt;
  const IncomeSource({
    required this.sourceId,
    required this.sourceName,
    required this.sourceCategoryId,
    required this.sourceisActiveStatus,
    required this.sourceCreatedAt,
    required this.sourceUpdatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['source_id'] = Variable<int>(sourceId);
    map['source_name'] = Variable<String>(sourceName);
    map['source_category_id'] = Variable<int>(sourceCategoryId);
    map['sourceis_active_status'] = Variable<bool>(sourceisActiveStatus);
    map['source_created_at'] = Variable<DateTime>(sourceCreatedAt);
    map['source_updated_at'] = Variable<DateTime>(sourceUpdatedAt);
    return map;
  }

  IncomeSourcesCompanion toCompanion(bool nullToAbsent) {
    return IncomeSourcesCompanion(
      sourceId: Value(sourceId),
      sourceName: Value(sourceName),
      sourceCategoryId: Value(sourceCategoryId),
      sourceisActiveStatus: Value(sourceisActiveStatus),
      sourceCreatedAt: Value(sourceCreatedAt),
      sourceUpdatedAt: Value(sourceUpdatedAt),
    );
  }

  factory IncomeSource.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeSource(
      sourceId: serializer.fromJson<int>(json['sourceId']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      sourceCategoryId: serializer.fromJson<int>(json['sourceCategoryId']),
      sourceisActiveStatus: serializer.fromJson<bool>(
        json['sourceisActiveStatus'],
      ),
      sourceCreatedAt: serializer.fromJson<DateTime>(json['sourceCreatedAt']),
      sourceUpdatedAt: serializer.fromJson<DateTime>(json['sourceUpdatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceId': serializer.toJson<int>(sourceId),
      'sourceName': serializer.toJson<String>(sourceName),
      'sourceCategoryId': serializer.toJson<int>(sourceCategoryId),
      'sourceisActiveStatus': serializer.toJson<bool>(sourceisActiveStatus),
      'sourceCreatedAt': serializer.toJson<DateTime>(sourceCreatedAt),
      'sourceUpdatedAt': serializer.toJson<DateTime>(sourceUpdatedAt),
    };
  }

  IncomeSource copyWith({
    int? sourceId,
    String? sourceName,
    int? sourceCategoryId,
    bool? sourceisActiveStatus,
    DateTime? sourceCreatedAt,
    DateTime? sourceUpdatedAt,
  }) => IncomeSource(
    sourceId: sourceId ?? this.sourceId,
    sourceName: sourceName ?? this.sourceName,
    sourceCategoryId: sourceCategoryId ?? this.sourceCategoryId,
    sourceisActiveStatus: sourceisActiveStatus ?? this.sourceisActiveStatus,
    sourceCreatedAt: sourceCreatedAt ?? this.sourceCreatedAt,
    sourceUpdatedAt: sourceUpdatedAt ?? this.sourceUpdatedAt,
  );
  IncomeSource copyWithCompanion(IncomeSourcesCompanion data) {
    return IncomeSource(
      sourceId: data.sourceId.present ? data.sourceId.value : this.sourceId,
      sourceName: data.sourceName.present
          ? data.sourceName.value
          : this.sourceName,
      sourceCategoryId: data.sourceCategoryId.present
          ? data.sourceCategoryId.value
          : this.sourceCategoryId,
      sourceisActiveStatus: data.sourceisActiveStatus.present
          ? data.sourceisActiveStatus.value
          : this.sourceisActiveStatus,
      sourceCreatedAt: data.sourceCreatedAt.present
          ? data.sourceCreatedAt.value
          : this.sourceCreatedAt,
      sourceUpdatedAt: data.sourceUpdatedAt.present
          ? data.sourceUpdatedAt.value
          : this.sourceUpdatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeSource(')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceCategoryId: $sourceCategoryId, ')
          ..write('sourceisActiveStatus: $sourceisActiveStatus, ')
          ..write('sourceCreatedAt: $sourceCreatedAt, ')
          ..write('sourceUpdatedAt: $sourceUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    sourceId,
    sourceName,
    sourceCategoryId,
    sourceisActiveStatus,
    sourceCreatedAt,
    sourceUpdatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeSource &&
          other.sourceId == this.sourceId &&
          other.sourceName == this.sourceName &&
          other.sourceCategoryId == this.sourceCategoryId &&
          other.sourceisActiveStatus == this.sourceisActiveStatus &&
          other.sourceCreatedAt == this.sourceCreatedAt &&
          other.sourceUpdatedAt == this.sourceUpdatedAt);
}

class IncomeSourcesCompanion extends UpdateCompanion<IncomeSource> {
  final Value<int> sourceId;
  final Value<String> sourceName;
  final Value<int> sourceCategoryId;
  final Value<bool> sourceisActiveStatus;
  final Value<DateTime> sourceCreatedAt;
  final Value<DateTime> sourceUpdatedAt;
  const IncomeSourcesCompanion({
    this.sourceId = const Value.absent(),
    this.sourceName = const Value.absent(),
    this.sourceCategoryId = const Value.absent(),
    this.sourceisActiveStatus = const Value.absent(),
    this.sourceCreatedAt = const Value.absent(),
    this.sourceUpdatedAt = const Value.absent(),
  });
  IncomeSourcesCompanion.insert({
    this.sourceId = const Value.absent(),
    required String sourceName,
    required int sourceCategoryId,
    this.sourceisActiveStatus = const Value.absent(),
    this.sourceCreatedAt = const Value.absent(),
    this.sourceUpdatedAt = const Value.absent(),
  }) : sourceName = Value(sourceName),
       sourceCategoryId = Value(sourceCategoryId);
  static Insertable<IncomeSource> custom({
    Expression<int>? sourceId,
    Expression<String>? sourceName,
    Expression<int>? sourceCategoryId,
    Expression<bool>? sourceisActiveStatus,
    Expression<DateTime>? sourceCreatedAt,
    Expression<DateTime>? sourceUpdatedAt,
  }) {
    return RawValuesInsertable({
      if (sourceId != null) 'source_id': sourceId,
      if (sourceName != null) 'source_name': sourceName,
      if (sourceCategoryId != null) 'source_category_id': sourceCategoryId,
      if (sourceisActiveStatus != null)
        'sourceis_active_status': sourceisActiveStatus,
      if (sourceCreatedAt != null) 'source_created_at': sourceCreatedAt,
      if (sourceUpdatedAt != null) 'source_updated_at': sourceUpdatedAt,
    });
  }

  IncomeSourcesCompanion copyWith({
    Value<int>? sourceId,
    Value<String>? sourceName,
    Value<int>? sourceCategoryId,
    Value<bool>? sourceisActiveStatus,
    Value<DateTime>? sourceCreatedAt,
    Value<DateTime>? sourceUpdatedAt,
  }) {
    return IncomeSourcesCompanion(
      sourceId: sourceId ?? this.sourceId,
      sourceName: sourceName ?? this.sourceName,
      sourceCategoryId: sourceCategoryId ?? this.sourceCategoryId,
      sourceisActiveStatus: sourceisActiveStatus ?? this.sourceisActiveStatus,
      sourceCreatedAt: sourceCreatedAt ?? this.sourceCreatedAt,
      sourceUpdatedAt: sourceUpdatedAt ?? this.sourceUpdatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (sourceId.present) {
      map['source_id'] = Variable<int>(sourceId.value);
    }
    if (sourceName.present) {
      map['source_name'] = Variable<String>(sourceName.value);
    }
    if (sourceCategoryId.present) {
      map['source_category_id'] = Variable<int>(sourceCategoryId.value);
    }
    if (sourceisActiveStatus.present) {
      map['sourceis_active_status'] = Variable<bool>(
        sourceisActiveStatus.value,
      );
    }
    if (sourceCreatedAt.present) {
      map['source_created_at'] = Variable<DateTime>(sourceCreatedAt.value);
    }
    if (sourceUpdatedAt.present) {
      map['source_updated_at'] = Variable<DateTime>(sourceUpdatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeSourcesCompanion(')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceCategoryId: $sourceCategoryId, ')
          ..write('sourceisActiveStatus: $sourceisActiveStatus, ')
          ..write('sourceCreatedAt: $sourceCreatedAt, ')
          ..write('sourceUpdatedAt: $sourceUpdatedAt')
          ..write(')'))
        .toString();
  }
}

class $ConsumersTable extends Consumers
    with TableInfo<$ConsumersTable, Consumer> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ConsumersTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _consumerIdMeta = const VerificationMeta(
    'consumerId',
  );
  @override
  late final GeneratedColumn<int> consumerId = GeneratedColumn<int>(
    'consumer_id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _consumerNameMeta = const VerificationMeta(
    'consumerName',
  );
  @override
  late final GeneratedColumn<String> consumerName = GeneratedColumn<String>(
    'consumer_name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('John Doe'),
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [consumerId, consumerName, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'consumers';
  @override
  VerificationContext validateIntegrity(
    Insertable<Consumer> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('consumer_id')) {
      context.handle(
        _consumerIdMeta,
        consumerId.isAcceptableOrUnknown(data['consumer_id']!, _consumerIdMeta),
      );
    }
    if (data.containsKey('consumer_name')) {
      context.handle(
        _consumerNameMeta,
        consumerName.isAcceptableOrUnknown(
          data['consumer_name']!,
          _consumerNameMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {consumerId};
  @override
  Consumer map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Consumer(
      consumerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}consumer_id'],
      )!,
      consumerName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}consumer_name'],
      )!,
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
    );
  }

  @override
  $ConsumersTable createAlias(String alias) {
    return $ConsumersTable(attachedDatabase, alias);
  }
}

class Consumer extends DataClass implements Insertable<Consumer> {
  final int consumerId;
  final String consumerName;
  final DateTime createdAt;
  const Consumer({
    required this.consumerId,
    required this.consumerName,
    required this.createdAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['consumer_id'] = Variable<int>(consumerId);
    map['consumer_name'] = Variable<String>(consumerName);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  ConsumersCompanion toCompanion(bool nullToAbsent) {
    return ConsumersCompanion(
      consumerId: Value(consumerId),
      consumerName: Value(consumerName),
      createdAt: Value(createdAt),
    );
  }

  factory Consumer.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Consumer(
      consumerId: serializer.fromJson<int>(json['consumerId']),
      consumerName: serializer.fromJson<String>(json['consumerName']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'consumerId': serializer.toJson<int>(consumerId),
      'consumerName': serializer.toJson<String>(consumerName),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  Consumer copyWith({
    int? consumerId,
    String? consumerName,
    DateTime? createdAt,
  }) => Consumer(
    consumerId: consumerId ?? this.consumerId,
    consumerName: consumerName ?? this.consumerName,
    createdAt: createdAt ?? this.createdAt,
  );
  Consumer copyWithCompanion(ConsumersCompanion data) {
    return Consumer(
      consumerId: data.consumerId.present
          ? data.consumerId.value
          : this.consumerId,
      consumerName: data.consumerName.present
          ? data.consumerName.value
          : this.consumerName,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Consumer(')
          ..write('consumerId: $consumerId, ')
          ..write('consumerName: $consumerName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(consumerId, consumerName, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Consumer &&
          other.consumerId == this.consumerId &&
          other.consumerName == this.consumerName &&
          other.createdAt == this.createdAt);
}

class ConsumersCompanion extends UpdateCompanion<Consumer> {
  final Value<int> consumerId;
  final Value<String> consumerName;
  final Value<DateTime> createdAt;
  const ConsumersCompanion({
    this.consumerId = const Value.absent(),
    this.consumerName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  ConsumersCompanion.insert({
    this.consumerId = const Value.absent(),
    this.consumerName = const Value.absent(),
    this.createdAt = const Value.absent(),
  });
  static Insertable<Consumer> custom({
    Expression<int>? consumerId,
    Expression<String>? consumerName,
    Expression<DateTime>? createdAt,
  }) {
    return RawValuesInsertable({
      if (consumerId != null) 'consumer_id': consumerId,
      if (consumerName != null) 'consumer_name': consumerName,
      if (createdAt != null) 'created_at': createdAt,
    });
  }

  ConsumersCompanion copyWith({
    Value<int>? consumerId,
    Value<String>? consumerName,
    Value<DateTime>? createdAt,
  }) {
    return ConsumersCompanion(
      consumerId: consumerId ?? this.consumerId,
      consumerName: consumerName ?? this.consumerName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (consumerId.present) {
      map['consumer_id'] = Variable<int>(consumerId.value);
    }
    if (consumerName.present) {
      map['consumer_name'] = Variable<String>(consumerName.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ConsumersCompanion(')
          ..write('consumerId: $consumerId, ')
          ..write('consumerName: $consumerName, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }
}

class $IncomeEntriesTable extends IncomeEntries
    with TableInfo<$IncomeEntriesTable, IncomeEntry> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $IncomeEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
    'amount',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _currencyMeta = const VerificationMeta(
    'currency',
  );
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
    'currency',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 3,
      maxTextLength: 3,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('PHP'),
  );
  static const VerificationMeta _isSharedMeta = const VerificationMeta(
    'isShared',
  );
  @override
  late final GeneratedColumn<bool> isShared = GeneratedColumn<bool>(
    'is_shared',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_shared" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _amountSharedMeta = const VerificationMeta(
    'amountShared',
  );
  @override
  late final GeneratedColumn<double> amountShared = GeneratedColumn<double>(
    'amount_shared',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.0),
  );
  static const VerificationMeta _sharePercentMeta = const VerificationMeta(
    'sharePercent',
  );
  @override
  late final GeneratedColumn<double> sharePercent = GeneratedColumn<double>(
    'share_percent',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0.35),
  );
  static const VerificationMeta _incomeSourceIdMeta = const VerificationMeta(
    'incomeSourceId',
  );
  @override
  late final GeneratedColumn<int> incomeSourceId = GeneratedColumn<int>(
    'income_source_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES income_sources (source_id)',
    ),
  );
  static const VerificationMeta _currentConsumerIdMeta = const VerificationMeta(
    'currentConsumerId',
  );
  @override
  late final GeneratedColumn<int> currentConsumerId = GeneratedColumn<int>(
    'current_consumer_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES consumers (consumer_id)',
    ),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _incomeDateMeta = const VerificationMeta(
    'incomeDate',
  );
  @override
  late final GeneratedColumn<DateTime> incomeDate = GeneratedColumn<DateTime>(
    'income_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _isRecurringMeta = const VerificationMeta(
    'isRecurring',
  );
  @override
  late final GeneratedColumn<bool> isRecurring = GeneratedColumn<bool>(
    'is_recurring',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("is_recurring" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _recurringPatternMeta = const VerificationMeta(
    'recurringPattern',
  );
  @override
  late final GeneratedColumn<String> recurringPattern = GeneratedColumn<String>(
    'recurring_pattern',
    aliasedName,
    true,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
  );
  static const VerificationMeta _createdAtMeta = const VerificationMeta(
    'createdAt',
  );
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
    'created_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  static const VerificationMeta _updatedAtMeta = const VerificationMeta(
    'updatedAt',
  );
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
    'updated_at',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: false,
    defaultValue: currentDateAndTime,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    amount,
    currency,
    isShared,
    amountShared,
    sharePercent,
    incomeSourceId,
    currentConsumerId,
    description,
    incomeDate,
    isRecurring,
    recurringPattern,
    createdAt,
    updatedAt,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'income_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<IncomeEntry> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(
        _amountMeta,
        amount.isAcceptableOrUnknown(data['amount']!, _amountMeta),
      );
    } else if (isInserting) {
      context.missing(_amountMeta);
    }
    if (data.containsKey('currency')) {
      context.handle(
        _currencyMeta,
        currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta),
      );
    }
    if (data.containsKey('is_shared')) {
      context.handle(
        _isSharedMeta,
        isShared.isAcceptableOrUnknown(data['is_shared']!, _isSharedMeta),
      );
    }
    if (data.containsKey('amount_shared')) {
      context.handle(
        _amountSharedMeta,
        amountShared.isAcceptableOrUnknown(
          data['amount_shared']!,
          _amountSharedMeta,
        ),
      );
    }
    if (data.containsKey('share_percent')) {
      context.handle(
        _sharePercentMeta,
        sharePercent.isAcceptableOrUnknown(
          data['share_percent']!,
          _sharePercentMeta,
        ),
      );
    }
    if (data.containsKey('income_source_id')) {
      context.handle(
        _incomeSourceIdMeta,
        incomeSourceId.isAcceptableOrUnknown(
          data['income_source_id']!,
          _incomeSourceIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_incomeSourceIdMeta);
    }
    if (data.containsKey('current_consumer_id')) {
      context.handle(
        _currentConsumerIdMeta,
        currentConsumerId.isAcceptableOrUnknown(
          data['current_consumer_id']!,
          _currentConsumerIdMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_currentConsumerIdMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('income_date')) {
      context.handle(
        _incomeDateMeta,
        incomeDate.isAcceptableOrUnknown(data['income_date']!, _incomeDateMeta),
      );
    } else if (isInserting) {
      context.missing(_incomeDateMeta);
    }
    if (data.containsKey('is_recurring')) {
      context.handle(
        _isRecurringMeta,
        isRecurring.isAcceptableOrUnknown(
          data['is_recurring']!,
          _isRecurringMeta,
        ),
      );
    }
    if (data.containsKey('recurring_pattern')) {
      context.handle(
        _recurringPatternMeta,
        recurringPattern.isAcceptableOrUnknown(
          data['recurring_pattern']!,
          _recurringPatternMeta,
        ),
      );
    }
    if (data.containsKey('created_at')) {
      context.handle(
        _createdAtMeta,
        createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta),
      );
    }
    if (data.containsKey('updated_at')) {
      context.handle(
        _updatedAtMeta,
        updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  IncomeEntry map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeEntry(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      amount: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount'],
      )!,
      currency: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}currency'],
      )!,
      isShared: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_shared'],
      )!,
      amountShared: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}amount_shared'],
      )!,
      sharePercent: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}share_percent'],
      )!,
      incomeSourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}income_source_id'],
      )!,
      currentConsumerId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_consumer_id'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      ),
      incomeDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}income_date'],
      )!,
      isRecurring: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}is_recurring'],
      )!,
      recurringPattern: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recurring_pattern'],
      ),
      createdAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_at'],
      )!,
      updatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}updated_at'],
      )!,
    );
  }

  @override
  $IncomeEntriesTable createAlias(String alias) {
    return $IncomeEntriesTable(attachedDatabase, alias);
  }
}

class IncomeEntry extends DataClass implements Insertable<IncomeEntry> {
  final int id;
  final double amount;
  final String currency;
  final bool isShared;
  final double amountShared;
  final double sharePercent;
  final int incomeSourceId;
  final int currentConsumerId;
  final String? description;
  final DateTime incomeDate;
  final bool isRecurring;
  final String? recurringPattern;
  final DateTime createdAt;
  final DateTime updatedAt;
  const IncomeEntry({
    required this.id,
    required this.amount,
    required this.currency,
    required this.isShared,
    required this.amountShared,
    required this.sharePercent,
    required this.incomeSourceId,
    required this.currentConsumerId,
    this.description,
    required this.incomeDate,
    required this.isRecurring,
    this.recurringPattern,
    required this.createdAt,
    required this.updatedAt,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['amount'] = Variable<double>(amount);
    map['currency'] = Variable<String>(currency);
    map['is_shared'] = Variable<bool>(isShared);
    map['amount_shared'] = Variable<double>(amountShared);
    map['share_percent'] = Variable<double>(sharePercent);
    map['income_source_id'] = Variable<int>(incomeSourceId);
    map['current_consumer_id'] = Variable<int>(currentConsumerId);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['income_date'] = Variable<DateTime>(incomeDate);
    map['is_recurring'] = Variable<bool>(isRecurring);
    if (!nullToAbsent || recurringPattern != null) {
      map['recurring_pattern'] = Variable<String>(recurringPattern);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  IncomeEntriesCompanion toCompanion(bool nullToAbsent) {
    return IncomeEntriesCompanion(
      id: Value(id),
      amount: Value(amount),
      currency: Value(currency),
      isShared: Value(isShared),
      amountShared: Value(amountShared),
      sharePercent: Value(sharePercent),
      incomeSourceId: Value(incomeSourceId),
      currentConsumerId: Value(currentConsumerId),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      incomeDate: Value(incomeDate),
      isRecurring: Value(isRecurring),
      recurringPattern: recurringPattern == null && nullToAbsent
          ? const Value.absent()
          : Value(recurringPattern),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory IncomeEntry.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeEntry(
      id: serializer.fromJson<int>(json['id']),
      amount: serializer.fromJson<double>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      isShared: serializer.fromJson<bool>(json['isShared']),
      amountShared: serializer.fromJson<double>(json['amountShared']),
      sharePercent: serializer.fromJson<double>(json['sharePercent']),
      incomeSourceId: serializer.fromJson<int>(json['incomeSourceId']),
      currentConsumerId: serializer.fromJson<int>(json['currentConsumerId']),
      description: serializer.fromJson<String?>(json['description']),
      incomeDate: serializer.fromJson<DateTime>(json['incomeDate']),
      isRecurring: serializer.fromJson<bool>(json['isRecurring']),
      recurringPattern: serializer.fromJson<String?>(json['recurringPattern']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'amount': serializer.toJson<double>(amount),
      'currency': serializer.toJson<String>(currency),
      'isShared': serializer.toJson<bool>(isShared),
      'amountShared': serializer.toJson<double>(amountShared),
      'sharePercent': serializer.toJson<double>(sharePercent),
      'incomeSourceId': serializer.toJson<int>(incomeSourceId),
      'currentConsumerId': serializer.toJson<int>(currentConsumerId),
      'description': serializer.toJson<String?>(description),
      'incomeDate': serializer.toJson<DateTime>(incomeDate),
      'isRecurring': serializer.toJson<bool>(isRecurring),
      'recurringPattern': serializer.toJson<String?>(recurringPattern),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  IncomeEntry copyWith({
    int? id,
    double? amount,
    String? currency,
    bool? isShared,
    double? amountShared,
    double? sharePercent,
    int? incomeSourceId,
    int? currentConsumerId,
    Value<String?> description = const Value.absent(),
    DateTime? incomeDate,
    bool? isRecurring,
    Value<String?> recurringPattern = const Value.absent(),
    DateTime? createdAt,
    DateTime? updatedAt,
  }) => IncomeEntry(
    id: id ?? this.id,
    amount: amount ?? this.amount,
    currency: currency ?? this.currency,
    isShared: isShared ?? this.isShared,
    amountShared: amountShared ?? this.amountShared,
    sharePercent: sharePercent ?? this.sharePercent,
    incomeSourceId: incomeSourceId ?? this.incomeSourceId,
    currentConsumerId: currentConsumerId ?? this.currentConsumerId,
    description: description.present ? description.value : this.description,
    incomeDate: incomeDate ?? this.incomeDate,
    isRecurring: isRecurring ?? this.isRecurring,
    recurringPattern: recurringPattern.present
        ? recurringPattern.value
        : this.recurringPattern,
    createdAt: createdAt ?? this.createdAt,
    updatedAt: updatedAt ?? this.updatedAt,
  );
  IncomeEntry copyWithCompanion(IncomeEntriesCompanion data) {
    return IncomeEntry(
      id: data.id.present ? data.id.value : this.id,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      isShared: data.isShared.present ? data.isShared.value : this.isShared,
      amountShared: data.amountShared.present
          ? data.amountShared.value
          : this.amountShared,
      sharePercent: data.sharePercent.present
          ? data.sharePercent.value
          : this.sharePercent,
      incomeSourceId: data.incomeSourceId.present
          ? data.incomeSourceId.value
          : this.incomeSourceId,
      currentConsumerId: data.currentConsumerId.present
          ? data.currentConsumerId.value
          : this.currentConsumerId,
      description: data.description.present
          ? data.description.value
          : this.description,
      incomeDate: data.incomeDate.present
          ? data.incomeDate.value
          : this.incomeDate,
      isRecurring: data.isRecurring.present
          ? data.isRecurring.value
          : this.isRecurring,
      recurringPattern: data.recurringPattern.present
          ? data.recurringPattern.value
          : this.recurringPattern,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('IncomeEntry(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('isShared: $isShared, ')
          ..write('amountShared: $amountShared, ')
          ..write('sharePercent: $sharePercent, ')
          ..write('incomeSourceId: $incomeSourceId, ')
          ..write('currentConsumerId: $currentConsumerId, ')
          ..write('description: $description, ')
          ..write('incomeDate: $incomeDate, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('recurringPattern: $recurringPattern, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    amount,
    currency,
    isShared,
    amountShared,
    sharePercent,
    incomeSourceId,
    currentConsumerId,
    description,
    incomeDate,
    isRecurring,
    recurringPattern,
    createdAt,
    updatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeEntry &&
          other.id == this.id &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.isShared == this.isShared &&
          other.amountShared == this.amountShared &&
          other.sharePercent == this.sharePercent &&
          other.incomeSourceId == this.incomeSourceId &&
          other.currentConsumerId == this.currentConsumerId &&
          other.description == this.description &&
          other.incomeDate == this.incomeDate &&
          other.isRecurring == this.isRecurring &&
          other.recurringPattern == this.recurringPattern &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class IncomeEntriesCompanion extends UpdateCompanion<IncomeEntry> {
  final Value<int> id;
  final Value<double> amount;
  final Value<String> currency;
  final Value<bool> isShared;
  final Value<double> amountShared;
  final Value<double> sharePercent;
  final Value<int> incomeSourceId;
  final Value<int> currentConsumerId;
  final Value<String?> description;
  final Value<DateTime> incomeDate;
  final Value<bool> isRecurring;
  final Value<String?> recurringPattern;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const IncomeEntriesCompanion({
    this.id = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.isShared = const Value.absent(),
    this.amountShared = const Value.absent(),
    this.sharePercent = const Value.absent(),
    this.incomeSourceId = const Value.absent(),
    this.currentConsumerId = const Value.absent(),
    this.description = const Value.absent(),
    this.incomeDate = const Value.absent(),
    this.isRecurring = const Value.absent(),
    this.recurringPattern = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  IncomeEntriesCompanion.insert({
    this.id = const Value.absent(),
    required double amount,
    this.currency = const Value.absent(),
    this.isShared = const Value.absent(),
    this.amountShared = const Value.absent(),
    this.sharePercent = const Value.absent(),
    required int incomeSourceId,
    required int currentConsumerId,
    this.description = const Value.absent(),
    required DateTime incomeDate,
    this.isRecurring = const Value.absent(),
    this.recurringPattern = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  }) : amount = Value(amount),
       incomeSourceId = Value(incomeSourceId),
       currentConsumerId = Value(currentConsumerId),
       incomeDate = Value(incomeDate);
  static Insertable<IncomeEntry> custom({
    Expression<int>? id,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<bool>? isShared,
    Expression<double>? amountShared,
    Expression<double>? sharePercent,
    Expression<int>? incomeSourceId,
    Expression<int>? currentConsumerId,
    Expression<String>? description,
    Expression<DateTime>? incomeDate,
    Expression<bool>? isRecurring,
    Expression<String>? recurringPattern,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (isShared != null) 'is_shared': isShared,
      if (amountShared != null) 'amount_shared': amountShared,
      if (sharePercent != null) 'share_percent': sharePercent,
      if (incomeSourceId != null) 'income_source_id': incomeSourceId,
      if (currentConsumerId != null) 'current_consumer_id': currentConsumerId,
      if (description != null) 'description': description,
      if (incomeDate != null) 'income_date': incomeDate,
      if (isRecurring != null) 'is_recurring': isRecurring,
      if (recurringPattern != null) 'recurring_pattern': recurringPattern,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  IncomeEntriesCompanion copyWith({
    Value<int>? id,
    Value<double>? amount,
    Value<String>? currency,
    Value<bool>? isShared,
    Value<double>? amountShared,
    Value<double>? sharePercent,
    Value<int>? incomeSourceId,
    Value<int>? currentConsumerId,
    Value<String?>? description,
    Value<DateTime>? incomeDate,
    Value<bool>? isRecurring,
    Value<String?>? recurringPattern,
    Value<DateTime>? createdAt,
    Value<DateTime>? updatedAt,
  }) {
    return IncomeEntriesCompanion(
      id: id ?? this.id,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      isShared: isShared ?? this.isShared,
      amountShared: amountShared ?? this.amountShared,
      sharePercent: sharePercent ?? this.sharePercent,
      incomeSourceId: incomeSourceId ?? this.incomeSourceId,
      currentConsumerId: currentConsumerId ?? this.currentConsumerId,
      description: description ?? this.description,
      incomeDate: incomeDate ?? this.incomeDate,
      isRecurring: isRecurring ?? this.isRecurring,
      recurringPattern: recurringPattern ?? this.recurringPattern,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (isShared.present) {
      map['is_shared'] = Variable<bool>(isShared.value);
    }
    if (amountShared.present) {
      map['amount_shared'] = Variable<double>(amountShared.value);
    }
    if (sharePercent.present) {
      map['share_percent'] = Variable<double>(sharePercent.value);
    }
    if (incomeSourceId.present) {
      map['income_source_id'] = Variable<int>(incomeSourceId.value);
    }
    if (currentConsumerId.present) {
      map['current_consumer_id'] = Variable<int>(currentConsumerId.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (incomeDate.present) {
      map['income_date'] = Variable<DateTime>(incomeDate.value);
    }
    if (isRecurring.present) {
      map['is_recurring'] = Variable<bool>(isRecurring.value);
    }
    if (recurringPattern.present) {
      map['recurring_pattern'] = Variable<String>(recurringPattern.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('IncomeEntriesCompanion(')
          ..write('id: $id, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('isShared: $isShared, ')
          ..write('amountShared: $amountShared, ')
          ..write('sharePercent: $sharePercent, ')
          ..write('incomeSourceId: $incomeSourceId, ')
          ..write('currentConsumerId: $currentConsumerId, ')
          ..write('description: $description, ')
          ..write('incomeDate: $incomeDate, ')
          ..write('isRecurring: $isRecurring, ')
          ..write('recurringPattern: $recurringPattern, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class IncomeSourcesWithCategoryData extends DataClass {
  final int sourceId;
  final String sourceName;
  final int sourceCategoryId;
  final bool sourceisActiveStatus;
  final DateTime sourceCreatedAt;
  final DateTime sourceUpdatedAt;
  final int categoryId;
  final String categoryName;
  final String categoryDescription;
  final bool categoryisActiveStatus;
  final DateTime categoryCreatedAt;
  final DateTime categoryUpdatedAt;
  const IncomeSourcesWithCategoryData({
    required this.sourceId,
    required this.sourceName,
    required this.sourceCategoryId,
    required this.sourceisActiveStatus,
    required this.sourceCreatedAt,
    required this.sourceUpdatedAt,
    required this.categoryId,
    required this.categoryName,
    required this.categoryDescription,
    required this.categoryisActiveStatus,
    required this.categoryCreatedAt,
    required this.categoryUpdatedAt,
  });
  factory IncomeSourcesWithCategoryData.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return IncomeSourcesWithCategoryData(
      sourceId: serializer.fromJson<int>(json['sourceId']),
      sourceName: serializer.fromJson<String>(json['sourceName']),
      sourceCategoryId: serializer.fromJson<int>(json['sourceCategoryId']),
      sourceisActiveStatus: serializer.fromJson<bool>(
        json['sourceisActiveStatus'],
      ),
      sourceCreatedAt: serializer.fromJson<DateTime>(json['sourceCreatedAt']),
      sourceUpdatedAt: serializer.fromJson<DateTime>(json['sourceUpdatedAt']),
      categoryId: serializer.fromJson<int>(json['categoryId']),
      categoryName: serializer.fromJson<String>(json['categoryName']),
      categoryDescription: serializer.fromJson<String>(
        json['categoryDescription'],
      ),
      categoryisActiveStatus: serializer.fromJson<bool>(
        json['categoryisActiveStatus'],
      ),
      categoryCreatedAt: serializer.fromJson<DateTime>(
        json['categoryCreatedAt'],
      ),
      categoryUpdatedAt: serializer.fromJson<DateTime>(
        json['categoryUpdatedAt'],
      ),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'sourceId': serializer.toJson<int>(sourceId),
      'sourceName': serializer.toJson<String>(sourceName),
      'sourceCategoryId': serializer.toJson<int>(sourceCategoryId),
      'sourceisActiveStatus': serializer.toJson<bool>(sourceisActiveStatus),
      'sourceCreatedAt': serializer.toJson<DateTime>(sourceCreatedAt),
      'sourceUpdatedAt': serializer.toJson<DateTime>(sourceUpdatedAt),
      'categoryId': serializer.toJson<int>(categoryId),
      'categoryName': serializer.toJson<String>(categoryName),
      'categoryDescription': serializer.toJson<String>(categoryDescription),
      'categoryisActiveStatus': serializer.toJson<bool>(categoryisActiveStatus),
      'categoryCreatedAt': serializer.toJson<DateTime>(categoryCreatedAt),
      'categoryUpdatedAt': serializer.toJson<DateTime>(categoryUpdatedAt),
    };
  }

  IncomeSourcesWithCategoryData copyWith({
    int? sourceId,
    String? sourceName,
    int? sourceCategoryId,
    bool? sourceisActiveStatus,
    DateTime? sourceCreatedAt,
    DateTime? sourceUpdatedAt,
    int? categoryId,
    String? categoryName,
    String? categoryDescription,
    bool? categoryisActiveStatus,
    DateTime? categoryCreatedAt,
    DateTime? categoryUpdatedAt,
  }) => IncomeSourcesWithCategoryData(
    sourceId: sourceId ?? this.sourceId,
    sourceName: sourceName ?? this.sourceName,
    sourceCategoryId: sourceCategoryId ?? this.sourceCategoryId,
    sourceisActiveStatus: sourceisActiveStatus ?? this.sourceisActiveStatus,
    sourceCreatedAt: sourceCreatedAt ?? this.sourceCreatedAt,
    sourceUpdatedAt: sourceUpdatedAt ?? this.sourceUpdatedAt,
    categoryId: categoryId ?? this.categoryId,
    categoryName: categoryName ?? this.categoryName,
    categoryDescription: categoryDescription ?? this.categoryDescription,
    categoryisActiveStatus:
        categoryisActiveStatus ?? this.categoryisActiveStatus,
    categoryCreatedAt: categoryCreatedAt ?? this.categoryCreatedAt,
    categoryUpdatedAt: categoryUpdatedAt ?? this.categoryUpdatedAt,
  );
  @override
  String toString() {
    return (StringBuffer('IncomeSourcesWithCategoryData(')
          ..write('sourceId: $sourceId, ')
          ..write('sourceName: $sourceName, ')
          ..write('sourceCategoryId: $sourceCategoryId, ')
          ..write('sourceisActiveStatus: $sourceisActiveStatus, ')
          ..write('sourceCreatedAt: $sourceCreatedAt, ')
          ..write('sourceUpdatedAt: $sourceUpdatedAt, ')
          ..write('categoryId: $categoryId, ')
          ..write('categoryName: $categoryName, ')
          ..write('categoryDescription: $categoryDescription, ')
          ..write('categoryisActiveStatus: $categoryisActiveStatus, ')
          ..write('categoryCreatedAt: $categoryCreatedAt, ')
          ..write('categoryUpdatedAt: $categoryUpdatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    sourceId,
    sourceName,
    sourceCategoryId,
    sourceisActiveStatus,
    sourceCreatedAt,
    sourceUpdatedAt,
    categoryId,
    categoryName,
    categoryDescription,
    categoryisActiveStatus,
    categoryCreatedAt,
    categoryUpdatedAt,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is IncomeSourcesWithCategoryData &&
          other.sourceId == this.sourceId &&
          other.sourceName == this.sourceName &&
          other.sourceCategoryId == this.sourceCategoryId &&
          other.sourceisActiveStatus == this.sourceisActiveStatus &&
          other.sourceCreatedAt == this.sourceCreatedAt &&
          other.sourceUpdatedAt == this.sourceUpdatedAt &&
          other.categoryId == this.categoryId &&
          other.categoryName == this.categoryName &&
          other.categoryDescription == this.categoryDescription &&
          other.categoryisActiveStatus == this.categoryisActiveStatus &&
          other.categoryCreatedAt == this.categoryCreatedAt &&
          other.categoryUpdatedAt == this.categoryUpdatedAt);
}

class $IncomeSourcesWithCategoryView
    extends
        ViewInfo<$IncomeSourcesWithCategoryView, IncomeSourcesWithCategoryData>
    implements HasResultSet {
  final String? _alias;
  @override
  final _$AppDatabase attachedDatabase;
  $IncomeSourcesWithCategoryView(this.attachedDatabase, [this._alias]);
  $IncomeSourcesTable get incomeSources =>
      attachedDatabase.incomeSources.createAlias('t0');
  $IncomeCategoriesTable get incomeCategories =>
      attachedDatabase.incomeCategories.createAlias('t1');
  @override
  List<GeneratedColumn> get $columns => [
    sourceId,
    sourceName,
    sourceCategoryId,
    sourceisActiveStatus,
    sourceCreatedAt,
    sourceUpdatedAt,
    categoryId,
    categoryName,
    categoryDescription,
    categoryisActiveStatus,
    categoryCreatedAt,
    categoryUpdatedAt,
  ];
  @override
  String get aliasedName => _alias ?? entityName;
  @override
  String get entityName => 'income_sources_with_category';
  @override
  Map<SqlDialect, String>? get createViewStatements => null;
  @override
  $IncomeSourcesWithCategoryView get asDslTable => this;
  @override
  IncomeSourcesWithCategoryData map(
    Map<String, dynamic> data, {
    String? tablePrefix,
  }) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return IncomeSourcesWithCategoryData(
      sourceId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_id'],
      )!,
      sourceName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}source_name'],
      )!,
      sourceCategoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}source_category_id'],
      )!,
      sourceisActiveStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}sourceis_active_status'],
      )!,
      sourceCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}source_created_at'],
      )!,
      sourceUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}source_updated_at'],
      )!,
      categoryId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}category_id'],
      )!,
      categoryName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_name'],
      )!,
      categoryDescription: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}category_description'],
      )!,
      categoryisActiveStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}categoryis_active_status'],
      )!,
      categoryCreatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}category_created_at'],
      )!,
      categoryUpdatedAt: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}category_updated_at'],
      )!,
    );
  }

  late final GeneratedColumn<int> sourceId = GeneratedColumn<int>(
    'source_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(incomeSources.sourceId, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> sourceName = GeneratedColumn<String>(
    'source_name',
    aliasedName,
    false,
    generatedAs: GeneratedAs(incomeSources.sourceName, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<int> sourceCategoryId = GeneratedColumn<int>(
    'source_category_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(incomeSources.sourceCategoryId, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<bool> sourceisActiveStatus = GeneratedColumn<bool>(
    'sourceis_active_status',
    aliasedName,
    false,
    generatedAs: GeneratedAs(incomeSources.sourceisActiveStatus, false),
    type: DriftSqlType.bool,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("sourceis_active_status" IN (0, 1))',
    ),
  );
  late final GeneratedColumn<DateTime> sourceCreatedAt =
      GeneratedColumn<DateTime>(
        'source_created_at',
        aliasedName,
        false,
        generatedAs: GeneratedAs(incomeSources.sourceCreatedAt, false),
        type: DriftSqlType.dateTime,
      );
  late final GeneratedColumn<DateTime> sourceUpdatedAt =
      GeneratedColumn<DateTime>(
        'source_updated_at',
        aliasedName,
        false,
        generatedAs: GeneratedAs(incomeSources.sourceUpdatedAt, false),
        type: DriftSqlType.dateTime,
      );
  late final GeneratedColumn<int> categoryId = GeneratedColumn<int>(
    'category_id',
    aliasedName,
    false,
    generatedAs: GeneratedAs(incomeCategories.categoryId, false),
    type: DriftSqlType.int,
  );
  late final GeneratedColumn<String> categoryName = GeneratedColumn<String>(
    'category_name',
    aliasedName,
    false,
    generatedAs: GeneratedAs(incomeCategories.categoryName, false),
    type: DriftSqlType.string,
  );
  late final GeneratedColumn<String> categoryDescription =
      GeneratedColumn<String>(
        'category_description',
        aliasedName,
        false,
        generatedAs: GeneratedAs(incomeCategories.categoryDescription, false),
        type: DriftSqlType.string,
      );
  late final GeneratedColumn<bool> categoryisActiveStatus =
      GeneratedColumn<bool>(
        'categoryis_active_status',
        aliasedName,
        false,
        generatedAs: GeneratedAs(
          incomeCategories.categoryisActiveStatus,
          false,
        ),
        type: DriftSqlType.bool,
        defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("categoryis_active_status" IN (0, 1))',
        ),
      );
  late final GeneratedColumn<DateTime> categoryCreatedAt =
      GeneratedColumn<DateTime>(
        'category_created_at',
        aliasedName,
        false,
        generatedAs: GeneratedAs(incomeCategories.categoryCreatedAt, false),
        type: DriftSqlType.dateTime,
      );
  late final GeneratedColumn<DateTime> categoryUpdatedAt =
      GeneratedColumn<DateTime>(
        'category_updated_at',
        aliasedName,
        false,
        generatedAs: GeneratedAs(incomeCategories.categoryUpdatedAt, false),
        type: DriftSqlType.dateTime,
      );
  @override
  $IncomeSourcesWithCategoryView createAlias(String alias) {
    return $IncomeSourcesWithCategoryView(attachedDatabase, alias);
  }

  @override
  Query? get query =>
      (attachedDatabase.selectOnly(incomeSources)..addColumns($columns)).join([
        innerJoin(
          incomeCategories,
          incomeSources.sourceCategoryId.equalsExp(incomeCategories.categoryId),
        ),
      ]);
  @override
  Set<String> get readTables => const {'income_sources', 'income_categories'};
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $IncomeCategoriesTable incomeCategories = $IncomeCategoriesTable(
    this,
  );
  late final $IncomeSourcesTable incomeSources = $IncomeSourcesTable(this);
  late final $ConsumersTable consumers = $ConsumersTable(this);
  late final $IncomeEntriesTable incomeEntries = $IncomeEntriesTable(this);
  late final $IncomeSourcesWithCategoryView incomeSourcesWithCategory =
      $IncomeSourcesWithCategoryView(this);
  late final IncomeSourcesDAO incomeSourcesDAO = IncomeSourcesDAO(
    this as AppDatabase,
  );
  late final IncomeDao incomeDao = IncomeDao(this as AppDatabase);
  late final CategoriesDao categoriesDao = CategoriesDao(this as AppDatabase);
  late final ConsumersDao consumersDao = ConsumersDao(this as AppDatabase);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    incomeCategories,
    incomeSources,
    consumers,
    incomeEntries,
    incomeSourcesWithCategory,
  ];
}

typedef $$IncomeCategoriesTableCreateCompanionBuilder =
    IncomeCategoriesCompanion Function({
      Value<int> categoryId,
      required String categoryName,
      required String categoryDescription,
      Value<bool> categoryisActiveStatus,
      Value<DateTime> categoryCreatedAt,
      Value<DateTime> categoryUpdatedAt,
    });
typedef $$IncomeCategoriesTableUpdateCompanionBuilder =
    IncomeCategoriesCompanion Function({
      Value<int> categoryId,
      Value<String> categoryName,
      Value<String> categoryDescription,
      Value<bool> categoryisActiveStatus,
      Value<DateTime> categoryCreatedAt,
      Value<DateTime> categoryUpdatedAt,
    });

final class $$IncomeCategoriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $IncomeCategoriesTable, IncomeCategory> {
  $$IncomeCategoriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static MultiTypedResultKey<$IncomeSourcesTable, List<IncomeSource>>
  _incomeSourcesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.incomeSources,
    aliasName: $_aliasNameGenerator(
      db.incomeCategories.categoryId,
      db.incomeSources.sourceCategoryId,
    ),
  );

  $$IncomeSourcesTableProcessedTableManager get incomeSourcesRefs {
    final manager = $$IncomeSourcesTableTableManager($_db, $_db.incomeSources)
        .filter(
          (f) => f.sourceCategoryId.categoryId.sqlEquals(
            $_itemColumn<int>('category_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_incomeSourcesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IncomeCategoriesTableFilterComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTable> {
  $$IncomeCategoriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get categoryDescription => $composableBuilder(
    column: $table.categoryDescription,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get categoryisActiveStatus => $composableBuilder(
    column: $table.categoryisActiveStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get categoryCreatedAt => $composableBuilder(
    column: $table.categoryCreatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get categoryUpdatedAt => $composableBuilder(
    column: $table.categoryUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> incomeSourcesRefs(
    Expression<bool> Function($$IncomeSourcesTableFilterComposer f) f,
  ) {
    final $$IncomeSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.incomeSources,
      getReferencedColumn: (t) => t.sourceCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeSourcesTableFilterComposer(
            $db: $db,
            $table: $db.incomeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IncomeCategoriesTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTable> {
  $$IncomeCategoriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get categoryDescription => $composableBuilder(
    column: $table.categoryDescription,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get categoryisActiveStatus => $composableBuilder(
    column: $table.categoryisActiveStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get categoryCreatedAt => $composableBuilder(
    column: $table.categoryCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get categoryUpdatedAt => $composableBuilder(
    column: $table.categoryUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$IncomeCategoriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomeCategoriesTable> {
  $$IncomeCategoriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get categoryId => $composableBuilder(
    column: $table.categoryId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryName => $composableBuilder(
    column: $table.categoryName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get categoryDescription => $composableBuilder(
    column: $table.categoryDescription,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get categoryisActiveStatus => $composableBuilder(
    column: $table.categoryisActiveStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get categoryCreatedAt => $composableBuilder(
    column: $table.categoryCreatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get categoryUpdatedAt => $composableBuilder(
    column: $table.categoryUpdatedAt,
    builder: (column) => column,
  );

  Expression<T> incomeSourcesRefs<T extends Object>(
    Expression<T> Function($$IncomeSourcesTableAnnotationComposer a) f,
  ) {
    final $$IncomeSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.categoryId,
      referencedTable: $db.incomeSources,
      getReferencedColumn: (t) => t.sourceCategoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.incomeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IncomeCategoriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncomeCategoriesTable,
          IncomeCategory,
          $$IncomeCategoriesTableFilterComposer,
          $$IncomeCategoriesTableOrderingComposer,
          $$IncomeCategoriesTableAnnotationComposer,
          $$IncomeCategoriesTableCreateCompanionBuilder,
          $$IncomeCategoriesTableUpdateCompanionBuilder,
          (IncomeCategory, $$IncomeCategoriesTableReferences),
          IncomeCategory,
          PrefetchHooks Function({bool incomeSourcesRefs})
        > {
  $$IncomeCategoriesTableTableManager(
    _$AppDatabase db,
    $IncomeCategoriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomeCategoriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomeCategoriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomeCategoriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> categoryId = const Value.absent(),
                Value<String> categoryName = const Value.absent(),
                Value<String> categoryDescription = const Value.absent(),
                Value<bool> categoryisActiveStatus = const Value.absent(),
                Value<DateTime> categoryCreatedAt = const Value.absent(),
                Value<DateTime> categoryUpdatedAt = const Value.absent(),
              }) => IncomeCategoriesCompanion(
                categoryId: categoryId,
                categoryName: categoryName,
                categoryDescription: categoryDescription,
                categoryisActiveStatus: categoryisActiveStatus,
                categoryCreatedAt: categoryCreatedAt,
                categoryUpdatedAt: categoryUpdatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> categoryId = const Value.absent(),
                required String categoryName,
                required String categoryDescription,
                Value<bool> categoryisActiveStatus = const Value.absent(),
                Value<DateTime> categoryCreatedAt = const Value.absent(),
                Value<DateTime> categoryUpdatedAt = const Value.absent(),
              }) => IncomeCategoriesCompanion.insert(
                categoryId: categoryId,
                categoryName: categoryName,
                categoryDescription: categoryDescription,
                categoryisActiveStatus: categoryisActiveStatus,
                categoryCreatedAt: categoryCreatedAt,
                categoryUpdatedAt: categoryUpdatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IncomeCategoriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({incomeSourcesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (incomeSourcesRefs) db.incomeSources,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (incomeSourcesRefs)
                    await $_getPrefetchedData<
                      IncomeCategory,
                      $IncomeCategoriesTable,
                      IncomeSource
                    >(
                      currentTable: table,
                      referencedTable: $$IncomeCategoriesTableReferences
                          ._incomeSourcesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$IncomeCategoriesTableReferences(
                            db,
                            table,
                            p0,
                          ).incomeSourcesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.sourceCategoryId == item.categoryId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$IncomeCategoriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncomeCategoriesTable,
      IncomeCategory,
      $$IncomeCategoriesTableFilterComposer,
      $$IncomeCategoriesTableOrderingComposer,
      $$IncomeCategoriesTableAnnotationComposer,
      $$IncomeCategoriesTableCreateCompanionBuilder,
      $$IncomeCategoriesTableUpdateCompanionBuilder,
      (IncomeCategory, $$IncomeCategoriesTableReferences),
      IncomeCategory,
      PrefetchHooks Function({bool incomeSourcesRefs})
    >;
typedef $$IncomeSourcesTableCreateCompanionBuilder =
    IncomeSourcesCompanion Function({
      Value<int> sourceId,
      required String sourceName,
      required int sourceCategoryId,
      Value<bool> sourceisActiveStatus,
      Value<DateTime> sourceCreatedAt,
      Value<DateTime> sourceUpdatedAt,
    });
typedef $$IncomeSourcesTableUpdateCompanionBuilder =
    IncomeSourcesCompanion Function({
      Value<int> sourceId,
      Value<String> sourceName,
      Value<int> sourceCategoryId,
      Value<bool> sourceisActiveStatus,
      Value<DateTime> sourceCreatedAt,
      Value<DateTime> sourceUpdatedAt,
    });

final class $$IncomeSourcesTableReferences
    extends BaseReferences<_$AppDatabase, $IncomeSourcesTable, IncomeSource> {
  $$IncomeSourcesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IncomeCategoriesTable _sourceCategoryIdTable(_$AppDatabase db) =>
      db.incomeCategories.createAlias(
        $_aliasNameGenerator(
          db.incomeSources.sourceCategoryId,
          db.incomeCategories.categoryId,
        ),
      );

  $$IncomeCategoriesTableProcessedTableManager get sourceCategoryId {
    final $_column = $_itemColumn<int>('source_category_id')!;

    final manager = $$IncomeCategoriesTableTableManager(
      $_db,
      $_db.incomeCategories,
    ).filter((f) => f.categoryId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_sourceCategoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static MultiTypedResultKey<$IncomeEntriesTable, List<IncomeEntry>>
  _incomeEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.incomeEntries,
    aliasName: $_aliasNameGenerator(
      db.incomeSources.sourceId,
      db.incomeEntries.incomeSourceId,
    ),
  );

  $$IncomeEntriesTableProcessedTableManager get incomeEntriesRefs {
    final manager = $$IncomeEntriesTableTableManager($_db, $_db.incomeEntries)
        .filter(
          (f) => f.incomeSourceId.sourceId.sqlEquals(
            $_itemColumn<int>('source_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_incomeEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$IncomeSourcesTableFilterComposer
    extends Composer<_$AppDatabase, $IncomeSourcesTable> {
  $$IncomeSourcesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get sourceisActiveStatus => $composableBuilder(
    column: $table.sourceisActiveStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sourceCreatedAt => $composableBuilder(
    column: $table.sourceCreatedAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get sourceUpdatedAt => $composableBuilder(
    column: $table.sourceUpdatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$IncomeCategoriesTableFilterComposer get sourceCategoryId {
    final $$IncomeCategoriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCategoryId,
      referencedTable: $db.incomeCategories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeCategoriesTableFilterComposer(
            $db: $db,
            $table: $db.incomeCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<bool> incomeEntriesRefs(
    Expression<bool> Function($$IncomeEntriesTableFilterComposer f) f,
  ) {
    final $$IncomeEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.incomeEntries,
      getReferencedColumn: (t) => t.incomeSourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeEntriesTableFilterComposer(
            $db: $db,
            $table: $db.incomeEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IncomeSourcesTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomeSourcesTable> {
  $$IncomeSourcesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get sourceId => $composableBuilder(
    column: $table.sourceId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get sourceisActiveStatus => $composableBuilder(
    column: $table.sourceisActiveStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sourceCreatedAt => $composableBuilder(
    column: $table.sourceCreatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get sourceUpdatedAt => $composableBuilder(
    column: $table.sourceUpdatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$IncomeCategoriesTableOrderingComposer get sourceCategoryId {
    final $$IncomeCategoriesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCategoryId,
      referencedTable: $db.incomeCategories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeCategoriesTableOrderingComposer(
            $db: $db,
            $table: $db.incomeCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IncomeSourcesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomeSourcesTable> {
  $$IncomeSourcesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get sourceId =>
      $composableBuilder(column: $table.sourceId, builder: (column) => column);

  GeneratedColumn<String> get sourceName => $composableBuilder(
    column: $table.sourceName,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get sourceisActiveStatus => $composableBuilder(
    column: $table.sourceisActiveStatus,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get sourceCreatedAt => $composableBuilder(
    column: $table.sourceCreatedAt,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get sourceUpdatedAt => $composableBuilder(
    column: $table.sourceUpdatedAt,
    builder: (column) => column,
  );

  $$IncomeCategoriesTableAnnotationComposer get sourceCategoryId {
    final $$IncomeCategoriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceCategoryId,
      referencedTable: $db.incomeCategories,
      getReferencedColumn: (t) => t.categoryId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeCategoriesTableAnnotationComposer(
            $db: $db,
            $table: $db.incomeCategories,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  Expression<T> incomeEntriesRefs<T extends Object>(
    Expression<T> Function($$IncomeEntriesTableAnnotationComposer a) f,
  ) {
    final $$IncomeEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.sourceId,
      referencedTable: $db.incomeEntries,
      getReferencedColumn: (t) => t.incomeSourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.incomeEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$IncomeSourcesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncomeSourcesTable,
          IncomeSource,
          $$IncomeSourcesTableFilterComposer,
          $$IncomeSourcesTableOrderingComposer,
          $$IncomeSourcesTableAnnotationComposer,
          $$IncomeSourcesTableCreateCompanionBuilder,
          $$IncomeSourcesTableUpdateCompanionBuilder,
          (IncomeSource, $$IncomeSourcesTableReferences),
          IncomeSource,
          PrefetchHooks Function({
            bool sourceCategoryId,
            bool incomeEntriesRefs,
          })
        > {
  $$IncomeSourcesTableTableManager(_$AppDatabase db, $IncomeSourcesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomeSourcesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomeSourcesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomeSourcesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> sourceId = const Value.absent(),
                Value<String> sourceName = const Value.absent(),
                Value<int> sourceCategoryId = const Value.absent(),
                Value<bool> sourceisActiveStatus = const Value.absent(),
                Value<DateTime> sourceCreatedAt = const Value.absent(),
                Value<DateTime> sourceUpdatedAt = const Value.absent(),
              }) => IncomeSourcesCompanion(
                sourceId: sourceId,
                sourceName: sourceName,
                sourceCategoryId: sourceCategoryId,
                sourceisActiveStatus: sourceisActiveStatus,
                sourceCreatedAt: sourceCreatedAt,
                sourceUpdatedAt: sourceUpdatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> sourceId = const Value.absent(),
                required String sourceName,
                required int sourceCategoryId,
                Value<bool> sourceisActiveStatus = const Value.absent(),
                Value<DateTime> sourceCreatedAt = const Value.absent(),
                Value<DateTime> sourceUpdatedAt = const Value.absent(),
              }) => IncomeSourcesCompanion.insert(
                sourceId: sourceId,
                sourceName: sourceName,
                sourceCategoryId: sourceCategoryId,
                sourceisActiveStatus: sourceisActiveStatus,
                sourceCreatedAt: sourceCreatedAt,
                sourceUpdatedAt: sourceUpdatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IncomeSourcesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({sourceCategoryId = false, incomeEntriesRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (incomeEntriesRefs) db.incomeEntries,
                  ],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (sourceCategoryId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.sourceCategoryId,
                                    referencedTable:
                                        $$IncomeSourcesTableReferences
                                            ._sourceCategoryIdTable(db),
                                    referencedColumn:
                                        $$IncomeSourcesTableReferences
                                            ._sourceCategoryIdTable(db)
                                            .categoryId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (incomeEntriesRefs)
                        await $_getPrefetchedData<
                          IncomeSource,
                          $IncomeSourcesTable,
                          IncomeEntry
                        >(
                          currentTable: table,
                          referencedTable: $$IncomeSourcesTableReferences
                              ._incomeEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$IncomeSourcesTableReferences(
                                db,
                                table,
                                p0,
                              ).incomeEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.incomeSourceId == item.sourceId,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$IncomeSourcesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncomeSourcesTable,
      IncomeSource,
      $$IncomeSourcesTableFilterComposer,
      $$IncomeSourcesTableOrderingComposer,
      $$IncomeSourcesTableAnnotationComposer,
      $$IncomeSourcesTableCreateCompanionBuilder,
      $$IncomeSourcesTableUpdateCompanionBuilder,
      (IncomeSource, $$IncomeSourcesTableReferences),
      IncomeSource,
      PrefetchHooks Function({bool sourceCategoryId, bool incomeEntriesRefs})
    >;
typedef $$ConsumersTableCreateCompanionBuilder =
    ConsumersCompanion Function({
      Value<int> consumerId,
      Value<String> consumerName,
      Value<DateTime> createdAt,
    });
typedef $$ConsumersTableUpdateCompanionBuilder =
    ConsumersCompanion Function({
      Value<int> consumerId,
      Value<String> consumerName,
      Value<DateTime> createdAt,
    });

final class $$ConsumersTableReferences
    extends BaseReferences<_$AppDatabase, $ConsumersTable, Consumer> {
  $$ConsumersTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$IncomeEntriesTable, List<IncomeEntry>>
  _incomeEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.incomeEntries,
    aliasName: $_aliasNameGenerator(
      db.consumers.consumerId,
      db.incomeEntries.currentConsumerId,
    ),
  );

  $$IncomeEntriesTableProcessedTableManager get incomeEntriesRefs {
    final manager = $$IncomeEntriesTableTableManager($_db, $_db.incomeEntries)
        .filter(
          (f) => f.currentConsumerId.consumerId.sqlEquals(
            $_itemColumn<int>('consumer_id')!,
          ),
        );

    final cache = $_typedResult.readTableOrNull(_incomeEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$ConsumersTableFilterComposer
    extends Composer<_$AppDatabase, $ConsumersTable> {
  $$ConsumersTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get consumerId => $composableBuilder(
    column: $table.consumerId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get consumerName => $composableBuilder(
    column: $table.consumerName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> incomeEntriesRefs(
    Expression<bool> Function($$IncomeEntriesTableFilterComposer f) f,
  ) {
    final $$IncomeEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.consumerId,
      referencedTable: $db.incomeEntries,
      getReferencedColumn: (t) => t.currentConsumerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeEntriesTableFilterComposer(
            $db: $db,
            $table: $db.incomeEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConsumersTableOrderingComposer
    extends Composer<_$AppDatabase, $ConsumersTable> {
  $$ConsumersTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get consumerId => $composableBuilder(
    column: $table.consumerId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get consumerName => $composableBuilder(
    column: $table.consumerName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$ConsumersTableAnnotationComposer
    extends Composer<_$AppDatabase, $ConsumersTable> {
  $$ConsumersTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get consumerId => $composableBuilder(
    column: $table.consumerId,
    builder: (column) => column,
  );

  GeneratedColumn<String> get consumerName => $composableBuilder(
    column: $table.consumerName,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  Expression<T> incomeEntriesRefs<T extends Object>(
    Expression<T> Function($$IncomeEntriesTableAnnotationComposer a) f,
  ) {
    final $$IncomeEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.consumerId,
      referencedTable: $db.incomeEntries,
      getReferencedColumn: (t) => t.currentConsumerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.incomeEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$ConsumersTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ConsumersTable,
          Consumer,
          $$ConsumersTableFilterComposer,
          $$ConsumersTableOrderingComposer,
          $$ConsumersTableAnnotationComposer,
          $$ConsumersTableCreateCompanionBuilder,
          $$ConsumersTableUpdateCompanionBuilder,
          (Consumer, $$ConsumersTableReferences),
          Consumer,
          PrefetchHooks Function({bool incomeEntriesRefs})
        > {
  $$ConsumersTableTableManager(_$AppDatabase db, $ConsumersTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ConsumersTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ConsumersTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ConsumersTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> consumerId = const Value.absent(),
                Value<String> consumerName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ConsumersCompanion(
                consumerId: consumerId,
                consumerName: consumerName,
                createdAt: createdAt,
              ),
          createCompanionCallback:
              ({
                Value<int> consumerId = const Value.absent(),
                Value<String> consumerName = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
              }) => ConsumersCompanion.insert(
                consumerId: consumerId,
                consumerName: consumerName,
                createdAt: createdAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ConsumersTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({incomeEntriesRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (incomeEntriesRefs) db.incomeEntries,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (incomeEntriesRefs)
                    await $_getPrefetchedData<
                      Consumer,
                      $ConsumersTable,
                      IncomeEntry
                    >(
                      currentTable: table,
                      referencedTable: $$ConsumersTableReferences
                          ._incomeEntriesRefsTable(db),
                      managerFromTypedResult: (p0) =>
                          $$ConsumersTableReferences(
                            db,
                            table,
                            p0,
                          ).incomeEntriesRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where(
                            (e) => e.currentConsumerId == item.consumerId,
                          ),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$ConsumersTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ConsumersTable,
      Consumer,
      $$ConsumersTableFilterComposer,
      $$ConsumersTableOrderingComposer,
      $$ConsumersTableAnnotationComposer,
      $$ConsumersTableCreateCompanionBuilder,
      $$ConsumersTableUpdateCompanionBuilder,
      (Consumer, $$ConsumersTableReferences),
      Consumer,
      PrefetchHooks Function({bool incomeEntriesRefs})
    >;
typedef $$IncomeEntriesTableCreateCompanionBuilder =
    IncomeEntriesCompanion Function({
      Value<int> id,
      required double amount,
      Value<String> currency,
      Value<bool> isShared,
      Value<double> amountShared,
      Value<double> sharePercent,
      required int incomeSourceId,
      required int currentConsumerId,
      Value<String?> description,
      required DateTime incomeDate,
      Value<bool> isRecurring,
      Value<String?> recurringPattern,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });
typedef $$IncomeEntriesTableUpdateCompanionBuilder =
    IncomeEntriesCompanion Function({
      Value<int> id,
      Value<double> amount,
      Value<String> currency,
      Value<bool> isShared,
      Value<double> amountShared,
      Value<double> sharePercent,
      Value<int> incomeSourceId,
      Value<int> currentConsumerId,
      Value<String?> description,
      Value<DateTime> incomeDate,
      Value<bool> isRecurring,
      Value<String?> recurringPattern,
      Value<DateTime> createdAt,
      Value<DateTime> updatedAt,
    });

final class $$IncomeEntriesTableReferences
    extends BaseReferences<_$AppDatabase, $IncomeEntriesTable, IncomeEntry> {
  $$IncomeEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $IncomeSourcesTable _incomeSourceIdTable(_$AppDatabase db) =>
      db.incomeSources.createAlias(
        $_aliasNameGenerator(
          db.incomeEntries.incomeSourceId,
          db.incomeSources.sourceId,
        ),
      );

  $$IncomeSourcesTableProcessedTableManager get incomeSourceId {
    final $_column = $_itemColumn<int>('income_source_id')!;

    final manager = $$IncomeSourcesTableTableManager(
      $_db,
      $_db.incomeSources,
    ).filter((f) => f.sourceId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_incomeSourceIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }

  static $ConsumersTable _currentConsumerIdTable(_$AppDatabase db) =>
      db.consumers.createAlias(
        $_aliasNameGenerator(
          db.incomeEntries.currentConsumerId,
          db.consumers.consumerId,
        ),
      );

  $$ConsumersTableProcessedTableManager get currentConsumerId {
    final $_column = $_itemColumn<int>('current_consumer_id')!;

    final manager = $$ConsumersTableTableManager(
      $_db,
      $_db.consumers,
    ).filter((f) => f.consumerId.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_currentConsumerIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$IncomeEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $IncomeEntriesTable> {
  $$IncomeEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isShared => $composableBuilder(
    column: $table.isShared,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get amountShared => $composableBuilder(
    column: $table.amountShared,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get sharePercent => $composableBuilder(
    column: $table.sharePercent,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get incomeDate => $composableBuilder(
    column: $table.incomeDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recurringPattern => $composableBuilder(
    column: $table.recurringPattern,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnFilters(column),
  );

  $$IncomeSourcesTableFilterComposer get incomeSourceId {
    final $$IncomeSourcesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.incomeSourceId,
      referencedTable: $db.incomeSources,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeSourcesTableFilterComposer(
            $db: $db,
            $table: $db.incomeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConsumersTableFilterComposer get currentConsumerId {
    final $$ConsumersTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currentConsumerId,
      referencedTable: $db.consumers,
      getReferencedColumn: (t) => t.consumerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConsumersTableFilterComposer(
            $db: $db,
            $table: $db.consumers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IncomeEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $IncomeEntriesTable> {
  $$IncomeEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amount => $composableBuilder(
    column: $table.amount,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get currency => $composableBuilder(
    column: $table.currency,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isShared => $composableBuilder(
    column: $table.isShared,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get amountShared => $composableBuilder(
    column: $table.amountShared,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get sharePercent => $composableBuilder(
    column: $table.sharePercent,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get incomeDate => $composableBuilder(
    column: $table.incomeDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recurringPattern => $composableBuilder(
    column: $table.recurringPattern,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
    column: $table.createdAt,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
    column: $table.updatedAt,
    builder: (column) => ColumnOrderings(column),
  );

  $$IncomeSourcesTableOrderingComposer get incomeSourceId {
    final $$IncomeSourcesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.incomeSourceId,
      referencedTable: $db.incomeSources,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeSourcesTableOrderingComposer(
            $db: $db,
            $table: $db.incomeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConsumersTableOrderingComposer get currentConsumerId {
    final $$ConsumersTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currentConsumerId,
      referencedTable: $db.consumers,
      getReferencedColumn: (t) => t.consumerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConsumersTableOrderingComposer(
            $db: $db,
            $table: $db.consumers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IncomeEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $IncomeEntriesTable> {
  $$IncomeEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<bool> get isShared =>
      $composableBuilder(column: $table.isShared, builder: (column) => column);

  GeneratedColumn<double> get amountShared => $composableBuilder(
    column: $table.amountShared,
    builder: (column) => column,
  );

  GeneratedColumn<double> get sharePercent => $composableBuilder(
    column: $table.sharePercent,
    builder: (column) => column,
  );

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get incomeDate => $composableBuilder(
    column: $table.incomeDate,
    builder: (column) => column,
  );

  GeneratedColumn<bool> get isRecurring => $composableBuilder(
    column: $table.isRecurring,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recurringPattern => $composableBuilder(
    column: $table.recurringPattern,
    builder: (column) => column,
  );

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  $$IncomeSourcesTableAnnotationComposer get incomeSourceId {
    final $$IncomeSourcesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.incomeSourceId,
      referencedTable: $db.incomeSources,
      getReferencedColumn: (t) => t.sourceId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$IncomeSourcesTableAnnotationComposer(
            $db: $db,
            $table: $db.incomeSources,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }

  $$ConsumersTableAnnotationComposer get currentConsumerId {
    final $$ConsumersTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.currentConsumerId,
      referencedTable: $db.consumers,
      getReferencedColumn: (t) => t.consumerId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ConsumersTableAnnotationComposer(
            $db: $db,
            $table: $db.consumers,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$IncomeEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $IncomeEntriesTable,
          IncomeEntry,
          $$IncomeEntriesTableFilterComposer,
          $$IncomeEntriesTableOrderingComposer,
          $$IncomeEntriesTableAnnotationComposer,
          $$IncomeEntriesTableCreateCompanionBuilder,
          $$IncomeEntriesTableUpdateCompanionBuilder,
          (IncomeEntry, $$IncomeEntriesTableReferences),
          IncomeEntry,
          PrefetchHooks Function({bool incomeSourceId, bool currentConsumerId})
        > {
  $$IncomeEntriesTableTableManager(_$AppDatabase db, $IncomeEntriesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$IncomeEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$IncomeEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$IncomeEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<double> amount = const Value.absent(),
                Value<String> currency = const Value.absent(),
                Value<bool> isShared = const Value.absent(),
                Value<double> amountShared = const Value.absent(),
                Value<double> sharePercent = const Value.absent(),
                Value<int> incomeSourceId = const Value.absent(),
                Value<int> currentConsumerId = const Value.absent(),
                Value<String?> description = const Value.absent(),
                Value<DateTime> incomeDate = const Value.absent(),
                Value<bool> isRecurring = const Value.absent(),
                Value<String?> recurringPattern = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => IncomeEntriesCompanion(
                id: id,
                amount: amount,
                currency: currency,
                isShared: isShared,
                amountShared: amountShared,
                sharePercent: sharePercent,
                incomeSourceId: incomeSourceId,
                currentConsumerId: currentConsumerId,
                description: description,
                incomeDate: incomeDate,
                isRecurring: isRecurring,
                recurringPattern: recurringPattern,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required double amount,
                Value<String> currency = const Value.absent(),
                Value<bool> isShared = const Value.absent(),
                Value<double> amountShared = const Value.absent(),
                Value<double> sharePercent = const Value.absent(),
                required int incomeSourceId,
                required int currentConsumerId,
                Value<String?> description = const Value.absent(),
                required DateTime incomeDate,
                Value<bool> isRecurring = const Value.absent(),
                Value<String?> recurringPattern = const Value.absent(),
                Value<DateTime> createdAt = const Value.absent(),
                Value<DateTime> updatedAt = const Value.absent(),
              }) => IncomeEntriesCompanion.insert(
                id: id,
                amount: amount,
                currency: currency,
                isShared: isShared,
                amountShared: amountShared,
                sharePercent: sharePercent,
                incomeSourceId: incomeSourceId,
                currentConsumerId: currentConsumerId,
                description: description,
                incomeDate: incomeDate,
                isRecurring: isRecurring,
                recurringPattern: recurringPattern,
                createdAt: createdAt,
                updatedAt: updatedAt,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$IncomeEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({incomeSourceId = false, currentConsumerId = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [],
                  addJoins:
                      <
                        T extends TableManagerState<
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic,
                          dynamic
                        >
                      >(state) {
                        if (incomeSourceId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.incomeSourceId,
                                    referencedTable:
                                        $$IncomeEntriesTableReferences
                                            ._incomeSourceIdTable(db),
                                    referencedColumn:
                                        $$IncomeEntriesTableReferences
                                            ._incomeSourceIdTable(db)
                                            .sourceId,
                                  )
                                  as T;
                        }
                        if (currentConsumerId) {
                          state =
                              state.withJoin(
                                    currentTable: table,
                                    currentColumn: table.currentConsumerId,
                                    referencedTable:
                                        $$IncomeEntriesTableReferences
                                            ._currentConsumerIdTable(db),
                                    referencedColumn:
                                        $$IncomeEntriesTableReferences
                                            ._currentConsumerIdTable(db)
                                            .consumerId,
                                  )
                                  as T;
                        }

                        return state;
                      },
                  getPrefetchedDataCallback: (items) async {
                    return [];
                  },
                );
              },
        ),
      );
}

typedef $$IncomeEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $IncomeEntriesTable,
      IncomeEntry,
      $$IncomeEntriesTableFilterComposer,
      $$IncomeEntriesTableOrderingComposer,
      $$IncomeEntriesTableAnnotationComposer,
      $$IncomeEntriesTableCreateCompanionBuilder,
      $$IncomeEntriesTableUpdateCompanionBuilder,
      (IncomeEntry, $$IncomeEntriesTableReferences),
      IncomeEntry,
      PrefetchHooks Function({bool incomeSourceId, bool currentConsumerId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$IncomeCategoriesTableTableManager get incomeCategories =>
      $$IncomeCategoriesTableTableManager(_db, _db.incomeCategories);
  $$IncomeSourcesTableTableManager get incomeSources =>
      $$IncomeSourcesTableTableManager(_db, _db.incomeSources);
  $$ConsumersTableTableManager get consumers =>
      $$ConsumersTableTableManager(_db, _db.consumers);
  $$IncomeEntriesTableTableManager get incomeEntries =>
      $$IncomeEntriesTableTableManager(_db, _db.incomeEntries);
}
