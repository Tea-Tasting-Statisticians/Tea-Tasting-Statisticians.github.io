---
title: FDA 가이던스 한국어 요약: Multiple Endpoints in Clinical Trials (2022)
date: 2026-03-22
categories: [KOR, Clinical Trial Design, FDA]
tags: [korean, multiple endpoints, multiplicity, fda stat guidance kor, cder, fwer, bonferroni, hochberg, gatekeeping, hierarchical testing, false discovery rate]
author: Tea Tasting Lady
format:
  html:
    html-math-method: mathjax
---

# Multiple Endpoints in Clinical Trials
## 임상시험에서의 다중 평가변수

| 항목 | 내용 |
|------|------|
| 발행처 | FDA CDER (Center for Drug Evaluation and Research) / CBER (Center for Biologics Evaluation and Research) |
| 발행일 | 2022년 10월 |
| 문서 상태 | Final Guidance |
| 원문 PDF | [다운로드](https://www.fda.gov/media/162416/download) |
| FDA 가이던스 페이지 | [링크](https://www.fda.gov/regulatory-information/search-fda-guidance-documents/multiple-endpoints-clinical-trials) |
| 요약 생성일 | 2026-03-14 |
| Docket 번호 | FDA-2016-D-4460 |

---

## 📌 전체 요약 (Executive Summary)

이 가이던스는 임상시험에서 다중 평가변수(multiple endpoints)를 평가할 때 발생하는 통계적 도전과제를 다룬다. 대부분의 임상시험에서 약물의 효과를 평가하기 위해 여러 개의 평가변수가 사용되며, 평가변수의 개수가 증가할수록 적절한 다중성(multiplicity) 조정이 없을 경우 거짓양성(false positive) 결론을 도출할 가능성이 증가한다. FDA는 이 가이던스를 통해 평가변수를 체계적으로 분류하고 순서를 정하며, 확립된 통계 방법을 적용하여 다중성을 통제하고 약물 효과에 대한 올바른 결론에 도달할 수 있도록 스폰서와 검토 담당자를 지원한다.

---

## I. 배경 및 목적 (Background and Purpose)

### 1.1 문제의 정의

임상시험 설계 시 약물의 다양한 측면을 평가하기 위해 다수의 평가변수(endpoints)가 포함된다. 이는 질병의 여러 양상을 포괄적으로 문서화하기 위한 필요성에서 비롯된다. 그러나 단일 시험에서 분석되는 평가변수(endpoint)의 개수가 증가함에 따라, 약물의 효과에 관한 거짓 결론을 도출할 가능성이 증가한다.

**핵심 문제**: "약물의 효과에 관하여 하나 이상의 평가변수와 관련하여 거짓 결론을 내릴 가능성은 다중성에 대한 적절한 조정이 없을 경우 우려의 대상이 된다."

### 1.2 통계적 배경

이 문제는 **제1종 오류(Type I Error)** 또는 **제1종 오차 확률(α error)**의 증가와 직결된다. 단일 검정에서 유의수준(significance level, α)이 0.05로 설정되어 있더라도:

- 2개 독립 검정 수행 시: 최소 1개 이상의 거짓양성이 나타날 확률 ≈ 1 - (0.95)² = 0.0975
- 10개 독립 검정 수행 시: 최소 1개 이상의 거짓양성이 나타날 확률 ≈ 1 - (0.95)¹⁰ ≈ 0.40

따라서 평가변수의 개수가 증가할수록 **가족단위 제1종 오류율(Family-Wise Error Rate, FWER)** 또는 **거짓발견율(False Discovery Rate, FDR)**을 통제하는 것이 중요하다.

### 1.3 가이던스의 목적

이 가이던스의 목적은 스폰서와 FDA 검토 담당자가 다음을 수행할 수 있도록 돕는 것이다:

1. 평가변수를 체계적으로 분류하고 순서 정하기 (grouping and ordering)
2. 확립된 통계 방법을 적용하여 시험 내 다중성 통제
3. 약물 효과에 관한 잘못된 결론을 방지

---

## II. 평가변수의 분류 (Classification of Endpoints)

### 2.1 주평가변수 (Primary Endpoint)

**정의**: 임상시험의 주요 목적을 평가하기 위해 미리 정의된 가장 중요한 평가변수

**특성**:
- 시험 프로토콜에 명확하게 사전 지정(pre-specified)
- 약물 효능의 핵심을 나타냄
- 일반적으로 1개 또는 제한된 개수로 설정
- 주요 통계 분석의 대상
- 규제 의사결정의 근거가 됨

**고려사항**:
- 질병의 임상적 의미 있는 측면을 측정해야 함
- 신뢰성 있고 타당한 측정이 가능해야 함
- 표본 크기 계산의 기초가 됨

### 2.2 부평가변수 (Secondary Endpoint)

**정의**: 주평가변수를 지지하거나 약물의 추가적인 효과를 평가하기 위한 평가변수

**특성**:
- 사전에 정의되지만 주평가변수보다 중요도가 낮음
- 약물의 추가적 이점 또는 영향을 평가
- 다중성 조정의 대상이 될 수 있음
- 탐색적 증거로서의 역할 가능

**활용**:
- 약물의 전반적인 임상적 이점 평가
- 부작용(adverse effect) 또는 안전성 측면
- 삶의 질(quality of life) 또는 기능적 측면
- 특정 부분군(subgroup) 분석

### 2.3 복합평가변수 (Composite Endpoint)

**정의**: 2개 이상의 개별 이벤트(event)로 구성되어 있으며, 피험자가 정의된 이벤트 중 하나라도 경험하면 복합평가변수 기준을 충족하는 평가변수

**예시**:
- 주요 심혈관 이벤트 (Major Adverse Cardiovascular Events, MACE) = 심근경색 + 뇌졸중 + 심혈관 사망
- 3-point MACE = MI + stroke + all-cause mortality

**장점**:
- 필요한 표본 크기 감소
- 임상적으로 의미 있는 결과의 종합적 평가
- 이벤트 발생 빈도 증가로 통계 검정력 향상

**위험도**:
- 개별 성분의 효과 크기가 상이할 경우 전체 효과 마스킹(masking) 위험
- 한 성분이 지배적이 되면 다른 성분의 영향 무시될 가능성
- 성분 간 상관관계 존재 시 다중성 문제 발생

**FDA 권고사항**:
복합평가변수 구성 시 다음을 고려해야 한다:

1. **성분 선택**: 임상적으로 중요하고 측정 가능한 이벤트만 포함
2. **가중치 부여**: 각 성분의 임상적 중요도를 명확히 정의
3. **사전 정의**: 복합평가변수의 구성과 순서를 프로토콜에 명확히 기술
4. **통계 분석**: 전체 복합평가변수와 개별 성분에 대한 분석 결과 모두 제시

### 2.4 기타 평가변수 (Tertiary and Exploratory Endpoints)

**3차 평가변수 (Tertiary Endpoint)**:
- 부평가변수를 추가로 지지하거나 탐색적 증거를 제공하는 평가변수
- 일반적으로 다중성 조정 대상이 아님

**탐색적 평가변수 (Exploratory Endpoint)**:
- 사전에 구체적으로 정의되지 않은 평가변수
- 데이터 기반의 가설 생성 목적
- 검증이 필요한 가설만 제시
- 결과 해석 시 신중함이 필요

---

## III. 다중성 문제 (Multiplicity Problem)

### 3.1 다중성의 정의 및 발생 원인

**다중성 (Multiplicity)**란 단일 임상시험에서 여러 개의 통계 검정이 수행될 때 발생하는 현상이다.

**다중성이 발생하는 주요 원인**:

1. **다중 평가변수 (Multiple Endpoints)**: 동일한 질문에 대해 여러 개의 평가변수로 검정
2. **다중 비교 (Multiple Comparisons)**: 2개 이상의 처리군(treatment group)을 비교
3. **부분군 분석 (Subgroup Analysis)**: 환자 부분군별로 반복되는 검정
4. **중간 분석 (Interim Analysis)**: 시험 진행 중 반복되는 검정
5. **반복 측정 (Repeated Measures)**: 동일한 변수를 여러 시점에서 측정 비교

### 3.2 다중성으로 인한 문제: 거짓양성 발생률 증가

**예시 계산**:

단일 검정에서 유의수준(α) = 0.05일 때:
- 1개 검정: P(적어도 1개 거짓양성) = 0.05
- 2개 독립 검정: P(적어도 1개 거짓양성) = 1 - (1-0.05)² = 0.0975 (97.5%)
- 5개 독립 검정: P(적어도 1개 거짓양성) = 1 - (0.95)⁵ ≈ 0.226
- 10개 독립 검정: P(적어도 1개 거짓양성) = 1 - (0.95)¹⁰ ≈ 0.401

**결론**: 다중성 조정 없이 다수의 검정을 수행하면 거짓양성 결론을 도출할 확률이 급격하게 증가한다.

### 3.3 가족단위 제1종 오류율 (Family-Wise Error Rate, FWER)

**정의**: 단일 시험에서 수행되는 모든 검정(family of tests) 중 **최소 1개 이상의 거짓양성(Type I error)이 발생할 확률**

**수식**:
$$\text{FWER} = P(\text{적어도 1개 이상의 Type I error})$$

**강한 FWER 통제 (Strong FWER Control)**:
- 모든 가능한 참 귀무가설(true null hypotheses) 조합에서 FWER ≤ α를 유지
- 일반적으로 임상시험에서 요구되는 기준

**약한 FWER 통제 (Weak FWER Control)**:
- 전체 귀무가설이 참일 때만 FWER ≤ α를 유지
- 실제로는 덜 엄격함

### 3.4 거짓발견율 (False Discovery Rate, FDR)

**정의**: 거짓양성(false positive)이 차지하는 비율

$$\text{FDR} = E\left[\frac{\text{Number of False Positives}}{\text{Total Number of Positives}}\right]$$

**FWER과의 관계**:
- FWER 통제가 더 엄격한 기준 (FDR 통제보다 보수적)
- FDR 통제는 다수의 검정에서 더 통계 검정력 제공

**FDR 통제 사용 시점**:
- 대규모 탐색적 분석(genome-wide association studies 등)
- 사후 검정(post-hoc) 분석
- 이차 또는 탐색적 평가변수 분석

---

## IV. 다중성 조정 방법 (Statistical Methods for Multiplicity Control)

### 4.1 개요 및 분류

FDA 가이던스에서 인정하는 주요 다중성 조정 방법:

1. **계층적 검정 (Hierarchical Testing/Gatekeeping)**
2. **동시 신뢰도 구간 (Simultaneous Confidence Intervals)**
3. **재표본추출 기반 방법 (Resampling-based Methods)**
4. **Bonferroni와 그 변형 (Bonferroni and Variants)**
5. **Hochberg 방법**
6. **Holm 방법**
7. **결합 검정 (Combination Tests)**

---

### 4.2 Bonferroni 방법

#### 정의
가장 보수적인 다중성 조정 방법으로, 각 검정에서 사용되는 유의수준을 검정 개수로 나누어 조정

#### 수식
$$\alpha_i = \frac{\alpha}{m}$$

여기서:
- α = 전체 유의수준 (typically 0.05)
- m = 검정 개수
- α_i = 각 개별 검정에서의 유의수준

#### 예시
- 5개 평가변수에 대해 검정할 경우:
  - 각 평가변수당 유의수준 = 0.05/5 = 0.01
  - 각 검정은 p-value < 0.01이어야만 유의

#### 장점
- 계산이 간단하고 직관적
- 어떤 검정 개수에서도 적용 가능
- 강한 FWER 통제를 보장

#### 단점
- 매우 보수적 (conservative): 통계 검정력 감소
- 다수의 검정에서 유의수준이 매우 작아짐
- 검정 간 독립성 가정이 완벽하지 않을 경우 더욱 보수적

#### FDA 권고사항
- 제한된 개수의 평가변수(e.g., 2-3개)가 있을 때 적합
- 더 복잡한 다중성 구조에서는 다른 방법 권장

---

### 4.3 Holm 방법 (Holm-Bonferroni Method)

#### 정의
Bonferroni 방법보다 덜 보수적인 방법으로, 단계적 접근을 통해 유의수준을 조정

#### 절차

1. **Step 1**: 모든 검정의 p-value를 오름차순으로 정렬: $p_{(1)} ≤ p_{(2)} ≤ ... ≤ p_{(m)}$

2. **Step 2**: 다음 유의수준과 비교:
   - $p_{(1)}$과 비교 할 유의수준: α/(m) = 0.05/5 = 0.01
   - $p_{(2)}$과 비교 할 유의수준: α/(m-1) = 0.05/4 ≈ 0.0125
   - $p_{(3)}$과 비교 할 유의수준: α/(m-2) = 0.05/3 ≈ 0.0167
   - ...
   - $p_{(m)}$과 비교 할 유의수준: α/1 = 0.05

3. **Step 3**:
   - $p_{(1)} < \frac{\alpha}{m}$이면 귀무가설 거부 → 다음 단계로 진행
   - $p_{(1)} ≥ \frac{\alpha}{m}$이면 이 이후의 모든 귀무가설 채택 → 중단

#### 예시
m=5, α=0.05인 경우:

| 순서 | p-값 | 비교 유의수준 | 결과 |
|------|------|-------------|------|
| p₍₁₎ | 0.001 | 0.05/5 = 0.010 | p < 0.010 → 거부 |
| p₍₂₎ | 0.008 | 0.05/4 = 0.0125 | p < 0.0125 → 거부 |
| p₍₃₎ | 0.015 | 0.05/3 = 0.0167 | p < 0.0167 → 거부 |
| p₍₄₎ | 0.025 | 0.05/2 = 0.025 | p = 0.025 → 거부 |
| p₍₅₎ | 0.032 | 0.05/1 = 0.050 | p < 0.050 → 거부 |

#### 장점
- Bonferroni보다 덜 보수적 (통계 검정력 더 높음)
- 강한 FWER 통제 보장
- 계산이 비교적 간단
- 검정 간 독립성 가정 필요 없음

#### 단점
- Bonferroni보다는 덜하지만 여전히 보수적
- 검정 간 음의 상관관계가 있으면 더욱 보수적

#### FDA 권고사항
- 제한된 개수의 평가변수(3-5개)에 적합
- 계층적 구조가 없는 경우 유용

---

### 4.4 Hochberg 방법

#### 정의
Holm 방법과 유사하지만, 하향식(top-down) 절차 대신 상향식(bottom-up) 절차를 사용하는 방법

#### 절차

1. **Step 1**: 모든 검정의 p-value를 오름차순으로 정렬: $p_{(1)} ≤ p_{(2)} ≤ ... ≤ p_{(m)}$

2. **Step 2**: 가장 큰 p-value부터 시작하여 검정:
   - $p_{(m)}$과 비교: α/1
   - $p_{(m-1)}$과 비교: α/2
   - ...
   - $p_{(1)}$과 비교: α/m

3. **Step 3**: 처음으로 $p_{(i)} < \frac{\alpha}{m-i+1}$을 만족하는 검정 i 찾기
   - 그러면 i번째부터 m번째까지의 모든 귀무가설 거부
   - i-1번째 이전의 귀무가설은 채택

#### 예시
| 순서 | p-값 | 비교 유의수준 | 검정 결과 |
|------|------|-------------|---------|
| p₍₅₎ | 0.032 | 0.05/1 = 0.050 | p < 0.050 ✓ (첫 번째 만족) |
| p₍₄₎ | 0.025 | 0.05/2 = 0.025 | (자동으로 거부) |
| p₍₃₎ | 0.015 | 0.05/3 ≈ 0.0167 | (자동으로 거부) |
| p₍₂₎ | 0.008 | 0.05/4 = 0.0125 | (자동으로 거부) |
| p₍₁₎ | 0.001 | 0.05/5 = 0.010 | (자동으로 거부) |

#### 장점
- Holm 방법보다 덜 보수적 (검정력 더 높음)
- 강한 FWER 통제 보장
- 특히 연관된(correlated) 검정에서 효율적

#### 단점
- 유효성이 양측(two-sided) 검정에서만 보증되거나 특정 조건 하에서만 적용 가능
- 계산이 Holm보다 약간 더 복잡할 수 있음

#### FDA 권고사항
- 중정도의 수의 평가변수(5-10개) 분석에 적합
- 검정 간 양의 상관관계 존재 시 특히 유용

---

### 4.5 계층적 검정/게이트키핑 (Hierarchical Testing/Gatekeeping Procedures)

#### 정의
평가변수 또는 가설을 논리적 순서대로 배열하고, 상위 단계의 가설이 채택(거부)되어야만 다음 단계의 가설을 검정하는 방법

#### 특징
- 평가변수 간의 논리적 관계를 반영
- "게이트(gate)" 역할을 하는 우선 평가변수가 통계적 유의성을 달성해야만 다음 평가변수 검정 가능
- 검정력 손실을 최소화하면서 FWER 통제 가능

#### 구조

**2단계 계층적 구조 예시**:

```
Level 1 (Gate 1): Primary Endpoint
  └─ If significant → proceed to Level 2
     Level 2a: Secondary Endpoint A
     Level 2b: Secondary Endpoint B
     Level 2c: Secondary Endpoint C
```

**3단계 계층적 구조 예시**:

```
Level 1: Primary Efficacy Endpoint
  └─ If significant → proceed to Level 2
     Level 2: Secondary Efficacy Endpoints (1-3 endpoints)
       └─ If all/specified endpoints significant → proceed to Level 3
          Level 3: Exploratory Endpoints
```

#### FDA 권고사항: 계층화의 원칙

1. **임상적 중요도 기반 순서 설정**
   - 가장 중요한 평가변수가 우선 검정
   - 예: 주평가변수 → 주요 부평가변수 → 탐색적 평가변수

2. **게이트 설정의 명확성**
   - "어느 평가변수가 유의성 달성 시 다음 단계 진행"인지 명확히 정의
   - 프로토콜에 사전 지정

3. **유의수준 할당**
   - 전체 α = 0.05를 여러 단계에 할당
   - 예: 주평가변수에 0.04, 부평가변수에 0.01 할당

#### 계층적 검정의 장점

1. **FWER 통제**: 강한 FWER 통제를 보장
2. **검정력 손실 최소화**: Bonferroni에 비해 검정력이 더 높음
3. **해석의 명확성**: 평가변수 간 논리적 관계가 명확
4. **임상적 의미 반영**: 평가변수의 임상적 중요도가 검정 우선순위에 반영

#### 계층적 검정의 단점

1. **엄격한 순서 규칙**: 상위 게이트 통과 필수
   - 상위 평가변수에서 유의성 미달 시 하위 평가변수 결과 무시됨
   - 의료 및 통계적 관점에서 유의한 결과가 있어도 보고 불가

2. **유연성 감소**: 사전 정의된 순서대로만 진행 가능

3. **통계 효율성**: 상위 평가변수 실패 시 하위 검정 능력 상실

#### 예시: 심부전(Heart Failure) 약물 시험

```
Primary Endpoint:
- Mortality (사망률)
  α = 0.025

If Primary Endpoint Significant (p < 0.025):
│
├─ Secondary Endpoint 1: Hospitalization due to HF
│  α = 0.0125 (from remaining 0.025 + 0.00625)
│
├─ Secondary Endpoint 2: Quality of Life Score
│  α = 0.0125
│
└─ Secondary Endpoint 3: LVEF Improvement
   α = 0.0125

If ALL Secondary Endpoints Significant:
│
└─ Exploratory: Subgroup Analyses (no formal α allocation)
```

---

### 4.6 결합 검정 (Combination Tests)

#### 정의
2개 이상의 개별 검정 결과를 결합하여 단일 결론을 도출하는 방법

#### 주요 유형

**Type 1: OR 결합 (Logical OR)**
- 구성 검정 중 **하나 이상**이 유의성을 달성하면 결합 귀무가설 거부
- 예: 마리화나 사용이 암 또는 심폐질환 위험 증가

**Type 2: AND 결합 (Logical AND)**
- 구성 검정 **모두**가 유의성을 달성해야만 결합 귀무가설 거부
- 예: 약물이 통증 감소 **그리고** 기능 개선을 모두 달성

**Type 3: 가중 조합 (Weighted Combination)**
- 각 검정에 임상적 중요도에 따른 가중치 부여
- 예: 주평가변수 가중치 70%, 부평가변수 가중치 30%

#### 통계적 원리

**p-value 결합 방법**:

1. **Fisher 방법** (양측):
   $$T = -2 \sum_{i=1}^{k} \ln(p_i) \sim \chi^2_{2k}$$

   여기서 k = 결합할 검정의 개수

2. **Stouffer 방법** (양측):
   $$Z = \sum_{i=1}^{k} \Phi^{-1}(1 - p_i) / \sqrt{k}$$

   여기서 Φ⁻¹는 표준정규분포의 역함수

3. **Tippett 방법** (양측):
   $$T = \min_{1≤i≤k} p_i$$

#### FDA 승인 사례: 결합 분석 (Co-Primary Endpoints)

**정의**: 약물의 효능을 입증하기 위해 2개 이상의 주평가변수가 모두 통계적 유의성을 달성해야 하는 경우

**예시**:
- Type 2 당뇨병 약물: HbA1c 감소 **AND** 체중 감소
- 고혈압 약물: 수축기 혈압 감소 **AND** 이완기 혈압 감소

**통계적 고려사항**:
- 2개 주평가변수가 모두 유의성 달성 필요
- 각 주평가변수에 일반적으로 α = 0.025 할당 (양측, 전체 α = 0.05)
- 또는 보다 보수적으로 각각 α = 0.025로 유지 (강한 통제)

---

### 4.7 재표본추출 기반 방법 (Resampling-based Methods)

#### 부트스트랩 (Bootstrap)

**정의**: 원본 데이터에서 복원 추출(with replacement)로 표본을 반복 생성하여 검정통계량의 분포를 추정하는 방법

**절차**:
1. 원본 데이터 (n개 관측치)에서 크기 n인 표본을 복원 추출로 생성: B번 반복 (e.g., B=10,000)
2. 각 재표본에서 검정통계량 계산
3. 검정통계량의 분포 형성
4. 신뢰도 구간 또는 p-value 계산

**장점**:
- 검정 간 상관관계 자동 반영
- 분포 가정 불필요 (비모수적)
- 복잡한 검정통계량에도 적용 가능

**단점**:
- 계산 비용이 높음
- 충분한 표본 크기 필요
- 결과 해석이 복잡할 수 있음

#### Permutation Test

**정의**: 귀무가설 하에서 데이터를 모든 가능한 방식으로 재배열하여 검정하는 방법

**절차**:
1. 관측된 검정통계량 계산
2. 처리(treatment) 할당을 모든 가능한 방식으로 재배열
3. 각 배열에서 검정통계량 재계산
4. 관측 검정통계량이 극단적인 값인지 평가

**특징**:
- 정확한(exact) p-value 계산 가능
- 작은 표본 크기에 적합
- 검정 간 상관관계 자동 반영

---

### 4.8 동시 신뢰도 구간 (Simultaneous Confidence Intervals)

#### 정의
하나 이상의 모수에 대해 사전에 정의된 신뢰도(confidence level)를 동시에 만족하는 신뢰도 구간 집합

#### 특징

**단일 신뢰도 구간**:
- 95% CI for parameter 1: 실제 모수가 이 구간에 포함될 확률 = 95%

**동시 신뢰도 구간 (Simultaneous 95% CI)**:
- 다중 모수에 대해 정의된 모든 구간이 동시에 실제 모수를 포함할 확률 = 95%
- FWER과 동일한 개념

#### 예시: 3개 평가변수에 대한 동시 신뢰도 구간

| 평가변수 | 점 추정치 | 95% CI | 결론 |
|---------|----------|--------|------|
| Endpoint 1 | -3.5 mmHg | [-5.2, -1.8] | Significant (0 포함 안 함) |
| Endpoint 2 | -2.1 mmHg | [-4.0, -0.2] | Significant (0 포함 안 함) |
| Endpoint 3 | -1.5 mmHg | [-3.5, 0.5] | Not significant (0 포함) |

**해석**: 이 세 구간이 동시에 적절한 신뢰도를 유지한다면, 평가변수 1, 2는 유의한 효과, 평가변수 3은 유의하지 않은 효과를 나타냄

#### FDA 권고사항
- 평가변수 간 상관관계가 있을 때 유용
- Scheffé, Tukey, Dunnett 등의 방법 활용 가능

---

## V. 특수 상황에서의 다중성 (Special Cases)

### 5.1 부분군 분석 (Subgroup Analyses)

#### 문제점
- 부분군의 수가 증가함에 따라 다중성 문제 발생
- 부분군별로 여러 평가변수 분석 시 다중성 기하급수적 증가
- 예: 3개 평가변수 × 5개 부분군 = 15개 검정

#### FDA 권고사항

1. **사전 정의 (Pre-specified)**
   - 프로토콜에 분석 부분군을 명시
   - 임상적 의의 있는 부분군만 선정
   - 부분군 정의 기준 명확히 제시

2. **제한된 개수**
   - 가능한 한 부분군 분석 개수 제한
   - 탐색적 부분군 분석은 검증 단계 필요

3. **다중성 조정**
   - 예: Bonferroni 또는 계층적 검정 적용
   - 또는 결과 해석 시 신중한 태도

4. **결과 해석**
   - 부분군 상호작용(interaction) 검정 권고
   - 개별 부분군 검정보다는 전체 모집단 결과 우선
   - 부분군 특이적 결과는 생성된 가설로 제시

### 5.2 중간 분석 (Interim Analysis)

#### 목적
- 시험 진행 중 조기 유효성 또는 안전성 평가
- 표본 크기 재계산
- 연구 중단(futility) 판단

#### 다중성 조정 방법

**1. 신뢰도 경계선 (O'Brien-Fleming Spending Function)**
```
분석 단계     1차 (50% 정보)    2차 (100% 정보)
유의수준      0.0051            0.0462
            (매우 엄격)        (느슨함)
```
- 초기 중간 분석에서 매우 엄격한 유의수준
- 최종 분석에 가까울수록 덜 엄격해짐
- 전체 FWER = 0.05 통제

**2. Pocock 경계선**
```
분석 단계     1차 (50%)    2차 (100%)
유의수준      0.0158       0.0158
           (항상 동일)
```
- 모든 분석 단계에서 동일한 유의수준 사용
- 계산이 간단하지만 최종 분석에서 통계 검정력 감소

#### FDA 권고사항

1. **사전 계획**
   - 중간 분석 시점, 정보도(information fraction), 의사결정 규칙 사전 지정
   - 프로토콜에 명시

2. **조건부 권력(Conditional Power) 고려**
   - 중간 분석에서 futility 판단 시 조건부 권력 계산
   - 현재까지의 효과 크기 및 남은 표본으로 최종 분석에서 충분한 검정력 있는지 확인

3. **보정 방법 적용**
   - O'Brien-Fleming, Pocock, Lan-DeMets 등 확립된 방법 사용
   - 각 분석 단계에서의 누적 제1종 오류 α를 명시

---

### 5.3 반복 측정 (Repeated Measures)

#### 상황
- 동일한 평가변수를 여러 시점(visits/timepoints)에서 측정
- 예: 주 1, 2, 4, 8, 12 방문 시점에 혈압 측정

#### 다중성 조정 방법

**방법 1: 계층적 구조**
```
Primary Analysis:
├─ Primary Timepoint: Week 12 (최종 시점)
└─ FWER 통제를 위해 다른 시점 분석은 보조적으로 수행
```

**방법 2: 사전 정의된 주요 시점**
- 프로토콜에 주요 평가 시점 명시 (e.g., Week 12만)
- 다른 시점은 탐색적으로 보고

**방법 3: 복합 점수**
- 모든 시점의 평균 또는 곡선 아래 면적(Area Under the Curve, AUC) 계산
- 단일 복합 평가변수로 분석

#### FDA 권고사항

1. **주요 분석 시점 사전 지정**
   - 일반적으로 최종 또는 중요한 1-2 시점만 주요 분석으로 지정

2. **조정 방법 선택**
   - 반복 측정 자료의 상관구조 고려
   - GEE, Mixed Model 등에서 자동으로 상관구조 반영 가능

3. **다중비교 보정**
   - Bonferroni, Hochberg, 또는 계층적 검정 적용 가능

---

### 5.4 복합 평가변수 분석 (Composite Endpoint Analysis)

#### 통계적 고려사항

**1. 성분 간 상관관계**
- 높은 양의 상관관계: 성분 중 하나가 지배적이 되어 전체 효과 단순화
- 음의 상관관계: 전체 효과의 방향이 불명확할 수 있음

**2. 성분별 효과 크기의 이질성(Heterogeneity)**

예: MACE (심근경색 + 뇌졸중 + 사망)
- 약물이 심근경색만 감소, 뇌졸중은 증가, 사망은 불변
- 복합 효과 해석이 복잡할 수 있음

#### 분석 권고사항

FDA는 복합평가변수에 대해 다음을 권고:

1. **주요 분석**
   - 사전 정의된 복합평가변수 전체 분석

2. **보조 분석**
   - 각 성분의 개별 분석 결과 제시
   - 성분 간 효과 크기 비교
   - 성분별 위해(harm) 또는 효과 이질성 평가

3. **추가 고려**
   - 성분의 상대적 임상적 중요도 명시
   - 성분 간 상관관계 평가
   - 각 성분의 발생 빈도(frequency) 비교

---

## VI. 규제 신청 시 고려사항 (Regulatory Considerations)

### 6.1 통계 분석 계획 (Statistical Analysis Plan, SAP)

#### SAP의 역할

SAP는 임상시험에서 수행될 모든 통계 분석을 사전에 명시한 문서로, 다중성 관리의 핵심이다.

#### SAP에 포함되어야 할 다중성 관련 내용

**1. 평가변수 정의 및 분류**
```
Primary Endpoints:
├─ Primary Efficacy Endpoint: Change in HbA1c from baseline to Week 24
└─ Primary Safety Endpoint: Adverse Events requiring treatment

Secondary Endpoints:
├─ Change in Fasting Glucose
├─ Change in Body Weight
├─ Change in Lipid Profile
└─ Health-Related Quality of Life

Exploratory Endpoints:
├─ Biomarker Changes
└─ Pharmacokinetic Parameters
```

**2. 평가변수 간 관계 명시**
- 어느 평가변수가 가장 중요한가?
- 평가변수 간 우선순위
- 각 평가변수의 임상적 의미

**3. 다중성 조정 전략**

**예시 SAP 기술**:

```markdown
### Multiple Comparison Adjustment Strategy

The trial employs a hierarchical testing procedure to control
the Family-Wise Error Rate (FWER) at 0.05 (two-sided).

Level 1 (Gate 1): Primary Efficacy Endpoint
- Hypothesis: HbA1c change differs between treatment and control
- α = 0.05 (two-sided)
- If significant → proceed to Level 2
- If not significant → all other efficacy endpoints considered supporting evidence only

Level 2: Secondary Efficacy Endpoints
- Available α: 0.05 (since Level 1 did not use it, or
  conditional on Level 1 significance)
- Bonferroni correction applied to 3 secondary endpoints
- Each endpoint α = 0.05/3 ≈ 0.0167 (two-sided)

Primary Safety Endpoint:
- Evaluated separately; FWER controlled independently
- No formal α allocation; descriptive summary
```

**4. 분석 방법**
- 사용할 통계 검정 명시
- 모수적/비모수적 방법 선택 근거
- 결측치 처리 방법
- 이상치(outlier) 처리 방법

**5. 부분군 분석**
- 사전 정의 부분군 명시
- 부분군 정의 기준
- 상호작용 검정 계획 포함

**6. 중간 분석 계획** (해당 시 포함)
- 중간 분석 시점 및 정보도
- 사용할 경계선 (O'Brien-Fleming, Pocock 등)
- Futility 판단 기준
- 의사결정 규칙

#### 예시: 계층적 검정 설계 (Hierarchical Testing Design in SAP)

```
PRIMARY ANALYSIS STRATEGY: Hierarchical Fixed Sequence Testing

┌─────────────────────────────────────────────────┐
│ Level 1: Primary Endpoint                        │
│ ├─ HbA1c Change (ITT Population)                │
│ └─ α = 0.05 (two-sided)                         │
│   └─ Success Criterion: p < 0.05                │
│     └─ If SUCCESS: Proceed to Level 2           │
│     └─ If FAIL: Stop, Level 2 endpoints         │
│        considered supporting evidence only      │
└─────────────────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────┐
│ Level 2: Secondary Efficacy Endpoints            │
│ (CONDITIONAL on Level 1 Success)                 │
│                                                  │
│ 2a. Weight Loss (per protocol α = 0.025)         │
│     └─ Bonferroni-adjusted α = 0.025/3          │
│                                                  │
│ 2b. Lipid Profile (per protocol α = 0.025)      │
│     └─ Bonferroni-adjusted α = 0.025/3          │
│                                                  │
│ 2c. Blood Pressure (per protocol α = 0.025)     │
│     └─ Bonferroni-adjusted α = 0.025/3          │
└─────────────────────────────────────────────────┘
                      │
                      ▼
┌─────────────────────────────────────────────────┐
│ Exploratory Endpoints:                           │
│ (No formal α allocation; p-values descriptive)  │
│ ├─ Quality of Life Score                        │
│ ├─ Biomarker Changes                            │
│ └─ Other exploratory analyses                   │
└─────────────────────────────────────────────────┘

SAFETY ENDPOINTS:
├─ Analyzed separately; no formal α allocation
├─ Descriptive summaries and listings provided
└─ Analysis conducted regardless of primary endpoint result
```

### 6.2 IND/BLA 신청 시 요구사항

#### IND (Investigational New Drug Application)

**다중성 관련 제출 내용**:
1. **Phase 1/2 단계**: 제한적 다중성 조정 (탐색 단계)
2. **Phase 2/3 단계**: 명확한 다중성 조정 전략 필수
   - SAP 제출
   - 평가변수 분류 명시
   - 통계 분석 계획 상세 기술

#### BLA/NDA (생물의약품/신약 허가 신청)

**제출 문서**:
1. **주요 효능 보고서 (Primary Efficacy Assessment)**
   - 주평가변수 분석 결과 상세 기술
   - 조정 방법 및 p-value 명시

2. **보조 효능 보고서 (Secondary Efficacy Assessment)**
   - 다중성 조정 방법 명시
   - 각 평가변수의 p-value 및 신뢰도 구간 제시
   - 임상적 중요도 해석

3. **종합 안전성 보고서 (Comprehensive Safety Summary)**
   - 안전성 평가변수 분석 (일반적으로 다중성 조정 불필요)
   - 이상 반응 발생 빈도 및 심각도

---

### 6.3 MFDS (식약처) 관련 고려사항

#### 한국 가이던스

MFDS는 "임상시험 계획서 작성 및 평가 가이드라인" 및 "의약품 임상시험 용어 표준화" 문서에서 다중성 조정을 권고:

1. **주평가변수 명시**
   - 단일 주평가변수 또는 co-primary endpoints 명시
   - 필요 시 복합평가변수 정의

2. **다중성 조정 방법**
   - Bonferroni, Hochberg, Holm 등 확립된 방법 권장
   - 계층적 검정 또는 게이트키핑 전략 권장

3. **SAP 제출**
   - 신약 허가 신청 시 상세한 SAP 제출 필수
   - 분석 계획 사전 지정(pre-specification) 강조

4. **CTDG (Common Technical Document) 작성 시**
   - Section 2.7.4.2: Study Report - Statistical sections
   - 다중성 조정 전략 명시
   - 각 평가변수별 분석 결과 제시

---

## VII. 실제 적용 사례 (Case Studies)

### 사례 1: Type 2 당뇨병 약물 (Antidiabetic Agent)

#### 시험 설계

**Primary Endpoint**:
- Change in HbA1c from baseline to Week 24 (이차 분석: ITT 모집단)

**Co-Primary Safety Endpoint**:
- Adverse events (AE) incidence rate (Safety population)

**Secondary Endpoints**:
1. Change in fasting plasma glucose (FPG)
2. Proportion of patients achieving HbA1c < 7%
3. Change in body weight
4. Change in lipid profile (total cholesterol, HDL, LDL, triglycerides)

**Exploratory Endpoints**:
- Change in C-peptide
- Change in proinsulin
- Biomarker changes (adiponectin, etc.)

#### 다중성 조정 전략

```
HIERARCHICAL TESTING STRATEGY:

Gate 1: Primary Efficacy Endpoint
├─ HbA1c Change (α = 0.025, ITT population)
└─ Success Criterion: p < 0.025

Gate 2: Primary Safety Endpoint (PARALLEL evaluation)
├─ AE Incidence Rate (α = 0.025, Safety population)
└─ No formal success criterion; descriptive evaluation

If Gate 1 SUCCESS:
│
└─ Level 2: Secondary Endpoints
   ├─ 2a. FPG Change (Bonferroni α = 0.025/4 ≈ 0.0063)
   ├─ 2b. HbA1c < 7% Achievement (Bonferroni α = 0.025/4)
   ├─ 2c. Body Weight Change (Bonferroni α = 0.025/4)
   └─ 2d. Lipid Profile Components (Hochberg correction)
      - Total Cholesterol (α = ...)
      - HDL (α = ...)
      - LDL (α = ...)
      - Triglycerides (α = ...)

If Gate 1 FAIL:
└─ Level 2 endpoints: Supporting evidence only (no formal α)
```

#### 결과 보고 예시

| 평가변수 | 비교 | 점 추정치 | 95% CI | p-value | 결론 |
|---------|------|---------|--------|---------|------|
| **Primary Efficacy** | | | | | |
| HbA1c Change | Drug vs. Control | -1.2% | [-1.5%, -0.9%] | 0.0012 | **Significant** (p < 0.025) |
| **Primary Safety** | | | | | |
| AE Incidence | Drug vs. Control | 45% vs. 42% | [38%, 52%] | 0.24 | No difference |
| **Secondary Efficacy** (Level 2) | | | | | |
| FPG Change | Drug vs. Control | -22 mg/dL | [-35, -9] | 0.0008 | **Significant** (p < 0.0063) |
| HbA1c < 7% | Drug vs. Control | 68% vs. 45% | [60%, 76%] | 0.0002 | **Significant** (p < 0.0063) |
| Body Weight | Drug vs. Control | -2.5 kg | [-4.1, -0.9] | 0.008 | **Significant** (p < 0.0063) |
| Total Cholesterol | Drug vs. Control | -15 mg/dL | [-32, 2] | 0.082 | Not significant |
| HDL | Drug vs. Control | +4 mg/dL | [1, 7] | 0.018 | **Significant** (Hochberg) |
| LDL | Drug vs. Control | -12 mg/dL | [-28, 4] | 0.12 | Not significant |
| Triglycerides | Drug vs. Control | -35 mg/dL | [-68, -2] | 0.035 | Not significant |

---

### 사례 2: 암(Oncology) 약물 — 복합평가변수

#### 시험 설계

**Primary Endpoint**:
- Overall Survival (OS): 임상적으로 가장 중요한 결과

**Secondary Endpoints**:
1. **Progression-Free Survival (PFS)**
2. **Objective Response Rate (ORR)**
3. **Duration of Response (DOR)**
4. **Quality of Life (QoL)** - EORTC QLQ-C30

#### 다중성 조정 전략

```
ANALYSIS HIERARCHY:

PRIMARY ANALYSIS:
├─ Overall Survival (OS)
│  └─ α = 0.05 (two-sided log-rank test)
│     └─ Landmark Analysis: 2-year OS rate
│        └─ Success Criterion: p < 0.05
└─ Only if OS significant: Proceed to Level 2

LEVEL 2: SECONDARY ENDPOINTS
├─ Progression-Free Survival (PFS)
│  └─ Bonferroni-adjusted α = 0.05/4 = 0.0125
├─ Objective Response Rate (ORR)
│  └─ Bonferroni-adjusted α = 0.0125
├─ Duration of Response (DOR)
│  └─ Bonferroni-adjusted α = 0.0125
└─ Quality of Life (QoL)
   └─ Bonferroni-adjusted α = 0.0125

EXPLORATORY ANALYSES:
├─ Biomarker-Stratified Analyses (Subgroup Analysis)
├─ Landmark Analyses at different time points
└─ Sensitivity Analyses
```

**주의**: 암 약물의 경우 OS (전체 생존)가 가장 강력한 효능 증거이므로,
FDA는 일반적으로 OS 유의성을 최우선적으로 요구한다.

---

### 사례 3: 심혈관계 약물 — Co-Primary Endpoints

#### 시험 설계

**Primary Efficacy Endpoint**:
- 심근경색(MI) 위험 감소

**Primary Safety Endpoint**:
- 모니터링되는 특정 안전성 이벤트 (e.g., muscle toxicity)

**복합 분석**: Co-Primary Efficacy/Safety Endpoints
```
약물이 효과적이려면:
1. MI 위험 통계적 유의하게 감소 (p < 0.025, two-sided) AND
2. 근육 독성 증가 없음 (p > 0.05 for increased risk)
```

#### 다중성 조정

```
Co-Primary Endpoints Analysis (Logical AND):

Hypothesis 1: MI Risk Reduction
├─ Null: HR_MI = 1.0
├─ Alternative: HR_MI < 1.0
└─ α = 0.025 (one-sided) or 0.05 (two-sided, split between two endpoints)

AND

Hypothesis 2: No Increased Muscle Toxicity
├─ Null: Incidence_Drug > Incidence_Control
├─ Alternative: Incidence_Drug ≤ Incidence_Control
└─ α = 0.025

COMBINED CONCLUSION:
If both p1 < 0.025 AND (not p2_safety < threshold) → EFFICACY ESTABLISHED
```

---

## VIII. 통계 방법 비교표 (Comparison of Statistical Methods)

| 방법 | 적용 상황 | 장점 | 단점 | FWER 통제 |
|------|---------|------|------|---------|
| **Bonferroni** | 2-3개 평가변수 | 간단, 직관적 | 매우 보수적, 검정력 저하 | 강함 |
| **Holm** | 3-5개 평가변수 | Bonferroni보다 덜 보수적 | 여전히 보수적 | 강함 |
| **Hochberg** | 5-10개 평가변수 | Holm보다 덜 보수적 | 계산 복잡도 증가 | 강함 |
| **Hierarchical/Gatekeeping** | 계층적 구조 있는 경우 | 검정력 손실 최소화, 임상적 의미 반영 | 엄격한 순서 규칙, 유연성 낮음 | 강함 |
| **Combination Tests** | Co-Primary, 복합 | 임상적으로 의미 있는 결론 | 해석 복잡, 계산 복잡 | 강함 |
| **Bootstrap/Permutation** | 복잡한 통계량 | 분포 가정 불필요, 상관관계 자동 반영 | 계산 비용 높음 | 약함* |
| **FDR Correction** | 탐색적 분석, 다수의 검정 | 검정력 높음 | 약함, 거짓양성 비율만 통제 | 약함 |

*Bootstrap/Permutation은 적절히 설계되면 FWER 통제 가능

---

## IX. 최신 고려사항 및 권고사항 (Recent Considerations)

### 9.1 기계학습(ML)/인공지능(AI) 기반 분석

종래의 통계 기반 다중성 조정이 기계학습 모델에 직접 적용되지 않을 수 있으므로:

1. **명확한 주평가변수 정의 필수**
2. **검증 데이터셋(validation set) 사용**
3. **사전 명시된 분석 계획**
4. **복제(replication) 또는 외부 검증**

### 9.2 적응형 시험 설계 (Adaptive Trial Design)

중간 분석 결과에 따라 시험 설계를 수정하는 적응형 시험에서:

1. **미리 정의된 적응 규칙**
2. **Conditional Type I error control**
3. **최종 분석에서의 p-value 조정**

---

## 📋 핵심 통계 개념 정의 모음

| 용어 (영문) | 한국어 | 설명 |
|-------------|--------|------|
| **Endpoint** | 평가변수 | 임상시험에서 측정되는 임상 결과 또는 중간 결과 |
| **Primary Endpoint** | 주평가변수 | 시험의 주요 목적을 달성했는지를 판단하는 가장 중요한 평가변수 |
| **Secondary Endpoint** | 부평가변수 | 주평가변수를 지지하거나 추가적 효과를 평가하는 평가변수 |
| **Composite Endpoint** | 복합평가변수 | 2개 이상의 개별 이벤트로 구성된 평가변수 |
| **Multiplicity** | 다중성 | 단일 시험에서 여러 개의 통계 검정이 수행되는 상황 |
| **Type I Error** | 제1종 오류 | 귀무가설이 참인데 거부하는 오류 (거짓양성) |
| **Type II Error** | 제2종 오류 | 귀무가설이 거짓인데 채택하는 오류 (거짓음성) |
| **Family-Wise Error Rate (FWER)** | 가족단위 제1종 오류율 | 다중 검정 중 최소 1개 이상의 거짓양성이 발생할 확률 |
| **False Discovery Rate (FDR)** | 거짓발견율 | 거짓양성 결과가 차지하는 비율 |
| **Statistical Significance** | 통계적 유의성 | 관측된 결과가 확률적으로 우연이 아닐 가능성 |
| **Significance Level (α)** | 유의수준 | 제1종 오류를 허용할 최대 확률 (일반적으로 0.05) |
| **p-value** | p값 | 귀무가설이 참일 때 관측된 결과 이상이 나올 확률 |
| **Confidence Interval** | 신뢰도 구간 | 모수가 포함될 가능성이 있는 범위 |
| **Hierarchical Testing** | 계층적 검정 | 평가변수를 논리적 순서대로 배열하여 순차적으로 검정 |
| **Gatekeeping** | 게이트키핑 | 상위 게이트가 통과되어야만 하위 평가변수 검정 가능 |
| **Bonferroni Correction** | Bonferroni 보정 | 각 검정의 유의수준을 검정 개수로 나누어 조정 |
| **Holm Procedure** | Holm 절차 | p-value를 오름차순 정렬하여 단계적으로 조정 (Bonferroni 개선) |
| **Hochberg Procedure** | Hochberg 절차 | Holm과 유사하나 하향식 절차 사용 (덜 보수적) |
| **Simultaneous Confidence Intervals** | 동시 신뢰도 구간 | 다중 모수에 대해 동시에 정의된 신뢰도를 만족하는 구간 |
| **Combination Tests** | 결합 검정 | 2개 이상의 개별 검정 결과를 결합하여 단일 결론 도출 |
| **Co-Primary Endpoints** | 공-주평가변수 | 약물 효능을 입증하기 위해 2개 이상의 주평가변수가 모두 유의성 달성 필요 |
| **Subgroup Analysis** | 부분군 분석 | 특정 환자 특성별로 약물 효과를 평가 |
| **Interim Analysis** | 중간 분석 | 시험 진행 중 조기에 수행하는 효능/안전성 평가 |
| **Futility Analysis** | 무익성 분석 | 최종 분석에서 유의한 결과 도출 불가능성을 평가하여 시험 중단 판단 |
| **Information Fraction** | 정보도 | 중간 분석 시점에서 계획된 최종 정보량의 몇 %에 도달했는지 나타내는 비율 |
| **O'Brien-Fleming Spending Function** | O'Brien-Fleming 경계선 | 초기 중간 분석에서 엄격, 최종 분석에서 느슨해지는 유의수준 배분 |
| **Pocock Boundary** | Pocock 경계선 | 모든 분석 단계에서 동일한 유의수준 사용하는 방법 |
| **Statistical Power** | 통계 검정력 | 실제로 차이가 있을 때 이를 검출할 확률 (1 - β) |
| **Effect Size** | 효과 크기 | 두 그룹 간 또는 처리 전후의 차이 정도 |
| **Sample Size Calculation** | 표본 크기 계산 | 통계적 검정력을 충분히 확보하기 위한 필요 표본 크기 결정 |
| **Intent-to-Treat (ITT)** | 의도된 치료 분석 | 무작위 배정된 모든 피험자를 할당된 그룹으로 분석 |
| **Per-Protocol (PP)** | 프로토콜 준수 분석 | 프로토콜 계획에 따라 약물을 투여 받은 피험자만 분석 |
| **Safety Endpoints** | 안전성 평가변수 | 약물의 부작용 또는 안전성 관련 측정치 |
| **Biomarker** | 생물 표지자 | 질병 상태 또는 약물 효과를 나타내는 객관적 지표 |
| **Efficacy** | 효능/유효성 | 임상 환경에서 약물이 의도된 효과를 나타내는 정도 |
| **Safety Profile** | 안전성 프로필 | 약물이 나타내는 부작용 및 안전성의 전반적 특성 |

---

## ⚖️ 규제 시사점 (FDA/MFDS 관점)

### FDA 신청 시 활용 방법

#### 1단계: IND (Investigational New Drug) 신청 단계

- **제출 내용**: Investigator's Brochure (IB)에서 선행 시험 결과 및 다중성 조정 방법 언급
- **Phase 2/3 시험 프로토콜**: 명확한 다중성 조정 전략 포함
- **통계 단원**: Statistical Considerations 섹션에서 다중성 조정 방법 상세 기술

#### 2단계: 임상시험 진행 중

- **SAP (Statistical Analysis Plan)**: 시험 개시 전 또는 최대한 조기에 최종화
- **IND 안전성 보고서**: 중간 분석 결과 보고 시 다중성 조정 방법 명시
- **Adaptive Design**: 중간 분석에서 유의수준 조정 규칙 사전 명시

#### 3단계: NDA/BLA 신청 단계

**주요 제출 문서**:

1. **Module 5: Clinical Study Reports (CSRs)**
   - 각 임상시험 최종 보고서 (완전한 통계 분석 결과 포함)
   - 다중성 조정 방법 및 결과 명시
   - 각 평가변수의 p-value 및 95% CI 제시

2. **Module 2.3: Quality Overall Summary (통합 요약)**
   - 적응형 설계의 경우 최종 p-value 조정 설명

3. **Module 2.5: Clinical Summary**
   - 주평가변수 결과 상세 기술
   - 부평가변수 결과 (다중성 조정 언급)
   - 임상적 의미 해석

4. **통계 부분 (Module 5.3.5)**
   - 통계 분석 계획 요약
   - 다중성 조정 방법 및 수식
   - 최종 분석 결과 (조정 전/후 p-value)

---

### MFDS (식약처) 관련성

#### 한국 규제 환경

**MFDS 가이던스 문서**:
- "의약품 임상시험 계획서 및 결과 보고에 관한 기준" (GCP 가이드라인)
- "의약품 개발 단계별 임상시험 계획 가이드라인"
- "생물의약품 임상시험 계획 및 결과 평가 가이드라인"

**다중성 관련 요구사항**:

1. **임상시험 계획서 (ICP) 작성 시**
   - 주평가변수 명시 (일반적으로 1개, 또는 사전 정당화된 다중 주평가변수)
   - 부평가변수 명시
   - 다중성 조정 방법 기술

2. **최종 임상시험 결과 보고서 작성 시**
   - 사용된 다중성 조정 방법 명시
   - 각 평가변수별 분석 결과 (조정 전/후 p-value)
   - 통계 분석 계획과의 일치성 확인

3. **의약품 허가 신청 시**
   - CTD (Common Technical Document) 형식 제출
   - Module 5에 상세한 통계 분석 결과 포함
   - 다중성 조정이 적절히 수행되었음을 입증

#### 한국 임상시험 특성

- **다국가 공동 임상시험 (Multi-Regional Clinical Trials, MRCT)**:
  - FDA/EMA와 동일한 다중성 조정 기준 적용 권장
  - 글로벌 시험의 경우 FDA 가이던스 준용

- **적응형 시험 설계**:
  - 중간 분석 결과에 따른 시험 설계 수정 시 사전 계획 필수
  - 최종 p-value 조정 명시

---

### SAP (Statistical Analysis Plan) 작성 유의사항

#### SAP 작성 원칙

**1. 사전 명시 (Pre-specification)**
- 데이터 확인 전에 작성
- 시험 개시 전 완성이 이상적
- 최소한 데이터 lock 전에 최종화
- 문서화된 버전 관리 필수

**2. 명확성 (Clarity)**
```markdown
❌ 나쁜 예:
"We will analyze primary efficacy endpoints using appropriate
statistical methods and adjust for multiplicity as needed."

✓ 좋은 예:
"Primary Efficacy Analysis:
- Endpoint: Change in HbA1c from baseline to Week 24
- Comparison: Treatment vs. Control (t-test)
- Analysis Population: Intent-to-Treat (ITT)
- Multiplicity Adjustment: Bonferroni correction
- Target α: 0.05 (two-sided)
- Adjusted α per endpoint: 0.025 (for 2 primary endpoints)
- Success Criterion: p < 0.025"
```

**3. 정당성 (Justification)**
- 선택된 다중성 조정 방법의 근거 제시
- 평가변수 분류의 임상적 정당화
- 샘플 크기 계산 방법 설명

#### SAP 필수 포함 항목

```markdown
# Statistical Analysis Plan (SAP) Template

## 1. Overview
- 시험의 목적 및 설계
- 주요 가설

## 2. Study Objectives and Endpoints
### 2.1 Primary Objective
- Primary Efficacy Endpoint 정의
- 비교 기준 (차이, 비율 등)

### 2.2 Secondary Objectives
- 각 Secondary Endpoint 명시
- 임상적 중요도 설명

### 2.3 Exploratory Objectives
- 탐색적 평가변수 (해당 시)

## 3. Statistical Methods
### 3.1 Analysis Populations
- ITT, PP, Safety population 정의
- 제외 기준 명시

### 3.2 Primary Analysis
- 사용할 통계 검정 (parametric, non-parametric)
- Assumptions 및 검정 방법
- 결측치 처리 방법

### 3.3 Multiplicity Adjustment Strategy
#### 평가변수 분류:
- Gate 1: Primary Endpoints
  - Endpoint A (α = 0.025)
  - Endpoint B (α = 0.025)
- Gate 2: Secondary Endpoints (조건부 분석)
  - Endpoint C (Bonferroni α = 0.025/3)
  - Endpoint D
  - Endpoint E

#### 조정 방법:
- Hierarchical testing procedure (Name/Reference)
- Type I error control: FWER
- If interim analysis: Boundary type (O'Brien-Fleming/Pocock)

### 3.4 Subgroup Analyses
- 사전 정의 부분군 명시
- 각 부분군 크기
- 상호작용 검정 계획

### 3.5 Interim Analysis (해당 시)
- 분석 시점 및 정보도
- 의사결정 규칙
- Futility criterion

## 4. Sensitivity Analyses
- LOCF (Last Observation Carried Forward) vs. observed data
- 이상치 포함/제외 분석
- 프로토콜 위반 대상자 처리

## 5. Sample Size Calculation
- 주요 가정 (기저 효과율, 기대 효과 크기)
- 통계 검정력 (일반적으로 80% 또는 90%)
- 탈락율(dropout rate)

## 6. References
- 통계 방법론 문헌
- 관련 가이던스 (FDA, EMA, MFDS)
```

---

## 💬 개인 메모
<!-- 추후 직접 작성 공간 -->

### 추가 학습 자료

1. **FDA 관련 가이던스**
   - Multiple Endpoints in Clinical Trials (2022)
   - Adaptive Design Clinical Trials for Drugs and Biologics (2019)
   - Multiple Comparisons in Clinical Trials (2001)

2. **통계 교재**
   - Dmitrienko, A., Tamhane, A. C., & Bretz, F. (2009). Multiple Testing Problems in Pharmaceutical Statistics. Chapman and Hall/CRC
   - Hochberg, Y., & Tamhane, A. C. (1987). Multiple Comparison Procedures. John Wiley & Sons

3. **실무 자료**
   - FDA CDER/CBER 웹사이트의 Q&A 섹션
   - 임상시험 통계 관련 국제 협회 (International Society for Biopharmaceutical Statistics, ISBS)
   - 한국 생물통계학회 (Korean Statistical Society)

### 실제 임상시험 설계 체크리스트

- [ ] 주평가변수가 명확하고 단일하게 정의되었는가?
- [ ] 부평가변수/탐색적 평가변수가 분류되었는가?
- [ ] 다중성 조정 방법이 사전 정의되었는가?
- [ ] SAP에 다중성 조정 전략이 명시되었는가?
- [ ] 부분군 분석이 사전 정의되었는가?
- [ ] 중간 분석 계획이 있는가? (있다면 경계선 정의)
- [ ] 표본 크기가 주평가변수 기반으로 계산되었는가?
- [ ] 통계학자가 시험 설계 단계부터 참여했는가?
- [ ] Regulatory pathway (FDA/MFDS) 고려사항을 검토했는가?

---

**마지막 업데이트**: 2026-03-14
**가이던스 원본 발행일**: 2022-10 (FDA)
**문서 버전**: 1.0
