// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'opensource.dart';

class OpensourceMapper extends ClassMapperBase<Opensource> {
  OpensourceMapper._();

  static OpensourceMapper? _instance;
  static OpensourceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = OpensourceMapper._());
      ContributionMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Opensource';

  static String _$repo(Opensource v) => v.repo;
  static const Field<Opensource, String> _f$repo = Field('repo', _$repo);
  static String _$description(Opensource v) => v.description;
  static const Field<Opensource, String> _f$description = Field(
    'description',
    _$description,
  );
  static String _$role(Opensource v) => v.role;
  static const Field<Opensource, String> _f$role = Field('role', _$role);
  static List<Contribution>? _$contribution(Opensource v) => v.contribution;
  static const Field<Opensource, List<Contribution>> _f$contribution = Field(
    'contribution',
    _$contribution,
    opt: true,
  );

  @override
  final MappableFields<Opensource> fields = const {
    #repo: _f$repo,
    #description: _f$description,
    #role: _f$role,
    #contribution: _f$contribution,
  };

  static Opensource _instantiate(DecodingData data) {
    return Opensource(
      repo: data.dec(_f$repo),
      description: data.dec(_f$description),
      role: data.dec(_f$role),
      contribution: data.dec(_f$contribution),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Opensource fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Opensource>(map);
  }

  static Opensource fromJson(String json) {
    return ensureInitialized().decodeJson<Opensource>(json);
  }
}

mixin OpensourceMappable {
  String toJson() {
    return OpensourceMapper.ensureInitialized().encodeJson<Opensource>(
      this as Opensource,
    );
  }

  Map<String, dynamic> toMap() {
    return OpensourceMapper.ensureInitialized().encodeMap<Opensource>(
      this as Opensource,
    );
  }

  OpensourceCopyWith<Opensource, Opensource, Opensource> get copyWith =>
      _OpensourceCopyWithImpl<Opensource, Opensource>(
        this as Opensource,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return OpensourceMapper.ensureInitialized().stringifyValue(
      this as Opensource,
    );
  }

  @override
  bool operator ==(Object other) {
    return OpensourceMapper.ensureInitialized().equalsValue(
      this as Opensource,
      other,
    );
  }

  @override
  int get hashCode {
    return OpensourceMapper.ensureInitialized().hashValue(this as Opensource);
  }
}

extension OpensourceValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Opensource, $Out> {
  OpensourceCopyWith<$R, Opensource, $Out> get $asOpensource =>
      $base.as((v, t, t2) => _OpensourceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class OpensourceCopyWith<$R, $In extends Opensource, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<
    $R,
    Contribution,
    ContributionCopyWith<$R, Contribution, Contribution>
  >?
  get contribution;
  $R call({
    String? repo,
    String? description,
    String? role,
    List<Contribution>? contribution,
  });
  OpensourceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _OpensourceCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Opensource, $Out>
    implements OpensourceCopyWith<$R, Opensource, $Out> {
  _OpensourceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Opensource> $mapper =
      OpensourceMapper.ensureInitialized();
  @override
  ListCopyWith<
    $R,
    Contribution,
    ContributionCopyWith<$R, Contribution, Contribution>
  >?
  get contribution => $value.contribution != null
      ? ListCopyWith(
          $value.contribution!,
          (v, t) => v.copyWith.$chain(t),
          (v) => call(contribution: v),
        )
      : null;
  @override
  $R call({
    String? repo,
    String? description,
    String? role,
    Object? contribution = $none,
  }) => $apply(
    FieldCopyWithData({
      if (repo != null) #repo: repo,
      if (description != null) #description: description,
      if (role != null) #role: role,
      if (contribution != $none) #contribution: contribution,
    }),
  );
  @override
  Opensource $make(CopyWithData data) => Opensource(
    repo: data.get(#repo, or: $value.repo),
    description: data.get(#description, or: $value.description),
    role: data.get(#role, or: $value.role),
    contribution: data.get(#contribution, or: $value.contribution),
  );

  @override
  OpensourceCopyWith<$R2, Opensource, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _OpensourceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ContributionMapper extends ClassMapperBase<Contribution> {
  ContributionMapper._();

  static ContributionMapper? _instance;
  static ContributionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ContributionMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Contribution';

  static int _$id(Contribution v) => v.id;
  static const Field<Contribution, int> _f$id = Field('id', _$id);
  static String _$description(Contribution v) => v.description;
  static const Field<Contribution, String> _f$description = Field(
    'description',
    _$description,
  );
  static String? _$title(Contribution v) => v.title;
  static const Field<Contribution, String> _f$title = Field(
    'title',
    _$title,
    opt: true,
  );

  @override
  final MappableFields<Contribution> fields = const {
    #id: _f$id,
    #description: _f$description,
    #title: _f$title,
  };

  static Contribution _instantiate(DecodingData data) {
    return Contribution(
      id: data.dec(_f$id),
      description: data.dec(_f$description),
      title: data.dec(_f$title),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Contribution fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Contribution>(map);
  }

  static Contribution fromJson(String json) {
    return ensureInitialized().decodeJson<Contribution>(json);
  }
}

mixin ContributionMappable {
  String toJson() {
    return ContributionMapper.ensureInitialized().encodeJson<Contribution>(
      this as Contribution,
    );
  }

  Map<String, dynamic> toMap() {
    return ContributionMapper.ensureInitialized().encodeMap<Contribution>(
      this as Contribution,
    );
  }

  ContributionCopyWith<Contribution, Contribution, Contribution> get copyWith =>
      _ContributionCopyWithImpl<Contribution, Contribution>(
        this as Contribution,
        $identity,
        $identity,
      );
  @override
  String toString() {
    return ContributionMapper.ensureInitialized().stringifyValue(
      this as Contribution,
    );
  }

  @override
  bool operator ==(Object other) {
    return ContributionMapper.ensureInitialized().equalsValue(
      this as Contribution,
      other,
    );
  }

  @override
  int get hashCode {
    return ContributionMapper.ensureInitialized().hashValue(
      this as Contribution,
    );
  }
}

extension ContributionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, Contribution, $Out> {
  ContributionCopyWith<$R, Contribution, $Out> get $asContribution =>
      $base.as((v, t, t2) => _ContributionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ContributionCopyWith<$R, $In extends Contribution, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({int? id, String? description, String? title});
  ContributionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ContributionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Contribution, $Out>
    implements ContributionCopyWith<$R, Contribution, $Out> {
  _ContributionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Contribution> $mapper =
      ContributionMapper.ensureInitialized();
  @override
  $R call({int? id, String? description, Object? title = $none}) => $apply(
    FieldCopyWithData({
      if (id != null) #id: id,
      if (description != null) #description: description,
      if (title != $none) #title: title,
    }),
  );
  @override
  Contribution $make(CopyWithData data) => Contribution(
    id: data.get(#id, or: $value.id),
    description: data.get(#description, or: $value.description),
    title: data.get(#title, or: $value.title),
  );

  @override
  ContributionCopyWith<$R2, Contribution, $Out2> $chain<$R2, $Out2>(
    Then<$Out2, $R2> t,
  ) => _ContributionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

