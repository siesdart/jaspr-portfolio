// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'content.dart';

class ContentMapper extends ClassMapperBase<Content> {
  ContentMapper._();

  static ContentMapper? _instance;
  static ContentMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContentMapper._());
      CareerMapper.ensureInitialized();
      ProjectMapper.ensureInitialized();
      OpensourceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Content';

  static String _$introduction(Content v) => v.introduction;
  static const Field<Content, String> _f$introduction = Field(
    'introduction',
    _$introduction,
  );
  static String _$skill(Content v) => v.skill;
  static const Field<Content, String> _f$skill = Field('skill', _$skill);
  static List<Career> _$careers(Content v) => v.careers;
  static const Field<Content, List<Career>> _f$careers = Field(
    'careers',
    _$careers,
  );
  static List<Project> _$projects(Content v) => v.projects;
  static const Field<Content, List<Project>> _f$projects = Field(
    'projects',
    _$projects,
  );
  static List<Opensource> _$opensources(Content v) => v.opensources;
  static const Field<Content, List<Opensource>> _f$opensources = Field(
    'opensources',
    _$opensources,
  );

  @override
  final MappableFields<Content> fields = const {
    #introduction: _f$introduction,
    #skill: _f$skill,
    #careers: _f$careers,
    #projects: _f$projects,
    #opensources: _f$opensources,
  };

  static Content _instantiate(DecodingData data) {
    return Content(
      introduction: data.dec(_f$introduction),
      skill: data.dec(_f$skill),
      careers: data.dec(_f$careers),
      projects: data.dec(_f$projects),
      opensources: data.dec(_f$opensources),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Content fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Content>(map);
  }

  static Content fromJson(String json) {
    return ensureInitialized().decodeJson<Content>(json);
  }
}

mixin ContentMappable {
  String toJson() {
    return ContentMapper.ensureInitialized().encodeJson<Content>(
      this as Content,
    );
  }

  Map<String, dynamic> toMap() {
    return ContentMapper.ensureInitialized().encodeMap<Content>(
      this as Content,
    );
  }

  ContentCopyWith<Content, Content, Content> get copyWith =>
      _ContentCopyWithImpl<Content, Content>(
        this as Content,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ContentMapper.ensureInitialized().stringifyValue(this as Content);
  }

  @override
  bool operator ==(Object other) {
    return ContentMapper.ensureInitialized().equalsValue(
      this as Content,
      other,
    );
  }

  @override
  int get hashCode {
    return ContentMapper.ensureInitialized().hashValue(this as Content);
  }
}

extension ContentValueCopy<$R, $Out> on ObjectCopyWith<$R, Content, $Out> {
  ContentCopyWith<$R, Content, $Out> get $asContent =>
      $base.as((v, t, t2) => _ContentCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ContentCopyWith<$R, $In extends Content, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Career, CareerCopyWith<$R, Career, Career>> get careers;
  ListCopyWith<$R, Project, ProjectCopyWith<$R, Project, Project>> get projects;
  ListCopyWith<$R, Opensource, OpensourceCopyWith<$R, Opensource, Opensource>>
  get opensources;
  $R call({
    String? introduction,
    String? skill,
    List<Career>? careers,
    List<Project>? projects,
    List<Opensource>? opensources,
  });
  ContentCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContentCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Content, $Out>
    implements ContentCopyWith<$R, Content, $Out> {
  _ContentCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Content> $mapper =
      ContentMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Career, CareerCopyWith<$R, Career, Career>> get careers =>
      ListCopyWith(
        $value.careers,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(careers: v),
      );
  @override
  ListCopyWith<$R, Project, ProjectCopyWith<$R, Project, Project>>
  get projects => ListCopyWith(
    $value.projects,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(projects: v),
  );
  @override
  ListCopyWith<$R, Opensource, OpensourceCopyWith<$R, Opensource, Opensource>>
  get opensources => ListCopyWith(
    $value.opensources,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(opensources: v),
  );
  @override
  $R call({
    String? introduction,
    String? skill,
    List<Career>? careers,
    List<Project>? projects,
    List<Opensource>? opensources,
  }) => $apply(
    FieldCopyWithData({
      if (introduction != null) #introduction: introduction,
      if (skill != null) #skill: skill,
      if (careers != null) #careers: careers,
      if (projects != null) #projects: projects,
      if (opensources != null) #opensources: opensources,
    }),
  );
  @override
  Content $make(CopyWithData data) => Content(
    introduction: data.get(#introduction, or: $value.introduction),
    skill: data.get(#skill, or: $value.skill),
    careers: data.get(#careers, or: $value.careers),
    projects: data.get(#projects, or: $value.projects),
    opensources: data.get(#opensources, or: $value.opensources),
  );

  @override
  ContentCopyWith<$R2, Content, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ContentCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

