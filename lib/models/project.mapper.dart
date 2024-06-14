// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project.dart';

class ProjectMapper extends ClassMapperBase<Project> {
  ProjectMapper._();

  static ProjectMapper? _instance;
  static ProjectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Project';

  static String _$id(Project v) => v.id;
  static const Field<Project, String> _f$id = Field('id', _$id);
  static String _$title(Project v) => v.title;
  static const Field<Project, String> _f$title = Field('title', _$title);
  static String _$introduction(Project v) => v.introduction;
  static const Field<Project, String> _f$introduction =
      Field('introduction', _$introduction);
  static int _$year(Project v) => v.year;
  static const Field<Project, int> _f$year = Field('year', _$year);
  static String? _$repo(Project v) => v.repo;
  static const Field<Project, String> _f$repo = Field('repo', _$repo);
  static String _$color(Project v) => v.color;
  static const Field<Project, String> _f$color = Field('color', _$color);
  static String? _$image(Project v) => v.image;
  static const Field<Project, String> _f$image = Field('image', _$image);
  static List<String> _$tags(Project v) => v.tags;
  static const Field<Project, List<String>> _f$tags = Field('tags', _$tags);

  @override
  final MappableFields<Project> fields = const {
    #id: _f$id,
    #title: _f$title,
    #introduction: _f$introduction,
    #year: _f$year,
    #repo: _f$repo,
    #color: _f$color,
    #image: _f$image,
    #tags: _f$tags,
  };

  static Project _instantiate(DecodingData data) {
    return Project(
        id: data.dec(_f$id),
        title: data.dec(_f$title),
        introduction: data.dec(_f$introduction),
        year: data.dec(_f$year),
        repo: data.dec(_f$repo),
        color: data.dec(_f$color),
        image: data.dec(_f$image),
        tags: data.dec(_f$tags));
  }

  @override
  final Function instantiate = _instantiate;

  static Project fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Project>(map);
  }

  static Project fromJson(String json) {
    return ensureInitialized().decodeJson<Project>(json);
  }
}

mixin ProjectMappable {
  String toJson() {
    return ProjectMapper.ensureInitialized()
        .encodeJson<Project>(this as Project);
  }

  Map<String, dynamic> toMap() {
    return ProjectMapper.ensureInitialized()
        .encodeMap<Project>(this as Project);
  }

  ProjectCopyWith<Project, Project, Project> get copyWith =>
      _ProjectCopyWithImpl(this as Project, $identity, $identity);
  @override
  String toString() {
    return ProjectMapper.ensureInitialized().stringifyValue(this as Project);
  }

  @override
  bool operator ==(Object other) {
    return ProjectMapper.ensureInitialized()
        .equalsValue(this as Project, other);
  }

  @override
  int get hashCode {
    return ProjectMapper.ensureInitialized().hashValue(this as Project);
  }
}

extension ProjectValueCopy<$R, $Out> on ObjectCopyWith<$R, Project, $Out> {
  ProjectCopyWith<$R, Project, $Out> get $asProject =>
      $base.as((v, t, t2) => _ProjectCopyWithImpl(v, t, t2));
}

abstract class ProjectCopyWith<$R, $In extends Project, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  $R call(
      {String? id,
      String? title,
      String? introduction,
      int? year,
      String? repo,
      String? color,
      String? image,
      List<String>? tags});
  ProjectCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ProjectCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Project, $Out>
    implements ProjectCopyWith<$R, Project, $Out> {
  _ProjectCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Project> $mapper =
      ProjectMapper.ensureInitialized();
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags =>
      ListCopyWith($value.tags, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tags: v));
  @override
  $R call(
          {String? id,
          String? title,
          String? introduction,
          int? year,
          Object? repo = $none,
          String? color,
          Object? image = $none,
          List<String>? tags}) =>
      $apply(FieldCopyWithData({
        if (id != null) #id: id,
        if (title != null) #title: title,
        if (introduction != null) #introduction: introduction,
        if (year != null) #year: year,
        if (repo != $none) #repo: repo,
        if (color != null) #color: color,
        if (image != $none) #image: image,
        if (tags != null) #tags: tags
      }));
  @override
  Project $make(CopyWithData data) => Project(
      id: data.get(#id, or: $value.id),
      title: data.get(#title, or: $value.title),
      introduction: data.get(#introduction, or: $value.introduction),
      year: data.get(#year, or: $value.year),
      repo: data.get(#repo, or: $value.repo),
      color: data.get(#color, or: $value.color),
      image: data.get(#image, or: $value.image),
      tags: data.get(#tags, or: $value.tags));

  @override
  ProjectCopyWith<$R2, Project, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProjectCopyWithImpl($value, $cast, t);
}
