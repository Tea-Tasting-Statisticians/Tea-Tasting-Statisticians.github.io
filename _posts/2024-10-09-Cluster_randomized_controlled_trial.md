---
title: Cluster Ranodmized Controlled Trial
date: 2024-10-09
categories: [KOR,Clinical Trial Designs, Advanced designs for clinical trial]
math: true
tags: [cluster randomized controlled trial, rct, pragmatic trial]     # TAG names should always be lowercase
author: <Tea Tasting Gentleman>
---

Cluster randomized controlled trial (cluster RCT)은 randomization 대상이 개인이 아니라 집단이다.

집단 단위로 무작위배정을 하는데, 병원, 학교, 지역 등을 예로 들 수 있다. 

학교의 경우, 무작위 배정의 결과로 어떤 학교에는 A 처치를 하고, 어떤 학교에는 B 처치를 하는 것이다.

이 또한 RCT이지만, 기존의 RCT에 더해서 고려할 사항이 몇 가지가 있다.

먼저 cluster RCT의 통계 모형을 생각해보자.


$$ y_{ij} = \beta_0 + \beta_1 x_j + \alpha_j + \epsilon_{ij} $$


여기서 $$y_{ij}$$는 $$j^{th}$$ cluster의 $$i^{th}$$ 대상자의 outcome이고, $$j\ =\ 1,\ \ldots,\ k$$, $$i\ =\ 1,\ \ldots,\ m_j$$, $$x_j$$는 treatment 군 여부에 해당하고(0이면 control, 1이면 treatment 군), $$\beta_0$$는 control 군의 평균 outcome, $$\beta_1$$은 treatment effect, $$\alpha_j$$는 cluster에 따른 random intercepts. $$alpha_j\ \sim\ N(0,\tau^2)$$, $$\epsilon_{ij}$$는 random error이고 $$\epsilon_{ij}\ \sim\ N(0,\sigma^2)$$, $$corr(\epsilon_{ij},\epsilon_{kj})=0$$, $$\alpha_j$$와 $$\epsilon_{ij}$$는 서로 독립이다. 

Cluster randomized controlled trial의 중요한 가정은 동일한 cluster 내의 대상자들은 서로 연관되어있다는 것이다. Cluster 1과 cluster 2에 있는 사람들은 특성이 다르게 나타나기 마련이다. 그러나 각 cluster를 조건부로 하게 되면 cluster 내의 대상자들은 독립적이라는 가정을 한다. 이는 다음과 같이 나타낸다.


$$Cov(\epsilon_{ij},\epsilon_{lj} | \alpha_j)\ =\ 0$$

일반적인 RCT에 비해 다음과 같이 고려해야 할 사항들을 살펴보자.

첫째는 sample size 측면이다. Cluster RCT의 경우 cluster 내의 대상자들이 서로 연관되어있기 때문에 일반적인 RCT에 비해서 같은 표본수이면 정보량이 적다. 이러한 상관관계는 클러스터간의 분산과 클러스터 내의 분산을 이용해서 계산할 수 있다. 이 상관관계는 intraclass correlation coefficient (ICC)라 부른다.

ICC $$\rho$$는 다음과 같다.


$$\rho = \frac{\tau^2}{\tau^2+\sigma^2}$$


여기서 $$\tau^2$$는 cluster의 그룹간 분산이고, $$\sigma^2$$는 cluster 내의 분산이다. 즉, cluster 내의 분산이 cluster의 그룹간 분산에 비해 클수록 $$\rho$$ 값이 작아진다.

이로부터 design effect ($$DE$$)를 알 수 있다.


$$DE = 1+(m-1)*\rho$$


여기서 $$m$$은 각 cluster의 표본수, $$\rho$$는 ICC이다.

그래서 총 표본수를 $$n_{cluster}$$이라 하고, 일반적인 RCT의 표본수를 $$n_{individual}$$이라 하면,


$$n_{individual} = n_{cluster}/DE$$


가 성립한다. 즉, $$DE$$ 값이 클수록 cluster RCT의 정보량이 적어지고, 모집해야 하는 대상자 수가 더 커지게 된다.

둘째는 cluster 단위로 RCT를 시행하게 된 배경이다. 

백신 접종의 경우 다른 사람이 백신을 맞게 되면 백신을 맞지 않은 사람도 영향을 받게 된다. 즉, 전염성이 감소된다.

또한, 현실적인 이유(정치 / 정책 등)로 이러한 trial을 시행하게 된다. 군 단위로 처치를 하는게 나은 경우도 있다.

실제 진료환경에서 임상적 효과를 거두기 위해 [pragmatic trial](https://tea-tasting-statisticians.github.io/posts/Advanced-designs-for-clinical-trial-2nd-week/)의 형태로 진행하는 경우가 많다.

셋째는 통계분석할 때에 각 표본들이 cluster에 따라 dependency가 존재하기 때문에 이를 보정하는 방법론을 고려하여야 한다.
