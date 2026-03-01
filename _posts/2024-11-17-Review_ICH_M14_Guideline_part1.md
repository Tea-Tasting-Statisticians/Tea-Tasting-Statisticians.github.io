---
title: Comment on ICH M14 Guideline - part 1
date: 2024-11-17
categories: [KOR,Real World Evidence]
math: true
tags: [safety, real world evidence, ich guideline, study design, epidemiology]     # TAG names should always be lowercase
author: <Tea Tasting Gentleman>
---

가짜연구소 스터디에서 ICH M14 guideline에 대해 다루었다. ICH(The International Council for Harmonisation of Technical Requirements for Pharmaceuticals for Human Use) 가이드라인은 규제기관과 제약 회사 등 관련 업계에서 인정받는 과학적이고 기술적인 가이드라인이다. ICH 가이드라인은 크게 4가지로 이루어진다. Quality (Q), Safety (S), Efficacy (E), 그리고 Multidiciplinary (M)이다. Q는 제약 품질을 보장하는 데 관련된 가이드라인이며 S는 비임상시험에서 다루는 safety와 관련이 있다. E는 임상시험에서 효과와 안전성을 다루며, biostatistician은 E6 R2 (Good Clinical Practice, GCP)와 E9 (Statistical Principles for Clinical Trials)를 주로 살펴보게 된다.

 마지막으로 M은 Q, S, 그리고 E에도 포함되지 않는 가이드라인이다. 우리가 살펴보는 가이드라인은 M 범주에 해당된다. ICH M14 가이드라인은 Real World Data (RWD)를 활용하여 의약품의 안전성을 평가하는 데 초점이 맞춰져 있다. 이는 임상시험이 아니라 관찰 혹은 비중재적 데이터를 사용한다. 이 때 필요한 계획, 설계, 분석에 관한 일반적인 원칙을 제시한다.

이 가이드라인은 역학 (Epidemiology) 교과서라고 할 수 있을만큼 하나 하나의 개념에 대해 개괄적으로 잘 다루고 있으며 스터디 디자인에서도 길잡이를 제시한다. 예를 들어, 다음과 같은 사항은 일반적으로 연구를 할 때 권고된다. Research question에서 출발하여 study population, exposure, outcome, covariates를 찾는다. 그리고 이러한 조건에 맞는 최소한의 데이터 요구사항을 파악하고, 데이터 원천(source)이 연구하고자 하는 target population을 잘 나타내고 있는지 평가한다. 더 나아가 잠재적인 편향과 confounding을 평가한다. 그 뒤에 데이터를 정하면 프로토콜을 완성하고 프로토콜에 따라 분석을 실시하고 평가한다.

다만 이 가이드라인이 매우 현실적으로 어려움이 있다는 느낌도 받았다. 데이터 원천을 찾았으면 분석 전에 프로토콜을 완성하고 프로토콜에 따라 계획을 실시하여야 한다. 하지만 RWD는 confounding과 여러가지 잠재적인 편향이 크게 존재하기 때문에 고려할 사항이 굉장히 많다. 임상시험보다 더 많은 고민을 해야할 수도 있다.

실질적으로는 RWD 분석을 하기 전에 프로토콜을 쓰는 경우는 많지 않다고 한다. 규제 기관에서 선제적으로 이러한 방향으로 나아갔으면 하는 마음에 가이드라인을 제시한 것으로 보인다. 만약 임상시험처럼 프로토콜을 미리 작성하고 분석을 하게 된다면, 그 분석은 믿을만한 과학적인 증거가 될 것이기 때문이다.

또한 RWD 분석을 할 때 고려해야 할 사항은 각 데이터는 연구를 목적으로 생성된 데이터가 아니라 진료 환경에 맞추어 생성된 데이터라는 점이다. 또한, 각 병원이나 의원의 환경에 따라 데이터가 코딩되는 알고리즘이 있다. 이러한 것에 대한 이해가 있어야 제대로 된 분석을 할 수 있다. 예를 들어 우리나라의 국민건강보험공단 데이터가 있는데, 당뇨병 환자를 정의하기 위해 ICD-10 코드와 공복혈당, 당뇨 약제 처방 등을 다양하게 고려하여 당뇨병 환자를 정의하기도 한다. 또 다른 예시로는 각 병원 임상 데이터 웨어하우스 (Clinical Data Warehouse)의 경우 각 병원마다 특정한 당뇨병 약제에 대한 코드가 다를 수가 있다.

발표자료 : [https://causalinferencelab.github.io/Bridging-Causal-Inference-and-Real-World-Evidence-A-Study-of-FDA-and-Other-Regulatory-Guidelines/docs/ICH_M14_part1.html](https://causalinferencelab.github.io/Bridging-Causal-Inference-and-Real-World-Evidence-A-Study-of-FDA-and-Other-Regulatory-Guidelines/docs/ICH_M14_part1.html)

발표자 : [박상호](https://www.linkedin.com/in/shstat1729/)