---
title: Switching noninferiority and superiority trial
date: 2024-10-19
categories: [KOR,Clinical Trial Designs, Switching Trials]
math: true
tags: [switching trial, noninferiority, superiority, clinical trial]     # TAG names should always be lowercase
author: <Tea Tasting Gentleman>
---

우월성 임상시험이나 비열등성 임상시험을 진행하는 경우에 분석 결과에 따라 우월성 임상시험에서 비열등성 임상시험으로 변경한다든지 비열등성 임상시험에서 우월성 임상시험으로 변경하는 경우가 있을 것입니다.

통계적으로 우월성 임상시험과 비열등성 임상시험은 닫힌 검정이기 때문에 변경하는 데에는 문제가 없습니다. 하지만 우월성 임상시험에서 비열등성 임상시험으로 변경할 때에 non-inferiority margin의 정당성에 문제가 생길 수 있습니다. 따라서 우월성 임상시험을 계획하는 단계에서 non-inferiority margin을 미리 설정해두면 됩니다. 이 때 non-inferiority margin은 placebo에 비해 우월하다는 정보를 포함하고 있어야 합니다.

반대로 비열등성 임상시험에서 우월성 임상시험으로 변경할 때에는 어려움은 거의 없으나 우월성 임상시험은 intention to treat analysis에서 파생된 full analysis set의 분석을 중시합니다. 따라서 사전에 ITT 분석의 중요도를 높게 둔 경우에 우월성 임상시험으로 변경이 가능합니다.

또한, 직접적으로 관련된 이슈는 아니지만 type 1 error의 값을 설정하는 것에 있어서 사람들이 헷갈리는 경우가 꽤 있습니다. 양측 검정으로 할 때에 type 1 error를 0.05로 두고 하는데, 단측 검정에서는 type 1 error를 0.025로 설정합니다. 결론적으로 말씀드리면 양측검정에서의 type 1 error 0.05와 단측 검정에서의 type 1 error 0.025로 했을 때 sample size는 동일하게 계산이 됩니다. 이는 ICH E9 가이드라인을 따르는 내용입니다.

[https://pseudo-lab.github.io/Let-Biostat-Guidance-Guide-Us/docs/Switching.html](https://pseudo-lab.github.io/Let-Biostat-Guidance-Guide-Us/docs/Switching.html)