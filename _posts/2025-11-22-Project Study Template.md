---
title: 의료기기 임상 Project Template 개발 및 활용
date: 2025-11-22
categories: [KOR, etc (KOR)]
tags: [korean]   # lower case 
author: <Tea Tasting Lady>
math: true
--- 

# Introduction
올해 5월 중순에 신입 팀원이 BSA(Biostatistician Associate) 으로 합류하였고 저는 BSM (Biostatistician Manager)으로써 함께 의료기기 임상통계 업무를 잘 해나갈 구조를 만들어가고 있습니다. 회사에서 맡은 의료기기 임상시험과 관련된 통계 업무를 잘 하기 위해서는 통계 분석을 위한 코딩 기술과 같은 통계 역량과 함께 해당 임상 연구에 대해 잘 이해하는 것도 중요합니다. 의료기기 임상 통계 업무를 체계적으로 하기 위해 매 프로젝트 마다 작성하는 임상 Project Study page 를 고안하게 되었습니다. 

# Motivation
의료기기는 수술 시 대상자의 몸 안에 이식되어 유효성, 안전성 평가가 이루어지는 유착방지재, 미용 목적의 필러와 같은 유형부터 의료 영상에  병변 여부를 표시해주는 AI 소프트웨어까지 그 범주가 다양합니다. 의료기기 임상도 어떤 유형의 의료기기인지에 따라 시험군과 대조군을 무작위배정하는 RCT(Randomized Clinical trial)부터 새로운 대상자의 등록 없이 병원 등에 이미 있는 영상 자료를 활용하는 후향적 임상 연구까지 그 형태가 다양합니다. 팀원이 맡은 프로젝트의 임상통계 업무를 하면서 관련 도메인 지식을 함께 공부하고, 또 정리하여 회사 내에 같은 프로젝트를 하는 다른 직군에게도 해당 임상 연구의 이해에 도움이 되도록 이 템플릿을 개발하였습니다. 

# Template Structure
임상 Project Study Template  구조 입니다.
![Project Structure](../img/Template_Structure.png) 

## 1. Regulatory Framework
### 1. 1 관련 규정 
 어떤 법령에 따라 의료기기 임상시험 업무를 하는 지에 대해 정리하기 위해 이 부분을 구성하였습니다. 가령, 의료기기 임상시험계획서 작성 업무를 진행할 때 링크하는 규정은 "의료기기 임상시험계획 승인에 관한 규정" 입니다. 
### 1.2 의료기기 Guideline
해당 의료기기에 대해 참조할 규제기관의 가이던스가 있는 경우, 해당 품목의 가이던스 링크를 소개합니다. 가령 성형용 필러 프로젝트를 진행할 경우, 식약처서 발간된 성형용 필러 허가김사 가이드라인(민원인 안내서) 을 첨부합니다. 

## 2. Study Design
임상 연구의 목적, 연구 유형, 연구 모집단에 대해 항목별로 소개합니다. 

## 3. Sample Size Estimation
대상자 수 산정에 대한 부분은 1차 평가 변수, 대상자 수 산정 공식, 효과 크기에 대해 항목별로 기술합니다. 

## 4. Statistical Methodology
계획서에 기술된 1차, 2차 평가변수들의 통계 분석방법에 대해 어떤 통계 검정방법이 적용되었는 지 위주로 기술 합니다. 

## 5. Study Research
진행하는 프로젝트 관련 기술이나 평가변수에 대해 추가로 조사한 것들에 대해 기술합니다. 가령, 당뇨병 연구에서 CGM 관련 metric 을 어떻게 평가해야 하는 지와 같은 평가 지표 관련된 개념을 정리하거나, Automated Insulin Delivery 와 같은 연관 기술에 대해 조사한 내용을 소개하고 참조한 문헌을 첨부합니다. 

