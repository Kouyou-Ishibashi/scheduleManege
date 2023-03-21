// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'calendar_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalendarStateData {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isReadyData => throw _privateConstructorUsedError;
  List<CalendarItemData> get CalendarItems =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalendarStateDataCopyWith<CalendarStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalendarStateDataCopyWith<$Res> {
  factory $CalendarStateDataCopyWith(
          CalendarStateData value, $Res Function(CalendarStateData) then) =
      _$CalendarStateDataCopyWithImpl<$Res, CalendarStateData>;
  @useResult
  $Res call(
      {bool isLoading, bool isReadyData, List<CalendarItemData> CalendarItems});
}

/// @nodoc
class _$CalendarStateDataCopyWithImpl<$Res, $Val extends CalendarStateData>
    implements $CalendarStateDataCopyWith<$Res> {
  _$CalendarStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? CalendarItems = null,
  }) {
    return _then(_value.copyWith(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      CalendarItems: null == CalendarItems
          ? _value.CalendarItems
          : CalendarItems // ignore: cast_nullable_to_non_nullable
              as List<CalendarItemData>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalendarStateDataCopyWith<$Res>
    implements $CalendarStateDataCopyWith<$Res> {
  factory _$$_CalendarStateDataCopyWith(_$_CalendarStateData value,
          $Res Function(_$_CalendarStateData) then) =
      __$$_CalendarStateDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isLoading, bool isReadyData, List<CalendarItemData> CalendarItems});
}

/// @nodoc
class __$$_CalendarStateDataCopyWithImpl<$Res>
    extends _$CalendarStateDataCopyWithImpl<$Res, _$_CalendarStateData>
    implements _$$_CalendarStateDataCopyWith<$Res> {
  __$$_CalendarStateDataCopyWithImpl(
      _$_CalendarStateData _value, $Res Function(_$_CalendarStateData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = null,
    Object? isReadyData = null,
    Object? CalendarItems = null,
  }) {
    return _then(_$_CalendarStateData(
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadyData: null == isReadyData
          ? _value.isReadyData
          : isReadyData // ignore: cast_nullable_to_non_nullable
              as bool,
      CalendarItems: null == CalendarItems
          ? _value._CalendarItems
          : CalendarItems // ignore: cast_nullable_to_non_nullable
              as List<CalendarItemData>,
    ));
  }
}

/// @nodoc

class _$_CalendarStateData implements _CalendarStateData {
  _$_CalendarStateData(
      {this.isLoading = false,
      this.isReadyData = false,
      final List<CalendarItemData> CalendarItems = const []})
      : _CalendarItems = CalendarItems;

  @override
  @JsonKey()
  final bool isLoading;
  @override
  @JsonKey()
  final bool isReadyData;
  final List<CalendarItemData> _CalendarItems;
  @override
  @JsonKey()
  List<CalendarItemData> get CalendarItems {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_CalendarItems);
  }

  @override
  String toString() {
    return 'CalendarStateData(isLoading: $isLoading, isReadyData: $isReadyData, CalendarItems: $CalendarItems)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalendarStateData &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.isReadyData, isReadyData) ||
                other.isReadyData == isReadyData) &&
            const DeepCollectionEquality()
                .equals(other._CalendarItems, _CalendarItems));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, isReadyData,
      const DeepCollectionEquality().hash(_CalendarItems));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalendarStateDataCopyWith<_$_CalendarStateData> get copyWith =>
      __$$_CalendarStateDataCopyWithImpl<_$_CalendarStateData>(
          this, _$identity);
}

abstract class _CalendarStateData implements CalendarStateData {
  factory _CalendarStateData(
      {final bool isLoading,
      final bool isReadyData,
      final List<CalendarItemData> CalendarItems}) = _$_CalendarStateData;

