// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';

import 'components/resume.dart' as c0;

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
const defaultJasprOptions = JasprOptions(
  targets: {
    c0.Resume: ClientTarget<c0.Resume>('components/resume', params: _params0Resume),
  },
);

Map<String, dynamic> _params0Resume(c0.Resume c) => {
      'config': c.config.toJson(),
      'introduction': c.introduction,
      'skill': c.skill,
      'projects': c.projects.map((i) => i.toJson()).toList(),
      'disabled': c.disabled
    };