# Application
맡은 의료기기 임상 프로젝트마다 템플릿을 활용하여 표준화된 형식으로 정보들을 정리해나가고 있습니다. 임상시험계획서에 기술된 내용들을 기본으로, 의료기기 임상연구와 관련된 도메인 지식이 팀원에게 계속 쌓여 나가기를 기대하고 있습니다. 임상시험이 종료되고 임상시험 결과 분석을 정확히 해나갈 때에도 이렇게 정리한 내용들이 유용할 것입니다. 또한, Medical Writer, CRA, PM 등 함께 프로젝트를 진행하는 모든 멤버들에게도 공유하여 임상에 대한 이해에 도움이 되도록 하고 있습니다.  

# Template 공유
국내 의료기기 임상 연구를 수행하는 다른 분들에게도 도움이 되기를 바라며, 사용하는 템플릿을 공유드립니다. 마크다운 형식으로 작성이 되었고 연구 상황에 맞게 활용해보시면 좋겠습니다. 

---
# 임상 Project Study Template 
# Project Details 
- Project ID (프로젝트 ID): 
- 제품명 (Device Name): [Device Name - 제품명]
- 품목명 및 품목별 등급 :e.g., 혈관용 스텐트 [3]
- Regulatory Agency (규제 기관): MFDS (대한민국 식품의약품안전처)

