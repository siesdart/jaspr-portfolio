import 'package:jaspr/jaspr.dart';
import 'package:jaspr_riverpod/jaspr_riverpod.dart';
import 'package:portfolio/components/history/history_item.dart';
import 'package:portfolio/components/section.dart';
import 'package:portfolio/components/sections/experience.dart';
import 'package:portfolio/components/sections/introduction.dart';
import 'package:portfolio/components/sections/opensource.dart';
import 'package:portfolio/components/sections/project.dart';
import 'package:portfolio/components/sections/skill.dart';
import 'package:portfolio/providers/config.dart';

class HomePage extends StatelessComponent {
  const HomePage({super.key});

  @override
  Component build(BuildContext context) {
    final config = context.watch(configProvider);

    return fragment([
      const Section(
        id: 'intro',
        title: '1. 소개',
        child: Introduction(),
      ),
      const Section(
        id: 'skill',
        title: '2. 기술 스택',
        child: Skill(),
      ),
      const Section(
        id: 'experience',
        title: '3. 경력',
        children: [Experience()],
      ),
      const Section(
        id: 'project',
        title: '4. 프로젝트',
        children: [Project()],
      ),
      const Section(
        id: 'opensource',
        title: '5. 오픈소스',
        children: [Opensource()],
      ),
      Section(
        id: 'edu',
        title: '6. 학력',
        children: config.education.map(HistoryItem.new).toList(),
      ),
      Section(
        id: 'award',
        title: '7. 수상 및 자격증',
        children: config.award.map(HistoryItem.new).toList(),
      ),
      Section(
        id: 'etc',
        title: '8. 기타',
        children: config.etc.map(HistoryItem.new).toList(),
      ),
    ]);
  }
}
