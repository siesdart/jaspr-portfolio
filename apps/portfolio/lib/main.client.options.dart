// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:core/src/config.dart' as _config;
import 'package:core/src/experience.dart' as _experience;
import 'package:core/src/opensource.dart' as _opensource;
import 'package:core/src/project.dart' as _project;
import 'package:portfolio/components/resume.dart' deferred as _resume;

/// Default [ClientOptions] for use with your Jaspr project.
///
/// Use this to initialize Jaspr **before** calling [runApp].
///
/// Example:
/// ```dart
/// import 'main.client.options.dart';
///
/// void main() {
///   Jaspr.initializeApp(
///     options: defaultClientOptions,
///   );
///
///   runApp(...);
/// }
/// ```
ClientOptions get defaultClientOptions => ClientOptions(
  clients: {
    'resume': ClientLoader(
      (p) => _resume.Resume(
        config: _config.Config.fromJson(p['config'] as String),
        introduction: p['introduction'] as String?,
        skill: p['skill'] as String?,
        experiences: (p['experiences'] as List<Object?>?)
            ?.map((i) => _experience.Experience.fromJson(i as String))
            .toList(),
        projects: (p['projects'] as List<Object?>?)
            ?.map((i) => _project.Project.fromJson(i as String))
            .toList(),
        opensources: (p['opensources'] as List<Object?>?)
            ?.map((i) => _opensource.Opensource.fromJson(i as String))
            .toList(),
      ),
      loader: _resume.loadLibrary,
    ),
  },
);