## 1. Regulatory Framework (규제 체계)
### 1.1 Primary Regulations (주요 규정)
- 의료기기 인허가 절차 (의료기기안심책방): [https://emedi.mfds.go.kr/contents/MNU20292](https://emedi.mfds.go.kr/contents/MNU20292)
- 의료기기 허가.신고.심사등에 관한 규정 (시행 2023.12.19): [https://www.law.go.kr/LSW/admRulLsInfoP.do?admRulId=38024&efYd=0](https://www.law.go.kr/LSW/admRulLsInfoP.do?admRulId=38024&efYd=0)
- 의료기기 품목 및 품목별 등급에 관한 규정 (시행 2024. 4. 8) : [https://www.law.go.kr/%ED%96%89%EC%A0%95%EA%B7%9C%EC%B9%99/%EC%9D%98%EB%A3%8C%EA%B8%B0%EA%B8%B0%20%ED%92%88%EB%AA%A9%20%EB%B0%8F%20%ED%92%88%EB%AA%A9%EB%B3%84%20%EB%93%B1%EA%B8%89%EC%97%90%20%EA%B4%80%ED%95%9C%20%EA%B7%9C%EC%A0%95](https://www.law.go.kr/%ED%96%89%EC%A0%95%EA%B7%9C%EC%B9%99/%EC%9D%98%EB%A3%8C%EA%B8%B0%EA%B8%B0%20%ED%92%88%EB%AA%A9%20%EB%B0%8F%20%ED%92%88%EB%AA%A9%EB%B3%84%20%EB%93%B1%EA%B8%89%EC%97%90%20%EA%B4%80%ED%95%9C%20%EA%B7%9C%EC%A0%95)
- 의료기기 임상시험계획 승인에 관한 규정 (시행 2023.2.14) : [https://www.law.go.kr/admRulLsInfoP.do?admRulId=33367&efYd=0](https://www.law.go.kr/admRulLsInfoP.do?admRulId=33367&efYd=0)
- 의료기기법 시행규칙 (시행 2025. 1.17): [https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EC%9D%98%EB%A3%8C%EA%B8%B0%EA%B8%B0%EB%B2%95%20%EC%8B%9C%ED%96%89%EA%B7%9C%EC%B9%99](https://www.law.go.kr/%EB%B2%95%EB%A0%B9/%EC%9D%98%EB%A3%8C%EA%B8%B0%EA%B8%B0%EB%B2%95%20%EC%8B%9C%ED%96%89%EA%B7%9C%EC%B9%99)
- 의료기기 임상시험 관리기준 (2024.1.16 개정), 의료기기법 시행규칙 별표3: [https://cmcohrp.cmcnu.or.kr/resources/attach/%EC%9D%98%EB%A3%8C%EA%B8%B0%EA%B8%B0%EC%9E%84%EC%83%81%EC%8B%9C%ED%97%98%EA%B4%80%EB%A6%AC%EA%B8%B0%EC%A4%80(%EC%A0%9C24%EC%A1%B0%EC%A0%9C1%ED%95%AD%20%EA%B4%80%EB%A0%A8)(%EC%9D%98%EB%A3%8C%EA%B8%B0%EA%B8%B0%EB%B2%95%EC%8B%9C%ED%96%89%EA%B7%9C%EC%B9%99).pdf](https://cmcohrp.cmcnu.or.kr/resources/attach/%EC%9D%98%EB%A3%8C%EA%B8%B0%EA%B8%B0%EC%9E%84%EC%83%81%EC%8B%9C%ED%97%98%EA%B4%80%EB%A6%AC%EA%B8%B0%EC%A4%80(%EC%A0%9C24%EC%A1%B0%EC%A0%9C1%ED%95%AD%20%EA%B4%80%EB%A0%A8)(%EC%9D%98%EB%A3%8C%EA%B8%B0%EA%B8%B0%EB%B2%95%EC%8B%9C%ED%96%89%EA%B7%9C%EC%B9%99).pdf)

### 1.2 Related Guidelines (관련 가이드라인)
- 의료기기 허가.심사 첨부자료 가이드라인: [https://www.mfds.go.kr/brd/m_1060/view.do?seq=15286&multi_itm_seq=0&page=6](https://www.mfds.go.kr/brd/m_1060/view.do?seq=15286&multi_itm_seq=0&page=6)
- 의료기기 임상시험 길라잡이: [https://www.mfds.go.kr/brd/m_1060/view.do?seq=14534&srchTp=0&multi_itm_seq=0&Data_stts_gubun=C1004&page=9](https://www.mfds.go.kr/brd/m_1060/view.do?seq=14534&srchTp=0&multi_itm_seq=0&Data_stts_gubun=C1004&page=9)
- 의료기기 임상시험 결과보고서 작성 가이드라인: [https://www.mfds.go.kr/brd/m_1060/view.do?seq=14431&srchTp=0&multi_itm_seq=0&Data_stts_gubun=C1004&page=1](https://www.mfds.go.kr/brd/m_1060/view.do?seq=14431&srchTp=0&multi_itm_seq=0&Data_stts_gubun=C1004&page=1)
- 의료기기 임상시험 관련 통계기법 정보자료집 (2022.12) : [https://www.nifds.go.kr/brd/m_18/view.do?seq=12679](https://www.nifds.go.kr/brd/m_18/view.do?seq=12679)
- Device-Specific Guidance Documents (품목별 가이드라인): 

## 2. Study Design (연구 설계)

### 2.1 Study Objective (연구 목적)
- Primary Objective
- Secondary Objective
### 2.2 Study Type (연구 유형)
- Study Design (연구 설계):
    - [ ] RCT (Randomized Controlled Trial, 무작위 대조 시험)
	    -  배정방식
		    - [ ] Stratified Randomization
		    - [ ] Block Randomization 
		-  배정 비율
			- [ ] 1:1 
    - [ ] Single-arm (단일군)
    - [ ] Non-inferiority (비열등성)
    - [ ] Superiority (우월성)
    - [ ] Equivalence (동등성)
    - [ ] Other (기타): 
- Control Type (대조군 유형):
    - [ ] Active (활성 대조군)
    - [ ] Placebo 
    - [ ] Historical (과거 자료)
    - [ ] None (대조군 없음)
    - [ ] Standard of Care (표준 치료)
    - [ ] Sham Control (sham 대조군)
    - [ ] Other (기타):
- Blinding Status (눈가림 상태):
    - [ ] Open-label (공개)
    - [ ] Single-blind (단일 눈가림)
    - [ ] Double-blind (이중 눈가림)
    - [ ] Triple-blind (삼중 눈가림)

### 2.3 Study Population (연구 대상 모집단)
- Target Population (목표 모집단): 
- Indication (적응증): 
## 3. Sample Size Calculation (대상자수 산출)
### 3.1 Primary Endpoint
- Endpoint Type (평가변수 유형):
    - [ ] Binary (이분형)
    - [ ] Continuous (연속형)
    - [ ] Time-to-event (시간-사건형)
    - [ ] Ordinal (순서형)
    - [ ] Categorical (범주형)
    - [ ] Other (기타): 
- Primary Hypotheses (연구 가설)
- Expected Effect Size (예상 효과 크기): [Clinically meaningful difference, justify with references - 임상적으로 유의미한 차이, 근거 제시]
- Non-inferiority margin (비열등성 마진): [비열등성 마진 크기와 해당 크기 설정 근거 간략히 기술]
- Reference Studies/Literature (참고 문헌/연구): [List key references for effect size - 효과 크기 추정 참고 문헌 목록]
- Stat Parameters(통계 검정 고려요소)
    - 유의수준: 0.05 (two-sided, 양측 검정)
    - 검정력: 0.8 , 0.9 
     - Dropout Rate (탈락률): 0.1 ~ 0.3 

### 3.2 Sample Size Formula and Calculations (표본 크기 공식 및 계산)
- 산출 공식 제시 
- 산출 parameter 제시
	- 표준편차, 효과크기, 비열등성 마진, 유의수준, 검정력 등 
	- 공식에 들어가는 요소들 숫자로 제시 
- 연구 가설 (귀무가설, 대립가설 제시)
- 산출 결과 
	- n = ** 명, 탈락률 ** % 고려 시 N = ** 명, 군 별 1:1 비율로 등록하여 총 대상자 ** 명을 대상으로 본 임상을 진행하고자 함 

### 3.3 References for Effect Size Estimation (효과 크기 추정 근거)
- [List key papers/studies used - 주요 논문/연구 목록]
- Historical data references - 과거 데이터 참고 자료
- Similar device study results - 유사 의료기기 연구 결과

## 4. Statistical Methodology (통계 방법론)
### 4.1 Primary Analysis (1차  분석)
- Analysis Population (분석 모집단):
    - [ ] ITT (Intent-to-Treat, 의향 분석)
    - [ ] PP (Per-Protocol, 계획서 순응)
    - [ ] Safety (안전성)
    - [ ] Other (기타): [Specify - 구체적으로 명시]
- Statistical Test (통계 검정): [Specific test - 구체적인 검정 방법 명시] - e.g., Independent t-test, Chi-square test, Cox regression
- Handling of Missing Data (결측 데이터 처리): [Describe methods - 방법 기술] - e.g., Multiple imputation, complete case analysis

### 4.2 Secondary Analyses (2차 분석)
- List of Secondary Endpoints (2차 평가변수 목록):
- Analysis Methods for Each Endpoint (각 평가변수별 분석 방법): 

### 4.3 Safety Analyses (안전성 분석)
- Adverse Event Categorization (이상반응 분류):
- Safety Population Definition (안전성 모집단 정의): 
- Analysis Methods for Safety Data (안전성 데이터 분석 방법): 

## 5. Study Research 
### 5.1 Concept
- 의료기기 관련 기술(e.g., CGM, Automated Insulin Delivery 등)
- 의료기기 평가 변수 정의 등 (e.g., CDR-SB, TIR, TBR 등)

### 5.2 Reference
- 연구 관련 참고한 문헌이 있을 경우, 간단히 요약 및 링크 제시 (e.g., Continuous glucose monitoring and metrics for clinical trials_an international consensus statement)

## Notes and Comments (참고 및 의견)
- 
