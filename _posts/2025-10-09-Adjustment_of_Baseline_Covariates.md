---
title: Adjustment of Baseline Covariates in Randomized Controlled Trial
date: 2025-10-20
categories: [KOR, Clinical Trial Designs, Advanced designs for clinical trial]
tags: [clinical trial design, adjustment of baseline covariates, precision, confounder]   # lower case 
author: <Tea Tasting Gentleman>
math: true
--- 
임상시험에서 프로토콜에 미리 baseline 보정변수를 제시하고 보정변수를 통제하여 통계분석을 진행하는 것이 권장된다는 FDA 가이드라인이 발행된지 몇년 안됐다. 무작위배정이 이루어진 경우, 잠재적 교란변수와 처치(X) 간의 연관성이 제거되므로 해당 변수는 더 이상 교란변수로 작용하지 않는다. 하지만 여전히 결과(Y)에 영향을 미치는 변수로 남을 수 있다. 이 변수를 보정하면 outcome에 대한 추정을 정밀하게 해주어 confidence interval이 좁아지는 장점이 있다. 그런데 이와 관련해서 선형 모형과 비선형 모형에서 보정변수를 사용할 때 주의점이 있다. 이에 대해 설명해보고자 한다.
Linear functional은 벡터공간 V에서 field F (예: 실수 공간 또는 복소수 공간)으로 보내는 linear map이다. 

통계학에서 다루는 기댓값의 경우 linear functional이다. 특히 기댓값은 통계모형에서 매우 중요한 역할을 하고 있는데, 흔히 우리가 이야기하는 통계적 추론의 경우 기댓값을 중심으로 이루어지기 때문이다. 다음 논의를 하기 위해 특수한 경우를 생각해보자. 사람들을 처치군과 통제군에 무작위 배정하는 경우이다. 이런 경우에는 일반적으로 교란변수가 존재하지 않고 outcome에만 영향을 미치는 변수가 존재한다.

따라서 Y를 outcome, X를 처치 여부를 나타내는 변수, Z를 보정변수 (예: Y에만 영향을 미치는 변수)라 해보자. 그렇다면 우리의 관심은 $$E(Y\|X=1,Z)-E(Y\|X=0,Z)$$이다. 이는 Z를 보정했을 때 X가 1 unit 증가하면 Y에 미치는 영향을 나타내기 때문이다. 다음과 같이 나타낼 수 있다. 
Y = α_0 + α_1*X + α_2*Z + ε
​여기서 Z로 보정된 X의 효과는 α_1 (=$$E(Y\|X=1,Z)-E(Y\|X=0,Z)$$)이다.
$$E(Y\|X=1,Z)-E(Y\|X=0,Z)$$의 경우에는 X가 1 unit 증가하면 Y에 미치는 영향을 나타낸다. 이는 다음과 같은 모형으로 쓸 수 있다.
Y = β_0 + β_1*X + ε
​여기서 X의 효과는 회귀 계수 $$β_1$$이다. $$β_1 = E[Y\|X=1] - E[Y\|X=0]$$를 의미한다.

무작위 배정이 시행되었을 때 linear model (예: linear regression model)의 경우 일반적으로 $$E(Y\|X=1)-E(Y\|X=0)$$와 $$E(Y\|X=1,Z)-E(Y\|X=0,Z)$$의 값이 비슷하다 (즉, β₁ ≈ α₁). 왜냐하면 무작위배정으로 X와 Y에 동시에 영향을 미치는 변수가 제거되었기 때문이다. 하지만 non-linear link function (예를 들어 logistic regression의 logit이나 cox regression의 경우를 고려해볼 수 있음)을 도입할 때 $$E(Y\|X=1)-E(Y\|X=0)$$와 $$E(Y\|X=1,Z)-E(Y\|X=0,Z)$$가 달라질 수 있다. 즉, β₁ ≠ α₁일 수 있다.
다음과 같은 이중기댓값 정리를 생각해보자.

$$E(Y\|X) = E_z[E(Y\|X,Z)]$$

가 항상 성립한다. 그런데, non-linear link function g을 고려하면,

$$g(E(Y\|X)) ≠  E_z[g(E(Y\|X,Z))]$$

와 같은 상황이 발생한다. 이 경우에는 Z가 교란변수이든 아니든 non linear function에 의해서 추정값이 달라질 수 있다. 이는 Z를 보정하였을 때 Z 조건을 가진 X 집단의 Y에 미치는 효과라고 해석해야 한다.

가이드라인에서는 비선형 모형에서 발생할 수 있는 이슈 때문에 상황에 따라 몇가지 다른 모형을 제시하고 있는데 이것은 다음에 정리해보고자 한다.







