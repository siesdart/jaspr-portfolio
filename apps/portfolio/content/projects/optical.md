---
id: optical
title: 광학 시뮬레이터
introduction: 고등학교 물리Ⅱ(2009 개정 교육과정)에서 다루는 광학의 상을 시뮬레이션하여 시각화하는 프로그램
year: 2018
order: 2
repo: Winrobrine-zz/OpticalSimulator
color: 178600
image: projects/optical.png
tags: [C#, WPF, MVVM, Skia]
files:
  - name: Report
    src: projects/optical_report.pdf
---

오목거울, 볼록거울, 오목렌즈, 볼록렌즈의 앞에 물체가 놓여있을 경우 상이 어떤 크기로, 어느 위치에 어느 방향으로 생성되는지를 렌즈 방정식 등을 활용하여 화면에 시뮬레이션해주는 프로그램이다.
화면에 결과를 렌더링하는데 2D 그래픽 엔진인 Skia, 정확히는 닷넷용 API인 SkiaSharp을 사용하였다.
