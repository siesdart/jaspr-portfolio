// dart format off
// ignore_for_file: type=lint

// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/client.dart';

import 'package:core/src/config.dart' as _config;
import 'package:core/src/content.dart' as _content;
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
        content: _content.Content.fromJson(p['content'] as String),
      ),
      loader: _resume.loadLibrary,
    ),
  },
);
