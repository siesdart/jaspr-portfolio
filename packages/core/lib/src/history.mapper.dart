// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'history.dart';

class HistoryMapper extends ClassMapperBase<History> {
  HistoryMapper._();

  static HistoryMapper? _instance;
  static HistoryMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = HistoryMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'History';

  static String _$period(History v) => v.period;
  static const Field<History, String> _f$period = Field('period', _$period);
  static String _$imageUrl(History v) => v.imageUrl;
  static const Field<History, String> _f$imageUrl = Field(
    'imageUrl',
    _$imageUrl,
  );
  static String _$title(History v) => v.title;
  static const Field<History, String> _f$title = Field('title', _$title);
  static String _$content(History v) => v.content;
  static const Field<History, String> _f$content = Field('content', _$content);

  @override
  final MappableFields<History> fields = const {
    #period: _f$period,
    #imageUrl: _f$imageUrl,
    #title: _f$title,
    #content: _f$content,
  };

  static History _instantiate(DecodingData data) {
    return History(
      period: data.dec(_f$period),
      imageUrl: data.dec(_f$imageUrl),
      title: data.dec(_f$title),
      content: data.dec(_f$content),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static History fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<History>(map);
  }

  static History fromJson(String json) {
    return ensureInitialized().decodeJson<History>(json);
  }
}

mixin HistoryMappable {
  String toJson() {
    return HistoryMapper.ensureInitialized().encodeJson<History>(
      this as History,
    );
  }

  Map<String, dynamic> toMap() {
    return HistoryMapper.ensureInitialized().encodeMap<History>(
      this as History,
    );
  }

  HistoryCopyWith<History, History, History> get copyWith =>
      _HistoryCopyWithImpl<History, History>(
        this as History,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return HistoryMapper.ensureInitialized().stringifyValue(this as History);
  }

  @override
  bool operator ==(Object other) {
    return HistoryMapper.ensureInitialized().equalsValue(
      this as History,
      other,
    );
  }

  @override
  int get hashCode {
    return HistoryMapper.ensureInitialized().hashValue(this as History);
  }
}

extension HistoryValueCopy<$R, $Out> on ObjectCopyWith<$R, History, $Out> {
  HistoryCopyWith<$R, History, $Out> get $asHistory =>
      $base.as((v, t, t2) => _HistoryCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class HistoryCopyWith<$R, $In extends History, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? period, String? imageUrl, String? title, String? content});
  HistoryCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _HistoryCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, History, $Out>
    implements HistoryCopyWith<$R, History, $Out> {
  _HistoryCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<History> $mapper =
      HistoryMapper.ensureInitialized();
  @override
  $R call({String? period, String? imageUrl, String? title, String? content}) =>
      $apply(
        FieldCopyWithData({
          if (period != null) #period: period,
          if (imageUrl != null) #imageUrl: imageUrl,
          if (title != null) #title: title,
          if (content != null) #content: content,
        }),
      );
  @override
  History $make(CopyWithData data) => History(
    period: data.get(#period, or: $value.period),
    imageUrl: data.get(#imageUrl, or: $value.imageUrl),
    title: data.get(#title, or: $value.title),
    content: data.get(#content, or: $value.content),
  );

  @override
  HistoryCopyWith<$R2, History, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _HistoryCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

