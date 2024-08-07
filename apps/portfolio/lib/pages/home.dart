import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/history_item.dart';
import 'package:portfolio/components/elements/section.dart';
import 'package:portfolio/components/sections/introduction.dart';
import 'package:portfolio/components/sections/project.dart';
import 'package:portfolio/components/sections/skill.dart';
import 'package:portfolio/providers/config.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Iterable<Component> build(BuildContext context) sync* {
    final config = context.watch(configProvider).value!;

    yield Section(id: 'intro', title: '1. 소개', children: [Introduction()]);
    yield Section(id: 'skill', title: '2. 기술 스택', children: [Skill()]);
    yield Section(
      id: 'project',
      title: '3. 프로젝트',
      border: true,
      children: [Project()],
    );
    yield Section(
      id: 'edu',
      title: '4. 학력',
      border: true,
      children: config.education.map(HistoryItem.new).toList(),
    );
    yield Section(
      id: 'award',
      title: '5. 수상 내역',
      border: true,
      children: config.award.map(HistoryItem.new).toList(),
    );
    yield Section(
      id: 'etc',
      title: '6. 기타',
      border: true,
      children: config.etc.map(HistoryItem.new).toList(),
    );
  }
}
