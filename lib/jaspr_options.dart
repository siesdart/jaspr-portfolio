// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';

import 'components/elements/resume_button.dart' as c0;

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
    c0.ResumeButton: ClientTarget<c0.ResumeButton>('components/elements/resume_button', params: _params0ResumeButton),
  },
);

Map<String, dynamic> _params0ResumeButton(c0.ResumeButton c) => {
      'config': c.config.toJson(),
      'introduction': c.introduction,
      'skill': c.skill,
      'projects': c.projects.map((i) => i.toJson()).toList(),
      'disabled': c.disabled
    };
