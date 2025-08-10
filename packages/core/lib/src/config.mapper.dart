// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'config.dart';

class ConfigMapper extends ClassMapperBase<Config> {
  ConfigMapper._();

  static ConfigMapper? _instance;
  static ConfigMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConfigMapper._());
      GithubMapper.ensureInitialized();
      OpensourceMapper.ensureInitialized();
      HistoryMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Config';

  static String _$title(Config v) => v.title;
  static const Field<Config, String> _f$title = Field('title', _$title);
  static String _$description(Config v) => v.description;
  static const Field<Config, String> _f$description = Field(
    'description',
    _$description,
  );
  static String _$url(Config v) => v.url;
  static const Field<Config, String> _f$url = Field('url', _$url);
  static String _$locale(Config v) => v.locale;
  static const Field<Config, String> _f$locale = Field('locale', _$locale);
  static String _$name(Config v) => v.name;
  static const Field<Config, String> _f$name = Field('name', _$name);
  static List<Github> _$github(Config v) => v.github;
  static const Field<Config, List<Github>> _f$github = Field(
    'github',
    _$github,
  );
  static String _$birth(Config v) => v.birth;
  static const Field<Config, String> _f$birth = Field('birth', _$birth);
  static String _$location(Config v) => v.location;
  static const Field<Config, String> _f$location = Field(
    'location',
    _$location,
  );
  static String _$mail(Config v) => v.mail;
  static const Field<Config, String> _f$mail = Field('mail', _$mail);
  static List<Opensource> _$opensource(Config v) => v.opensource;
  static const Field<Config, List<Opensource>> _f$opensource = Field(
    'opensource',
    _$opensource,
  );
  static List<History> _$education(Config v) => v.education;
  static const Field<Config, List<History>> _f$education = Field(
    'education',
    _$education,
  );
  static List<History> _$award(Config v) => v.award;
  static const Field<Config, List<History>> _f$award = Field('award', _$award);
  static List<History> _$etc(Config v) => v.etc;
  static const Field<Config, List<History>> _f$etc = Field('etc', _$etc);

  @override
  final MappableFields<Config> fields = const {
    #title: _f$title,
    #description: _f$description,
    #url: _f$url,
    #locale: _f$locale,
    #name: _f$name,
    #github: _f$github,
    #birth: _f$birth,
    #location: _f$location,
    #mail: _f$mail,
    #opensource: _f$opensource,
    #education: _f$education,
    #award: _f$award,
    #etc: _f$etc,
  };

  static Config _instantiate(DecodingData data) {
    return Config(
      title: data.dec(_f$title),
      description: data.dec(_f$description),
      url: data.dec(_f$url),
      locale: data.dec(_f$locale),
      name: data.dec(_f$name),
      github: data.dec(_f$github),
      birth: data.dec(_f$birth),
      location: data.dec(_f$location),
      mail: data.dec(_f$mail),
      opensource: data.dec(_f$opensource),
      education: data.dec(_f$education),
      award: data.dec(_f$award),
      etc: data.dec(_f$etc),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Config fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Config>(map);
  }

  static Config fromJson(String json) {
    return ensureInitialized().decodeJson<Config>(json);
  }
}

mixin ConfigMappable {
  String toJson() {
    return ConfigMapper.ensureInitialized().encodeJson<Config>(this as Config);
  }

  Map<String, dynamic> toMap() {
    return ConfigMapper.ensureInitialized().encodeMap<Config>(this as Config);
  }

  ConfigCopyWith<Config, Config, Config> get copyWith =>
      _ConfigCopyWithImpl<Config, Config>(this as Config, $identity, $identity);
  @override
  String toString() {
    return ConfigMapper.ensureInitialized().stringifyValue(this as Config);
  }

  @override
  bool operator ==(Object other) {
    return ConfigMapper.ensureInitialized().equalsValue(this as Config, other);
  }

  @override
  int get hashCode {
    return ConfigMapper.ensureInitialized().hashValue(this as Config);
  }
}

