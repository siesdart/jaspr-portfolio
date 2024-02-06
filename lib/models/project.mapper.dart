// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast
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

  static String _$url(Project v) => v.url;
  static const Field<Project, String> _f$url =
      Field('url', _$url, key: 'html_url');
  static String _$fullName(Project v) => v.fullName;
  static const Field<Project, String> _f$fullName =
      Field('fullName', _$fullName, key: 'full_name');
  static String? _$description(Project v) => v.description;
  static const Field<Project, String> _f$description =
      Field('description', _$description);
  static int _$stargazersCount(Project v) => v.stargazersCount;
  static const Field<Project, int> _f$stargazersCount =
      Field('stargazersCount', _$stargazersCount, key: 'stargazers_count');
  static int _$forks(Project v) => v.forks;
  static const Field<Project, int> _f$forks = Field('forks', _$forks);
  static DateTime _$pushedAt(Project v) => v.pushedAt;
  static const Field<Project, DateTime> _f$pushedAt =
      Field('pushedAt', _$pushedAt, key: 'pushed_at');

  @override
  final MappableFields<Project> fields = const {
    #url: _f$url,
    #fullName: _f$fullName,
    #description: _f$description,
    #stargazersCount: _f$stargazersCount,
    #forks: _f$forks,
    #pushedAt: _f$pushedAt,
  };

  static Project _instantiate(DecodingData data) {
    return Project(
        url: data.dec(_f$url),
        fullName: data.dec(_f$fullName),
        description: data.dec(_f$description),
        stargazersCount: data.dec(_f$stargazersCount),
        forks: data.dec(_f$forks),
        pushedAt: data.dec(_f$pushedAt));
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
    return identical(this, other) ||
        (runtimeType == other.runtimeType &&
            ProjectMapper.ensureInitialized()
                .isValueEqual(this as Project, other));
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
  $R call(
      {String? url,
      String? fullName,
      String? description,
      int? stargazersCount,
      int? forks,
      DateTime? pushedAt});
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
  $R call(
          {String? url,
          String? fullName,
          Object? description = $none,
          int? stargazersCount,
          int? forks,
          DateTime? pushedAt}) =>
      $apply(FieldCopyWithData({
        if (url != null) #url: url,
        if (fullName != null) #fullName: fullName,
        if (description != $none) #description: description,
        if (stargazersCount != null) #stargazersCount: stargazersCount,
        if (forks != null) #forks: forks,
        if (pushedAt != null) #pushedAt: pushedAt
      }));
  @override
  Project $make(CopyWithData data) => Project(
      url: data.get(#url, or: $value.url),
      fullName: data.get(#fullName, or: $value.fullName),
      description: data.get(#description, or: $value.description),
      stargazersCount: data.get(#stargazersCount, or: $value.stargazersCount),
      forks: data.get(#forks, or: $value.forks),
      pushedAt: data.get(#pushedAt, or: $value.pushedAt));

  @override
  ProjectCopyWith<$R2, Project, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ProjectCopyWithImpl($value, $cast, t);
}
