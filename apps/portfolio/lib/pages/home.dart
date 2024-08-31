import 'package:common/component.dart';
import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
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
    yield Section(
      id: 'experience',
      title: '3. 경력',
      children: config.experience.map(ExperienceItem.new).toList(),
    );
    yield const Section(
      id: 'project',
      title: '4. 프로젝트',
      children: [Project()],
    );
    yield Section(
      id: 'opensource',
      title: '5. 오픈소스',
      children: config.opensource.map(OpensourceItem.new).toList(),
    );
    yield Section(
      id: 'edu',
      title: '6. 학력',
      children: config.education.map(HistoryItem.new).toList(),
    );
    yield Section(
      id: 'award',
      title: '7. 수상 및 자격증',
      children: config.award.map(HistoryItem.new).toList(),
    );
    yield Section(
      id: 'etc',
      title: '8. 기타',
      children: config.etc.map(HistoryItem.new).toList(),
    );
  }
}