extension ConfigValueCopy<$R, $Out> on ObjectCopyWith<$R, Config, $Out> {
  ConfigCopyWith<$R, Config, $Out> get $asConfig =>
      $base.as((v, t, t2) => _ConfigCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ConfigCopyWith<$R, $In extends Config, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Github, GithubCopyWith<$R, Github, Github>> get github;
  ListCopyWith<$R, Opensource, OpensourceCopyWith<$R, Opensource, Opensource>>
  get opensource;
  ListCopyWith<$R, History, HistoryCopyWith<$R, History, History>>
  get education;
  ListCopyWith<$R, History, HistoryCopyWith<$R, History, History>> get award;
  ListCopyWith<$R, History, HistoryCopyWith<$R, History, History>> get etc;
  $R call({
    String? title,
    String? description,
    String? url,
    String? locale,
    String? name,
    List<Github>? github,
    String? birth,
    String? location,
    String? mail,
    List<Opensource>? opensource,
    List<History>? education,
    List<History>? award,
    List<History>? etc,
  });
  ConfigCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ConfigCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Config, $Out>
    implements ConfigCopyWith<$R, Config, $Out> {
  _ConfigCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Config> $mapper = ConfigMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Github, GithubCopyWith<$R, Github, Github>> get github =>
      ListCopyWith(
        $value.github,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(github: v),
      );
  @override
  ListCopyWith<$R, Opensource, OpensourceCopyWith<$R, Opensource, Opensource>>
  get opensource => ListCopyWith(
    $value.opensource,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(opensource: v),
  );
  @override
  ListCopyWith<$R, History, HistoryCopyWith<$R, History, History>>
  get education => ListCopyWith(
    $value.education,
    (v, t) => v.copyWith.$chain(t),
    (v) => call(education: v),
  );
  @override
  ListCopyWith<$R, History, HistoryCopyWith<$R, History, History>> get award =>
      ListCopyWith(
        $value.award,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(award: v),
      );
  @override
  ListCopyWith<$R, History, HistoryCopyWith<$R, History, History>> get etc =>
      ListCopyWith(
        $value.etc,
        (v, t) => v.copyWith.$chain(t),
        (v) => call(etc: v),
      );
  @override
  $R call({
    String? title,
    String? description,
    String? url,
    String? locale,
    String? name,
    List<Github>? github,
    String? birth,
    String? location,
    String? mail,
    List<Opensource>? opensource,
    List<History>? education,
    List<History>? award,
    List<History>? etc,
  }) => $apply(
    FieldCopyWithData({
      if (title != null) #title: title,
      if (description != null) #description: description,
      if (url != null) #url: url,
      if (locale != null) #locale: locale,
      if (name != null) #name: name,
      if (github != null) #github: github,
      if (birth != null) #birth: birth,
      if (location != null) #location: location,
      if (mail != null) #mail: mail,
      if (opensource != null) #opensource: opensource,
      if (education != null) #education: education,
      if (award != null) #award: award,
      if (etc != null) #etc: etc,
    }),
  );
  @override
  Config $make(CopyWithData data) => Config(
    title: data.get(#title, or: $value.title),
    description: data.get(#description, or: $value.description),
    url: data.get(#url, or: $value.url),
    locale: data.get(#locale, or: $value.locale),
    name: data.get(#name, or: $value.name),
    github: data.get(#github, or: $value.github),
    birth: data.get(#birth, or: $value.birth),
    location: data.get(#location, or: $value.location),
    mail: data.get(#mail, or: $value.mail),
    opensource: data.get(#opensource, or: $value.opensource),
    education: data.get(#education, or: $value.education),
    award: data.get(#award, or: $value.award),
    etc: data.get(#etc, or: $value.etc),
  );

  @override
  ConfigCopyWith<$R2, Config, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ConfigCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

