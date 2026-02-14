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

KAIST 몰입캠프에서 만든, StackOverflow와 유사한 느낌의 개발자 지식 공유 사이트. 2인 1조의 팀으로 진행하였으며 그 중 백엔드를 맡아 진행하였다.
대표적인 기능으로는 AI 답변이 있는데, 질문을 쓰는 POST 요청에서 AI 답변을 요청했음이 확인되면 랭체인을 사용해 GPT와 연동하여 스트림을 통해 실제 ChatGPT처럼 실시간으로 답변이 작성되는 기능을 구현하였다.
이 때 랭체인을 통해 실시간으로 서버에 들어오는 스트림 형식의 답변과 본래 서버에서 클라이언트로 보내야 할 응답이 함께 하나의 응답으로 클라이언트에 반환되어야 하는데다,
그 과정에서 청크 단위로 들어오는 스트림 데이터를 서버에서 읽어 DB에 답변으로 저장해야 하는데 응답이 스트림 형식으로 보내지는만큼 이 부분을 처리하는데 상당히 애를 먹었다.
최종적으로 Node.js에 내장된 Transform 스트림을 활용하여 생성자에서 기존 응답을 답변이 들어오기 전에 먼저 추가해 보내고, 청크가 들어오는 부분에는 빈 문자열 변수에 더해 나가 답변을 추출하는 방식을 생각해내 이를 해결하였다.
