// GENERATED FILE, DO NOT MODIFY
// Generated with jaspr_builder

import 'package:jaspr/jaspr.dart';

import 'pages/home.dart' as c0;
import 'pages/project_list.dart' as c1;
import 'pages/project_detail.dart' as c2;

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
    c1.ProjectListPage: ClientTarget<c1.ProjectListPage>('pages/project_list'),
    c2.ProjectDetailPage: ClientTarget<c2.ProjectDetailPage>('pages/project_detail', params: _params2ProjectDetailPage),
  },
);

Map<String, dynamic> _params2ProjectDetailPage(c2.ProjectDetailPage c) => {'project': c.project};