  @override
  bool get isLoading;
  @override
  bool get isReadyData;
  @override
  List<CalendarItemData> get CalendarItems;
  @override
  @JsonKey(ignore: true)
  _$$_CalendarStateDataCopyWith<_$_CalendarStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$TempCalendarItemData {
  DateTime? get scheduleDate => throw _privateConstructorUsedError;
  DateTime? get startTime => throw _privateConstructorUsedError;
  DateTime? get endTime => throw _privateConstructorUsedError;
  String get eventFlg => throw _privateConstructorUsedError;
  String get scheduleMemo => throw _privateConstructorUsedError;
  DateTime? get createDate => throw _privateConstructorUsedError;
  DateTime? get editDate => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TempCalendarItemDataCopyWith<TempCalendarItemData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TempCalendarItemDataCopyWith<$Res> {
  factory $TempCalendarItemDataCopyWith(TempCalendarItemData value,
          $Res Function(TempCalendarItemData) then) =
      _$TempCalendarItemDataCopyWithImpl<$Res, TempCalendarItemData>;
  @useResult
  $Res call(
      {DateTime? scheduleDate,
      DateTime? startTime,
      DateTime? endTime,
      String eventFlg,
      String scheduleMemo,
      DateTime? createDate,
      DateTime? editDate});
}

/// @nodoc
class _$TempCalendarItemDataCopyWithImpl<$Res,
        $Val extends TempCalendarItemData>
    implements $TempCalendarItemDataCopyWith<$Res> {
  _$TempCalendarItemDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? eventFlg = null,
    Object? scheduleMemo = null,
    Object? createDate = freezed,
    Object? editDate = freezed,
  }) {
    return _then(_value.copyWith(
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventFlg: null == eventFlg
          ? _value.eventFlg
          : eventFlg // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleMemo: null == scheduleMemo
          ? _value.scheduleMemo
          : scheduleMemo // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editDate: freezed == editDate
          ? _value.editDate
          : editDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TempCalendarItemDataCopyWith<$Res>
    implements $TempCalendarItemDataCopyWith<$Res> {
  factory _$$_TempCalendarItemDataCopyWith(_$_TempCalendarItemData value,
          $Res Function(_$_TempCalendarItemData) then) =
      __$$_TempCalendarItemDataCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime? scheduleDate,
      DateTime? startTime,
      DateTime? endTime,
      String eventFlg,
      String scheduleMemo,
      DateTime? createDate,
      DateTime? editDate});
}

/// @nodoc
class __$$_TempCalendarItemDataCopyWithImpl<$Res>
    extends _$TempCalendarItemDataCopyWithImpl<$Res, _$_TempCalendarItemData>
    implements _$$_TempCalendarItemDataCopyWith<$Res> {
  __$$_TempCalendarItemDataCopyWithImpl(_$_TempCalendarItemData _value,
      $Res Function(_$_TempCalendarItemData) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? scheduleDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? eventFlg = null,
    Object? scheduleMemo = null,
    Object? createDate = freezed,
    Object? editDate = freezed,
  }) {
    return _then(_$_TempCalendarItemData(
      scheduleDate: freezed == scheduleDate
          ? _value.scheduleDate
          : scheduleDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      eventFlg: null == eventFlg
          ? _value.eventFlg
          : eventFlg // ignore: cast_nullable_to_non_nullable
              as String,
      scheduleMemo: null == scheduleMemo
          ? _value.scheduleMemo
          : scheduleMemo // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: freezed == createDate
          ? _value.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      editDate: freezed == editDate
          ? _value.editDate
          : editDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc

class _$_TempCalendarItemData implements _TempCalendarItemData {
  _$_TempCalendarItemData(
      {this.scheduleDate,
      this.startTime,
      this.endTime,
      this.eventFlg = '0',
      this.scheduleMemo = 'test',
      this.createDate,
      this.editDate});

  @override
  final DateTime? scheduleDate;
  @override
  final DateTime? startTime;
  @override
  final DateTime? endTime;
  @override
  @JsonKey()
  final String eventFlg;
  @override
  @JsonKey()
  final String scheduleMemo;
  @override
  final DateTime? createDate;
  @override
  final DateTime? editDate;

  @override
  String toString() {
    return 'TempCalendarItemData(scheduleDate: $scheduleDate, startTime: $startTime, endTime: $endTime, eventFlg: $eventFlg, scheduleMemo: $scheduleMemo, createDate: $createDate, editDate: $editDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TempCalendarItemData &&
            (identical(other.scheduleDate, scheduleDate) ||
                other.scheduleDate == scheduleDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.eventFlg, eventFlg) ||
                other.eventFlg == eventFlg) &&
            (identical(other.scheduleMemo, scheduleMemo) ||
                other.scheduleMemo == scheduleMemo) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.editDate, editDate) ||
                other.editDate == editDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, scheduleDate, startTime, endTime,
      eventFlg, scheduleMemo, createDate, editDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TempCalendarItemDataCopyWith<_$_TempCalendarItemData> get copyWith =>
      __$$_TempCalendarItemDataCopyWithImpl<_$_TempCalendarItemData>(
          this, _$identity);
}

abstract class _TempCalendarItemData implements TempCalendarItemData {
  factory _TempCalendarItemData(
      {final DateTime? scheduleDate,
      final DateTime? startTime,
      final DateTime? endTime,
      final String eventFlg,
      final String scheduleMemo,
      final DateTime? createDate,
      final DateTime? editDate}) = _$_TempCalendarItemData;

  @override
  DateTime? get scheduleDate;
  @override
  DateTime? get startTime;
  @override
  DateTime? get endTime;
  @override
  String get eventFlg;
  @override
  String get scheduleMemo;
  @override
  DateTime? get createDate;
  @override
  DateTime? get editDate;
  @override
  @JsonKey(ignore: true)
  _$$_TempCalendarItemDataCopyWith<_$_TempCalendarItemData> get copyWith =>
      throw _privateConstructorUsedError;
}
