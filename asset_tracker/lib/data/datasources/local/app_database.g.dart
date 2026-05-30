// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $AssetsTableTable extends AssetsTable
    with TableInfo<$AssetsTableTable, AssetsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _familyGroupIdMeta =
      const VerificationMeta('familyGroupId');
  @override
  late final GeneratedColumn<String> familyGroupId = GeneratedColumn<String>(
      'family_group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _templateIdMeta =
      const VerificationMeta('templateId');
  @override
  late final GeneratedColumn<String> templateId = GeneratedColumn<String>(
      'template_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByMeta =
      const VerificationMeta('createdBy');
  @override
  late final GeneratedColumn<String> createdBy = GeneratedColumn<String>(
      'created_by', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _customFieldsMeta =
      const VerificationMeta('customFields');
  @override
  late final GeneratedColumn<String> customFields = GeneratedColumn<String>(
      'custom_fields', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('{}'));
  static const VerificationMeta _isArchivedMeta =
      const VerificationMeta('isArchived');
  @override
  late final GeneratedColumn<bool> isArchived = GeneratedColumn<bool>(
      'is_archived', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_archived" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        familyGroupId,
        templateId,
        createdBy,
        name,
        category,
        iconName,
        notes,
        customFields,
        isArchived,
        syncStatus,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'assets';
  @override
  VerificationContext validateIntegrity(Insertable<AssetsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('family_group_id')) {
      context.handle(
          _familyGroupIdMeta,
          familyGroupId.isAcceptableOrUnknown(
              data['family_group_id']!, _familyGroupIdMeta));
    } else if (isInserting) {
      context.missing(_familyGroupIdMeta);
    }
    if (data.containsKey('template_id')) {
      context.handle(
          _templateIdMeta,
          templateId.isAcceptableOrUnknown(
              data['template_id']!, _templateIdMeta));
    }
    if (data.containsKey('created_by')) {
      context.handle(_createdByMeta,
          createdBy.isAcceptableOrUnknown(data['created_by']!, _createdByMeta));
    } else if (isInserting) {
      context.missing(_createdByMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('custom_fields')) {
      context.handle(
          _customFieldsMeta,
          customFields.isAcceptableOrUnknown(
              data['custom_fields']!, _customFieldsMeta));
    }
    if (data.containsKey('is_archived')) {
      context.handle(
          _isArchivedMeta,
          isArchived.isAcceptableOrUnknown(
              data['is_archived']!, _isArchivedMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssetsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssetsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      familyGroupId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}family_group_id'])!,
      templateId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}template_id']),
      createdBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      customFields: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}custom_fields'])!,
      isArchived: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_archived'])!,
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $AssetsTableTable createAlias(String alias) {
    return $AssetsTableTable(attachedDatabase, alias);
  }
}

class AssetsTableData extends DataClass implements Insertable<AssetsTableData> {
  final String id;
  final String familyGroupId;
  final String? templateId;
  final String createdBy;
  final String name;
  final String category;
  final String iconName;
  final String? notes;
  final String customFields;
  final bool isArchived;
  final String syncStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  const AssetsTableData(
      {required this.id,
      required this.familyGroupId,
      this.templateId,
      required this.createdBy,
      required this.name,
      required this.category,
      required this.iconName,
      this.notes,
      required this.customFields,
      required this.isArchived,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['family_group_id'] = Variable<String>(familyGroupId);
    if (!nullToAbsent || templateId != null) {
      map['template_id'] = Variable<String>(templateId);
    }
    map['created_by'] = Variable<String>(createdBy);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['icon_name'] = Variable<String>(iconName);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['custom_fields'] = Variable<String>(customFields);
    map['is_archived'] = Variable<bool>(isArchived);
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  AssetsTableCompanion toCompanion(bool nullToAbsent) {
    return AssetsTableCompanion(
      id: Value(id),
      familyGroupId: Value(familyGroupId),
      templateId: templateId == null && nullToAbsent
          ? const Value.absent()
          : Value(templateId),
      createdBy: Value(createdBy),
      name: Value(name),
      category: Value(category),
      iconName: Value(iconName),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      customFields: Value(customFields),
      isArchived: Value(isArchived),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory AssetsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssetsTableData(
      id: serializer.fromJson<String>(json['id']),
      familyGroupId: serializer.fromJson<String>(json['familyGroupId']),
      templateId: serializer.fromJson<String?>(json['templateId']),
      createdBy: serializer.fromJson<String>(json['createdBy']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      iconName: serializer.fromJson<String>(json['iconName']),
      notes: serializer.fromJson<String?>(json['notes']),
      customFields: serializer.fromJson<String>(json['customFields']),
      isArchived: serializer.fromJson<bool>(json['isArchived']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'familyGroupId': serializer.toJson<String>(familyGroupId),
      'templateId': serializer.toJson<String?>(templateId),
      'createdBy': serializer.toJson<String>(createdBy),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'iconName': serializer.toJson<String>(iconName),
      'notes': serializer.toJson<String?>(notes),
      'customFields': serializer.toJson<String>(customFields),
      'isArchived': serializer.toJson<bool>(isArchived),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  AssetsTableData copyWith(
          {String? id,
          String? familyGroupId,
          Value<String?> templateId = const Value.absent(),
          String? createdBy,
          String? name,
          String? category,
          String? iconName,
          Value<String?> notes = const Value.absent(),
          String? customFields,
          bool? isArchived,
          String? syncStatus,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      AssetsTableData(
        id: id ?? this.id,
        familyGroupId: familyGroupId ?? this.familyGroupId,
        templateId: templateId.present ? templateId.value : this.templateId,
        createdBy: createdBy ?? this.createdBy,
        name: name ?? this.name,
        category: category ?? this.category,
        iconName: iconName ?? this.iconName,
        notes: notes.present ? notes.value : this.notes,
        customFields: customFields ?? this.customFields,
        isArchived: isArchived ?? this.isArchived,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  AssetsTableData copyWithCompanion(AssetsTableCompanion data) {
    return AssetsTableData(
      id: data.id.present ? data.id.value : this.id,
      familyGroupId: data.familyGroupId.present
          ? data.familyGroupId.value
          : this.familyGroupId,
      templateId:
          data.templateId.present ? data.templateId.value : this.templateId,
      createdBy: data.createdBy.present ? data.createdBy.value : this.createdBy,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      notes: data.notes.present ? data.notes.value : this.notes,
      customFields: data.customFields.present
          ? data.customFields.value
          : this.customFields,
      isArchived:
          data.isArchived.present ? data.isArchived.value : this.isArchived,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssetsTableData(')
          ..write('id: $id, ')
          ..write('familyGroupId: $familyGroupId, ')
          ..write('templateId: $templateId, ')
          ..write('createdBy: $createdBy, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('iconName: $iconName, ')
          ..write('notes: $notes, ')
          ..write('customFields: $customFields, ')
          ..write('isArchived: $isArchived, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      familyGroupId,
      templateId,
      createdBy,
      name,
      category,
      iconName,
      notes,
      customFields,
      isArchived,
      syncStatus,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssetsTableData &&
          other.id == this.id &&
          other.familyGroupId == this.familyGroupId &&
          other.templateId == this.templateId &&
          other.createdBy == this.createdBy &&
          other.name == this.name &&
          other.category == this.category &&
          other.iconName == this.iconName &&
          other.notes == this.notes &&
          other.customFields == this.customFields &&
          other.isArchived == this.isArchived &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class AssetsTableCompanion extends UpdateCompanion<AssetsTableData> {
  final Value<String> id;
  final Value<String> familyGroupId;
  final Value<String?> templateId;
  final Value<String> createdBy;
  final Value<String> name;
  final Value<String> category;
  final Value<String> iconName;
  final Value<String?> notes;
  final Value<String> customFields;
  final Value<bool> isArchived;
  final Value<String> syncStatus;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const AssetsTableCompanion({
    this.id = const Value.absent(),
    this.familyGroupId = const Value.absent(),
    this.templateId = const Value.absent(),
    this.createdBy = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.iconName = const Value.absent(),
    this.notes = const Value.absent(),
    this.customFields = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssetsTableCompanion.insert({
    required String id,
    required String familyGroupId,
    this.templateId = const Value.absent(),
    required String createdBy,
    required String name,
    required String category,
    required String iconName,
    this.notes = const Value.absent(),
    this.customFields = const Value.absent(),
    this.isArchived = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        familyGroupId = Value(familyGroupId),
        createdBy = Value(createdBy),
        name = Value(name),
        category = Value(category),
        iconName = Value(iconName),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<AssetsTableData> custom({
    Expression<String>? id,
    Expression<String>? familyGroupId,
    Expression<String>? templateId,
    Expression<String>? createdBy,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? iconName,
    Expression<String>? notes,
    Expression<String>? customFields,
    Expression<bool>? isArchived,
    Expression<String>? syncStatus,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (familyGroupId != null) 'family_group_id': familyGroupId,
      if (templateId != null) 'template_id': templateId,
      if (createdBy != null) 'created_by': createdBy,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (iconName != null) 'icon_name': iconName,
      if (notes != null) 'notes': notes,
      if (customFields != null) 'custom_fields': customFields,
      if (isArchived != null) 'is_archived': isArchived,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssetsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? familyGroupId,
      Value<String?>? templateId,
      Value<String>? createdBy,
      Value<String>? name,
      Value<String>? category,
      Value<String>? iconName,
      Value<String?>? notes,
      Value<String>? customFields,
      Value<bool>? isArchived,
      Value<String>? syncStatus,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return AssetsTableCompanion(
      id: id ?? this.id,
      familyGroupId: familyGroupId ?? this.familyGroupId,
      templateId: templateId ?? this.templateId,
      createdBy: createdBy ?? this.createdBy,
      name: name ?? this.name,
      category: category ?? this.category,
      iconName: iconName ?? this.iconName,
      notes: notes ?? this.notes,
      customFields: customFields ?? this.customFields,
      isArchived: isArchived ?? this.isArchived,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (familyGroupId.present) {
      map['family_group_id'] = Variable<String>(familyGroupId.value);
    }
    if (templateId.present) {
      map['template_id'] = Variable<String>(templateId.value);
    }
    if (createdBy.present) {
      map['created_by'] = Variable<String>(createdBy.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (customFields.present) {
      map['custom_fields'] = Variable<String>(customFields.value);
    }
    if (isArchived.present) {
      map['is_archived'] = Variable<bool>(isArchived.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetsTableCompanion(')
          ..write('id: $id, ')
          ..write('familyGroupId: $familyGroupId, ')
          ..write('templateId: $templateId, ')
          ..write('createdBy: $createdBy, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('iconName: $iconName, ')
          ..write('notes: $notes, ')
          ..write('customFields: $customFields, ')
          ..write('isArchived: $isArchived, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ExtensionRecordsTableTable extends ExtensionRecordsTable
    with TableInfo<$ExtensionRecordsTableTable, ExtensionRecordsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ExtensionRecordsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _assetIdMeta =
      const VerificationMeta('assetId');
  @override
  late final GeneratedColumn<String> assetId = GeneratedColumn<String>(
      'asset_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _familyGroupIdMeta =
      const VerificationMeta('familyGroupId');
  @override
  late final GeneratedColumn<String> familyGroupId = GeneratedColumn<String>(
      'family_group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _labelMeta = const VerificationMeta('label');
  @override
  late final GeneratedColumn<String> label = GeneratedColumn<String>(
      'label', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _expiryDateMeta =
      const VerificationMeta('expiryDate');
  @override
  late final GeneratedColumn<DateTime> expiryDate = GeneratedColumn<DateTime>(
      'expiry_date', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _remindDaysBeforeMeta =
      const VerificationMeta('remindDaysBefore');
  @override
  late final GeneratedColumn<int> remindDaysBefore = GeneratedColumn<int>(
      'remind_days_before', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(30));
  static const VerificationMeta _billingCycleMeta =
      const VerificationMeta('billingCycle');
  @override
  late final GeneratedColumn<String> billingCycle = GeneratedColumn<String>(
      'billing_cycle', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _amountMeta = const VerificationMeta('amount');
  @override
  late final GeneratedColumn<double> amount = GeneratedColumn<double>(
      'amount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _currencyMeta =
      const VerificationMeta('currency');
  @override
  late final GeneratedColumn<String> currency = GeneratedColumn<String>(
      'currency', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('IDR'));
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('active'));
  static const VerificationMeta _renewedFromMeta =
      const VerificationMeta('renewedFrom');
  @override
  late final GeneratedColumn<String> renewedFrom = GeneratedColumn<String>(
      'renewed_from', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        assetId,
        familyGroupId,
        type,
        label,
        expiryDate,
        remindDaysBefore,
        billingCycle,
        amount,
        currency,
        status,
        renewedFrom,
        syncStatus,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'extension_records';
  @override
  VerificationContext validateIntegrity(
      Insertable<ExtensionRecordsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('asset_id')) {
      context.handle(_assetIdMeta,
          assetId.isAcceptableOrUnknown(data['asset_id']!, _assetIdMeta));
    } else if (isInserting) {
      context.missing(_assetIdMeta);
    }
    if (data.containsKey('family_group_id')) {
      context.handle(
          _familyGroupIdMeta,
          familyGroupId.isAcceptableOrUnknown(
              data['family_group_id']!, _familyGroupIdMeta));
    } else if (isInserting) {
      context.missing(_familyGroupIdMeta);
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('label')) {
      context.handle(
          _labelMeta, label.isAcceptableOrUnknown(data['label']!, _labelMeta));
    } else if (isInserting) {
      context.missing(_labelMeta);
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
          _expiryDateMeta,
          expiryDate.isAcceptableOrUnknown(
              data['expiry_date']!, _expiryDateMeta));
    } else if (isInserting) {
      context.missing(_expiryDateMeta);
    }
    if (data.containsKey('remind_days_before')) {
      context.handle(
          _remindDaysBeforeMeta,
          remindDaysBefore.isAcceptableOrUnknown(
              data['remind_days_before']!, _remindDaysBeforeMeta));
    }
    if (data.containsKey('billing_cycle')) {
      context.handle(
          _billingCycleMeta,
          billingCycle.isAcceptableOrUnknown(
              data['billing_cycle']!, _billingCycleMeta));
    }
    if (data.containsKey('amount')) {
      context.handle(_amountMeta,
          amount.isAcceptableOrUnknown(data['amount']!, _amountMeta));
    }
    if (data.containsKey('currency')) {
      context.handle(_currencyMeta,
          currency.isAcceptableOrUnknown(data['currency']!, _currencyMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('renewed_from')) {
      context.handle(
          _renewedFromMeta,
          renewedFrom.isAcceptableOrUnknown(
              data['renewed_from']!, _renewedFromMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ExtensionRecordsTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ExtensionRecordsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      assetId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}asset_id'])!,
      familyGroupId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}family_group_id'])!,
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      label: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}label'])!,
      expiryDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}expiry_date'])!,
      remindDaysBefore: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}remind_days_before'])!,
      billingCycle: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}billing_cycle']),
      amount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}amount']),
      currency: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}currency'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      renewedFrom: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}renewed_from']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $ExtensionRecordsTableTable createAlias(String alias) {
    return $ExtensionRecordsTableTable(attachedDatabase, alias);
  }
}

class ExtensionRecordsTableData extends DataClass
    implements Insertable<ExtensionRecordsTableData> {
  final String id;
  final String assetId;
  final String familyGroupId;
  final String type;
  final String label;
  final DateTime expiryDate;
  final int remindDaysBefore;
  final String? billingCycle;
  final double? amount;
  final String currency;
  final String status;
  final String? renewedFrom;
  final String syncStatus;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ExtensionRecordsTableData(
      {required this.id,
      required this.assetId,
      required this.familyGroupId,
      required this.type,
      required this.label,
      required this.expiryDate,
      required this.remindDaysBefore,
      this.billingCycle,
      this.amount,
      required this.currency,
      required this.status,
      this.renewedFrom,
      required this.syncStatus,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['asset_id'] = Variable<String>(assetId);
    map['family_group_id'] = Variable<String>(familyGroupId);
    map['type'] = Variable<String>(type);
    map['label'] = Variable<String>(label);
    map['expiry_date'] = Variable<DateTime>(expiryDate);
    map['remind_days_before'] = Variable<int>(remindDaysBefore);
    if (!nullToAbsent || billingCycle != null) {
      map['billing_cycle'] = Variable<String>(billingCycle);
    }
    if (!nullToAbsent || amount != null) {
      map['amount'] = Variable<double>(amount);
    }
    map['currency'] = Variable<String>(currency);
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || renewedFrom != null) {
      map['renewed_from'] = Variable<String>(renewedFrom);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  ExtensionRecordsTableCompanion toCompanion(bool nullToAbsent) {
    return ExtensionRecordsTableCompanion(
      id: Value(id),
      assetId: Value(assetId),
      familyGroupId: Value(familyGroupId),
      type: Value(type),
      label: Value(label),
      expiryDate: Value(expiryDate),
      remindDaysBefore: Value(remindDaysBefore),
      billingCycle: billingCycle == null && nullToAbsent
          ? const Value.absent()
          : Value(billingCycle),
      amount:
          amount == null && nullToAbsent ? const Value.absent() : Value(amount),
      currency: Value(currency),
      status: Value(status),
      renewedFrom: renewedFrom == null && nullToAbsent
          ? const Value.absent()
          : Value(renewedFrom),
      syncStatus: Value(syncStatus),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory ExtensionRecordsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ExtensionRecordsTableData(
      id: serializer.fromJson<String>(json['id']),
      assetId: serializer.fromJson<String>(json['assetId']),
      familyGroupId: serializer.fromJson<String>(json['familyGroupId']),
      type: serializer.fromJson<String>(json['type']),
      label: serializer.fromJson<String>(json['label']),
      expiryDate: serializer.fromJson<DateTime>(json['expiryDate']),
      remindDaysBefore: serializer.fromJson<int>(json['remindDaysBefore']),
      billingCycle: serializer.fromJson<String?>(json['billingCycle']),
      amount: serializer.fromJson<double?>(json['amount']),
      currency: serializer.fromJson<String>(json['currency']),
      status: serializer.fromJson<String>(json['status']),
      renewedFrom: serializer.fromJson<String?>(json['renewedFrom']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'assetId': serializer.toJson<String>(assetId),
      'familyGroupId': serializer.toJson<String>(familyGroupId),
      'type': serializer.toJson<String>(type),
      'label': serializer.toJson<String>(label),
      'expiryDate': serializer.toJson<DateTime>(expiryDate),
      'remindDaysBefore': serializer.toJson<int>(remindDaysBefore),
      'billingCycle': serializer.toJson<String?>(billingCycle),
      'amount': serializer.toJson<double?>(amount),
      'currency': serializer.toJson<String>(currency),
      'status': serializer.toJson<String>(status),
      'renewedFrom': serializer.toJson<String?>(renewedFrom),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ExtensionRecordsTableData copyWith(
          {String? id,
          String? assetId,
          String? familyGroupId,
          String? type,
          String? label,
          DateTime? expiryDate,
          int? remindDaysBefore,
          Value<String?> billingCycle = const Value.absent(),
          Value<double?> amount = const Value.absent(),
          String? currency,
          String? status,
          Value<String?> renewedFrom = const Value.absent(),
          String? syncStatus,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ExtensionRecordsTableData(
        id: id ?? this.id,
        assetId: assetId ?? this.assetId,
        familyGroupId: familyGroupId ?? this.familyGroupId,
        type: type ?? this.type,
        label: label ?? this.label,
        expiryDate: expiryDate ?? this.expiryDate,
        remindDaysBefore: remindDaysBefore ?? this.remindDaysBefore,
        billingCycle:
            billingCycle.present ? billingCycle.value : this.billingCycle,
        amount: amount.present ? amount.value : this.amount,
        currency: currency ?? this.currency,
        status: status ?? this.status,
        renewedFrom: renewedFrom.present ? renewedFrom.value : this.renewedFrom,
        syncStatus: syncStatus ?? this.syncStatus,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ExtensionRecordsTableData copyWithCompanion(
      ExtensionRecordsTableCompanion data) {
    return ExtensionRecordsTableData(
      id: data.id.present ? data.id.value : this.id,
      assetId: data.assetId.present ? data.assetId.value : this.assetId,
      familyGroupId: data.familyGroupId.present
          ? data.familyGroupId.value
          : this.familyGroupId,
      type: data.type.present ? data.type.value : this.type,
      label: data.label.present ? data.label.value : this.label,
      expiryDate:
          data.expiryDate.present ? data.expiryDate.value : this.expiryDate,
      remindDaysBefore: data.remindDaysBefore.present
          ? data.remindDaysBefore.value
          : this.remindDaysBefore,
      billingCycle: data.billingCycle.present
          ? data.billingCycle.value
          : this.billingCycle,
      amount: data.amount.present ? data.amount.value : this.amount,
      currency: data.currency.present ? data.currency.value : this.currency,
      status: data.status.present ? data.status.value : this.status,
      renewedFrom:
          data.renewedFrom.present ? data.renewedFrom.value : this.renewedFrom,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ExtensionRecordsTableData(')
          ..write('id: $id, ')
          ..write('assetId: $assetId, ')
          ..write('familyGroupId: $familyGroupId, ')
          ..write('type: $type, ')
          ..write('label: $label, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('remindDaysBefore: $remindDaysBefore, ')
          ..write('billingCycle: $billingCycle, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('status: $status, ')
          ..write('renewedFrom: $renewedFrom, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      assetId,
      familyGroupId,
      type,
      label,
      expiryDate,
      remindDaysBefore,
      billingCycle,
      amount,
      currency,
      status,
      renewedFrom,
      syncStatus,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ExtensionRecordsTableData &&
          other.id == this.id &&
          other.assetId == this.assetId &&
          other.familyGroupId == this.familyGroupId &&
          other.type == this.type &&
          other.label == this.label &&
          other.expiryDate == this.expiryDate &&
          other.remindDaysBefore == this.remindDaysBefore &&
          other.billingCycle == this.billingCycle &&
          other.amount == this.amount &&
          other.currency == this.currency &&
          other.status == this.status &&
          other.renewedFrom == this.renewedFrom &&
          other.syncStatus == this.syncStatus &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ExtensionRecordsTableCompanion
    extends UpdateCompanion<ExtensionRecordsTableData> {
  final Value<String> id;
  final Value<String> assetId;
  final Value<String> familyGroupId;
  final Value<String> type;
  final Value<String> label;
  final Value<DateTime> expiryDate;
  final Value<int> remindDaysBefore;
  final Value<String?> billingCycle;
  final Value<double?> amount;
  final Value<String> currency;
  final Value<String> status;
  final Value<String?> renewedFrom;
  final Value<String> syncStatus;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const ExtensionRecordsTableCompanion({
    this.id = const Value.absent(),
    this.assetId = const Value.absent(),
    this.familyGroupId = const Value.absent(),
    this.type = const Value.absent(),
    this.label = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.remindDaysBefore = const Value.absent(),
    this.billingCycle = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.status = const Value.absent(),
    this.renewedFrom = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ExtensionRecordsTableCompanion.insert({
    required String id,
    required String assetId,
    required String familyGroupId,
    required String type,
    required String label,
    required DateTime expiryDate,
    this.remindDaysBefore = const Value.absent(),
    this.billingCycle = const Value.absent(),
    this.amount = const Value.absent(),
    this.currency = const Value.absent(),
    this.status = const Value.absent(),
    this.renewedFrom = const Value.absent(),
    this.syncStatus = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        assetId = Value(assetId),
        familyGroupId = Value(familyGroupId),
        type = Value(type),
        label = Value(label),
        expiryDate = Value(expiryDate),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ExtensionRecordsTableData> custom({
    Expression<String>? id,
    Expression<String>? assetId,
    Expression<String>? familyGroupId,
    Expression<String>? type,
    Expression<String>? label,
    Expression<DateTime>? expiryDate,
    Expression<int>? remindDaysBefore,
    Expression<String>? billingCycle,
    Expression<double>? amount,
    Expression<String>? currency,
    Expression<String>? status,
    Expression<String>? renewedFrom,
    Expression<String>? syncStatus,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (assetId != null) 'asset_id': assetId,
      if (familyGroupId != null) 'family_group_id': familyGroupId,
      if (type != null) 'type': type,
      if (label != null) 'label': label,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (remindDaysBefore != null) 'remind_days_before': remindDaysBefore,
      if (billingCycle != null) 'billing_cycle': billingCycle,
      if (amount != null) 'amount': amount,
      if (currency != null) 'currency': currency,
      if (status != null) 'status': status,
      if (renewedFrom != null) 'renewed_from': renewedFrom,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ExtensionRecordsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? assetId,
      Value<String>? familyGroupId,
      Value<String>? type,
      Value<String>? label,
      Value<DateTime>? expiryDate,
      Value<int>? remindDaysBefore,
      Value<String?>? billingCycle,
      Value<double?>? amount,
      Value<String>? currency,
      Value<String>? status,
      Value<String?>? renewedFrom,
      Value<String>? syncStatus,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return ExtensionRecordsTableCompanion(
      id: id ?? this.id,
      assetId: assetId ?? this.assetId,
      familyGroupId: familyGroupId ?? this.familyGroupId,
      type: type ?? this.type,
      label: label ?? this.label,
      expiryDate: expiryDate ?? this.expiryDate,
      remindDaysBefore: remindDaysBefore ?? this.remindDaysBefore,
      billingCycle: billingCycle ?? this.billingCycle,
      amount: amount ?? this.amount,
      currency: currency ?? this.currency,
      status: status ?? this.status,
      renewedFrom: renewedFrom ?? this.renewedFrom,
      syncStatus: syncStatus ?? this.syncStatus,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (assetId.present) {
      map['asset_id'] = Variable<String>(assetId.value);
    }
    if (familyGroupId.present) {
      map['family_group_id'] = Variable<String>(familyGroupId.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (label.present) {
      map['label'] = Variable<String>(label.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<DateTime>(expiryDate.value);
    }
    if (remindDaysBefore.present) {
      map['remind_days_before'] = Variable<int>(remindDaysBefore.value);
    }
    if (billingCycle.present) {
      map['billing_cycle'] = Variable<String>(billingCycle.value);
    }
    if (amount.present) {
      map['amount'] = Variable<double>(amount.value);
    }
    if (currency.present) {
      map['currency'] = Variable<String>(currency.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (renewedFrom.present) {
      map['renewed_from'] = Variable<String>(renewedFrom.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ExtensionRecordsTableCompanion(')
          ..write('id: $id, ')
          ..write('assetId: $assetId, ')
          ..write('familyGroupId: $familyGroupId, ')
          ..write('type: $type, ')
          ..write('label: $label, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('remindDaysBefore: $remindDaysBefore, ')
          ..write('billingCycle: $billingCycle, ')
          ..write('amount: $amount, ')
          ..write('currency: $currency, ')
          ..write('status: $status, ')
          ..write('renewedFrom: $renewedFrom, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AttachmentsTableTable extends AttachmentsTable
    with TableInfo<$AttachmentsTableTable, AttachmentsTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AttachmentsTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _extensionRecordIdMeta =
      const VerificationMeta('extensionRecordId');
  @override
  late final GeneratedColumn<String> extensionRecordId =
      GeneratedColumn<String>('extension_record_id', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _familyGroupIdMeta =
      const VerificationMeta('familyGroupId');
  @override
  late final GeneratedColumn<String> familyGroupId = GeneratedColumn<String>(
      'family_group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _uploadedByMeta =
      const VerificationMeta('uploadedBy');
  @override
  late final GeneratedColumn<String> uploadedBy = GeneratedColumn<String>(
      'uploaded_by', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _fileNameMeta =
      const VerificationMeta('fileName');
  @override
  late final GeneratedColumn<String> fileName = GeneratedColumn<String>(
      'file_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileTypeMeta =
      const VerificationMeta('fileType');
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
      'file_type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _fileSizeBytesMeta =
      const VerificationMeta('fileSizeBytes');
  @override
  late final GeneratedColumn<int> fileSizeBytes = GeneratedColumn<int>(
      'file_size_bytes', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _storagePathMeta =
      const VerificationMeta('storagePath');
  @override
  late final GeneratedColumn<String> storagePath = GeneratedColumn<String>(
      'storage_path', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _localCachePathMeta =
      const VerificationMeta('localCachePath');
  @override
  late final GeneratedColumn<String> localCachePath = GeneratedColumn<String>(
      'local_cache_path', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _syncStatusMeta =
      const VerificationMeta('syncStatus');
  @override
  late final GeneratedColumn<String> syncStatus = GeneratedColumn<String>(
      'sync_status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('synced'));
  static const VerificationMeta _uploadedAtMeta =
      const VerificationMeta('uploadedAt');
  @override
  late final GeneratedColumn<DateTime> uploadedAt = GeneratedColumn<DateTime>(
      'uploaded_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        extensionRecordId,
        familyGroupId,
        uploadedBy,
        fileName,
        fileType,
        fileSizeBytes,
        storagePath,
        localCachePath,
        syncStatus,
        uploadedAt,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'attachments';
  @override
  VerificationContext validateIntegrity(
      Insertable<AttachmentsTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('extension_record_id')) {
      context.handle(
          _extensionRecordIdMeta,
          extensionRecordId.isAcceptableOrUnknown(
              data['extension_record_id']!, _extensionRecordIdMeta));
    } else if (isInserting) {
      context.missing(_extensionRecordIdMeta);
    }
    if (data.containsKey('family_group_id')) {
      context.handle(
          _familyGroupIdMeta,
          familyGroupId.isAcceptableOrUnknown(
              data['family_group_id']!, _familyGroupIdMeta));
    } else if (isInserting) {
      context.missing(_familyGroupIdMeta);
    }
    if (data.containsKey('uploaded_by')) {
      context.handle(
          _uploadedByMeta,
          uploadedBy.isAcceptableOrUnknown(
              data['uploaded_by']!, _uploadedByMeta));
    }
    if (data.containsKey('file_name')) {
      context.handle(_fileNameMeta,
          fileName.isAcceptableOrUnknown(data['file_name']!, _fileNameMeta));
    } else if (isInserting) {
      context.missing(_fileNameMeta);
    }
    if (data.containsKey('file_type')) {
      context.handle(_fileTypeMeta,
          fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta));
    } else if (isInserting) {
      context.missing(_fileTypeMeta);
    }
    if (data.containsKey('file_size_bytes')) {
      context.handle(
          _fileSizeBytesMeta,
          fileSizeBytes.isAcceptableOrUnknown(
              data['file_size_bytes']!, _fileSizeBytesMeta));
    } else if (isInserting) {
      context.missing(_fileSizeBytesMeta);
    }
    if (data.containsKey('storage_path')) {
      context.handle(
          _storagePathMeta,
          storagePath.isAcceptableOrUnknown(
              data['storage_path']!, _storagePathMeta));
    } else if (isInserting) {
      context.missing(_storagePathMeta);
    }
    if (data.containsKey('local_cache_path')) {
      context.handle(
          _localCachePathMeta,
          localCachePath.isAcceptableOrUnknown(
              data['local_cache_path']!, _localCachePathMeta));
    }
    if (data.containsKey('sync_status')) {
      context.handle(
          _syncStatusMeta,
          syncStatus.isAcceptableOrUnknown(
              data['sync_status']!, _syncStatusMeta));
    }
    if (data.containsKey('uploaded_at')) {
      context.handle(
          _uploadedAtMeta,
          uploadedAt.isAcceptableOrUnknown(
              data['uploaded_at']!, _uploadedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AttachmentsTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AttachmentsTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      extensionRecordId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}extension_record_id'])!,
      familyGroupId: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}family_group_id'])!,
      uploadedBy: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}uploaded_by']),
      fileName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_name'])!,
      fileType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}file_type'])!,
      fileSizeBytes: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}file_size_bytes'])!,
      storagePath: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}storage_path'])!,
      localCachePath: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}local_cache_path']),
      syncStatus: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sync_status'])!,
      uploadedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}uploaded_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AttachmentsTableTable createAlias(String alias) {
    return $AttachmentsTableTable(attachedDatabase, alias);
  }
}

class AttachmentsTableData extends DataClass
    implements Insertable<AttachmentsTableData> {
  final String id;
  final String extensionRecordId;
  final String familyGroupId;
  final String? uploadedBy;
  final String fileName;
  final String fileType;
  final int fileSizeBytes;
  final String storagePath;
  final String? localCachePath;
  final String syncStatus;
  final DateTime? uploadedAt;
  final DateTime createdAt;
  const AttachmentsTableData(
      {required this.id,
      required this.extensionRecordId,
      required this.familyGroupId,
      this.uploadedBy,
      required this.fileName,
      required this.fileType,
      required this.fileSizeBytes,
      required this.storagePath,
      this.localCachePath,
      required this.syncStatus,
      this.uploadedAt,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['extension_record_id'] = Variable<String>(extensionRecordId);
    map['family_group_id'] = Variable<String>(familyGroupId);
    if (!nullToAbsent || uploadedBy != null) {
      map['uploaded_by'] = Variable<String>(uploadedBy);
    }
    map['file_name'] = Variable<String>(fileName);
    map['file_type'] = Variable<String>(fileType);
    map['file_size_bytes'] = Variable<int>(fileSizeBytes);
    map['storage_path'] = Variable<String>(storagePath);
    if (!nullToAbsent || localCachePath != null) {
      map['local_cache_path'] = Variable<String>(localCachePath);
    }
    map['sync_status'] = Variable<String>(syncStatus);
    if (!nullToAbsent || uploadedAt != null) {
      map['uploaded_at'] = Variable<DateTime>(uploadedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AttachmentsTableCompanion toCompanion(bool nullToAbsent) {
    return AttachmentsTableCompanion(
      id: Value(id),
      extensionRecordId: Value(extensionRecordId),
      familyGroupId: Value(familyGroupId),
      uploadedBy: uploadedBy == null && nullToAbsent
          ? const Value.absent()
          : Value(uploadedBy),
      fileName: Value(fileName),
      fileType: Value(fileType),
      fileSizeBytes: Value(fileSizeBytes),
      storagePath: Value(storagePath),
      localCachePath: localCachePath == null && nullToAbsent
          ? const Value.absent()
          : Value(localCachePath),
      syncStatus: Value(syncStatus),
      uploadedAt: uploadedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(uploadedAt),
      createdAt: Value(createdAt),
    );
  }

  factory AttachmentsTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AttachmentsTableData(
      id: serializer.fromJson<String>(json['id']),
      extensionRecordId: serializer.fromJson<String>(json['extensionRecordId']),
      familyGroupId: serializer.fromJson<String>(json['familyGroupId']),
      uploadedBy: serializer.fromJson<String?>(json['uploadedBy']),
      fileName: serializer.fromJson<String>(json['fileName']),
      fileType: serializer.fromJson<String>(json['fileType']),
      fileSizeBytes: serializer.fromJson<int>(json['fileSizeBytes']),
      storagePath: serializer.fromJson<String>(json['storagePath']),
      localCachePath: serializer.fromJson<String?>(json['localCachePath']),
      syncStatus: serializer.fromJson<String>(json['syncStatus']),
      uploadedAt: serializer.fromJson<DateTime?>(json['uploadedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'extensionRecordId': serializer.toJson<String>(extensionRecordId),
      'familyGroupId': serializer.toJson<String>(familyGroupId),
      'uploadedBy': serializer.toJson<String?>(uploadedBy),
      'fileName': serializer.toJson<String>(fileName),
      'fileType': serializer.toJson<String>(fileType),
      'fileSizeBytes': serializer.toJson<int>(fileSizeBytes),
      'storagePath': serializer.toJson<String>(storagePath),
      'localCachePath': serializer.toJson<String?>(localCachePath),
      'syncStatus': serializer.toJson<String>(syncStatus),
      'uploadedAt': serializer.toJson<DateTime?>(uploadedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AttachmentsTableData copyWith(
          {String? id,
          String? extensionRecordId,
          String? familyGroupId,
          Value<String?> uploadedBy = const Value.absent(),
          String? fileName,
          String? fileType,
          int? fileSizeBytes,
          String? storagePath,
          Value<String?> localCachePath = const Value.absent(),
          String? syncStatus,
          Value<DateTime?> uploadedAt = const Value.absent(),
          DateTime? createdAt}) =>
      AttachmentsTableData(
        id: id ?? this.id,
        extensionRecordId: extensionRecordId ?? this.extensionRecordId,
        familyGroupId: familyGroupId ?? this.familyGroupId,
        uploadedBy: uploadedBy.present ? uploadedBy.value : this.uploadedBy,
        fileName: fileName ?? this.fileName,
        fileType: fileType ?? this.fileType,
        fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
        storagePath: storagePath ?? this.storagePath,
        localCachePath:
            localCachePath.present ? localCachePath.value : this.localCachePath,
        syncStatus: syncStatus ?? this.syncStatus,
        uploadedAt: uploadedAt.present ? uploadedAt.value : this.uploadedAt,
        createdAt: createdAt ?? this.createdAt,
      );
  AttachmentsTableData copyWithCompanion(AttachmentsTableCompanion data) {
    return AttachmentsTableData(
      id: data.id.present ? data.id.value : this.id,
      extensionRecordId: data.extensionRecordId.present
          ? data.extensionRecordId.value
          : this.extensionRecordId,
      familyGroupId: data.familyGroupId.present
          ? data.familyGroupId.value
          : this.familyGroupId,
      uploadedBy:
          data.uploadedBy.present ? data.uploadedBy.value : this.uploadedBy,
      fileName: data.fileName.present ? data.fileName.value : this.fileName,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      fileSizeBytes: data.fileSizeBytes.present
          ? data.fileSizeBytes.value
          : this.fileSizeBytes,
      storagePath:
          data.storagePath.present ? data.storagePath.value : this.storagePath,
      localCachePath: data.localCachePath.present
          ? data.localCachePath.value
          : this.localCachePath,
      syncStatus:
          data.syncStatus.present ? data.syncStatus.value : this.syncStatus,
      uploadedAt:
          data.uploadedAt.present ? data.uploadedAt.value : this.uploadedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsTableData(')
          ..write('id: $id, ')
          ..write('extensionRecordId: $extensionRecordId, ')
          ..write('familyGroupId: $familyGroupId, ')
          ..write('uploadedBy: $uploadedBy, ')
          ..write('fileName: $fileName, ')
          ..write('fileType: $fileType, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('storagePath: $storagePath, ')
          ..write('localCachePath: $localCachePath, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('uploadedAt: $uploadedAt, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      extensionRecordId,
      familyGroupId,
      uploadedBy,
      fileName,
      fileType,
      fileSizeBytes,
      storagePath,
      localCachePath,
      syncStatus,
      uploadedAt,
      createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AttachmentsTableData &&
          other.id == this.id &&
          other.extensionRecordId == this.extensionRecordId &&
          other.familyGroupId == this.familyGroupId &&
          other.uploadedBy == this.uploadedBy &&
          other.fileName == this.fileName &&
          other.fileType == this.fileType &&
          other.fileSizeBytes == this.fileSizeBytes &&
          other.storagePath == this.storagePath &&
          other.localCachePath == this.localCachePath &&
          other.syncStatus == this.syncStatus &&
          other.uploadedAt == this.uploadedAt &&
          other.createdAt == this.createdAt);
}

class AttachmentsTableCompanion extends UpdateCompanion<AttachmentsTableData> {
  final Value<String> id;
  final Value<String> extensionRecordId;
  final Value<String> familyGroupId;
  final Value<String?> uploadedBy;
  final Value<String> fileName;
  final Value<String> fileType;
  final Value<int> fileSizeBytes;
  final Value<String> storagePath;
  final Value<String?> localCachePath;
  final Value<String> syncStatus;
  final Value<DateTime?> uploadedAt;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AttachmentsTableCompanion({
    this.id = const Value.absent(),
    this.extensionRecordId = const Value.absent(),
    this.familyGroupId = const Value.absent(),
    this.uploadedBy = const Value.absent(),
    this.fileName = const Value.absent(),
    this.fileType = const Value.absent(),
    this.fileSizeBytes = const Value.absent(),
    this.storagePath = const Value.absent(),
    this.localCachePath = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.uploadedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AttachmentsTableCompanion.insert({
    required String id,
    required String extensionRecordId,
    required String familyGroupId,
    this.uploadedBy = const Value.absent(),
    required String fileName,
    required String fileType,
    required int fileSizeBytes,
    required String storagePath,
    this.localCachePath = const Value.absent(),
    this.syncStatus = const Value.absent(),
    this.uploadedAt = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        extensionRecordId = Value(extensionRecordId),
        familyGroupId = Value(familyGroupId),
        fileName = Value(fileName),
        fileType = Value(fileType),
        fileSizeBytes = Value(fileSizeBytes),
        storagePath = Value(storagePath),
        createdAt = Value(createdAt);
  static Insertable<AttachmentsTableData> custom({
    Expression<String>? id,
    Expression<String>? extensionRecordId,
    Expression<String>? familyGroupId,
    Expression<String>? uploadedBy,
    Expression<String>? fileName,
    Expression<String>? fileType,
    Expression<int>? fileSizeBytes,
    Expression<String>? storagePath,
    Expression<String>? localCachePath,
    Expression<String>? syncStatus,
    Expression<DateTime>? uploadedAt,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (extensionRecordId != null) 'extension_record_id': extensionRecordId,
      if (familyGroupId != null) 'family_group_id': familyGroupId,
      if (uploadedBy != null) 'uploaded_by': uploadedBy,
      if (fileName != null) 'file_name': fileName,
      if (fileType != null) 'file_type': fileType,
      if (fileSizeBytes != null) 'file_size_bytes': fileSizeBytes,
      if (storagePath != null) 'storage_path': storagePath,
      if (localCachePath != null) 'local_cache_path': localCachePath,
      if (syncStatus != null) 'sync_status': syncStatus,
      if (uploadedAt != null) 'uploaded_at': uploadedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AttachmentsTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? extensionRecordId,
      Value<String>? familyGroupId,
      Value<String?>? uploadedBy,
      Value<String>? fileName,
      Value<String>? fileType,
      Value<int>? fileSizeBytes,
      Value<String>? storagePath,
      Value<String?>? localCachePath,
      Value<String>? syncStatus,
      Value<DateTime?>? uploadedAt,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AttachmentsTableCompanion(
      id: id ?? this.id,
      extensionRecordId: extensionRecordId ?? this.extensionRecordId,
      familyGroupId: familyGroupId ?? this.familyGroupId,
      uploadedBy: uploadedBy ?? this.uploadedBy,
      fileName: fileName ?? this.fileName,
      fileType: fileType ?? this.fileType,
      fileSizeBytes: fileSizeBytes ?? this.fileSizeBytes,
      storagePath: storagePath ?? this.storagePath,
      localCachePath: localCachePath ?? this.localCachePath,
      syncStatus: syncStatus ?? this.syncStatus,
      uploadedAt: uploadedAt ?? this.uploadedAt,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (extensionRecordId.present) {
      map['extension_record_id'] = Variable<String>(extensionRecordId.value);
    }
    if (familyGroupId.present) {
      map['family_group_id'] = Variable<String>(familyGroupId.value);
    }
    if (uploadedBy.present) {
      map['uploaded_by'] = Variable<String>(uploadedBy.value);
    }
    if (fileName.present) {
      map['file_name'] = Variable<String>(fileName.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (fileSizeBytes.present) {
      map['file_size_bytes'] = Variable<int>(fileSizeBytes.value);
    }
    if (storagePath.present) {
      map['storage_path'] = Variable<String>(storagePath.value);
    }
    if (localCachePath.present) {
      map['local_cache_path'] = Variable<String>(localCachePath.value);
    }
    if (syncStatus.present) {
      map['sync_status'] = Variable<String>(syncStatus.value);
    }
    if (uploadedAt.present) {
      map['uploaded_at'] = Variable<DateTime>(uploadedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AttachmentsTableCompanion(')
          ..write('id: $id, ')
          ..write('extensionRecordId: $extensionRecordId, ')
          ..write('familyGroupId: $familyGroupId, ')
          ..write('uploadedBy: $uploadedBy, ')
          ..write('fileName: $fileName, ')
          ..write('fileType: $fileType, ')
          ..write('fileSizeBytes: $fileSizeBytes, ')
          ..write('storagePath: $storagePath, ')
          ..write('localCachePath: $localCachePath, ')
          ..write('syncStatus: $syncStatus, ')
          ..write('uploadedAt: $uploadedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AssetTemplatesTableTable extends AssetTemplatesTable
    with TableInfo<$AssetTemplatesTableTable, AssetTemplatesTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AssetTemplatesTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _categoryMeta =
      const VerificationMeta('category');
  @override
  late final GeneratedColumn<String> category = GeneratedColumn<String>(
      'category', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _iconNameMeta =
      const VerificationMeta('iconName');
  @override
  late final GeneratedColumn<String> iconName = GeneratedColumn<String>(
      'icon_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _defaultFieldsMeta =
      const VerificationMeta('defaultFields');
  @override
  late final GeneratedColumn<String> defaultFields = GeneratedColumn<String>(
      'default_fields', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _isSystemMeta =
      const VerificationMeta('isSystem');
  @override
  late final GeneratedColumn<bool> isSystem = GeneratedColumn<bool>(
      'is_system', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_system" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, category, iconName, defaultFields, isSystem, createdAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'asset_templates';
  @override
  VerificationContext validateIntegrity(
      Insertable<AssetTemplatesTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('category')) {
      context.handle(_categoryMeta,
          category.isAcceptableOrUnknown(data['category']!, _categoryMeta));
    } else if (isInserting) {
      context.missing(_categoryMeta);
    }
    if (data.containsKey('icon_name')) {
      context.handle(_iconNameMeta,
          iconName.isAcceptableOrUnknown(data['icon_name']!, _iconNameMeta));
    } else if (isInserting) {
      context.missing(_iconNameMeta);
    }
    if (data.containsKey('default_fields')) {
      context.handle(
          _defaultFieldsMeta,
          defaultFields.isAcceptableOrUnknown(
              data['default_fields']!, _defaultFieldsMeta));
    }
    if (data.containsKey('is_system')) {
      context.handle(_isSystemMeta,
          isSystem.isAcceptableOrUnknown(data['is_system']!, _isSystemMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AssetTemplatesTableData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AssetTemplatesTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      category: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category'])!,
      iconName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}icon_name'])!,
      defaultFields: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}default_fields'])!,
      isSystem: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_system'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AssetTemplatesTableTable createAlias(String alias) {
    return $AssetTemplatesTableTable(attachedDatabase, alias);
  }
}

class AssetTemplatesTableData extends DataClass
    implements Insertable<AssetTemplatesTableData> {
  final String id;
  final String name;
  final String category;
  final String iconName;
  final String defaultFields;
  final bool isSystem;
  final DateTime createdAt;
  const AssetTemplatesTableData(
      {required this.id,
      required this.name,
      required this.category,
      required this.iconName,
      required this.defaultFields,
      required this.isSystem,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['category'] = Variable<String>(category);
    map['icon_name'] = Variable<String>(iconName);
    map['default_fields'] = Variable<String>(defaultFields);
    map['is_system'] = Variable<bool>(isSystem);
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AssetTemplatesTableCompanion toCompanion(bool nullToAbsent) {
    return AssetTemplatesTableCompanion(
      id: Value(id),
      name: Value(name),
      category: Value(category),
      iconName: Value(iconName),
      defaultFields: Value(defaultFields),
      isSystem: Value(isSystem),
      createdAt: Value(createdAt),
    );
  }

  factory AssetTemplatesTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AssetTemplatesTableData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      category: serializer.fromJson<String>(json['category']),
      iconName: serializer.fromJson<String>(json['iconName']),
      defaultFields: serializer.fromJson<String>(json['defaultFields']),
      isSystem: serializer.fromJson<bool>(json['isSystem']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'category': serializer.toJson<String>(category),
      'iconName': serializer.toJson<String>(iconName),
      'defaultFields': serializer.toJson<String>(defaultFields),
      'isSystem': serializer.toJson<bool>(isSystem),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AssetTemplatesTableData copyWith(
          {String? id,
          String? name,
          String? category,
          String? iconName,
          String? defaultFields,
          bool? isSystem,
          DateTime? createdAt}) =>
      AssetTemplatesTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        category: category ?? this.category,
        iconName: iconName ?? this.iconName,
        defaultFields: defaultFields ?? this.defaultFields,
        isSystem: isSystem ?? this.isSystem,
        createdAt: createdAt ?? this.createdAt,
      );
  AssetTemplatesTableData copyWithCompanion(AssetTemplatesTableCompanion data) {
    return AssetTemplatesTableData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      category: data.category.present ? data.category.value : this.category,
      iconName: data.iconName.present ? data.iconName.value : this.iconName,
      defaultFields: data.defaultFields.present
          ? data.defaultFields.value
          : this.defaultFields,
      isSystem: data.isSystem.present ? data.isSystem.value : this.isSystem,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AssetTemplatesTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('iconName: $iconName, ')
          ..write('defaultFields: $defaultFields, ')
          ..write('isSystem: $isSystem, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id, name, category, iconName, defaultFields, isSystem, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AssetTemplatesTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.category == this.category &&
          other.iconName == this.iconName &&
          other.defaultFields == this.defaultFields &&
          other.isSystem == this.isSystem &&
          other.createdAt == this.createdAt);
}

class AssetTemplatesTableCompanion
    extends UpdateCompanion<AssetTemplatesTableData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> category;
  final Value<String> iconName;
  final Value<String> defaultFields;
  final Value<bool> isSystem;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AssetTemplatesTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.category = const Value.absent(),
    this.iconName = const Value.absent(),
    this.defaultFields = const Value.absent(),
    this.isSystem = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AssetTemplatesTableCompanion.insert({
    required String id,
    required String name,
    required String category,
    required String iconName,
    this.defaultFields = const Value.absent(),
    this.isSystem = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        category = Value(category),
        iconName = Value(iconName),
        createdAt = Value(createdAt);
  static Insertable<AssetTemplatesTableData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? category,
    Expression<String>? iconName,
    Expression<String>? defaultFields,
    Expression<bool>? isSystem,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (category != null) 'category': category,
      if (iconName != null) 'icon_name': iconName,
      if (defaultFields != null) 'default_fields': defaultFields,
      if (isSystem != null) 'is_system': isSystem,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AssetTemplatesTableCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? category,
      Value<String>? iconName,
      Value<String>? defaultFields,
      Value<bool>? isSystem,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AssetTemplatesTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      category: category ?? this.category,
      iconName: iconName ?? this.iconName,
      defaultFields: defaultFields ?? this.defaultFields,
      isSystem: isSystem ?? this.isSystem,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (category.present) {
      map['category'] = Variable<String>(category.value);
    }
    if (iconName.present) {
      map['icon_name'] = Variable<String>(iconName.value);
    }
    if (defaultFields.present) {
      map['default_fields'] = Variable<String>(defaultFields.value);
    }
    if (isSystem.present) {
      map['is_system'] = Variable<bool>(isSystem.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AssetTemplatesTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('category: $category, ')
          ..write('iconName: $iconName, ')
          ..write('defaultFields: $defaultFields, ')
          ..write('isSystem: $isSystem, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SyncQueueTableTable extends SyncQueueTable
    with TableInfo<$SyncQueueTableTable, SyncQueueTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SyncQueueTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _tableNameColumnMeta =
      const VerificationMeta('tableNameColumn');
  @override
  late final GeneratedColumn<String> tableNameColumn = GeneratedColumn<String>(
      'table_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _recordIdMeta =
      const VerificationMeta('recordId');
  @override
  late final GeneratedColumn<String> recordId = GeneratedColumn<String>(
      'record_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _operationMeta =
      const VerificationMeta('operation');
  @override
  late final GeneratedColumn<String> operation = GeneratedColumn<String>(
      'operation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _dataMeta = const VerificationMeta('data');
  @override
  late final GeneratedColumn<String> data = GeneratedColumn<String>(
      'data', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _retryCountMeta =
      const VerificationMeta('retryCount');
  @override
  late final GeneratedColumn<int> retryCount = GeneratedColumn<int>(
      'retry_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _lastErrorMeta =
      const VerificationMeta('lastError');
  @override
  late final GeneratedColumn<String> lastError = GeneratedColumn<String>(
      'last_error', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tableNameColumn,
        recordId,
        operation,
        data,
        createdAt,
        retryCount,
        lastError
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'sync_queue';
  @override
  VerificationContext validateIntegrity(Insertable<SyncQueueTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('table_name')) {
      context.handle(
          _tableNameColumnMeta,
          tableNameColumn.isAcceptableOrUnknown(
              data['table_name']!, _tableNameColumnMeta));
    } else if (isInserting) {
      context.missing(_tableNameColumnMeta);
    }
    if (data.containsKey('record_id')) {
      context.handle(_recordIdMeta,
          recordId.isAcceptableOrUnknown(data['record_id']!, _recordIdMeta));
    } else if (isInserting) {
      context.missing(_recordIdMeta);
    }
    if (data.containsKey('operation')) {
      context.handle(_operationMeta,
          operation.isAcceptableOrUnknown(data['operation']!, _operationMeta));
    } else if (isInserting) {
      context.missing(_operationMeta);
    }
    if (data.containsKey('data')) {
      context.handle(
          _dataMeta, this.data.isAcceptableOrUnknown(data['data']!, _dataMeta));
    } else if (isInserting) {
      context.missing(_dataMeta);
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('retry_count')) {
      context.handle(
          _retryCountMeta,
          retryCount.isAcceptableOrUnknown(
              data['retry_count']!, _retryCountMeta));
    }
    if (data.containsKey('last_error')) {
      context.handle(_lastErrorMeta,
          lastError.isAcceptableOrUnknown(data['last_error']!, _lastErrorMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SyncQueueTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SyncQueueTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      tableNameColumn: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}table_name'])!,
      recordId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}record_id'])!,
      operation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}operation'])!,
      data: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}data'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      retryCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}retry_count'])!,
      lastError: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_error']),
    );
  }

  @override
  $SyncQueueTableTable createAlias(String alias) {
    return $SyncQueueTableTable(attachedDatabase, alias);
  }
}

class SyncQueueTableData extends DataClass
    implements Insertable<SyncQueueTableData> {
  final int id;
  final String tableNameColumn;
  final String recordId;
  final String operation;
  final String data;
  final DateTime createdAt;
  final int retryCount;
  final String? lastError;
  const SyncQueueTableData(
      {required this.id,
      required this.tableNameColumn,
      required this.recordId,
      required this.operation,
      required this.data,
      required this.createdAt,
      required this.retryCount,
      this.lastError});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['table_name'] = Variable<String>(tableNameColumn);
    map['record_id'] = Variable<String>(recordId);
    map['operation'] = Variable<String>(operation);
    map['data'] = Variable<String>(data);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['retry_count'] = Variable<int>(retryCount);
    if (!nullToAbsent || lastError != null) {
      map['last_error'] = Variable<String>(lastError);
    }
    return map;
  }

  SyncQueueTableCompanion toCompanion(bool nullToAbsent) {
    return SyncQueueTableCompanion(
      id: Value(id),
      tableNameColumn: Value(tableNameColumn),
      recordId: Value(recordId),
      operation: Value(operation),
      data: Value(data),
      createdAt: Value(createdAt),
      retryCount: Value(retryCount),
      lastError: lastError == null && nullToAbsent
          ? const Value.absent()
          : Value(lastError),
    );
  }

  factory SyncQueueTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SyncQueueTableData(
      id: serializer.fromJson<int>(json['id']),
      tableNameColumn: serializer.fromJson<String>(json['tableNameColumn']),
      recordId: serializer.fromJson<String>(json['recordId']),
      operation: serializer.fromJson<String>(json['operation']),
      data: serializer.fromJson<String>(json['data']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      retryCount: serializer.fromJson<int>(json['retryCount']),
      lastError: serializer.fromJson<String?>(json['lastError']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'tableNameColumn': serializer.toJson<String>(tableNameColumn),
      'recordId': serializer.toJson<String>(recordId),
      'operation': serializer.toJson<String>(operation),
      'data': serializer.toJson<String>(data),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'retryCount': serializer.toJson<int>(retryCount),
      'lastError': serializer.toJson<String?>(lastError),
    };
  }

  SyncQueueTableData copyWith(
          {int? id,
          String? tableNameColumn,
          String? recordId,
          String? operation,
          String? data,
          DateTime? createdAt,
          int? retryCount,
          Value<String?> lastError = const Value.absent()}) =>
      SyncQueueTableData(
        id: id ?? this.id,
        tableNameColumn: tableNameColumn ?? this.tableNameColumn,
        recordId: recordId ?? this.recordId,
        operation: operation ?? this.operation,
        data: data ?? this.data,
        createdAt: createdAt ?? this.createdAt,
        retryCount: retryCount ?? this.retryCount,
        lastError: lastError.present ? lastError.value : this.lastError,
      );
  SyncQueueTableData copyWithCompanion(SyncQueueTableCompanion data) {
    return SyncQueueTableData(
      id: data.id.present ? data.id.value : this.id,
      tableNameColumn: data.tableNameColumn.present
          ? data.tableNameColumn.value
          : this.tableNameColumn,
      recordId: data.recordId.present ? data.recordId.value : this.recordId,
      operation: data.operation.present ? data.operation.value : this.operation,
      data: data.data.present ? data.data.value : this.data,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      retryCount:
          data.retryCount.present ? data.retryCount.value : this.retryCount,
      lastError: data.lastError.present ? data.lastError.value : this.lastError,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableData(')
          ..write('id: $id, ')
          ..write('tableNameColumn: $tableNameColumn, ')
          ..write('recordId: $recordId, ')
          ..write('operation: $operation, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tableNameColumn, recordId, operation,
      data, createdAt, retryCount, lastError);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SyncQueueTableData &&
          other.id == this.id &&
          other.tableNameColumn == this.tableNameColumn &&
          other.recordId == this.recordId &&
          other.operation == this.operation &&
          other.data == this.data &&
          other.createdAt == this.createdAt &&
          other.retryCount == this.retryCount &&
          other.lastError == this.lastError);
}

class SyncQueueTableCompanion extends UpdateCompanion<SyncQueueTableData> {
  final Value<int> id;
  final Value<String> tableNameColumn;
  final Value<String> recordId;
  final Value<String> operation;
  final Value<String> data;
  final Value<DateTime> createdAt;
  final Value<int> retryCount;
  final Value<String?> lastError;
  const SyncQueueTableCompanion({
    this.id = const Value.absent(),
    this.tableNameColumn = const Value.absent(),
    this.recordId = const Value.absent(),
    this.operation = const Value.absent(),
    this.data = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  });
  SyncQueueTableCompanion.insert({
    this.id = const Value.absent(),
    required String tableNameColumn,
    required String recordId,
    required String operation,
    required String data,
    required DateTime createdAt,
    this.retryCount = const Value.absent(),
    this.lastError = const Value.absent(),
  })  : tableNameColumn = Value(tableNameColumn),
        recordId = Value(recordId),
        operation = Value(operation),
        data = Value(data),
        createdAt = Value(createdAt);
  static Insertable<SyncQueueTableData> custom({
    Expression<int>? id,
    Expression<String>? tableNameColumn,
    Expression<String>? recordId,
    Expression<String>? operation,
    Expression<String>? data,
    Expression<DateTime>? createdAt,
    Expression<int>? retryCount,
    Expression<String>? lastError,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tableNameColumn != null) 'table_name': tableNameColumn,
      if (recordId != null) 'record_id': recordId,
      if (operation != null) 'operation': operation,
      if (data != null) 'data': data,
      if (createdAt != null) 'created_at': createdAt,
      if (retryCount != null) 'retry_count': retryCount,
      if (lastError != null) 'last_error': lastError,
    });
  }

  SyncQueueTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? tableNameColumn,
      Value<String>? recordId,
      Value<String>? operation,
      Value<String>? data,
      Value<DateTime>? createdAt,
      Value<int>? retryCount,
      Value<String?>? lastError}) {
    return SyncQueueTableCompanion(
      id: id ?? this.id,
      tableNameColumn: tableNameColumn ?? this.tableNameColumn,
      recordId: recordId ?? this.recordId,
      operation: operation ?? this.operation,
      data: data ?? this.data,
      createdAt: createdAt ?? this.createdAt,
      retryCount: retryCount ?? this.retryCount,
      lastError: lastError ?? this.lastError,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (tableNameColumn.present) {
      map['table_name'] = Variable<String>(tableNameColumn.value);
    }
    if (recordId.present) {
      map['record_id'] = Variable<String>(recordId.value);
    }
    if (operation.present) {
      map['operation'] = Variable<String>(operation.value);
    }
    if (data.present) {
      map['data'] = Variable<String>(data.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (retryCount.present) {
      map['retry_count'] = Variable<int>(retryCount.value);
    }
    if (lastError.present) {
      map['last_error'] = Variable<String>(lastError.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SyncQueueTableCompanion(')
          ..write('id: $id, ')
          ..write('tableNameColumn: $tableNameColumn, ')
          ..write('recordId: $recordId, ')
          ..write('operation: $operation, ')
          ..write('data: $data, ')
          ..write('createdAt: $createdAt, ')
          ..write('retryCount: $retryCount, ')
          ..write('lastError: $lastError')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $AssetsTableTable assetsTable = $AssetsTableTable(this);
  late final $ExtensionRecordsTableTable extensionRecordsTable =
      $ExtensionRecordsTableTable(this);
  late final $AttachmentsTableTable attachmentsTable =
      $AttachmentsTableTable(this);
  late final $AssetTemplatesTableTable assetTemplatesTable =
      $AssetTemplatesTableTable(this);
  late final $SyncQueueTableTable syncQueueTable = $SyncQueueTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        assetsTable,
        extensionRecordsTable,
        attachmentsTable,
        assetTemplatesTable,
        syncQueueTable
      ];
}

typedef $$AssetsTableTableCreateCompanionBuilder = AssetsTableCompanion
    Function({
  required String id,
  required String familyGroupId,
  Value<String?> templateId,
  required String createdBy,
  required String name,
  required String category,
  required String iconName,
  Value<String?> notes,
  Value<String> customFields,
  Value<bool> isArchived,
  Value<String> syncStatus,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$AssetsTableTableUpdateCompanionBuilder = AssetsTableCompanion
    Function({
  Value<String> id,
  Value<String> familyGroupId,
  Value<String?> templateId,
  Value<String> createdBy,
  Value<String> name,
  Value<String> category,
  Value<String> iconName,
  Value<String?> notes,
  Value<String> customFields,
  Value<bool> isArchived,
  Value<String> syncStatus,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$AssetsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AssetsTableTable> {
  $$AssetsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get customFields => $composableBuilder(
      column: $table.customFields, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$AssetsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AssetsTableTable> {
  $$AssetsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdBy => $composableBuilder(
      column: $table.createdBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get customFields => $composableBuilder(
      column: $table.customFields,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$AssetsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssetsTableTable> {
  $$AssetsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId, builder: (column) => column);

  GeneratedColumn<String> get templateId => $composableBuilder(
      column: $table.templateId, builder: (column) => column);

  GeneratedColumn<String> get createdBy =>
      $composableBuilder(column: $table.createdBy, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<String> get customFields => $composableBuilder(
      column: $table.customFields, builder: (column) => column);

  GeneratedColumn<bool> get isArchived => $composableBuilder(
      column: $table.isArchived, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$AssetsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssetsTableTable,
    AssetsTableData,
    $$AssetsTableTableFilterComposer,
    $$AssetsTableTableOrderingComposer,
    $$AssetsTableTableAnnotationComposer,
    $$AssetsTableTableCreateCompanionBuilder,
    $$AssetsTableTableUpdateCompanionBuilder,
    (
      AssetsTableData,
      BaseReferences<_$AppDatabase, $AssetsTableTable, AssetsTableData>
    ),
    AssetsTableData,
    PrefetchHooks Function()> {
  $$AssetsTableTableTableManager(_$AppDatabase db, $AssetsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssetsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssetsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssetsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> familyGroupId = const Value.absent(),
            Value<String?> templateId = const Value.absent(),
            Value<String> createdBy = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> iconName = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<String> customFields = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetsTableCompanion(
            id: id,
            familyGroupId: familyGroupId,
            templateId: templateId,
            createdBy: createdBy,
            name: name,
            category: category,
            iconName: iconName,
            notes: notes,
            customFields: customFields,
            isArchived: isArchived,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String familyGroupId,
            Value<String?> templateId = const Value.absent(),
            required String createdBy,
            required String name,
            required String category,
            required String iconName,
            Value<String?> notes = const Value.absent(),
            Value<String> customFields = const Value.absent(),
            Value<bool> isArchived = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetsTableCompanion.insert(
            id: id,
            familyGroupId: familyGroupId,
            templateId: templateId,
            createdBy: createdBy,
            name: name,
            category: category,
            iconName: iconName,
            notes: notes,
            customFields: customFields,
            isArchived: isArchived,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssetsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssetsTableTable,
    AssetsTableData,
    $$AssetsTableTableFilterComposer,
    $$AssetsTableTableOrderingComposer,
    $$AssetsTableTableAnnotationComposer,
    $$AssetsTableTableCreateCompanionBuilder,
    $$AssetsTableTableUpdateCompanionBuilder,
    (
      AssetsTableData,
      BaseReferences<_$AppDatabase, $AssetsTableTable, AssetsTableData>
    ),
    AssetsTableData,
    PrefetchHooks Function()>;
typedef $$ExtensionRecordsTableTableCreateCompanionBuilder
    = ExtensionRecordsTableCompanion Function({
  required String id,
  required String assetId,
  required String familyGroupId,
  required String type,
  required String label,
  required DateTime expiryDate,
  Value<int> remindDaysBefore,
  Value<String?> billingCycle,
  Value<double?> amount,
  Value<String> currency,
  Value<String> status,
  Value<String?> renewedFrom,
  Value<String> syncStatus,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$ExtensionRecordsTableTableUpdateCompanionBuilder
    = ExtensionRecordsTableCompanion Function({
  Value<String> id,
  Value<String> assetId,
  Value<String> familyGroupId,
  Value<String> type,
  Value<String> label,
  Value<DateTime> expiryDate,
  Value<int> remindDaysBefore,
  Value<String?> billingCycle,
  Value<double?> amount,
  Value<String> currency,
  Value<String> status,
  Value<String?> renewedFrom,
  Value<String> syncStatus,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$ExtensionRecordsTableTableFilterComposer
    extends Composer<_$AppDatabase, $ExtensionRecordsTableTable> {
  $$ExtensionRecordsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get assetId => $composableBuilder(
      column: $table.assetId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get remindDaysBefore => $composableBuilder(
      column: $table.remindDaysBefore,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get billingCycle => $composableBuilder(
      column: $table.billingCycle, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get renewedFrom => $composableBuilder(
      column: $table.renewedFrom, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$ExtensionRecordsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $ExtensionRecordsTableTable> {
  $$ExtensionRecordsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get assetId => $composableBuilder(
      column: $table.assetId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get label => $composableBuilder(
      column: $table.label, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get remindDaysBefore => $composableBuilder(
      column: $table.remindDaysBefore,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get billingCycle => $composableBuilder(
      column: $table.billingCycle,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get amount => $composableBuilder(
      column: $table.amount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get currency => $composableBuilder(
      column: $table.currency, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get renewedFrom => $composableBuilder(
      column: $table.renewedFrom, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ExtensionRecordsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $ExtensionRecordsTableTable> {
  $$ExtensionRecordsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get assetId =>
      $composableBuilder(column: $table.assetId, builder: (column) => column);

  GeneratedColumn<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get label =>
      $composableBuilder(column: $table.label, builder: (column) => column);

  GeneratedColumn<DateTime> get expiryDate => $composableBuilder(
      column: $table.expiryDate, builder: (column) => column);

  GeneratedColumn<int> get remindDaysBefore => $composableBuilder(
      column: $table.remindDaysBefore, builder: (column) => column);

  GeneratedColumn<String> get billingCycle => $composableBuilder(
      column: $table.billingCycle, builder: (column) => column);

  GeneratedColumn<double> get amount =>
      $composableBuilder(column: $table.amount, builder: (column) => column);

  GeneratedColumn<String> get currency =>
      $composableBuilder(column: $table.currency, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get renewedFrom => $composableBuilder(
      column: $table.renewedFrom, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$ExtensionRecordsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ExtensionRecordsTableTable,
    ExtensionRecordsTableData,
    $$ExtensionRecordsTableTableFilterComposer,
    $$ExtensionRecordsTableTableOrderingComposer,
    $$ExtensionRecordsTableTableAnnotationComposer,
    $$ExtensionRecordsTableTableCreateCompanionBuilder,
    $$ExtensionRecordsTableTableUpdateCompanionBuilder,
    (
      ExtensionRecordsTableData,
      BaseReferences<_$AppDatabase, $ExtensionRecordsTableTable,
          ExtensionRecordsTableData>
    ),
    ExtensionRecordsTableData,
    PrefetchHooks Function()> {
  $$ExtensionRecordsTableTableTableManager(
      _$AppDatabase db, $ExtensionRecordsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ExtensionRecordsTableTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$ExtensionRecordsTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ExtensionRecordsTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> assetId = const Value.absent(),
            Value<String> familyGroupId = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> label = const Value.absent(),
            Value<DateTime> expiryDate = const Value.absent(),
            Value<int> remindDaysBefore = const Value.absent(),
            Value<String?> billingCycle = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> renewedFrom = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ExtensionRecordsTableCompanion(
            id: id,
            assetId: assetId,
            familyGroupId: familyGroupId,
            type: type,
            label: label,
            expiryDate: expiryDate,
            remindDaysBefore: remindDaysBefore,
            billingCycle: billingCycle,
            amount: amount,
            currency: currency,
            status: status,
            renewedFrom: renewedFrom,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String assetId,
            required String familyGroupId,
            required String type,
            required String label,
            required DateTime expiryDate,
            Value<int> remindDaysBefore = const Value.absent(),
            Value<String?> billingCycle = const Value.absent(),
            Value<double?> amount = const Value.absent(),
            Value<String> currency = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> renewedFrom = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              ExtensionRecordsTableCompanion.insert(
            id: id,
            assetId: assetId,
            familyGroupId: familyGroupId,
            type: type,
            label: label,
            expiryDate: expiryDate,
            remindDaysBefore: remindDaysBefore,
            billingCycle: billingCycle,
            amount: amount,
            currency: currency,
            status: status,
            renewedFrom: renewedFrom,
            syncStatus: syncStatus,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$ExtensionRecordsTableTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ExtensionRecordsTableTable,
        ExtensionRecordsTableData,
        $$ExtensionRecordsTableTableFilterComposer,
        $$ExtensionRecordsTableTableOrderingComposer,
        $$ExtensionRecordsTableTableAnnotationComposer,
        $$ExtensionRecordsTableTableCreateCompanionBuilder,
        $$ExtensionRecordsTableTableUpdateCompanionBuilder,
        (
          ExtensionRecordsTableData,
          BaseReferences<_$AppDatabase, $ExtensionRecordsTableTable,
              ExtensionRecordsTableData>
        ),
        ExtensionRecordsTableData,
        PrefetchHooks Function()>;
typedef $$AttachmentsTableTableCreateCompanionBuilder
    = AttachmentsTableCompanion Function({
  required String id,
  required String extensionRecordId,
  required String familyGroupId,
  Value<String?> uploadedBy,
  required String fileName,
  required String fileType,
  required int fileSizeBytes,
  required String storagePath,
  Value<String?> localCachePath,
  Value<String> syncStatus,
  Value<DateTime?> uploadedAt,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$AttachmentsTableTableUpdateCompanionBuilder
    = AttachmentsTableCompanion Function({
  Value<String> id,
  Value<String> extensionRecordId,
  Value<String> familyGroupId,
  Value<String?> uploadedBy,
  Value<String> fileName,
  Value<String> fileType,
  Value<int> fileSizeBytes,
  Value<String> storagePath,
  Value<String?> localCachePath,
  Value<String> syncStatus,
  Value<DateTime?> uploadedAt,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AttachmentsTableTableFilterComposer
    extends Composer<_$AppDatabase, $AttachmentsTableTable> {
  $$AttachmentsTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get extensionRecordId => $composableBuilder(
      column: $table.extensionRecordId,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get uploadedBy => $composableBuilder(
      column: $table.uploadedBy, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get fileType => $composableBuilder(
      column: $table.fileType, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get storagePath => $composableBuilder(
      column: $table.storagePath, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get localCachePath => $composableBuilder(
      column: $table.localCachePath,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AttachmentsTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AttachmentsTableTable> {
  $$AttachmentsTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get extensionRecordId => $composableBuilder(
      column: $table.extensionRecordId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get uploadedBy => $composableBuilder(
      column: $table.uploadedBy, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileName => $composableBuilder(
      column: $table.fileName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get fileType => $composableBuilder(
      column: $table.fileType, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get storagePath => $composableBuilder(
      column: $table.storagePath, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get localCachePath => $composableBuilder(
      column: $table.localCachePath,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AttachmentsTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AttachmentsTableTable> {
  $$AttachmentsTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get extensionRecordId => $composableBuilder(
      column: $table.extensionRecordId, builder: (column) => column);

  GeneratedColumn<String> get familyGroupId => $composableBuilder(
      column: $table.familyGroupId, builder: (column) => column);

  GeneratedColumn<String> get uploadedBy => $composableBuilder(
      column: $table.uploadedBy, builder: (column) => column);

  GeneratedColumn<String> get fileName =>
      $composableBuilder(column: $table.fileName, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<int> get fileSizeBytes => $composableBuilder(
      column: $table.fileSizeBytes, builder: (column) => column);

  GeneratedColumn<String> get storagePath => $composableBuilder(
      column: $table.storagePath, builder: (column) => column);

  GeneratedColumn<String> get localCachePath => $composableBuilder(
      column: $table.localCachePath, builder: (column) => column);

  GeneratedColumn<String> get syncStatus => $composableBuilder(
      column: $table.syncStatus, builder: (column) => column);

  GeneratedColumn<DateTime> get uploadedAt => $composableBuilder(
      column: $table.uploadedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AttachmentsTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AttachmentsTableTable,
    AttachmentsTableData,
    $$AttachmentsTableTableFilterComposer,
    $$AttachmentsTableTableOrderingComposer,
    $$AttachmentsTableTableAnnotationComposer,
    $$AttachmentsTableTableCreateCompanionBuilder,
    $$AttachmentsTableTableUpdateCompanionBuilder,
    (
      AttachmentsTableData,
      BaseReferences<_$AppDatabase, $AttachmentsTableTable,
          AttachmentsTableData>
    ),
    AttachmentsTableData,
    PrefetchHooks Function()> {
  $$AttachmentsTableTableTableManager(
      _$AppDatabase db, $AttachmentsTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AttachmentsTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AttachmentsTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AttachmentsTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> extensionRecordId = const Value.absent(),
            Value<String> familyGroupId = const Value.absent(),
            Value<String?> uploadedBy = const Value.absent(),
            Value<String> fileName = const Value.absent(),
            Value<String> fileType = const Value.absent(),
            Value<int> fileSizeBytes = const Value.absent(),
            Value<String> storagePath = const Value.absent(),
            Value<String?> localCachePath = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> uploadedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AttachmentsTableCompanion(
            id: id,
            extensionRecordId: extensionRecordId,
            familyGroupId: familyGroupId,
            uploadedBy: uploadedBy,
            fileName: fileName,
            fileType: fileType,
            fileSizeBytes: fileSizeBytes,
            storagePath: storagePath,
            localCachePath: localCachePath,
            syncStatus: syncStatus,
            uploadedAt: uploadedAt,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String extensionRecordId,
            required String familyGroupId,
            Value<String?> uploadedBy = const Value.absent(),
            required String fileName,
            required String fileType,
            required int fileSizeBytes,
            required String storagePath,
            Value<String?> localCachePath = const Value.absent(),
            Value<String> syncStatus = const Value.absent(),
            Value<DateTime?> uploadedAt = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AttachmentsTableCompanion.insert(
            id: id,
            extensionRecordId: extensionRecordId,
            familyGroupId: familyGroupId,
            uploadedBy: uploadedBy,
            fileName: fileName,
            fileType: fileType,
            fileSizeBytes: fileSizeBytes,
            storagePath: storagePath,
            localCachePath: localCachePath,
            syncStatus: syncStatus,
            uploadedAt: uploadedAt,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AttachmentsTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AttachmentsTableTable,
    AttachmentsTableData,
    $$AttachmentsTableTableFilterComposer,
    $$AttachmentsTableTableOrderingComposer,
    $$AttachmentsTableTableAnnotationComposer,
    $$AttachmentsTableTableCreateCompanionBuilder,
    $$AttachmentsTableTableUpdateCompanionBuilder,
    (
      AttachmentsTableData,
      BaseReferences<_$AppDatabase, $AttachmentsTableTable,
          AttachmentsTableData>
    ),
    AttachmentsTableData,
    PrefetchHooks Function()>;
typedef $$AssetTemplatesTableTableCreateCompanionBuilder
    = AssetTemplatesTableCompanion Function({
  required String id,
  required String name,
  required String category,
  required String iconName,
  Value<String> defaultFields,
  Value<bool> isSystem,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$AssetTemplatesTableTableUpdateCompanionBuilder
    = AssetTemplatesTableCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> category,
  Value<String> iconName,
  Value<String> defaultFields,
  Value<bool> isSystem,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AssetTemplatesTableTableFilterComposer
    extends Composer<_$AppDatabase, $AssetTemplatesTableTable> {
  $$AssetTemplatesTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get defaultFields => $composableBuilder(
      column: $table.defaultFields, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isSystem => $composableBuilder(
      column: $table.isSystem, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AssetTemplatesTableTableOrderingComposer
    extends Composer<_$AppDatabase, $AssetTemplatesTableTable> {
  $$AssetTemplatesTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get category => $composableBuilder(
      column: $table.category, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get iconName => $composableBuilder(
      column: $table.iconName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get defaultFields => $composableBuilder(
      column: $table.defaultFields,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isSystem => $composableBuilder(
      column: $table.isSystem, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AssetTemplatesTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $AssetTemplatesTableTable> {
  $$AssetTemplatesTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get category =>
      $composableBuilder(column: $table.category, builder: (column) => column);

  GeneratedColumn<String> get iconName =>
      $composableBuilder(column: $table.iconName, builder: (column) => column);

  GeneratedColumn<String> get defaultFields => $composableBuilder(
      column: $table.defaultFields, builder: (column) => column);

  GeneratedColumn<bool> get isSystem =>
      $composableBuilder(column: $table.isSystem, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AssetTemplatesTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AssetTemplatesTableTable,
    AssetTemplatesTableData,
    $$AssetTemplatesTableTableFilterComposer,
    $$AssetTemplatesTableTableOrderingComposer,
    $$AssetTemplatesTableTableAnnotationComposer,
    $$AssetTemplatesTableTableCreateCompanionBuilder,
    $$AssetTemplatesTableTableUpdateCompanionBuilder,
    (
      AssetTemplatesTableData,
      BaseReferences<_$AppDatabase, $AssetTemplatesTableTable,
          AssetTemplatesTableData>
    ),
    AssetTemplatesTableData,
    PrefetchHooks Function()> {
  $$AssetTemplatesTableTableTableManager(
      _$AppDatabase db, $AssetTemplatesTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AssetTemplatesTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AssetTemplatesTableTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AssetTemplatesTableTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> category = const Value.absent(),
            Value<String> iconName = const Value.absent(),
            Value<String> defaultFields = const Value.absent(),
            Value<bool> isSystem = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetTemplatesTableCompanion(
            id: id,
            name: name,
            category: category,
            iconName: iconName,
            defaultFields: defaultFields,
            isSystem: isSystem,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            required String category,
            required String iconName,
            Value<String> defaultFields = const Value.absent(),
            Value<bool> isSystem = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AssetTemplatesTableCompanion.insert(
            id: id,
            name: name,
            category: category,
            iconName: iconName,
            defaultFields: defaultFields,
            isSystem: isSystem,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AssetTemplatesTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AssetTemplatesTableTable,
    AssetTemplatesTableData,
    $$AssetTemplatesTableTableFilterComposer,
    $$AssetTemplatesTableTableOrderingComposer,
    $$AssetTemplatesTableTableAnnotationComposer,
    $$AssetTemplatesTableTableCreateCompanionBuilder,
    $$AssetTemplatesTableTableUpdateCompanionBuilder,
    (
      AssetTemplatesTableData,
      BaseReferences<_$AppDatabase, $AssetTemplatesTableTable,
          AssetTemplatesTableData>
    ),
    AssetTemplatesTableData,
    PrefetchHooks Function()>;
typedef $$SyncQueueTableTableCreateCompanionBuilder = SyncQueueTableCompanion
    Function({
  Value<int> id,
  required String tableNameColumn,
  required String recordId,
  required String operation,
  required String data,
  required DateTime createdAt,
  Value<int> retryCount,
  Value<String?> lastError,
});
typedef $$SyncQueueTableTableUpdateCompanionBuilder = SyncQueueTableCompanion
    Function({
  Value<int> id,
  Value<String> tableNameColumn,
  Value<String> recordId,
  Value<String> operation,
  Value<String> data,
  Value<DateTime> createdAt,
  Value<int> retryCount,
  Value<String?> lastError,
});

class $$SyncQueueTableTableFilterComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tableNameColumn => $composableBuilder(
      column: $table.tableNameColumn,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get recordId => $composableBuilder(
      column: $table.recordId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnFilters(column));
}

class $$SyncQueueTableTableOrderingComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tableNameColumn => $composableBuilder(
      column: $table.tableNameColumn,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get recordId => $composableBuilder(
      column: $table.recordId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get operation => $composableBuilder(
      column: $table.operation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get data => $composableBuilder(
      column: $table.data, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastError => $composableBuilder(
      column: $table.lastError, builder: (column) => ColumnOrderings(column));
}

class $$SyncQueueTableTableAnnotationComposer
    extends Composer<_$AppDatabase, $SyncQueueTableTable> {
  $$SyncQueueTableTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tableNameColumn => $composableBuilder(
      column: $table.tableNameColumn, builder: (column) => column);

  GeneratedColumn<String> get recordId =>
      $composableBuilder(column: $table.recordId, builder: (column) => column);

  GeneratedColumn<String> get operation =>
      $composableBuilder(column: $table.operation, builder: (column) => column);

  GeneratedColumn<String> get data =>
      $composableBuilder(column: $table.data, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<int> get retryCount => $composableBuilder(
      column: $table.retryCount, builder: (column) => column);

  GeneratedColumn<String> get lastError =>
      $composableBuilder(column: $table.lastError, builder: (column) => column);
}

class $$SyncQueueTableTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SyncQueueTableTable,
    SyncQueueTableData,
    $$SyncQueueTableTableFilterComposer,
    $$SyncQueueTableTableOrderingComposer,
    $$SyncQueueTableTableAnnotationComposer,
    $$SyncQueueTableTableCreateCompanionBuilder,
    $$SyncQueueTableTableUpdateCompanionBuilder,
    (
      SyncQueueTableData,
      BaseReferences<_$AppDatabase, $SyncQueueTableTable, SyncQueueTableData>
    ),
    SyncQueueTableData,
    PrefetchHooks Function()> {
  $$SyncQueueTableTableTableManager(
      _$AppDatabase db, $SyncQueueTableTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SyncQueueTableTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SyncQueueTableTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SyncQueueTableTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> tableNameColumn = const Value.absent(),
            Value<String> recordId = const Value.absent(),
            Value<String> operation = const Value.absent(),
            Value<String> data = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> retryCount = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
          }) =>
              SyncQueueTableCompanion(
            id: id,
            tableNameColumn: tableNameColumn,
            recordId: recordId,
            operation: operation,
            data: data,
            createdAt: createdAt,
            retryCount: retryCount,
            lastError: lastError,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String tableNameColumn,
            required String recordId,
            required String operation,
            required String data,
            required DateTime createdAt,
            Value<int> retryCount = const Value.absent(),
            Value<String?> lastError = const Value.absent(),
          }) =>
              SyncQueueTableCompanion.insert(
            id: id,
            tableNameColumn: tableNameColumn,
            recordId: recordId,
            operation: operation,
            data: data,
            createdAt: createdAt,
            retryCount: retryCount,
            lastError: lastError,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$SyncQueueTableTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SyncQueueTableTable,
    SyncQueueTableData,
    $$SyncQueueTableTableFilterComposer,
    $$SyncQueueTableTableOrderingComposer,
    $$SyncQueueTableTableAnnotationComposer,
    $$SyncQueueTableTableCreateCompanionBuilder,
    $$SyncQueueTableTableUpdateCompanionBuilder,
    (
      SyncQueueTableData,
      BaseReferences<_$AppDatabase, $SyncQueueTableTable, SyncQueueTableData>
    ),
    SyncQueueTableData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$AssetsTableTableTableManager get assetsTable =>
      $$AssetsTableTableTableManager(_db, _db.assetsTable);
  $$ExtensionRecordsTableTableTableManager get extensionRecordsTable =>
      $$ExtensionRecordsTableTableTableManager(_db, _db.extensionRecordsTable);
  $$AttachmentsTableTableTableManager get attachmentsTable =>
      $$AttachmentsTableTableTableManager(_db, _db.attachmentsTable);
  $$AssetTemplatesTableTableTableManager get assetTemplatesTable =>
      $$AssetTemplatesTableTableTableManager(_db, _db.assetTemplatesTable);
  $$SyncQueueTableTableTableManager get syncQueueTable =>
      $$SyncQueueTableTableTableManager(_db, _db.syncQueueTable);
}
