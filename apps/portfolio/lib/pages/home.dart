import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/elements/history_item.dart';
import 'package:portfolio/components/elements/opensource_item.dart';
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

    yield const Section(
      id: 'intro',
      title: '1. 소개',
      child: Introduction(),
    );
    yield const Section(
      id: 'skill',
      title: '2. 기술 스택',
      child: Skill(),
    );
    yield const Section(
      id: 'project',
      title: '3. 프로젝트',
      children: [Project()],
    );
    yield Section(
      id: 'opensource',
      title: '4. 오픈소스',
      children: config.opensource.map(OpensourceItem.new).toList(),
    );
    yield Section(
      id: 'edu',
      title: '5. 학력',
      children: config.education.map(HistoryItem.new).toList(),
    );
    yield Section(
      id: 'award',
      title: '6. 수상 내역',
      children: config.award.map(HistoryItem.new).toList(),
    );
    yield Section(
      id: 'etc',
      title: '7. 기타',
      children: config.etc.map(HistoryItem.new).toList(),
    );
  }
}
