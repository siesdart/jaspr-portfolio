// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format off
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'file.dart';

class FileMapper extends ClassMapperBase<File> {
  FileMapper._();

  static FileMapper? _instance;
  static FileMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = FileMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'File';

  static String _$name(File v) => v.name;
  static const Field<File, String> _f$name = Field('name', _$name);
  static String _$src(File v) => v.src;
  static const Field<File, String> _f$src = Field('src', _$src);

  @override
  final MappableFields<File> fields = const {#name: _f$name, #src: _f$src};

  static File _instantiate(DecodingData data) {
    return File(name: data.dec(_f$name), src: data.dec(_f$src));
  }

  @override
  final Function instantiate = _instantiate;

  static File fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<File>(map);
  }

  static File fromJson(String json) {
    return ensureInitialized().decodeJson<File>(json);
  }
}

mixin FileMappable {
  String toJson() {
    return FileMapper.ensureInitialized().encodeJson<File>(this as File);
  }

  Map<String, dynamic> toMap() {
    return FileMapper.ensureInitialized().encodeMap<File>(this as File);
  }

  FileCopyWith<File, File, File> get copyWith =>
      _FileCopyWithImpl<File, File>(this as File, $identity, $identity);
  @override
  String toString() {
    return FileMapper.ensureInitialized().stringifyValue(this as File);
  }

  @override
  bool operator ==(Object other) {
    return FileMapper.ensureInitialized().equalsValue(this as File, other);
  }

  @override
  int get hashCode {
    return FileMapper.ensureInitialized().hashValue(this as File);
  }
}

extension FileValueCopy<$R, $Out> on ObjectCopyWith<$R, File, $Out> {
  FileCopyWith<$R, File, $Out> get $asFile =>
      $base.as((v, t, t2) => _FileCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class FileCopyWith<$R, $In extends File, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? name, String? src});
  FileCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _FileCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, File, $Out>
    implements FileCopyWith<$R, File, $Out> {
  _FileCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<File> $mapper = FileMapper.ensureInitialized();
  @override
  $R call({String? name, String? src}) => $apply(
    FieldCopyWithData({
      if (name != null) #name: name,
      if (src != null) #src: src,
    }),
  );
  @override
  File $make(CopyWithData data) => File(
    name: data.get(#name, or: $value.name),
    src: data.get(#src, or: $value.src),
  );

  @override
  FileCopyWith<$R2, File, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _FileCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

