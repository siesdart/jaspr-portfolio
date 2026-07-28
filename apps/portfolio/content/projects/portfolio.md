---
id: portfolio
title: Jaspr Portfolio
introduction: Dart 기반 웹 프레임워크인 Jaspr로 개발한 개인 포트폴리오 홈페이지
year: 2024
order: 3
repo: siesdart/jaspr-portfolio
color: 00B4AB
image: projects/portfolio.png
tags: [Dart, Jaspr, Riverpod, Monorepo, Tailwind CSS, Docker, AI Agent]
---

개인 이력서 및 포트폴리오 홈페이지다. Flutter와 유사한 구조와 인터페이스를 가지고 있지만 Flutter Web과 달리 프로그래밍 언어로 Dart를 사용하면서도 렌더링에 HTML, CSS와 같은 보편적인 웹 기술을 사용하는 모던 웹 프레임워크인 Jaspr를 사용하여 개발하였다.

덕분에 Flutter Web이 가지는 초기 번들 사이즈 과다 및 SEO 취약점을 극복하면서도, Dio, Riverpod 등 Dart와 Flutter 생태계의 라이브러리를 그대로 재활용하여 익숙한 환경에서 높은 생산성으로 웹사이트를 제작할 수 있었다.

- **Configuration Driven Development (CDD)**: 마크다운 및 YAML 파일을 적극 활용하여 코드 변경 없이 파일 수정만으로 이력서와 포트폴리오 콘텐츠가 정적 반영되는 구조 설계.
- **Client-Side PDF Architecture**: Dart의 `pdf` 라이브러리를 사용하여 클라이언트 사이드에서 직접 이력서와 포트폴리오 PDF를 생성하는 아키텍처를 구축하여 즉각적인 다운로드 UX 제공.
- **AI Agent Harness Integration**: 단순 포트폴리오를 넘어 Antigravity 기반 이력서 피드백 하네스를 구축하여 이력서 콘텐츠 분석 및 대화형 인터뷰를 통한 개선 시스템 구축.
