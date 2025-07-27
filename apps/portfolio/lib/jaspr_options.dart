// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';
import 'package:portfolio/components/resume.dart' as prefix0;

/// Default [JasprOptions] for use with your jaspr project.
///
/// Use this to initialize jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'jaspr_options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultJasprOptions,
///   );
///
///   runApp(...);
/// }
/// ```
JasprOptions get defaultJasprOptions => JasprOptions(
  clients: {
    prefix0.Resume: ClientTarget<prefix0.Resume>(
      'components/resume',
      params: _prefix0Resume,
    ),
  },
);

Map<String, dynamic> _prefix0Resume(prefix0.Resume c) => {
  'config': c.config.toJson(),
  'introduction': c.introduction,
  'skill': c.skill,
  'projects': c.projects.map((i) => i.toJson()).toList(),
  'disabled': c.disabled,
};
