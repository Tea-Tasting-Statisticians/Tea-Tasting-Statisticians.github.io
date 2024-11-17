---
title: Comment on ICH M14 Guideline - part 2
date: 2024-11-17
categories: [KOR,Real World Evidence]
math: true
tags: [Safety, real world evidence, ich guideline, study design, epidemiology, operational definition, conceptual definition, pregnancy studies]     # TAG names should always be lowercase
author: <Tea Tasting Gentleman>
---

[김청수](https://www.linkedin.com/in/chungsoo-kim-42419b175/)님이 발표해주셨다. Protocol development에서 특히 개념적 정의를 operational definition으로 옮기는 내용을 중점적으로 살펴보았다. 먼저 개념적 정의는 연구에서 우리가 측정하고자 하는 개념이다. 예시 : 질환을 정의하기 위한 임상적 진단 기준이나 관심 노출을 정의하기 위한 약물 복용의 측정이다. 그런데 개념적 정의는 각 RWD 시스템에서 바로 코딩되지 않기 때문에 조작적 정의를 통해 변수를 파악해야 한다. 조작적 정의는 시스템 내에서 개념적 정의를 구현하기 포착하기 위한 방법이다. 예를 들어, ICD 10 코드의 E11-E14 진단 및 당뇨 약제 처방 또는 공복혈당 126 이상을 당뇨환자로 정의하는 것이다. 개념적 정의를 조작적 정의로 치환하기 때문에 이 과정에서 존재하는 한계점에 대해 프로토콜에서 논의하여야 한다. 이러한 한계점을 어떻게 개선할 것인지 고민해야 한다.

공변량 (covariates)을 정의할 때에는 confounding과 effect modifier을 고려하여 설계하여야 한다. Confounding은 개념적으로 exposure(노출변수)에 영향을 미치고, outcome에 영향을 미치는 변수이며 인과 경로에는 포함되지 않는다. 예를 들어 국민 1인당 초콜릿 소비량이 국가의 노벨상 수상자수에 미치는 영향을 살펴보았을 때, 국가의 GDP가 높을수록 1인당 초콜릿 소비량을 높이고 노벨상 수상자 수도 높일 것이다. 그러나 1인당 초콜릿 수가 많다고 GDP가 올라가지는 않을 것이다.

또 효과변경인자는 말 그대로 효과를 변경하는 인자이다. 반드시 인과경로에 포함될 필요는 없다. 효과변경인자의 예시로는 인종을 예시로 들 수 있다. 실제로 흑인에게는 효과가 있으나 다른 인종에게는 약이 효과가 없는 경우가 있다.

그밖에도 선택편향, 정보편향, 불멸시간편향(immortal time bias)을 고려해야 한다. 불멸시간편향은 follow-up을 시작하였지만, 한 군이 exposure에 노출될 때까지 outcome이 발생하지 않는 경우에 발생한다. 약물역학 연구자 에드워드 라이 (Edward Lai) 선생님이 들어주신 예시를 생각해볼 수 있다 (24년 한국역학회). intensive care unit에 입원한 사람들 중에 bubble tea가 생존에 미치는 효과를 알고 싶어서 3일차에 bubble tea를 한 군에 제공하고 다른 군은 제공하지 않는다. 결과는 bubble tea를 마신 군이 더 오래 생존하는 것으로 나왔지만 이는 사실 3일차까지 생존해있는 사람들을 대상으로 했기 때문에 편향이 발생한 것이다. 불멸시간편향을 고려하지 않아서 논문이 철회(retraction)된 경우가 있다([https://pubmed.ncbi.nlm.nih.gov/30688986/](https://pubmed.ncbi.nlm.nih.gov/30688986/)).

이 가이드라인에서는 데이터 관리계획, 통계 분석 계획 등에 대해서도 다루고 있다. 자세한 내용은 발표자료를 참고하길 바란다. RWD가 가장 유용하게 사용될 수 있는 지점은 study population에 포함되어 있지 않던 대상들에게 약이 안전한지 확인하는 것이다. 예를 들어, 소아, 노인, 임신한 사람 등을 생각해볼 수 있다. RWD를 통해 안전성이 확인되면 이들에게도 약을 사용할 수 있기 때문이다. 임신의 경우에는 임신 기간을 셋으로 나누어 살펴보기도 하고, 출산된 아이와 연계하는 등의 노력이 필요할 수도 있다.

발표자료 : [https://causalinferencelab.github.io/Bridging-Causal-Inference-and-Real-World-Evidence-A-Study-of-FDA-and-Other-Regulatory-Guidelines/docs/ICH_M14_part2.html](https://causalinferencelab.github.io/Bridging-Causal-Inference-and-Real-World-Evidence-A-Study-of-FDA-and-Other-Regulatory-Guidelines/docs/ICH_M14_part2.html)

발표자 : [김청수](https://www.linkedin.com/in/chungsoo-kim-42419b175/)