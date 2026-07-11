---
id: coai
title: CoAI @ 몰입캠프
introduction: 개발자들이 질문을 하고 지식을 공유할 수 있는 AI 플랫폼
year: 2024
order: 2
repo: estherjsong/madweek4
color: 3178C6
image: projects/coai.png
tags: [TypeScript, Express, PostgreSQL, Drizzle ORM, LangChain]
---

KAIST 몰입캠프에서 진행한 개발자 지식 공유 플랫폼 프로젝트(2인 1조 백엔드 담당).

- **핵심 성과 및 기능**:
  - **GPT 연동 스트리밍 AI 답변 구현**: 사용자가 질문을 등록할 때 AI 답변 생성을 요청하면, LangChain을 통해 GPT API와 연동하여 실시간으로 생성형 스트리밍 답변을 제공하는 기능 구현.
  - **데이터 스트림 제어 문제 해결**: LangChain을 통해 서버로 인입되는 실시간 답변 스트림과 기존 서버 HTTP 응답 객체를 클라이언트로 단일 스트림 형태로 즉각 전송하면서, 답변이 휘발되지 않도록 스트림 형태로 인입되는 AI 답변 전체를 문자열로 저장해 데이터베이스에 적재해야 하는 이슈 발생.
  - **Node.js Transform Stream 파이프라인 설계**: Node.js 내장 `Transform Stream`을 커스텀 구현하여, `Transform` 생성자 단계에서 기존 HTTP 응답을 선제 전송하고, `transform` 메서드에서 유입되는 텍스트 청크(Chunk)들을 실시간 클라이언트 전송과 동시에 문자열 변수에 병합하여 데이터베이스에 답변 본문으로 적재되도록 파이프라인 구현.
