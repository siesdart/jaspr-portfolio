// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/server.dart';
import 'package:portfolio/components/resume.dart' as _resume;

/// Default [ServerOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.server.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultServerOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ServerOptions get defaultServerOptions => ServerOptions(
  clientId: 'main.client.dart.js',
  clients: {
    _resume.Resume: ClientTarget<_resume.Resume>(
      'resume',
      params: __resumeResume,
    ),
  },
);

Map<String, Object?> __resumeResume(_resume.Resume c) => {
  'config': c.config.toJson(),
  'introduction': c.introduction,
  'skill': c.skill,
  'experiences': c.experiences?.map((i) => i.toJson()).toList(),
  'projects': c.projects?.map((i) => i.toJson()).toList(),
  'opensources': c.opensources?.map((i) => i.toJson()).toList(),
};
