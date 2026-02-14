// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'project.dart';

class ProjectMapper extends ClassMapperBase<Project> {
  ProjectMapper._();

  static ProjectMapper? _instance;
  static ProjectMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ProjectMapper._());
      FileMapper.ensureInitialized();
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
  static const Field<Project, String> _f$introduction = Field(
    'introduction',
    _$introduction,
  );
  static String _$description(Project v) => v.description;
  static const Field<Project, String> _f$description = Field(
    'description',
    _$description,
  );
  static int _$year(Project v) => v.year;
  static const Field<Project, int> _f$year = Field('year', _$year);
  static int _$order(Project v) => v.order;
  static const Field<Project, int> _f$order = Field('order', _$order);
  static String? _$repo(Project v) => v.repo;
  static const Field<Project, String> _f$repo = Field('repo', _$repo);
  static String _$color(Project v) => v.color;
  static const Field<Project, String> _f$color = Field('color', _$color);
  static String? _$image(Project v) => v.image;
  static const Field<Project, String> _f$image = Field('image', _$image);
  static List<String> _$tags(Project v) => v.tags;
  static const Field<Project, List<String>> _f$tags = Field('tags', _$tags);
  static List<File>? _$files(Project v) => v.files;
  static const Field<Project, List<File>> _f$files = Field('files', _$files);

  @override
  final MappableFields<Project> fields = const {
    #id: _f$id,
    #title: _f$title,
    #introduction: _f$introduction,
    #description: _f$description,
    #year: _f$year,
    #order: _f$order,
    #repo: _f$repo,
    #color: _f$color,
    #image: _f$image,
    #tags: _f$tags,
    #files: _f$files,
  };

  static Project _instantiate(DecodingData data) {
    return Project(
      id: data.dec(_f$id),
      title: data.dec(_f$title),
      introduction: data.dec(_f$introduction),
      description: data.dec(_f$description),
      year: data.dec(_f$year),
      order: data.dec(_f$order),
      repo: data.dec(_f$repo),
      color: data.dec(_f$color),
      image: data.dec(_f$image),
      tags: data.dec(_f$tags),
      files: data.dec(_f$files),
    );
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
    return ProjectMapper.ensureInitialized().encodeJson<Project>(
      this as Project,
    );
  }

  Map<String, dynamic> toMap() {
    return ProjectMapper.ensureInitialized().encodeMap<Project>(
      this as Project,
    );
  }

  ProjectCopyWith<Project, Project, Project> get copyWith =>
      _ProjectCopyWithImpl<Project, Project>(
        this as Project,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ProjectMapper.ensureInitialized().stringifyValue(this as Project);
  }

  @override
  bool operator ==(Object other) {
    return ProjectMapper.ensureInitialized().equalsValue(
      this as Project,
      other,
    );
  }

  @override
  int get hashCode {
    return ProjectMapper.ensureInitialized().hashValue(this as Project);
  }
}

extension ProjectValueCopy<$R, $Out> on ObjectCopyWith<$R, Project, $Out> {
  ProjectCopyWith<$R, Project, $Out> get $asProject =>
      $base.as((v, t, t2) => _ProjectCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ProjectCopyWith<$R, $In extends Project, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get tags;
  ListCopyWith<$R, File, FileCopyWith<$R, File, File>>? get files;
  $R call({
    String? id,
    String? title,
    String? introduction,
    String? description,
    int? year,
    int? order,
    String? repo,
    String? color,
    String? image,
    List<String>? tags,
    List<File>? files,
  });
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
      ListCopyWith(
        $value.tags,
        (v, t) => ObjectCopyWith(v, $identity, t),
        (v) => call(tags: v),
      );
  @override
  ListCopyWith<$R, File, FileCopyWith<$R, File, File>>? get files =>
      $value.files != null
      ? ListCopyWith(
          $value.files!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(files: v),
        )
      : null;
  @override
  $R call({
    String? id,
    String? title,
    String? introduction,
    String? description,
    int? year,
    int? order,
    Object? repo = $none,
    String? color,
    Object? image = $none,
    List<String>? tags,
    Object? files = $none,
  }) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (title != null) #title: title,
      if (introduction != null) #introduction: introduction,
      if (description != null) #description: description,
      if (year != null) #year: year,
      if (order != null) #order: order,
      if (repo != $none) #repo: repo,
      if (color != null) #color: color,
      if (image != $none) #image: image,
      if (tags != null) #tags: tags,
      if (files != $none) #files: files,
    }),
  );
  @override
  Project $make(CopyWithData data) => Project(
    id: data.get(#id, or: $value.id),
    title: data.get(#title, or: $value.title),
    introduction: data.get(#introduction, or: $value.introduction),
    description: data.get(#description, or: $value.description),
    year: data.get(#year, or: $value.year),
    order: data.get(#order, or: $value.order),
    repo: data.get(#repo, or: $value.repo),
    color: data.get(#color, or: $value.color),
    image: data.get(#image, or: $value.image),
    tags: data.get(#tags, or: $value.tags),
    files: data.get(#files, or: $value.files),
  );

  @override
  ProjectCopyWith<$R2, Project, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProjectCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

