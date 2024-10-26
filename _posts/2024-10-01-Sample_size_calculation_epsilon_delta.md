---
title: Sample size calculation in terms of epsilon and delta
date: 2024-10-01
categories: [KOR,Clinical Trial Designs, Sample size calculation]
math: true
tags: [true mean difference, clinical significance, statistical significance]     # TAG names should always be lowercase
author: <Tea Tasting Gentleman>
---
오늘은 sample size calculation에서 중요한 $$\epsilon$$(예상되는 임상적 차이)과 $$\delta$$(margin)에 대해서 이야기를 나누어보려고 한다.

다음 수식은 두 평행군의 sample size를 구하는 공식이다. Z 분포를 활용한다.

 $$n$$은 sample size를 의미하고, $$\epsilon$$과 $$\delta$$에 따라 $$n$$이 크게 변한다.

$$ 
\huge
\begin{aligned} n=\frac{(z_{\alpha}+z_{\beta})^2 \sigma^2 (1 + 1/\kappa)}{(\epsilon - \delta)^2} \end{aligned} 
$$

여기서 $$\alpha$$는 type 1 error, $$\beta$$는 type 2 error, $$z_{\alpha}$$는 Z 분포에서 면적 $$\alpha$$를 나타내는 지점이다. 즉, $$-\infty$$에서 $$z_{\alpha}$$까지 적분했을 때 $$\alpha$$ 값을 얻을 수 있다. 또한, $$\kappa$$는 대조군과 통제군의 비율이고, $$\sigma$$는 표준편차에 해당한다.

그렇다면 $$\epsilon$$과 $$\delta$$는 무엇일까?

$$\epsilon$$은 임상적으로 예상되는 차잇값에 해당한다. 즉, 우리의 제품(혹은 intervention)과 기존의 제품(혹은 intervention)과의 예상되는 차이를 일컫는다. $$\epsilon$$을 정할 때에는 선행연구에 기반해서 두어야 하며, 우월성 임상시험이나 비열등성 임상시험을 계획할 때에 너무 낙관적으로 크게 잡게 되면 sample size가 작아지게 되고, sample size calculation에 대한 신뢰를 잃게 된다.

$$\delta$$는 margin이라고 일컫는다. 우월성 임상시험에서는 두 군의 차잇값의 신뢰구간 하한이 +$$\delta$$ 값보다 크면 우월하다고 보고, 비열등성 임상시험에서는 두 군의 차잇값의 신뢰구간 하한이 -$$\delta$$ 값보다 크면 비열등하다고 본다.

통계적 우월성만을 보는 경우에는 $$\delta$$를 0으로 두기도 한다.

하지만 우월성 임상시험 환경에서 다이어트 약을 투여한다고 했을 때, 무처치 대조군에 비해 +$$\delta$$(=0)보다 차이가 있다고 하는 것은 의미가 없을 것이다.

3달 동안 5kg의 체중 감량이 있어야 의미가 있다고 한다면, 이 경우에는 +$$\delta$$가 5가 되는 것이다.

가장 중요한 것은 선행연구와 임상적인 의미를 고려하여 정하는 것이다.
