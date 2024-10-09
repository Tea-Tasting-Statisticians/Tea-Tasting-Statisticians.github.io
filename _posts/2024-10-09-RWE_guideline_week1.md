---
title: RWE guideline week1 causal inference
date: 2024-10-09
categories: [Real World Evidence]
math: true
tags: [causal inference, randomized controlled trial, RCT, clinical trial]     # TAG names should always be lowercase
author: <Tea Tasting Gentleman>
---

지난주 수요일에 가짜연구소 RWE(real world evidence) 가이드라인 스터디 첫 모임을 가졌습니다. Real world data로부터 real world evidence를 창출하기 위해서는 인과추론 개념을 알아야 합니다.

가장 중요한 개념 중 하나인 comparability와 randomization에 대해 공부하였습니다. 두 군 사이의 comparability는 거칠게 설명하면, 두 군이 비슷해야 성립하는 것입니다. 처치군에서의 처치를 받기 전의 상태가 통제군에서 처치(ex 위약)를 받기 전의 상태와 비슷해야 합니다. 또한 두 군이 처치에 비슷하게 반응해야 합니다.

이렇게 된다면 두 군은 원래 비슷했는데, 하나의 군에 처치를 하게 되고, 다른 군은 처치를 받지 않으니 비교가 가능하겠죠. 하지만 이것이 어떻게 가능할까요? 정답은 무작위배정에 있습니다. 무작위로 두 군에 대상자를 배정하게 되면 기본적인 특성이 서로 비슷해지게 됩니다.

하지만 현실적으로 표본수가 적은 경우에는 특성이 불균형할 수 있습니다. 그밖에 중요한 변수(모집한 병원 등)가 있을 수 있습니다. 그래서 해당 정보를 층화하여 무작위 배정을 하기도 합니다.

자세한 내용은 아래 링크를 확인해주세요.
https://causalinferencelab.github.io/Bridging-Causal-Inference-and-Real-World-Evidence-A-Study-of-FDA-and-Other-Regulatory-Guidelines/docs/causal_inference_part1.html