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

개인 홈페이지다. Flutter와 거의 동일한 구조를 띄지만 HTML, CSS와 같은 일반적인 웹 기술로 화면을 렌더링하고 JS 대신 Dart를 기반으로 하는 웹 프레임워크인 Jaspr를 사용하여 개발하였다.
덕분에 Flutter에서 많이 사용하는 Dio, Riverpod 등의 라이브러리를 그대로 사용하여 Flutter와 유사한 환경으로 웹사이트를 제작할 수 있었다.
마크다운, Yaml 등의 파일을 적극 활용하여 코드 수정 없이 파일을 추가 또는 수정하는 것만으로 홈페이지의 내용을 변경할 수 있는 Content-driven Development로 개발하였다.
대표적인 기능으로 pdf 이력서가 있는데, Dart의 pdf 라이브러리를 사용하여 서버 API 호출 없이 클라이언트 사이드에서 pdf 로직을 직접 처리하도록 아키텍처를 설계하여, PDF의 생성과 다운로드가 빠른 속도로 이루어지도록 구현하였다.
또 단순한 포트폴리오 웹사이트에 그치지 않고, Antigravity 기반의 이력서 피드백 하네스를 구축하여 Antigravity가 프로젝트 내 이력서 콘텐츠를 분석·평가하고, 사용자와의 대화형 인터뷰를 통해 내용을 개선해줄 수 있도록 하였다.
