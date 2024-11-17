---
title: Adjustment of baseline covariates
date: 2024-11-17
categories: [KOR,Clinical Trial Designs, Advanced designs for clinical trial]
tags: [clinical trial, trial design]     # TAG names should always be lowercase
author: <Tea Tasting Gentleman>
---

조주희 교수님이 진행하시는 advanced designs of clinical trials 수업에서 adjustment of baseline covariates에 대해 다루었다. 보통 임상시험에서는 공변량 (covariates)을 통제하지 않고 결과만 비교하기도 한다. 왜냐하면 randomization 결과로 confounder가 통제되고, collider와 같은 것들을 고려할 필요가 없기 때문이다. 

그럼에도 불구하고 baseline covariates를 보정하면 여러 이점이 있다. 이 수업은 Eliseo Guallar 교수님이 강의 하셨는데, “free meal”이라고 표현하셨다. 왜냐하면 baseline covariates를 통계 모형에 넣게 되면 variance와 bias가 감소하기 때문이다. 설령 baseline covariates를 잘못 설정하여도 추정에 문제가 생기지 않는다. Randomization을 통해 크게 bias를 줄였기 때문이다. 많은 경우에 우리가 covariates를 추가함으로써 유익을 얻을 수 있으며 임상시험에서 항상 고려할 수 있는 선택지이기 때문이다.

하지만 임상시험에서 보정 변수를 넣는 경우는 보기 힘들다. 그 이유는 사람들이 이와 관련하여 잘 모르기 때문이다. 2014년에 보정변수를 고려하는 FDA 가이드라인이 나왔고, 10년이 지난 지금은 사람들이 어느정도 이해를 하고 있다. 곧 있으면 여러 보정변수를 활용한 임상시험이 등장할 것이다.

통계모형에서 선형 모형인지, 비선형 모형인지에 따라 추정량을 계산하는 데 고려해야 할 점이 있다. 선형 회귀모형에서는 보정 변수를 추가하더라도 우리가 추정하고자 하는 beta coefficient에 변화가 거의 없다. Beta coefficient는 average treatment effect이기 때문이다. 하지만 로지스틱 회귀 모형이나 콕스 모형의 경우에는 우리가 추정하고자 하는 beta coefficient는 conditional treatment effect이기 때문에 confounding이 없는 상황에서도 보정변수를 무엇을 넣느냐에 따라 값이 크게 달라질 수 있다. 이를 통계학적 용어로 non-collapsibility라고 한다. 생소하고 어려운 용어여서 여러 문헌들을 살펴보았는데, 특정한 상황에서는 값이 달라지지는 않는다고 한다. 그러나 보통은 보정변수를 넣음에 따라 값이 달라진다고 봐야한다. 

물론 어떤 변수를 보정할 것인지는 프로토콜에 반드시 명시하여야 한다. 프로토콜에 명확하고 정확하게 명시하고 임상시험을 시작해야 할 것이다. 
