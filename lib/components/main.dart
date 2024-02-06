import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/aside.dart';
import 'package:portfolio/components/elements/history_item.dart';
import 'package:portfolio/components/elements/section.dart';
import 'package:portfolio/components/sections/introduction.dart';
import 'package:portfolio/components/sections/project.dart';
import 'package:portfolio/components/sections/skill.dart';
import 'package:portfolio/providers/config.dart';

class Main extends StatelessComponent {
  @override
  Iterable<Component> build(BuildContext context) sync* {
    final config = context.watch(configProvider).value!;
    yield DomComponent(
      tag: 'main',
      classes:
          'flex flex-col items-center my-4 lg:flex-row lg:items-start lg:my-8',
      children: [
        Aside(),
        div(
          classes:
              'max-w-screen-sm flex-none flex flex-col gap-6 mt-4 mx-6 lg:max-w-screen-md lg:mt-0 lg:mx-auto',
          [
            Section(id: 'intro', title: '1. 소개', children: [Introduction()]),
            Section(id: 'skill', title: '2. 기술 스택', children: [Skill()]),
            Section(id: 'project', title: '3. 프로젝트', children: [Project()]),
            Section(
              id: 'edu',
              title: '4. 학력',
              border: true,
              children: config.education.map(HistoryItem.fromHistory).toList(),
            ),
            Section(
              id: 'award',
              title: '5. 수상 내역',
              border: true,
              children: config.award.map(HistoryItem.fromHistory).toList(),
            ),
            Section(
              id: 'etc',
              title: '6. 기타',
              border: true,
              children: config.etc.map(HistoryItem.fromHistory).toList(),
            ),
          ],
        ),
      ],
    );
  }
}