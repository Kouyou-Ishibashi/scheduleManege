import 'package:freezed_annotation/freezed_annotation.dart';

import '../service/datebase.dart';

//①生成されるファイル名を指定する（ `生成元ファイル名.freezed.dart` ）
part 'event_state.freezed.dart';

@freezed
abstract class EventState with _$EventState {
  const factory EventState({
    @Default(false) bool isLoading,
    @Default(false) bool isReadyData,
    List<EventData>? events,
  }) = _EventState;
}
