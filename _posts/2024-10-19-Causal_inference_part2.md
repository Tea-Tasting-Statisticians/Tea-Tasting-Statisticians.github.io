---
title: RWE guideline week2 causal inference part2
date: 2024-10-19
categories: [KOR,Real World Evidence]
math: true
tags: [real world evidence, causal inference, graphical model, mediator, confounder, collider]     # TAG names should always be lowercase
author: <Tea Tasting Gentleman>
---

지난 10월 16일에 가짜연구소 RWE 가이드라인 스터디를 하였습니다. 인과추론 개념을 다루는 마지막 주였습니다. 다음주에는 FDA framework 가이드라인을 다룹니다. 이번에 다룬 주제는 statistics review와 graphical causal model에 관한 것입니다. [Jaeyun Choi](https://www.linkedin.com/in/jaeyun-choi-0b64292a0/)님께서 자료 제작하시고 발표하셨습니다. Statistics review에서는 점추정과 구간 추정, 그리고 가설검정을 살펴보았습니다. 우리가 스터디한 자료는 Causal inference for brave and true 라는 자료인데, 설명이 대체로 잘 되어있으나 아쉬운 것은 중심극한정리에 대한 설명이었습니다.

 

다음과 같이 설명이 되어 있습니다.

“중심극한정리는 표본의 크기가 충분히 클 때, 모집단의 분포와 상관없이 모평균을 추정하기 위해 사용되는 표본평균들의 분포는 정규분포를 따른다는 이론입니다. 따라서 모평균에 대한 신뢰구간을 구하기 위해 정규분포의 특성을 이용하여 계산할 수 있습니다.”

 

사실은 모집단의 분포의 평균과 분산이 존재해야 성립하는 정리입니다. 예를 들어 파레토 법칙에서 나타나는 분포를 예로 들 수 있습니다. 사람들이 가지고 있는 돈의 액수 분포 또한 파레토 법칙을 따르지요. 이 때 평균은 무한대입니다. 다른 예시로는 코시 분포를 들 수 있습니다. 우리가 의학 논문 table 1에서 군에 따른 변수들의 평균값, 표준편차를 구하고, 평균 차이에 대한 검정 등을 하는데요, 비모수 분포를 따르는 것으로 보이는 경우에는 비모수 검정을 하는 이유도 중심극한정리가 적용되지 않는 경우가 종종 있기 때문입니다.

 

Graphical model에서는 세 가지 인과 그래프 구조 모형을 다루었습니다. 첫 번째 구조는 사슬구조인데요, 중간에 매개효과가 있는 구조입니다. Mediation analysis에서 다루는 구조(여기서는 direct effect만 존재하는 경우)이기도 하지요. T는 M의 원인이 되고, M은 Y의 원인이 됩니다. 다음과 같이 표현할 수 있습니다.

T -> M -> Y


![](/img/사슬구조.png)


만약 여기서 M을 조건부(또는 보정한다고 표현함)로 하게 되면, T와 Y는 독립이 됩니다. 보통은 M을 보정하지 않지만 연구 목적에 따라 T와 Y를 독립으로 만들기도 합니다.

 

두 번째 구조는 분기 구조인데, 흔히 말하는 confounder의 개념이 여기서 등장합니다. 분기 구조는 공통 원인을 말합니다. T와 Y의 공통 원인으로 X가 있는 것이지요. X가 confounder에 해당합니다. Confounder를 제대로 보정해야 T가 Y에 미치는 영향을 파악할 수 있습니다. 예를 들면, X는 국가의 GDP에 해당하고 T는 1인당 초콜릿 소비량, Y는 노벨상 수상자수라고 말할 수 있을 것입니다. 1인당 초콜릿 소비량이 클수록 노벨상 수상자 수가 많다고 할 때, 그게 초콜릿 소비량의 영향인지 초콜릿 소비량이 큰 국가가 GDP도 커서 그런건지 알기가 어렵습니다. 따라서 국가의 GDP를 통제하고 초콜릿 소비량에 따른 노벨상 수상자 수를 살펴보는 것도 좋은 방법입니다.


![](/img/분기구조.png)


세 번째 구조는 충돌부 구조입니다. Collider라고 표현하며 T와 Y가 X의 원인이 되는 경우 X가 collider입니다. T와 Y가 인과관계가 없는데 X를 조건부로 하면 T와 Y가 연관관계가 생깁니다. 예를 들어보면, T는 통계학 지식, Y는 아첨, X는 승진이라고 해봅시다. 승진했다고 하면, 그 사람은 통계학 지식이 많거나 아첨을 잘하는 경우일 것입니다. 만약에 통계학 지식이 없다는 것을 알게 되면 아첨을 잘한다는 사실을 알게 될 것입니다. 따라서 X(승진)을 조건으로 하게 되면 통계학 지식과 아첨에서 inverse relationship이 생기게 되는 것입니다.


![](/img/충돌부구조.png)


선택편향도 다루었습니다. 선택편향은 통제해야 하는 변수보다 더 많은 변수를 통제할 때 발생하게 됩니다. 재윤님이 두 가지 예시를 들어주셨습니다. 첫 번째 예시는 하늘을 쳐다보는 것이 다른 보행자들이 하늘을 쳐다보게 하는 데 영향을 줄까? 라는 물음에서 출발한 무작위 실험입니다. 무작위 실험을 통해 confounder가 발생하지 않을 것이지만, 하늘을 쳐다보는 행동과 주변 사람들이 하늘을 쳐다보는 것의 인과성을 파악할 수 있을까요? 아마도 모집 단계에서 부끄러움을 많이 타는 사람들이 연구에 참여하지 않아서 일반화하기 어려울 수 있습니다. 이 경우에는 internal validity는 성립하지만 external validity는 성립하지 않는다고 말할 수 있을 것입니다.


두 번째 예시로는 per protocol set을 들 수 있습니다. 임상시험계획서에 따라서 잘 순응한 사람들만 대상으로 하여 분석하는 경우입니다. 그런데 약이 매우 독하여 처치군에서 drop out(탈락)이 많이 발생하면 선택편향이 발생할 것입니다. 이 경우에는 internal validity가 떨어진다고 말할 수 있을 것입니다.

아래 스터디 자료입니다.
[https://causalinferencelab.github.io/Bridging-Causal-Inference-and-Real-World-Evidence-A-Study-of-FDA-and-Other-Regulatory-Guidelines/docs/causal_inference_part2.html](https://causalinferencelab.github.io/Bridging-Causal-Inference-and-Real-World-Evidence-A-Study-of-FDA-and-Other-Regulatory-Guidelines/docs/causal_inference_part2.html)