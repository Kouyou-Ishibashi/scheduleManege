// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'calendar_db.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: type=lint
class CalendarItemData extends DataClass
    implements Insertable<CalendarItemData> {
  final int id;
  final DateTime? scheduleDate;
  final DateTime? startTime;
  final DateTime? endTime;
  final String eventFlg;
  final String? scheduleMemo;
  final DateTime? createDate;
  final DateTime? editDate;
  CalendarItemData(
      {required this.id,
      this.scheduleDate,
      this.startTime,
      this.endTime,
      required this.eventFlg,
      this.scheduleMemo,
      this.createDate,
      this.editDate});
  factory CalendarItemData.fromData(Map<String, dynamic> data,
      {String? prefix}) {
    final effectivePrefix = prefix ?? '';
    return CalendarItemData(
      id: const IntType()
          .mapFromDatabaseResponse(data['${effectivePrefix}id'])!,
      scheduleDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}schedule_date']),
      startTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}start_time']),
      endTime: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}end_time']),
      eventFlg: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}event_flg'])!,
      scheduleMemo: const StringType()
          .mapFromDatabaseResponse(data['${effectivePrefix}schedule_memo']),
      createDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}create_date']),
      editDate: const DateTimeType()
          .mapFromDatabaseResponse(data['${effectivePrefix}edit_date']),
    );
  }
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || scheduleDate != null) {
      map['schedule_date'] = Variable<DateTime?>(scheduleDate);
    }
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<DateTime?>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<DateTime?>(endTime);
    }
    map['event_flg'] = Variable<String>(eventFlg);
    if (!nullToAbsent || scheduleMemo != null) {
      map['schedule_memo'] = Variable<String?>(scheduleMemo);
    }
    if (!nullToAbsent || createDate != null) {
      map['create_date'] = Variable<DateTime?>(createDate);
    }
    if (!nullToAbsent || editDate != null) {
      map['edit_date'] = Variable<DateTime?>(editDate);
    }
    return map;
  }

  CalendarItemCompanion toCompanion(bool nullToAbsent) {
    return CalendarItemCompanion(
      id: Value(id),
      scheduleDate: scheduleDate == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduleDate),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      eventFlg: Value(eventFlg),
      scheduleMemo: scheduleMemo == null && nullToAbsent
          ? const Value.absent()
          : Value(scheduleMemo),
      createDate: createDate == null && nullToAbsent
          ? const Value.absent()
          : Value(createDate),
      editDate: editDate == null && nullToAbsent
          ? const Value.absent()
          : Value(editDate),
    );
  }

  factory CalendarItemData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CalendarItemData(
      id: serializer.fromJson<int>(json['id']),
      scheduleDate: serializer.fromJson<DateTime?>(json['scheduleDate']),
      startTime: serializer.fromJson<DateTime?>(json['startTime']),
      endTime: serializer.fromJson<DateTime?>(json['endTime']),
      eventFlg: serializer.fromJson<String>(json['eventFlg']),
      scheduleMemo: serializer.fromJson<String?>(json['scheduleMemo']),
      createDate: serializer.fromJson<DateTime?>(json['createDate']),
      editDate: serializer.fromJson<DateTime?>(json['editDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'scheduleDate': serializer.toJson<DateTime?>(scheduleDate),
      'startTime': serializer.toJson<DateTime?>(startTime),
      'endTime': serializer.toJson<DateTime?>(endTime),
      'eventFlg': serializer.toJson<String>(eventFlg),
      'scheduleMemo': serializer.toJson<String?>(scheduleMemo),
      'createDate': serializer.toJson<DateTime?>(createDate),
      'editDate': serializer.toJson<DateTime?>(editDate),
    };
  }

  CalendarItemData copyWith(
          {int? id,
          DateTime? scheduleDate,
          DateTime? startTime,
          DateTime? endTime,
          String? eventFlg,
          String? scheduleMemo,
          DateTime? createDate,
          DateTime? editDate}) =>
      CalendarItemData(
        id: id ?? this.id,
        scheduleDate: scheduleDate ?? this.scheduleDate,
        startTime: startTime ?? this.startTime,
        endTime: endTime ?? this.endTime,
        eventFlg: eventFlg ?? this.eventFlg,
        scheduleMemo: scheduleMemo ?? this.scheduleMemo,
        createDate: createDate ?? this.createDate,
        editDate: editDate ?? this.editDate,
      );
  @override
  String toString() {
    return (StringBuffer('CalendarItemData(')
          ..write('id: $id, ')
          ..write('scheduleDate: $scheduleDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('eventFlg: $eventFlg, ')
          ..write('scheduleMemo: $scheduleMemo, ')
          ..write('createDate: $createDate, ')
          ..write('editDate: $editDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, scheduleDate, startTime, endTime,
      eventFlg, scheduleMemo, createDate, editDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CalendarItemData &&
          other.id == this.id &&
          other.scheduleDate == this.scheduleDate &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.eventFlg == this.eventFlg &&
          other.scheduleMemo == this.scheduleMemo &&
          other.createDate == this.createDate &&
          other.editDate == this.editDate);
}

class CalendarItemCompanion extends UpdateCompanion<CalendarItemData> {
  final Value<int> id;
  final Value<DateTime?> scheduleDate;
  final Value<DateTime?> startTime;
  final Value<DateTime?> endTime;
  final Value<String> eventFlg;
  final Value<String?> scheduleMemo;
  final Value<DateTime?> createDate;
  final Value<DateTime?> editDate;
  const CalendarItemCompanion({
    this.id = const Value.absent(),
    this.scheduleDate = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.eventFlg = const Value.absent(),
    this.scheduleMemo = const Value.absent(),
    this.createDate = const Value.absent(),
    this.editDate = const Value.absent(),
  });
  CalendarItemCompanion.insert({
    this.id = const Value.absent(),
    this.scheduleDate = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    required String eventFlg,
    this.scheduleMemo = const Value.absent(),
    this.createDate = const Value.absent(),
    this.editDate = const Value.absent(),
  }) : eventFlg = Value(eventFlg);
  static Insertable<CalendarItemData> custom({
    Expression<int>? id,
    Expression<DateTime?>? scheduleDate,
    Expression<DateTime?>? startTime,
    Expression<DateTime?>? endTime,
    Expression<String>? eventFlg,
    Expression<String?>? scheduleMemo,
    Expression<DateTime?>? createDate,
    Expression<DateTime?>? editDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (scheduleDate != null) 'schedule_date': scheduleDate,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (eventFlg != null) 'event_flg': eventFlg,
      if (scheduleMemo != null) 'schedule_memo': scheduleMemo,
      if (createDate != null) 'create_date': createDate,
      if (editDate != null) 'edit_date': editDate,
    });
  }

  CalendarItemCompanion copyWith(
      {Value<int>? id,
      Value<DateTime?>? scheduleDate,
      Value<DateTime?>? startTime,
      Value<DateTime?>? endTime,
      Value<String>? eventFlg,
      Value<String?>? scheduleMemo,
      Value<DateTime?>? createDate,
      Value<DateTime?>? editDate}) {
    return CalendarItemCompanion(
      id: id ?? this.id,
      scheduleDate: scheduleDate ?? this.scheduleDate,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      eventFlg: eventFlg ?? this.eventFlg,
      scheduleMemo: scheduleMemo ?? this.scheduleMemo,
      createDate: createDate ?? this.createDate,
      editDate: editDate ?? this.editDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (scheduleDate.present) {
      map['schedule_date'] = Variable<DateTime?>(scheduleDate.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<DateTime?>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<DateTime?>(endTime.value);
    }
    if (eventFlg.present) {
      map['event_flg'] = Variable<String>(eventFlg.value);
    }
    if (scheduleMemo.present) {
      map['schedule_memo'] = Variable<String?>(scheduleMemo.value);
    }
    if (createDate.present) {
      map['create_date'] = Variable<DateTime?>(createDate.value);
    }
    if (editDate.present) {
      map['edit_date'] = Variable<DateTime?>(editDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CalendarItemCompanion(')
          ..write('id: $id, ')
          ..write('scheduleDate: $scheduleDate, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('eventFlg: $eventFlg, ')
          ..write('scheduleMemo: $scheduleMemo, ')
          ..write('createDate: $createDate, ')
          ..write('editDate: $editDate')
          ..write(')'))
        .toString();
  }
}

class $CalendarItemTable extends CalendarItem
    with TableInfo<$CalendarItemTable, CalendarItemData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CalendarItemTable(this.attachedDatabase, [this._alias]);
  final VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int?> id = GeneratedColumn<int?>(
      'id', aliasedName, false,
      type: const IntType(),
      requiredDuringInsert: false,
      defaultConstraints: 'PRIMARY KEY AUTOINCREMENT');
  final VerificationMeta _scheduleDateMeta =
      const VerificationMeta('scheduleDate');
  @override
  late final GeneratedColumn<DateTime?> scheduleDate =
      GeneratedColumn<DateTime?>('schedule_date', aliasedName, true,
          type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _startTimeMeta = const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<DateTime?> startTime = GeneratedColumn<DateTime?>(
      'start_time', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _endTimeMeta = const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<DateTime?> endTime = GeneratedColumn<DateTime?>(
      'end_time', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _eventFlgMeta = const VerificationMeta('eventFlg');
  @override
  late final GeneratedColumn<String?> eventFlg = GeneratedColumn<String?>(
      'event_flg', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 1),
      type: const StringType(),
      requiredDuringInsert: true);
  final VerificationMeta _scheduleMemoMeta =
      const VerificationMeta('scheduleMemo');
  @override
  late final GeneratedColumn<String?> scheduleMemo = GeneratedColumn<String?>(
      'schedule_memo', aliasedName, true,
      type: const StringType(), requiredDuringInsert: false);
  final VerificationMeta _createDateMeta = const VerificationMeta('createDate');
  @override
  late final GeneratedColumn<DateTime?> createDate = GeneratedColumn<DateTime?>(
      'create_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  final VerificationMeta _editDateMeta = const VerificationMeta('editDate');
  @override
  late final GeneratedColumn<DateTime?> editDate = GeneratedColumn<DateTime?>(
      'edit_date', aliasedName, true,
      type: const IntType(), requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        scheduleDate,
        startTime,
        endTime,
        eventFlg,
        scheduleMemo,
        createDate,
        editDate
      ];
  @override
  String get aliasedName => _alias ?? 'calendar_item';
  @override
  String get actualTableName => 'calendar_item';
  @override
  VerificationContext validateIntegrity(Insertable<CalendarItemData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('schedule_date')) {
      context.handle(
          _scheduleDateMeta,
          scheduleDate.isAcceptableOrUnknown(
              data['schedule_date']!, _scheduleDateMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('event_flg')) {
      context.handle(_eventFlgMeta,
          eventFlg.isAcceptableOrUnknown(data['event_flg']!, _eventFlgMeta));
    } else if (isInserting) {
      context.missing(_eventFlgMeta);
    }
    if (data.containsKey('schedule_memo')) {
      context.handle(
          _scheduleMemoMeta,
          scheduleMemo.isAcceptableOrUnknown(
              data['schedule_memo']!, _scheduleMemoMeta));
    }
    if (data.containsKey('create_date')) {
      context.handle(
          _createDateMeta,
          createDate.isAcceptableOrUnknown(
              data['create_date']!, _createDateMeta));
    }
    if (data.containsKey('edit_date')) {
      context.handle(_editDateMeta,
          editDate.isAcceptableOrUnknown(data['edit_date']!, _editDateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CalendarItemData map(Map<String, dynamic> data, {String? tablePrefix}) {
    return CalendarItemData.fromData(data,
        prefix: tablePrefix != null ? '$tablePrefix.' : null);
  }

  @override
  $CalendarItemTable createAlias(String alias) {
    return $CalendarItemTable(attachedDatabase, alias);
  }
}

abstract class _$MyDatabase extends GeneratedDatabase {
  _$MyDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  late final $CalendarItemTable calendarItem = $CalendarItemTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [calendarItem];
}
