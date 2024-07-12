// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';

import 'pages/home.dart' as c0;
import 'pages/project_detail.dart' as c1;
import 'pages/project_list.dart' as c2;

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
    c0.HomePage: ClientTarget<c0.HomePage>('pages/home'),
    c1.ProjectDetailPage: ClientTarget<c1.ProjectDetailPage>('pages/project_detail', params: _params1ProjectDetailPage),
    c2.ProjectListPage: ClientTarget<c2.ProjectListPage>('pages/project_list'),
  },
);

Map<String, dynamic> _params1ProjectDetailPage(c1.ProjectDetailPage c) => {'project': c.project};
