// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: invalid_use_of_protected_member
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'site.dart';

class SiteMapper extends ClassMapperBase<Site> {
  SiteMapper._();

  static SiteMapper? _instance;
  static SiteMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SiteMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Site';

  static String _$title(Site v) => v.title;
  static const Field<Site, String> _f$title = Field('title', _$title);
  static String _$url(Site v) => v.url;
  static const Field<Site, String> _f$url = Field('url', _$url);
  static String? _$icon(Site v) => v.icon;
  static const Field<Site, String> _f$icon = Field('icon', _$icon, opt: true);

  @override
  final MappableFields<Site> fields = const {
    #title: _f$title,
    #url: _f$url,
    #icon: _f$icon,
  };

  static Site _instantiate(DecodingData data) {
    return Site(
      title: data.dec(_f$title),
      url: data.dec(_f$url),
      icon: data.dec(_f$icon),
    );
  }

  @override
  final Function instantiate = _instantiate;

  static Site fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Site>(map);
  }

  static Site fromJson(String json) {
    return ensureInitialized().decodeJson<Site>(json);
  }
}

mixin SiteMappable {
  String toJson() {
    return SiteMapper.ensureInitialized().encodeJson<Site>(this as Site);
  }

  Map<String, dynamic> toMap() {
    return SiteMapper.ensureInitialized().encodeMap<Site>(this as Site);
  }

  SiteCopyWith<Site, Site, Site> get copyWith =>
      _SiteCopyWithImpl<Site, Site>(this as Site, $identity, $identity);
  @override
  String toString() {
    return SiteMapper.ensureInitialized().stringifyValue(this as Site);
  }

  @override
  bool operator ==(Object other) {
    return SiteMapper.ensureInitialized().equalsValue(this as Site, other);
  }

  @override
  int get hashCode {
    return SiteMapper.ensureInitialized().hashValue(this as Site);
  }
}

extension SiteValueCopy<$R, $Out> on ObjectCopyWith<$R, Site, $Out> {
  SiteCopyWith<$R, Site, $Out> get $asSite =>
      $base.as((v, t, t2) => _SiteCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SiteCopyWith<$R, $In extends Site, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? title, String? url, String? icon});
  SiteCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _SiteCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Site, $Out>
    implements SiteCopyWith<$R, Site, $Out> {
  _SiteCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Site> $mapper = SiteMapper.ensureInitialized();
  @override
  $R call({String? title, String? url, Object? icon = $none}) => $apply(
    FieldCopyWithData({
      if (title != null) #title: title,
      if (url != null) #url: url,
      if (icon != $none) #icon: icon,
    }),
  );
  @override
  Site $make(CopyWithData data) => Site(
    title: data.get(#title, or: $value.title),
    url: data.get(#url, or: $value.url),
    icon: data.get(#icon, or: $value.icon),
  );

  @override
  SiteCopyWith<$R2, Site, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _SiteCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

