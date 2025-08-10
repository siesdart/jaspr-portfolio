// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'experience.dart';

class ExperienceMapper extends ClassMapperBase<Experience> {
  ExperienceMapper._();

  static ExperienceMapper? _instance;
  static ExperienceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ExperienceMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Experience';

  static String _$id(Experience v) => v.id;
  static const Field<Experience, String> _f$id = Field('id', _$id);
  static String _$company(Experience v) => v.company;
  static const Field<Experience, String> _f$company = Field(
    'company',
    _$company,
  );
  static String _$role(Experience v) => v.role;
  static const Field<Experience, String> _f$role = Field('role', _$role);
  static String _$period(Experience v) => v.period;
  static const Field<Experience, String> _f$period = Field('period', _$period);
  static String _$description(Experience v) => v.description;
  static const Field<Experience, String> _f$description = Field(
    'description',
    _$description,
  );
  static String _$image(Experience v) => v.image;
  static const Field<Experience, String> _f$image = Field('image', _$image);
  static List<String> _$tags(Experience v) => v.tags;
  static const Field<Experience, List<String>> _f$tags = Field('tags', _$tags);

  @override
  final MappableFields<Experience> fields = const {
    #id: _f$id,
    #company: _f$company,
    #role: _f$role,
    #period: _f$period,
    #description: _f$description,
    #image: _f$image,
    #tags: _f$tags,
  };

  static Experience _instantiate(DecodingData data) {
    return Experience(
      id: data.dec(_f$id),
      company: data.dec(_f$company),
      role: data.dec(_f$role),
      period: data.dec(_f$period),
      description: data.dec(_f$description),
      image: data.dec(_f$image),
      tags: data.dec(_f$tags),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Experience fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Experience>(map);
  }

  static Experience fromJson(String json) {
    return ensureInitialized().decodeJson<Experience>(json);
  }
}

mixin ExperienceMappable {
  String toJson() {
    return ExperienceMapper.ensureInitialized().encodeJson<Experience>(
      this as Experience,
    );
  }

  Map<String, dynamic> toMap() {
    return ExperienceMapper.ensureInitialized().encodeMap<Experience>(
      this as Experience,
    );
  }

  ExperienceCopyWith<Experience, Experience, Experience> get copyWith =>
      _ExperienceCopyWithImpl<Experience, Experience>(
        this as Experience,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ExperienceMapper.ensureInitialized().stringifyValue(
      this as Experience,
    );
  }

  @override
  bool operator ==(Object other) {
    return ExperienceMapper.ensureInitialized().equalsValue(
      this as Experience,
      other,
    );
  }

  @override
  int get hashCode {
    return ExperienceMapper.ensureInitialized().hashValue(this as Experience);
  }
}

extension ExperienceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Experience, $Out> {
  ExperienceCopyWith<$R, Experience, $Out> get $asExperience =>
      $base.as((v, t, t2) => _ExperienceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ExperienceCopyWith<$R, $In extends Experience, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call({
    String? id,
    String? company,
    String? role,
    String? period,
    String? description,
    String? image,
    List<String>? tags,
  });
  ExperienceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ExperienceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Experience, $Out>
    implements ExperienceCopyWith<$R, Experience, $Out> {
  _ExperienceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Experience> $mapper =
      ExperienceMapper.ensureInitialized();
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
    String? description,
    String? image,
    List<String>? tags,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (company != null) #company: company,
      if (role != null) #role: role,
      if (period != null) #period: period,
      if (description != null) #description: description,
      if (image != null) #image: image,
      if (tags != null) #tags: tags,
    }),
  );
  @override
  Experience $make(CopyWithData data) => Experience(
    id: data.get(#id, or: $value.id),
    company: data.get(#company, or: $value.company),
    role: data.get(#role, or: $value.role),
    period: data.get(#period, or: $value.period),
    description: data.get(#description, or: $value.description),
    image: data.get(#image, or: $value.image),
    tags: data.get(#tags, or: $value.tags),
  );

  @override
  ExperienceCopyWith<$R2, Experience, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ExperienceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

