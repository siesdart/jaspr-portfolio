// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'career.dart';

class CareerMapper extends ClassMapperBase<Career> {
  CareerMapper._();

  static CareerMapper? _instance;
  static CareerMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = CareerMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Career';

  static String _$id(Career v) => v.id;
  static const Field<Career, String> _f$id = Field('id', _$id);
  static String _$company(Career v) => v.company;
  static const Field<Career, String> _f$company = Field('company', _$company);
  static String _$role(Career v) => v.role;
  static const Field<Career, String> _f$role = Field('role', _$role);
  static String _$period(Career v) => v.period;
  static const Field<Career, String> _f$period = Field('period', _$period);
  static String _$image(Career v) => v.image;
  static const Field<Career, String> _f$image = Field('image', _$image);
  static List<String> _$tags(Career v) => v.tags;
  static const Field<Career, List<String>> _f$tags = Field('tags', _$tags);
  static String _$content(Career v) => v.content;
  static const Field<Career, String> _f$content = Field('content', _$content);

  @override
  final MappableFields<Career> fields = const {
    #id: _f$id,
    #company: _f$company,
    #role: _f$role,
    #period: _f$period,
    #image: _f$image,
    #tags: _f$tags,
    #content: _f$content,
  };

  static Career _instantiate(DecodingData data) {
    return Career(
      id: data.dec(_f$id),
      company: data.dec(_f$company),
      role: data.dec(_f$role),
      period: data.dec(_f$period),
      image: data.dec(_f$image),
      tags: data.dec(_f$tags),
      content: data.dec(_f$content),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Career fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Career>(map);
  }

  static Career fromJson(String json) {
    return ensureInitialized().decodeJson<Career>(json);
  }
}

mixin CareerMappable {
  String toJson() {
    return CareerMapper.ensureInitialized().encodeJson<Career>(this as Career);
  }

  Map<String, dynamic> toMap() {
    return CareerMapper.ensureInitialized().encodeMap<Career>(this as Career);
  }

  CareerCopyWith<Career, Career, Career> get copyWith =>
      _CareerCopyWithImpl<Career, Career>(this as Career, $identity, $identity);
  @override
  String toString() {
    return CareerMapper.ensureInitialized().stringifyValue(this as Career);
  }

  @override
  bool operator ==(Object other) {
    return CareerMapper.ensureInitialized().equalsValue(this as Career, other);
  }

  @override
  int get hashCode {
    return CareerMapper.ensureInitialized().hashValue(this as Career);
  }
}

extension CareerValueCopy<$R, $Out> on ObjectCopyWith<$R, Career, $Out> {
  CareerCopyWith<$R, Career, $Out> get $asCareer =>
      $base.as((v, t, t2) => _CareerCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class CareerCopyWith<$R, $In extends Career, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call({
    String? id,
    String? company,
    String? role,
    String? period,
    String? image,
    List<String>? tags,
    String? content,
  });
  CareerCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _CareerCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Career, $Out>
    implements CareerCopyWith<$R, Career, $Out> {
  _CareerCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Career> $mapper = CareerMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith(
        $value.tags,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(tags: v),
      );
  @override
  $R call({
    String? id,
    String? company,
    String? role,
    String? period,
    String? image,
    List<String>? tags,
    String? content,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (company != null) #company: company,
      if (role != null) #role: role,
      if (period != null) #period: period,
      if (image != null) #image: image,
      if (tags != null) #tags: tags,
      if (content != null) #content: content,
    }),
  );
  @override
  Career $make(CopyWithData data) => Career(
    id: data.get(#id, or: $value.id),
    company: data.get(#company, or: $value.company),
    role: data.get(#role, or: $value.role),
    period: data.get(#period, or: $value.period),
    image: data.get(#image, or: $value.image),
    tags: data.get(#tags, or: $value.tags),
    content: data.get(#content, or: $value.content),
  );

  @override
  CareerCopyWith<$R2, Career, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _CareerCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

