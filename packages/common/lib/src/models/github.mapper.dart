// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'github.dart';

class GithubMapper extends ClassMapperBase<Github> {
  GithubMapper._();

  static GithubMapper? _instance;
  static GithubMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GithubMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Github';

  static String _$title(Github v) => v.title;
  static const Field<Github, String> _f$title = Field('title', _$title);
  static String _$user(Github v) => v.user;
  static const Field<Github, String> _f$user = Field('user', _$user);

  @override
  final MappableFields<Github> fields = const {
    #title: _f$title,
    #user: _f$user,
  };

  static Github _instantiate(DecodingData data) {
    return Github(title: data.dec(_f$title), user: data.dec(_f$user));
  }

  @override
  final Function instantiate = _instantiate;

  static Github fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Github>(map);
  }

  static Github fromJson(String json) {
    return ensureInitialized().decodeJson<Github>(json);
  }
}

mixin GithubMappable {
  String toJson() {
    return GithubMapper.ensureInitialized().encodeJson<Github>(this as Github);
  }

  Map<String, dynamic> toMap() {
    return GithubMapper.ensureInitialized().encodeMap<Github>(this as Github);
  }

  GithubCopyWith<Github, Github, Github> get copyWith =>
      _GithubCopyWithImpl(this as Github, $identity, $identity);
  @override
  String toString() {
    return GithubMapper.ensureInitialized().stringifyValue(this as Github);
  }

  @override
  bool operator ==(Object other) {
    return GithubMapper.ensureInitialized().equalsValue(this as Github, other);
  }

  @override
  int get hashCode {
    return GithubMapper.ensureInitialized().hashValue(this as Github);
  }
}

extension GithubValueCopy<$R, $Out> on ObjectCopyWith<$R, Github, $Out> {
  GithubCopyWith<$R, Github, $Out> get $asGithub =>
      $base.as((v, t, t2) => _GithubCopyWithImpl(v, t, t2));
}

abstract class GithubCopyWith<$R, $In extends Github, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title, String? user});
  GithubCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GithubCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Github, $Out>
    implements GithubCopyWith<$R, Github, $Out> {
  _GithubCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Github> $mapper = GithubMapper.ensureInitialized();
  @override
  $R call({String? title, String? user}) => $apply(FieldCopyWithData(
      {if (title != null) #title: title, if (user != null) #user: user}));
  @override
  Github $make(CopyWithData data) => Github(
      title: data.get(#title, or: $value.title),
      user: data.get(#user, or: $value.user));

  @override
  GithubCopyWith<$R2, Github, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _GithubCopyWithImpl($value, $cast, t);
}
