---
title: Research for MICCAI 2026
date: 2026-09-24
categories:
  - KOR
  - Biostatistics
  - Medical AI
tags:
  - MICCAI2026
  - medical imaging
  - AI SaMDs
author: Tea Tasting Lady
math: true
---

# MICCAI 2026 사전 학습 노트

> [!info] 문서 목적
> - 학회 참석 전 세션 토픽의 배경지식·개념·용어 사전 정리
> - 관심 축 4개 기준으로 발표를 재분류: ① 평가 metric ② 참조표준 ③ 임상 평가 디자인 ④ 임상 적용 case
> - 발표 ID(예: `W-PM-162`)는 프로그램 PDF의 poster board 번호. Oral은 세션 코드(예: `O3C`)로 표기

---

## 1. 프로그램 구조

### 1-1. Oral & Spotlight Session (Erasme / Schweitzer / Cassin Hall)

| 일시                         | A (Erasme)                              | B (Schweitzer)                                  | C (Cassin)                                     |
| -------------------------- | --------------------------------------- | ----------------------------------------------- | ---------------------------------------------- |
| **S1** 9/28(월) 10:30–12:00 | O1A Image Segmentation I                | O1B Computer-Aided Diagnosis I                  | O1C Image-Guided Interventions & Robotics      |
| **S2** 9/28(월) 15:00–16:00 | O2A Image Segmentation II               | O2B Outcome Prediction & Longitudinal Modeling  | O2C Emerging Applications & Methods            |
| **S3** 9/29(화) 08:30–09:30 | O3A Computer-Aided Diagnosis II         | O3B Computational Pathology                     | O3C Interventions, Connectivity & Other        |
| **S4** 9/29(화) 14:00–15:30 | O4A Image Synthesis & Generative Models | O4B Anomaly & Lesion Detection                  | O4C Diagnosis, Analysis & Modeling             |
| **S5** 9/30(수) 08:30–09:30 | O5A Image Segmentation III              | O5B Image Synthesis & Digital Twins             | O5C Pathology, Anatomy & Lesion Analysis       |
| **S6** 9/30(수) 14:00–15:30 | O6A Image Reconstruction                | O6B Multimodal Integration & Outcome Prediction | O6C Image Registration & Computational Anatomy |

### 1-2. Poster Session

| Session | 일시                  | 주제                                                              | 포스터 ID prefix |
| ------- | ------------------- | --------------------------------------------------------------- | ------------- |
| P1      | 9/28(월) 16:00–18:00 | Segmentation, Registration and Detection                        | `M-PM-`       |
| P2      | 9/29(화) 10:30–12:30 | Reconstruction, Synthesis and Image Quality                     | `T-AM-`       |
| P3      | 9/29(화) 15:30–17:30 | Diagnosis, Prognosis and Clinical Prediction                    | `T-PM-`       |
| P4      | 9/30(수) 10:30–12:30 | Foundation Models, Multimodal Learning and Contextual Reasoning | `W-AM-`       |
| P5      | 9/30(수) 15:30–17:30 | Trustworthy AI, Learning Strategies and Surgical Data Science   | `W-PM-`       |

- 포스터 제목 키워드 빈도(대략): segmentation 약 200편, pathology/WSI 약 40편, ultrasound 약 40편, report 관련 약 34편, cardiac/echo 약 32편, foundation model 약 26편, retina/fundus/OCT 약 22편, mammography/breast 약 19편, endoscopy/polyp 약 18편, CXR 약 15편
- 관찰: 학회 무게중심이 segmentation 방법론과 foundation model/VLM으로 이동. 임상 평가 디자인 자체를 다루는 발표는 소수(`O3C` user study, `W-PM-209` 등)

---
## 2. 세션 토픽별 배경지식

> [!tip] 읽는 법
> - 각 소절 첫머리의 "본문 용어 정의" 표: 설명 문장에 등장하는 보조 용어의 정의
> - 각 핵심 용어는 **정의 → 장점 → 한계 → 적용 메모** 순서
> - "적용 메모"는 의료기기 임상평가·허가 관점에서 확인할 점
> - [R#] 번호는 7절 References

---

### 2-1. Image Segmentation (O1A, O2A, O5A, P1)

> [!abstract]+ 2-1 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Pixel / Voxel | 2D 영상의 최소 단위 화소(pixel), 3D 영상의 최소 단위 부피 요소(voxel) |
> | Class / Label | Class는 구분할 범주(예: 간, 종양, 배경). Label은 각 영상·pixel에 부여된 정답 범주 |
> | Mask | 구조물 영역을 1, 나머지를 0으로 표시한 영상. Segmentation의 입력 정답 또는 출력 결과 형식 |
> | Annotation / Annotator | Annotation은 전문가가 영상에 정답(mask, 위치, 등급)을 표시하는 작업. Annotator는 그 작업자 |
> | Contouring | 방사선치료 계획을 위해 종양·정상장기 경계를 그리는 작업 |
> | RECIST | Response Evaluation Criteria in Solid Tumors. Target lesion 최대 직경 합의 변화로 고형암 치료반응을 판정하는 기준 |
> | Target lesion | 치료반응 평가를 위해 사전 선정해 반복 측정하는 대표 병변 |
> | Split / Merge error | 한 개체를 여러 개로 나누는 오류(split)와 여러 개체를 하나로 합치는 오류(merge) |
> | Prompt (click, scribble, box) | 사용자가 model에 주는 위치 힌트. Click은 점, scribble은 자유 곡선, box는 사각형 영역 |
> | NoC | Number of Clicks. 목표 Dice(예: 0.85)에 도달할 때까지 필요한 사용자 click 수 |
> | Inter-observer (inter-rater) variability | 같은 영상을 여러 전문가가 판정할 때 생기는 결과 차이 |
> | Standalone performance | 사람 개입 없이 AI 단독 출력만으로 산출한 성능 |
> | Labeled / Unlabeled data | 정답 label이 있는 data / 영상만 있고 label이 없는 data |
> | Pseudo-label | Model이 unlabeled data에 예측한 결과를 임시 정답으로 간주해 다시 학습에 쓰는 label |
> | Consistency regularization | 같은 영상에 약간의 변형(회전, noise)을 주어도 예측이 같도록 강제하는 학습 제약 |
> | Mean teacher | 학생 model 가중치의 이동평균으로 만든 교사 model의 예측을 학생이 따라가도록 하는 semi-supervised 방법 |
> | Confirmation bias (학습) | Model이 자기 오류를 pseudo-label로 재학습해 오류가 강화되는 현상 |
> | Data leakage | Test data 정보가 학습·tuning 과정에 섞여 성능이 과대추정되는 문제 (예: 같은 환자 영상이 학습·test에 모두 포함) |
> | Image-level label | 영상 전체에 대한 유무 판정(예: '폐렴 있음')만 있고 위치 정보는 없는 label |
> | Domain / Domain shift | Domain은 data를 만든 조건(기관, 장비, protocol, 인구)의 집합. Domain shift는 학습과 사용 환경 간 이 조건의 차이 |
> | Model parameter (weight) | 학습으로 결정되는 model 내부 수치. 같은 입력에 대한 출력을 결정 |
> | Locked algorithm | 배포 후 같은 입력에 항상 같은 출력을 내며 스스로 변경되지 않는 algorithm (FDA 용어) |
> | Silent failure | 경고 없이 성능이 저하되어 사용자가 오류를 알아차리지 못하는 상태 |
> | Catastrophic forgetting | 새 data로 학습할 때 이전에 학습한 task 성능이 급격히 떨어지는 현상 |
> | Regression test set | Model 변경 후 기존 성능이 유지되는지 확인하기 위해 고정해 두는 평가용 dataset |
> | Encoder / Decoder | Encoder는 영상을 압축된 특징(feature)으로 변환, decoder는 특징을 다시 영상 크기의 출력으로 복원 |
> | Skip connection | Encoder의 중간 특징을 decoder에 직접 전달해 세부 위치 정보를 보존하는 연결 |
> | Baseline | 새 방법의 성능 비교 기준이 되는 기존 방법 |
> | SOTA | State of the Art. 해당 benchmark의 현재 최고 성능 방법 |
> | Challenge | 공통 dataset과 metric으로 여러 팀의 알고리즘을 비교하는 공개 경연 (MICCAI challenge 등) |
> | Self-attention | 입력의 모든 위치 쌍 사이 관련도를 계산해 전역 정보를 결합하는 연산 |
> | Context / Sequence | Sequence는 순서가 있는 입력(예: slice 연속, video frame). Context는 판단에 활용하는 주변·전체 정보 범위 |
> | Gating / Routing | 입력에 따라 어떤 expert subnetwork를 사용할지 결정하는 선택 장치 / 그 배분 과정 |
> | Load imbalance | MoE에서 일부 expert에만 입력이 몰리고 나머지는 거의 쓰이지 않는 현상 |
> | Zero-shot / Few-shot | 해당 task의 학습 예시 없이 바로 적용(zero-shot) / 소수 예시만으로 적응(few-shot) |
> | Fine-tuning | 사전학습 model을 목표 task data로 추가 학습하는 과정 |
> | Overlap metric / Boundary metric | 예측과 참조 영역의 겹침 비율을 보는 지표 / 경계선 사이 거리를 보는 지표 |
> | Class imbalance | 배경 voxel이 대부분이고 목표 구조물 voxel이 매우 적은 것처럼 class 간 표본 수가 크게 다른 상태 |
> | Empty mask | 참조 또는 예측에 해당 구조물이 전혀 없는 mask (예: 병변 없는 환자) |
> | Outlier | 대부분의 값과 동떨어진 극단값 |
> | Percentile | 값을 크기순으로 정렬했을 때 해당 비율 위치의 값 (95 percentile = 하위 95% 경계값) |
> | Voxel spacing | Voxel 하나가 실제 공간에서 차지하는 크기(mm). 거리 metric을 mm로 환산할 때 필요 |
> | Tolerance τ | 임상적으로 허용되는 경계 오차 범위(mm). NSD 계산의 기준값 |
> | TP / FP / FN / TN | True Positive(맞게 양성) / False Positive(틀리게 양성) / False Negative(놓침) / True Negative(맞게 음성) |
> | Matching criterion | 예측 병변과 참조 병변을 같은 병변으로 인정하는 규칙 (예: IoU ≥ 0.1, 중심 거리 ≤ 5 mm) |
> | Stratification (층화) | 크기, 기관, 성별 등 특성별로 나눠 결과를 따로 산출하는 것 |
> | SQ / RQ | Segmentation Quality(매칭된 instance의 평균 IoU) / Recognition Quality(instance 검출 F1) |
> | Bias (측정) | 측정값과 참조값 차이의 평균. 체계적으로 크거나 작게 측정하는 경향 |
> | LoA | Limits of Agreement. 두 측정법 차이의 95%가 들어갈 것으로 기대되는 범위 (bias ± 1.96 SD) |
> | Equivalence design | 두 방법의 차이가 사전 정의한 허용범위(equivalence margin) 안에 있음을 입증하는 설계 |
> | Correlation vs Agreement | Correlation은 두 값이 함께 변하는 정도, agreement는 두 값이 실제로 같은 정도. 상관이 높아도 일치하지 않을 수 있음 |
> | Uncertainty | Model 예측이 얼마나 불확실한지를 나타내는 정량값 |
> | Cross-validation (CV) fold | Data를 k개로 나눠 번갈아 검증하는 방식에서 각 분할 단위. Fold마다 별도 model이 학습됨 |

#### 2-1-1. Task 유형

□ Semantic segmentation
- ○ 정의: 영상의 모든 pixel(voxel)에 class label을 부여하는 task. 같은 class의 개체는 구분하지 않음
- ○ 장점: 장기·병변 부피, 경계 등 정량 측정의 기반. Output 형식이 단순해 metric 계산이 쉬움
- ○ 한계: 서로 붙은 병변 여러 개를 하나로 합침. 병변 개수·개별 크기 측정 불가
- ○ 적용 메모: 장기 contouring(방사선치료), 부피 측정 기기에 적합. 병변 수가 endpoint면 instance 방식 필요

□ Instance segmentation
- ○ 정의: 같은 class 안에서도 개체별로 별도 mask를 부여하는 task (예: 세포, 전이 병변 각각)
- ○ 장점: 개수·개별 크기·개별 추적 가능. 치료반응 평가(RECIST 등 target lesion 추적)와 직접 연결
- ○ 한계: 개체 분리 오류(split/merge)가 추가 오류원. Annotation 비용이 semantic보다 큼
- ○ 적용 메모: Lesion-wise sensitivity, FP/scan 같은 detection metric을 함께 보고해야 함

□ Interactive segmentation
- ○ 정의: 사용자가 click·scribble·box 등 prompt를 주고 model이 결과를 반복 수정하는 방식
- ○ 장점: 전문가 판단을 결합해 최종 정확도 향상. 어려운 case에서 완전 수동 대비 시간 절감
- ○ 한계: 결과가 사용자와 prompt 위치에 의존 → 재현성 저하. Standalone 성능 정의 모호
- ○ 적용 메모: NoC(Number of Clicks to reach target Dice), 작업 시간, inter-user variability로 평가. `O5A` Disentangling Prompt Dependence가 이 문제를 다룸

#### 2-1-2. 학습 전략 (label 부족 대응)

□ Supervised learning (fully-supervised)
- ○ 정의: 모든 학습 영상에 pixel 수준 정답 mask를 두고 학습
- ○ 장점: 성능 상한이 가장 높고 동작이 예측 가능
- ○ 한계: 3D 영상 1건 annotation에 수십 분~수 시간. 전문가 비용이 병목
- ○ 적용 메모: 학습 label의 품질(annotator 자격, QC 절차)을 기술문서에 기재 필요

□ Semi-supervised learning
- ○ 정의: 소수 labeled data와 다수 unlabeled data를 함께 학습. Pseudo-label, consistency regularization, mean teacher 등 사용
- ○ 장점: Annotation 비용 절감. Unlabeled data가 다양한 기관·장비를 포함하면 일반화 향상 가능
- ○ 한계: 잘못된 pseudo-label이 누적되는 confirmation bias. Unlabeled data의 분포가 다르면 오히려 성능 저하
- ○ 적용 메모: 학습에 쓴 unlabeled data와 test data가 섞이지 않았는지(data leakage) 확인

□ Weakly-supervised learning
- ○ 정의: Scribble, point, bounding box, image-level label 등 불완전 label로 pixel 수준 예측을 학습
- ○ 장점: Label 비용이 매우 낮음. 판독문에서 추출한 label도 활용 가능
- ○ 한계: 경계 정확도가 낮음. 작은 병변과 경계 모호 구조에서 성능 격차 큼
- ○ 적용 메모: 학습은 weak label로 하더라도 **검증 참조표준은 full annotation** 필요

□ Test-time adaptation (TTA)
- ○ 정의: 배포 후 추론 시점에 들어오는 unlabeled test data로 model parameter 일부를 갱신하는 기법 [R43]
- ○ 장점: 장비·프로토콜 변경에 따른 domain shift에 자동 대응
- ○ 한계: ① 입력마다 model이 바뀌어 결과 재현성 저하 ② 잘못 적응하면 조용한 성능 붕괴(silent failure)
- ○ 적용 메모: 규제상 "locked algorithm"이 아님. FDA PCCP 범위·검증 방법을 사전 정의해야 함 [R23]

□ Continual learning
- ○ 정의: 새 data나 새 task를 순차적으로 학습하면서 이전 지식을 유지하려는 학습 방식
- ○ 장점: 전체 재학습 없이 model 갱신. 신규 기관 data 반영에 유리
- ○ 한계: Catastrophic forgetting(이전 task 성능 저하). 버전별 성능 추적 부담
- ○ 적용 메모: 갱신마다 고정된 regression test set으로 기존 성능 유지 확인 필요

#### 2-1-3. Model 구조·Foundation model

□ U-Net / nnU-Net
- ○ 정의: U-Net은 encoder–decoder에 skip connection을 둔 segmentation 구조 [R44]. nnU-Net은 dataset 특성에 따라 전처리·구조·학습 설정을 자동 결정하는 framework [R45]
- ○ 장점: nnU-Net은 다수 challenge에서 강력한 baseline. 재현성 높음
- ○ 한계: 새 방법이 nnU-Net 대비 개선을 입증하지 못하는 경우가 많음. 논문 비교 시 baseline 설정 확인 필요
- ○ 적용 메모: MICCAI 발표의 "SOTA 대비 향상"은 nnU-Net baseline 포함 여부로 신뢰도 판단

□ Transformer / Mamba(State Space Model)
- ○ 정의: Transformer는 self-attention으로 전역 관계를 학습. Mamba는 선형 복잡도의 state space model로 긴 sequence 처리
- ○ 장점: 3D·video처럼 긴 context 처리. Mamba는 memory·속도 효율
- ○ 한계: 대량 data 요구. 의료영상에서 CNN 대비 일관된 우위 근거는 제한적
- ○ 적용 메모: 구조 차이보다 학습 data와 검증 설계가 성능 차이의 주 요인인 경우가 많음

□ MoE(Mixture-of-Experts)
- ○ 정의: 여러 전문가 subnetwork 중 입력에 맞는 일부만 gating으로 선택해 사용하는 구조
- ○ 장점: 다장기·다modality를 하나의 model로 처리하면서 계산량 억제
- ○ 한계: Routing 불안정, 일부 expert만 쓰이는 load imbalance. 동작 설명이 어려움
- ○ 적용 메모: 입력 조건(장기, modality)별 subgroup 성능 제시 필요

□ SAM / SAM2 / SAM3 (Segment Anything Model)
- ○ 정의: 대규모 자연영상으로 학습한 prompt 기반 범용 segmentation model [R46]. SAM2는 video, SAM3는 text concept prompt 지원
- ○ 장점: 새 task에 적은 label로 적응. Annotation 도구로 활용 시 작업시간 단축
- ○ 한계: 의료영상의 낮은 contrast·3D 구조에서 zero-shot 성능 낮음. Prompt 품질에 결과 의존
- ○ 적용 메모: Annotation 보조로 쓸 경우 참조표준에 model bias가 유입될 수 있음(3-2절)

#### 2-1-4. Segmentation 평가 metric

□ DSC(Dice Similarity Coefficient)
- ○ 정의: 예측 A와 참조 B의 overlap 비율. $\text{DSC}=\dfrac{2|A\cap B|}{|A|+|B|}$, 0~1
- ○ 장점: 가장 널리 쓰여 비교 가능. Class imbalance(작은 전경)에 accuracy보다 강건
- ○ 한계: ① 작은 구조물은 1~2 voxel 차이로 값 급변 ② 경계 형태 오류 반영 약함 ③ 참조 mask가 빈 경우 정의 불가
- ○ 적용 메모: 구조물 크기별 층화 보고, empty case 처리 규칙 사전 정의 [R1][R2]

□ IoU(Intersection over Union, Jaccard index)
- ○ 정의: $\text{IoU}=\dfrac{|A\cap B|}{|A\cup B|}$. DSC와 단조 변환 관계 $\text{IoU}=\text{DSC}/(2-\text{DSC})$
- ○ 장점: Detection 매칭 기준(IoU ≥ 0.5 등)으로도 사용
- ○ 한계: DSC와 정보가 중복. 두 metric을 동시에 보고해도 추가 정보 없음
- ○ 적용 메모: 둘 중 하나와 boundary metric을 조합하는 것이 권장 조합

□ HD / HD95(Hausdorff Distance, 95th percentile)
- ○ 정의: 두 경계 사이 최대 거리(HD). HD95는 거리 분포의 95 percentile로 극단값 영향 완화
- ○ 장점: 경계에서 멀리 떨어진 오류(누락된 원격 병변, 가짜 섬 영역)를 포착
- ○ 한계: 단일 outlier에 민감. 예측 mask가 비면 정의 불가. 단위(mm)가 해부 구조마다 해석 다름
- ○ 적용 메모: Voxel spacing 반영(mm 단위) 여부 확인. 비어 있는 예측 시 대체값 규칙 명시

□ ASSD(Average Symmetric Surface Distance)
- ○ 정의: 양방향 경계점 간 최단거리의 평균
- ○ 장점: 전반적 경계 일치도를 mm 단위로 표현. HD보다 outlier에 덜 민감
- ○ 한계: 국소적 큰 오류가 평균에 묻힘
- ○ 적용 메모: HD95와 함께 보고해 "평균 오차 vs 최악 오차"를 분리

□ NSD(Normalized Surface Dice, surface Dice at tolerance τ)
- ○ 정의: 허용오차 τ(mm) 안에 들어온 경계 면적 비율 [R3]
- ○ 장점: 임상 허용오차를 직접 반영. "수정이 필요한 경계 비율"로 해석 가능
- ○ 한계: τ 선택이 자의적일 수 있음. τ에 따라 결론이 바뀜
- ○ 적용 메모: τ를 inter-observer variability 또는 임상 가이드라인(방사선치료 margin)에 근거해 사전 설정

□ Lesion-wise F1 / lesion-wise sensitivity
- ○ 정의: 병변 단위로 검출 여부(TP/FP/FN)를 판정해 계산하는 metric
- ○ 장점: 다발성 병변(MS, 전이)에서 임상 판단 단위와 일치. 작은 병변 누락이 드러남
- ○ 한계: 병변 매칭 기준(overlap 기준, 중심 거리)에 따라 값 변동. 기준 표준화 부족
- ○ 적용 메모: 매칭 기준을 protocol에 명시. 병변 크기별 sensitivity 층화

□ PQ(Panoptic Quality)
- ○ 정의: 인스턴스 매칭 품질(SQ, Segmentation Quality)과 검출 품질(RQ, Recognition Quality)의 곱 [R47]
- ○ 장점: 검출과 분할 성능을 하나의 수치로 통합
- ○ 한계: 두 요소가 섞여 어떤 오류가 주 원인인지 구분 어려움. 작은 객체에서 불안정
- ○ 적용 메모: SQ와 RQ를 분리 보고하면 해석 가능성 향상

□ 부피·측정 agreement (Bland–Altman, ICC, CCC)
- ○ 정의: Segmentation으로 산출한 부피를 참조값과 비교. Bland–Altman은 차이의 평균(bias)과 95% LoA(Limits of Agreement) [R48]
- ○ 장점: 임상 의사결정 단위(mL, mm)로 결과 제시. 정량 측정기기의 표준 평가 방식
- ○ 한계: 부피가 같아도 위치가 다를 수 있음(overlap 정보 손실)
- ○ 적용 메모: 사전 정의한 허용 LoA와 비교하는 equivalence 설계가 명확함. Correlation 계수만 보고는 부적절

□ 주목 발표
- ○ `O2A` Lost in the Folds — CV fold model 집합을 deep ensemble처럼 쓰면 uncertainty가 왜곡될 수 있다는 논점
- ○ `O5A` A Real-World Evaluation of Failure Detection for Liver CT Segmentation (MD Anderson)
- ○ `O5A` Disentangling Prompt Dependence to Evaluate Segmentation Reliability in Gynecological MRI
- ○ `O5A` MedFM-Robust: Benchmarking Robustness of Medical Foundation Models
- ○ `M-PM-105` Conformal 3D Lesion Segmentation with Balanced Risk Control / `M-PM-140` Multi-Rater Few-Shot Segmentation / `M-PM-082` Mixed-Quality Annotations

---

### 2-2. Computer-Aided Diagnosis & Anomaly/Lesion Detection (O1B, O3A, O4B, O4C, P3)

> [!abstract]+ 2-2 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Mark | CADe가 영상 위에 표시하는 의심 부위 표지 |
> | Alert fatigue | 경고가 너무 잦아 사용자가 경고를 무시하게 되는 현상 |
> | Automation bias | 자동화 시스템 출력에 과도하게 의존해 자신의 판단을 소홀히 하는 경향 |
> | Anchoring | 처음 제시된 정보(AI 점수)에 판단이 끌려가는 인지 편향 |
> | Calibration | 예측 확률이 실제 발생 빈도와 일치하는 정도 (예: 70%로 예측한 case 중 실제 70%가 양성) |
> | 510(k) / De Novo | FDA 시판 전 신고(기존 합법 기기와 실질적 동등성 입증) / 신규 저·중위험 기기의 분류 신청 경로 |
> | MRMC | Multi-Reader Multi-Case. 여러 판독의가 여러 case를 판독해 reader·case 변동을 모두 반영하는 연구 (3-3절) |
> | LVO / ICH | Large Vessel Occlusion(대혈관 폐색 뇌경색) / Intracranial Hemorrhage(두개내 출혈) |
> | Time-to-notification / Time-to-treatment | 영상 촬영부터 전문의 알림까지 시간 / 치료 시작까지 시간 |
> | Standard of care | 해당 상황에서 현재 표준으로 시행되는 진료 방식. 비교 대조 기준 |
> | Intended use / Intended user | 기기의 사용 목적·대상 환자·사용 환경 / 기기를 사용하는 의료진 유형 |
> | Prospective study | 연구 계획 후 새로 환자를 모집해 자료를 수집하는 연구 (↔ retrospective: 이미 있는 자료 사용) |
> | Threshold (cut-off) | 연속 점수를 양성/음성으로 나누는 기준값 |
> | Trade-off | 한 지표를 올리면 다른 지표가 내려가는 상충 관계 (sensitivity ↔ specificity) |
> | Co-primary endpoint | 두 개 이상의 주평가변수를 모두 충족해야 성공으로 판정하는 설계 |
> | Multiplicity (다중성) | 여러 가설을 검정할 때 우연히 하나 이상 유의할 확률이 커지는 문제 |
> | Prevalence (유병률) | 대상 집단에서 질환이 있는 사람의 비율 |
> | Enriched dataset | 양성 case를 의도적으로 늘려 실제보다 유병률이 높게 구성한 dataset |
> | Bayes 보정 (PPV/NPV) | Sensitivity, specificity와 목표 유병률로 PPV·NPV를 재계산하는 방법 |
> | ROC curve | Receiver Operating Characteristic curve. Threshold를 바꾸며 sensitivity를 (1−specificity)에 대해 그린 곡선 |
> | Operating region | 실제 임상에서 사용할 threshold 근처의 ROC 곡선 구간 |
> | DeLong test | 같은 case에서 얻은 두 AUC 차이를 비모수 방법으로 검정하는 통계 검정 |
> | Partial AUC | 특정 specificity(또는 sensitivity) 범위에 한정한 ROC 곡선 아래 면적 |
> | Precision / Recall | Precision = PPV(양성 판정 중 진양성 비율). Recall = sensitivity |
> | Youden index (J) | Sensitivity + specificity − 1. 두 값의 합이 최대인 threshold 선택 기준 |
> | Tuning set | Threshold·hyperparameter 선택에 쓰는 dataset. 최종 test set과 분리 |
> | Optimism (bias) | 같은 data로 model·threshold를 고르고 평가해 성능이 실제보다 좋게 나오는 편향 |
> | Lesion-level sensitivity | 전체 참조 병변 중 AI가 정확한 위치에서 찾은 병변 비율 |
> | FP/image | 영상 1장(또는 scan 1건)당 평균 위양성 표시 수 |
> | FOM | Figure of Merit. 성능을 하나의 수치로 요약한 지표 (AUC, JAFROC FOM 등) |
> | Jackknife | 표본에서 하나씩 제외하며 반복 추정해 분산을 계산하는 재표본 방법 |
> | Acceptance radius | 표시 위치가 참조 병변 중심에서 이 거리 안이면 정확한 위치로 인정하는 기준 |
> | IoU threshold (detection) | 예측 box와 참조 box의 IoU가 이 값 이상이면 TP로 인정하는 기준 |
> | Kappa / Kappa paradox | 우연 일치를 보정한 일치도 / 한 범주가 극단적으로 많으면 일치율이 높아도 kappa가 낮게 나오는 현상 |
> | Quadratic weight | 불일치 등급 차이의 제곱에 비례해 벌점을 주는 weighted kappa 가중 방식 |
> | Normal variation | 질환이 아닌 정상 범위의 해부학적 개인차 |
> | Artifact | 움직임, 금속, 장비 등으로 생긴 실제 해부와 무관한 영상 왜곡 |
> | Anomaly map | 영상 각 위치의 이상 정도를 값으로 나타낸 지도 |
> | Identity shortcut | Reconstruction model이 병변까지 그대로 복원해 이상을 탐지하지 못하는 현상 |
> | Bayesian inverse problem / Diffusion prior | 관측 영상에서 원래 정상 영상을 확률적으로 역추정하는 문제 / 그 추정에 diffusion model이 학습한 정상 영상 분포를 사전정보로 쓰는 것 |
> | Pixel-level / Image-level AUROC | Pixel 단위 이상 여부 판별 AUC / 영상 전체 이상 여부 판별 AUC |
> | AUPRO | Area Under the Per-Region Overlap curve. 이상 영역별 검출 겹침 비율을 FP rate 범위에서 적분한 지표 |
> | Sequence (MRI) | T1, T2, FLAIR, DWI 등 서로 다른 촬영 조건으로 얻은 MRI 영상 종류 |
> | Subgroup | 성별, 연령, 기관, 장비 등 특성으로 나눈 하위 집단 |

#### 2-2-1. 기기 기능 유형

□ CADe(Computer-Aided Detection)
- ○ 정의: 의심 부위를 영상 위에 표시(mark)해 판독의 주의를 유도하는 기능. 최종 판단은 판독의 [R25]
- ○ 장점: 놓치기 쉬운 작은 병변의 검출률 향상
- ○ 한계: FP mark 증가 시 판독 시간 증가, alert fatigue. Automation bias(AI 표시 없으면 병변 없다고 가정)
- ○ 적용 메모: Standalone lesion-level 성능 + MRMC(AI 보조 효과) 조합이 FDA 510(k) 관행

□ CADx(Computer-Aided Diagnosis)
- ○ 정의: 병변의 특성(악성 확률, 등급)을 점수·분류로 제공하는 기능
- ○ 장점: 판독의 간 변동 감소, 불필요한 생검 감소 가능
- ○ 한계: 점수 calibration이 기관마다 다를 수 있음. 점수에 대한 과신(anchoring)
- ○ 적용 메모: ROC 기반 MRMC가 표준. 점수의 calibration도 제시 권장

□ CADt(Computer-Aided Triage and Notification)
- ○ 정의: 응급 소견 의심 case를 판독 대기열에서 우선 알림하는 기능. 진단 결과 자체를 제공하지 않음 [R26]
- ○ 장점: 치료 시간이 중요한 질환(LVO stroke, ICH, 기흉)에서 time-to-treatment 단축
- ○ 한계: 알림 없는 case가 "정상"으로 오인될 위험. 진단 성능 claim 불가
- ○ 적용 메모: Endpoint는 sensitivity/specificity + time-to-notification(standard of care 대비)

□ Autonomous AI
- ○ 정의: 전문가 판독 없이 AI 결과가 임상 결정(의뢰 여부 등)에 직접 사용되는 기기
- ○ 장점: 전문가 부족 환경(1차 의료)에서 접근성 향상
- ○ 한계: 오류를 사람이 걸러내지 못함. 요구 근거 수준이 가장 높음
- ○ 적용 메모: IDx-DR처럼 intended use 환경에서의 prospective 임상시험이 사실상 필수 [R21]

#### 2-2-2. 분류 성능 metric

□ Sensitivity / Specificity
- ○ 정의: Sensitivity = TP/(TP+FN), Specificity = TN/(TN+FP)
- ○ 장점: 유병률과 독립. Enriched dataset에서도 추정 가능
- ○ 한계: Threshold 하나에 대한 값. Threshold 변경 시 trade-off 정보 손실
- ○ 적용 메모: Threshold는 test 전 lock. 두 값을 co-primary로 두면 다중성 보정 불필요(둘 다 충족해야 성공)

□ PPV / NPV(Positive / Negative Predictive Value)
- ○ 정의: 양성 판정 중 실제 양성 비율(PPV), 음성 판정 중 실제 음성 비율(NPV)
- ○ 장점: 임상의·환자가 직접 체감하는 정보
- ○ 한계: 유병률에 강하게 의존. Enriched set의 PPV는 실제 사용 환경과 다름
- ○ 적용 메모: 목표 사용 환경 유병률로 Bayes 보정한 PPV/NPV를 함께 제시

□ AUROC(Area Under the ROC Curve)
- ○ 정의: 모든 threshold에 걸친 sensitivity–(1–specificity) 곡선 아래 면적. 무작위 양성·음성 쌍에서 양성 점수가 높을 확률
- ○ 장점: Threshold 독립적 판별력 요약. Paired 비교는 DeLong test [R49]
- ○ 한계: 임상에서 쓰지 않는 operating 영역까지 평균. 저유병률에서 과대 인상. Calibration 정보 없음
- ○ 적용 메모: 임상 operating point의 sens/spec, partial AUC를 병행

□ AUPRC(Area Under the Precision–Recall Curve)
- ○ 정의: Precision(PPV)–Recall(sensitivity) 곡선 아래 면적
- ○ 장점: 저유병률 task에서 FP 증가를 민감하게 반영
- ○ 한계: 유병률 의존으로 dataset 간 비교 불가. 무작위 기준선이 유병률과 같음
- ○ 적용 메모: 유병률을 함께 보고해야 해석 가능

□ Operating point 선택 (Youden index, fixed specificity)
- ○ 정의: Youden J = sensitivity + specificity − 1이 최대인 threshold, 또는 사전 목표 specificity에서의 threshold
- ○ 장점: Threshold 선택 근거를 명시
- ○ 한계: Test set에서 선택하면 낙관적 bias(optimism)
- ○ 적용 메모: Tuning set에서 선택 → 독립 test set에서 검증. 임상 비용(FN vs FP) 반영 근거 기술

#### 2-2-3. Detection·localization metric

□ FROC(Free-response ROC)
- ○ 정의: 영상당 FP 수(x축)에 대한 lesion-level sensitivity(y축) 곡선
- ○ 장점: 한 영상 내 다수 병변과 위치 정확성을 반영
- ○ 한계: 곡선 요약 지표가 표준화되지 않음. Reader 간 통계 비교가 어려움
- ○ 적용 메모: Standalone CADe 성능 제시에 표준적. 특정 FP/image에서 sensitivity를 보고

□ JAFROC(Jackknife Alternative FROC) FOM
- ○ 정의: 병변 위치 정확성을 반영한 figure of merit를 jackknife로 MRMC 분석하는 방법 [R11]
- ○ 장점: 위치 오류를 오답으로 처리해 CADe의 실제 가치를 측정. ROC 대비 통계적 검정력 높음
- ○ 한계: 사용자에게 익숙하지 않음. Acceptance radius 등 위치 판정 기준 설정 필요
- ○ 적용 메모: R `RJafroc` package. FDA 제출 사례 존재하나 ROC AUC가 더 흔함

□ LROC(Localization ROC)
- ○ 정의: 영상당 최대 1개 병변 가정하에 위치 정확 여부를 결합한 ROC
- ○ 장점: 개념이 단순
- ○ 한계: 다발성 병변 영상에 부적합
- ○ 적용 메모: 단일 병변 task(예: 결절 1개 여부)에 한정

□ mAP(mean Average Precision)
- ○ 정의: Class별 precision–recall 곡선 아래 면적의 평균. 컴퓨터비전 detection 표준
- ○ 장점: CV 분야 benchmark와 비교 가능
- ○ 한계: IoU 기준에 따라 값이 크게 달라지고 임상 해석이 어려움
- ○ 적용 메모: 임상 논문·허가 문서에서는 FROC/lesion-level sensitivity로 전환해 제시

□ Weighted kappa (ordinal grading)
- ○ 정의: 순서형 등급 간 불일치에 거리 가중치를 둔 일치도. Quadratic weight가 흔함 [R50]
- ○ 장점: 1단계 차이와 3단계 차이를 구분
- ○ 한계: 유병률·등급 분포에 따라 값이 달라지는 kappa paradox. 가중치 선택이 결과에 영향
- ○ 적용 메모: 전문가 간 weighted kappa를 기준선으로 함께 제시 (DR grade, Gleason, CXR severity `W-PM-173`)

#### 2-2-4. Anomaly detection

□ UAD(Unsupervised Anomaly Detection)
- ○ 정의: 정상 영상만으로 정상 분포를 학습하고, 이와 다른 영역을 이상으로 판단
- ○ 장점: 희귀질환·미지의 병변도 포착 가능. 질환별 label 불필요
- ○ 한계: 정상 변이(해부 변이, artifact)도 이상으로 탐지 → FP 높음. 임상적으로 무의미한 이상 구분 불가
- ○ 적용 메모: "정상" dataset 정의(연령, 장비) 자체가 참조표준 역할. Intended use를 screening 보조로 한정하는 경향

□ Reconstruction-/Diffusion-based anomaly detection
- ○ 정의: 입력을 정상 영상으로 복원한 뒤 원본과의 차이를 anomaly map으로 사용. Diffusion prior를 쓰는 Bayesian inverse problem 접근 포함 (`O4B`)
- ○ 장점: Pixel 수준 위치 정보 제공
- ○ 한계: 복원 과정에서 병변까지 복원(identity shortcut)하거나 정상 부위를 과도 수정
- ○ 적용 메모: Pixel-level AUROC, AUPRO, image-level AUROC를 구분해 보고

#### 2-2-5. Multimodal·missing modality

□ Missing modality learning
- ○ 정의: MRI sequence, PET, 임상정보 등 일부 입력이 없어도 추론 가능한 multimodal model (`O3A` PRA-PoE, `O1B` BrainAnytime)
- ○ 장점: 실제 임상의 불완전 검사 조합에서도 사용 가능
- ○ 한계: 입력 조합마다 성능이 달라 사실상 여러 기기를 검증하는 것과 같음
- ○ 적용 메모: 입력 조합별 subgroup 성능과 최소 필수 입력 조건을 사용설명서에 명시

□ 주목 발표
- ○ `O1B` Benchmarking Foundation Models for Early Multi-Retinopathy Detection at National Scale
- ○ `O1B` Fair Curriculum Learning for Concept Bottleneck Models in Dermatology / Smartphone-Based Low-Quality Fundus Video
- ○ `O3A` Curia-2: Scaling Self-Supervised Learning for Radiology Foundation Models
- ○ `O4B` StrokeTimer / Semantic Feature Modulation for Mammographic Lesion Classification / Multi-Center Benchmark for Abdominal Disease (Non-Contrast CT)
- ○ `M-PM-109` Conflict-Aware Evidential Inference for Multi-View Mammography

---

### 2-3. Computational Pathology (O3B, O5C, P3)

> [!abstract]+ 2-3 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Gigapixel | 10억 pixel 이상 규모의 영상 |
> | Patch / Tile | WSI를 처리 가능한 작은 정사각형(예: 256×256 pixel)으로 나눈 조각 |
> | Scanner | 유리 슬라이드를 디지털 영상으로 변환하는 장비. 기종별 색·해상도 차이 존재 |
> | Bag / Instance | MIL에서 label이 붙는 묶음 단위(slide) / 묶음을 구성하는 개별 요소(patch) |
> | Attention (MIL) | 각 patch가 slide 판정에 기여하는 가중치를 학습하는 장치 |
> | Attention heatmap | Attention 가중치를 slide 위에 색으로 표시한 지도 |
> | Shortcut learning | 진짜 병변 특징 대신 우연히 label과 상관된 신호(표지, 염색, scanner 흔적)로 판정하는 학습 |
> | Patch encoder / Slide encoder | Patch 하나를 특징 vector로 바꾸는 network / patch 특징들을 slide 전체 표현으로 통합하는 network |
> | Downstream task | 사전학습 후 실제로 적용하는 목표 task (예: 암 아형 분류) |
> | Self-supervised pre-training | Label 없이 영상 자체에서 만든 과제로 먼저 학습하는 단계 (2-8절) |
> | H&E | Hematoxylin & Eosin. 핵을 청보라, 세포질을 분홍으로 염색하는 기본 병리 염색 |
> | IHC | Immunohistochemistry(면역조직화학). 특정 단백질을 항체로 염색해 진단을 보조하는 검사 |
> | Balanced accuracy | Sensitivity와 specificity의 평균. Class 불균형 시 accuracy 대안 |
> | Gleason grade / ISUP grade group | 전립선암 조직 분화도 등급 / 이를 1~5 group으로 재분류한 국제 기준 |
> | Consensus panel | 여러 전문가가 합의로 최종 판정을 내리는 참조표준 확립 방식 |
> | Glass vs digital 판독 동등성 | 현미경 유리 슬라이드 판독과 WSI 화면 판독의 진단 일치도 |

□ WSI(Whole Slide Image)
- ○ 정의: 유리 슬라이드를 고배율로 스캔한 gigapixel 디지털 영상 (보통 100,000 × 100,000 pixel 이상)
- ○ 장점: 원격 판독, 정량 분석, AI 적용 가능
- ○ 한계: 파일 크기로 patch 분할 처리 필수. Scanner·염색 차이로 domain shift 큼
- ○ 적용 메모: Scanner 기종별 성능, 스캔 품질 QC 기준 제시 필요

□ MIL(Multiple Instance Learning)
- ○ 정의: Slide = bag, patch = instance로 보고 slide-level label만으로 학습. Attention-based MIL이 대표적 [R51][R52]
- ○ 장점: Pixel annotation 없이 진단 보고서 label로 대규모 학습 가능
- ○ 한계: 소수 patch에 의존한 shortcut 학습 위험. Attention map이 진단 근거와 반드시 일치하지 않음
- ○ 적용 메모: Attention heatmap을 "설명"으로 제시할 때 병리의 검증 필요

□ Pathology foundation model (UNI, CONCH, Virchow 등)
- ○ 정의: 수십만~수백만 WSI로 self-supervised 사전학습한 patch/slide encoder [R30]
- ○ 장점: 적은 label로 다양한 downstream task에 적응. 희귀 암종에도 적용 가능성
- ○ 한계: 사전학습 data 구성(기관, 인종, 염색)이 불투명. Downstream 성능은 여전히 task별 검증 필요
- ○ 적용 메모: Foundation model 버전 고정(locked)과 변경 시 재검증 계획 필요

□ Stain normalization / augmentation
- ○ 정의: H&E 색 분포를 기준 slide에 맞추거나(normalization), 학습 중 색을 무작위 변형(augmentation)
- ○ 장점: 기관 간 색 차이에 따른 성능 저하 완화
- ○ 한계: 과도한 정규화는 진단 정보(염색 강도) 손실. 새로운 기관 색 분포에는 여전히 취약
- ○ 적용 메모: External site 성능으로 효과 입증 필요

□ Slide artifact QC
- ○ 정의: 조직 접힘, 기포, blur, pen mark 등 판독 품질 저하 요소를 자동 탐지 (`O2C`/`W-PM-121` SlideGuard)
- ○ 장점: AI 오류의 사전 차단. 재스캔 대상 선별
- ○ 한계: Artifact 정의와 허용 기준이 기관마다 다름
- ○ 적용 메모: AI 입력 적합성 판정(input QC) 기능은 기기 안전성 논거로 활용 가능

□ 병리 평가 metric과 참조표준
- ○ Slide-level AUROC, balanced accuracy / Grading은 quadratic weighted kappa / 생존은 C-index
- ○ 한계: Gleason grade 병리의 간 kappa가 중등도 수준으로 보고되어 참조표준 자체가 불확실
- ○ 적용 메모: Consensus panel, IHC 보조검사로 참조표준 강화. Paige Prostate(FDA De Novo 2021)은 병리의 보조 효과를 reader study로 입증 [R29]

---

### 2-4. Image Synthesis & Generative Models, Digital Twins (O4A, O5B, P2)

> [!abstract]+ 2-4 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Noise (생성 model) | 무작위 값으로 채운 입력. 생성 model은 이를 점차 영상으로 변환 |
> | Conditional generation | 병변 위치, modality, 질환 유무 등 조건을 지정해 생성하는 방식 |
> | Memorization | 생성 model이 학습 영상을 거의 그대로 재생산하는 현상. 개인정보 노출 위험 |
> | Modality | 영상 획득 방식의 종류 (CT, MRI, PET, 초음파, X-ray 등) |
> | Synthetic CT | MRI 등 다른 영상으로부터 생성한 CT 유사 영상. MRI 단독 방사선치료 계획에 활용 |
> | Low-dose / Full-dose | 방사선량·추적자 용량을 줄여 촬영한 영상 / 표준 용량 영상 |
> | Data augmentation | 기존 학습 영상을 변형·합성해 학습 data 다양성을 늘리는 기법 |
> | Visual Turing test | 판독의가 실제 영상과 합성 영상을 구별할 수 있는지 시험하는 평가 |
> | Feature (특징) | Network가 영상에서 추출한 수치 표현 vector |
> | Inception network | ImageNet 자연영상으로 학습한 분류 network. FID 계산의 특징 추출기 |
> | Paired / Unpaired 참조 | 같은 환자·위치의 대응 참조 영상이 있는 경우 / 없는 경우 |
> | Credibility (computational model) | 시뮬레이션 model 결과를 특정 사용 목적의 근거로 신뢰할 수 있는 정도 |
> | ASME V&V 40 | 의료기기 computational model의 검증(verification)·확인(validation) 수준을 위험도에 맞춰 정하는 표준 |
> | Verification / Validation (model) | Model이 수식대로 올바르게 구현됐는지 확인 / 현실을 충분히 정확히 재현하는지 확인 |
> | ISO 14971 | 의료기기 위험관리(risk management) 국제 표준. 위해 식별·평가·통제 절차 규정 |
> | In silico | 컴퓨터 시뮬레이션으로 수행하는 (실험·임상시험) |
> | VICTRE | FDA가 수행한 가상 환자·가상 영상 장비·가상 판독자 기반 유방영상 임상시험 |

□ Diffusion model
- ○ 정의: 영상에 단계적으로 noise를 더하는 과정을 역으로 학습해 noise에서 영상을 생성하는 model [R53]
- ○ 장점: 고품질·다양한 영상 생성. 조건부 생성(병변 위치, modality 지정) 유연
- ○ 한계: 추론 속도 느림. 학습 data를 기억·재현(memorization)해 개인정보 이슈 가능
- ○ 적용 메모: 합성영상을 학습에 쓸 때 test set과 원천 환자 중복 여부 확인

□ Flow matching / Schrödinger bridge
- ○ 정의: 두 분포(noise→영상, 또는 modality A→B) 사이 연속 변환 경로를 직접 학습하는 생성 방식 [R54]
- ○ 장점: Diffusion보다 적은 단계로 생성. Image-to-image 변환에 효율적
- ○ 한계: 이론·구현이 새로워 검증 사례 적음. Diffusion과 같은 hallucination 위험 공유
- ○ 적용 메모: `O4A` Time Matters, `T-AM-158` MammoFlow 등에서 다룸

□ Image-to-image translation (예: MRI→PET, MRI→synthetic CT, low-dose→full-dose)
- ○ 정의: 한 modality·조건의 영상을 다른 modality·조건 영상으로 변환
- ○ 장점: 추가 검사·방사선 노출·조영제 없이 정보 획득 가능성
- ○ 한계: 입력 영상에 없는 생물학적 정보는 원리상 복원 불가 (`O4A` When Brains Disagree: amyloid PET 합성의 생물학적 한계)
- ○ 적용 메모: 진단 대체 claim은 매우 높은 근거 필요. 치료계획 보조(synthetic CT) 등 제한적 사용이 현실적

□ Counterfactual synthesis
- ○ 정의: "병변이 없었다면/있었다면" 같은 가상의 영상을 생성 (`W-PM-160` PolypSteer, `T-AM-212` counterfactual CXR)
- ○ 장점: Model 설명, data augmentation, 교육 자료
- ○ 한계: 생성된 반사실 영상이 해부학적으로 타당한지 검증 어려움
- ○ 적용 메모: 전문가의 해부학적 타당성 평가(reader-based) 필요

□ Digital twin / Virtual population / In silico trial
- ○ 정의: 환자 특이적 가상 model(digital twin) 또는 가상 환자 집단으로 기기 성능을 시뮬레이션 평가
- ○ 장점: 희귀 조건·위험 상황 평가, 임상시험 규모 축소 가능. FDA VICTRE가 실증 사례 [R32]
- ○ 한계: 시뮬레이션 model 자체의 타당성(credibility) 입증 필요. 실제 환자 변이를 모두 반영하기 어려움
- ○ 적용 메모: FDA의 computational modeling credibility 평가 guidance(2023)와 ASME V&V 40 체계 참고 [R55]. `W-PM-209` 시뮬레이션 평가 검증 발표 연결

□ 생성 영상 평가 metric
- ○ PSNR(Peak Signal-to-Noise Ratio) / MAE
  - 정의: 참조 영상과 pixel 차이 기반 지표
  - 장점: 계산 간단, 재현성 높음
  - 한계: 사람 인지·진단 가치와 상관 약함. Blur된 영상이 높은 점수를 받기 쉬움
- ○ SSIM(Structural Similarity Index)
  - 정의: 밝기·대비·구조의 국소 유사도 [R56]
  - 장점: PSNR보다 지각 품질 반영
  - 한계: 작은 병변 누락·추가를 거의 반영하지 못함
- ○ FID(Fréchet Inception Distance)
  - 정의: 실제·생성 영상 feature 분포 간 거리. ImageNet Inception network feature 사용 [R33]
  - 장점: 쌍(paired) 참조 없이 분포 수준 품질 평가
  - 한계: 자연영상 feature라 의료영상 특성 반영 부족. Sample 수에 따라 bias. 개별 영상 품질은 알 수 없음 → 의료 특화 FID 제안 (`O2C` EchoFID)
- ○ Task-based / reader-based 평가
  - 정의: 합성영상으로 downstream task 성능 유지 여부, 또는 판독의의 진단 정확도·Visual Turing test로 평가
  - 장점: 임상 목적과 직접 연결
  - 한계: 비용 높음. Visual Turing test는 "구별 불가"만 보여줄 뿐 진단 정확성은 입증하지 않음

□ Hallucination (생성 영상)
- ○ 정의: 입력에 없던 구조·병변 생성 또는 실제 병변 제거
- ○ 장점: 해당 없음 (위험 요소)
- ○ 한계: 전역 metric(PSNR, FID)으로 탐지 불가. 판독의도 알아차리기 어려움
- ○ 적용 메모: 병변 단위 검출 비교(원본 vs 합성), 전문가 검토로 안전성 평가. 위해 분석(ISO 14971)에 반영

---

### 2-5. Image Reconstruction & Image Quality (O6A, P2)

> [!abstract]+ 2-5 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | k-space | MRI의 원시 주파수 영역 data. 역 Fourier 변환으로 영상이 됨 |
> | Undersampling / Fully-sampled | 촬영 시간 단축을 위해 k-space 일부만 수집 / 전체 수집한 표준 data |
> | Raw data (projection, sinogram) | CT·PET 장비가 영상 재구성 전 기록한 측정 신호 |
> | Denoising | 영상의 무작위 noise를 줄이는 처리 |
> | Smoothing | 인접 pixel 값을 평균화해 영상을 부드럽게 만드는 효과. 과도하면 미세 구조 소실 |
> | Phantom | 알려진 물성·구조를 가진 시험용 모형. 장비·알고리즘 성능을 객관 측정 |
> | Data consistency | 재구성 영상이 실제 측정 raw data와 수학적으로 일치하도록 하는 조건 |
> | Super-resolution | 저해상도 영상에서 고해상도 영상을 추정하는 처리 |
> | Slice-to-volume reconstruction | 두꺼운 2D slice 여러 장으로부터 등방성 3D volume을 재구성 |
> | Model observer / CHO | 사람 판독을 모사하는 수학적 관찰자 / 사람 시각 채널을 흉내 낸 대표적 선형 model observer |
> | NMSE | Normalized Mean Squared Error. 참조 영상 에너지로 정규화한 평균 제곱오차 |
> | No-reference IQA | 참조 영상 없이 영상 자체만으로 화질을 평가하는 방법 |
> | Likert score (화질) | 판독의가 화질·진단 신뢰도를 1~5점 등 순서 척도로 평가한 점수 |
> | Conspicuity | 병변이 주변 조직과 구별되어 눈에 띄는 정도 |

□ DLR(Deep Learning Reconstruction) — accelerated MRI, low-dose CT/PET
- ○ 정의: Undersampled k-space 또는 저선량 raw data에서 DL로 진단 영상을 재구성·denoising [R57]
- ○ 장점: 검사 시간 단축, 피폭 감소, 환자 움직임 artifact 감소
- ○ 한계: 학습 분포 밖 병변·해부를 매끄럽게 지우는 hallucination 위험. 과도한 smoothing으로 미세 구조 손실
- ○ 적용 메모: FDA 510(k)에서 phantom 시험 + 판독의 화질·진단 reader study로 기존 재구성과 동등성 입증이 관행

□ Physics-informed model
- ○ 정의: 영상 획득 물리(MR signal model, CT projection)를 network 구조나 loss에 포함 (`O6A` PiMoE 등)
- ○ 장점: Data consistency 보장으로 hallucination 위험 감소. 적은 data로 학습
- ○ 한계: 물리 model 단순화 가정이 틀리면 bias. 장비별 파라미터 필요
- ○ 적용 메모: 장비·protocol별 검증 범위 명시

□ INR(Implicit Neural Representation)
- ○ 정의: 좌표(x, y, z, t)를 입력받아 신호값을 출력하는 연속 함수로 영상을 표현 [R58]
- ○ 장점: 해상도 독립적 표현, super-resolution·slice-to-volume 재구성에 유리
- ○ 한계: 영상마다 최적화 필요로 계산량 큼. 일반화 방식 연구 단계
- ○ 적용 메모: `O6A` SRPAN(pancreatic MRI), Low-Rank-Modulated Functa

□ 화질 평가: reference-based vs task-based
- ○ Reference-based(PSNR, SSIM, NMSE)
  - 정의: Fully-sampled 참조 영상과 비교
  - 장점: 객관적, 빠른 비교
  - 한계: 실제 임상에는 참조 영상이 없음. 진단 성능과 괴리
- ○ Task-based image quality (model observer)
  - 정의: 영상이 특정 진단 task(병변 검출 등)를 얼마나 잘 지원하는지 수학적 관찰자 model(예: CHO, Channelized Hotelling Observer)로 평가 [R34]
  - 장점: "진단에 충분한 화질"을 정량화. Reader study보다 저비용
  - 한계: Model observer와 사람 판독의 일치 검증 필요. 단순 task(신호 검출)에 한정
- ○ No-reference IQA(Image Quality Assessment)
  - 정의: 참조 영상 없이 화질을 점수화 (`O6A` Ultrasound Quality Metrics, `W-PM-139` FunPiQ)
  - 장점: 실제 사용 환경에서 입력 품질 QC로 활용
  - 한계: 점수의 임상적 의미(진단 가능 여부)와 연결 검증 필요

---

### 2-6. Image Registration & Computational Anatomy (O6C, P1)

> [!abstract]+ 2-6 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Registration (정합) | 두 영상의 같은 해부 위치가 같은 좌표에 오도록 한 영상을 변환하는 과정 |
> | Fixed / Moving image | 기준이 되는 영상 / 변환되어 기준에 맞춰지는 영상 |
> | Deformation field (변형장) | 각 voxel이 얼마나, 어느 방향으로 이동하는지 나타낸 vector 지도 |
> | Topology (위상) 보존 | 구조물의 연결 관계·구멍 수 등이 변환 후에도 유지되는 성질 |
> | Folding | 변형장이 공간을 뒤집어 겹치게 만드는 비물리적 변형 |
> | Jacobian determinant | 변형장의 국소 부피 변화율. 1이면 부피 불변, >1 팽창, <1 수축, ≤0 folding |
> | Landmark | 두 영상에서 대응점으로 지정할 수 있는 해부학적 표지점 |
> | FLE | Fiducial Localization Error. Landmark 위치를 지정할 때 생기는 관찰자 오차 |
> | Navigation (수술) | 수술 중 기구 위치를 수술 전 영상 좌표에 실시간 표시하는 system |
> | Markerless tracking | 부착 표지 없이 영상만으로 환자·기구 위치를 추적하는 기술 |

□ Rigid / Affine / Deformable registration
- ○ 정의: 두 영상을 같은 좌표계로 맞추는 변환. Rigid(회전·이동), affine(+크기·기울기), deformable(국소 변형)
- ○ 장점: 시계열 비교, multimodal 융합, 수술 navigation의 기반
- ○ 한계: Deformable은 자유도가 커 비현실적 변형 가능
- ○ 적용 메모: 변환 유형별 허용 오차 기준을 intended use에 맞춰 설정

□ Diffeomorphic registration
- ○ 정의: 매끄럽고 역변환이 존재하는(위상 보존) 변형만 허용하는 방식
- ○ 장점: Folding 등 비물리적 변형 방지
- ○ 한계: 절제·병변 성장처럼 실제 위상이 바뀌는 경우 표현 불가
- ○ 적용 메모: 수술 전후 비교에는 부적합할 수 있음

□ TRE(Target Registration Error)
- ○ 정의: 정합 후 대응 landmark 사이 거리(mm) [R35]
- ○ 장점: 임상 의미가 가장 직접적 (예: "종양 중심 오차 2 mm")
- ○ 한계: Landmark 지정 자체의 관찰자 오차(FLE, Fiducial Localization Error) 포함. Landmark 없는 영역 오차 미반영
- ○ 적용 메모: 관찰자 landmark 재현성을 함께 보고

□ Jacobian determinant 기반 folding 비율
- ○ 정의: 변형장의 국소 부피 변화율. ≤0이면 folding(비물리적)
- ○ 장점: 변형장의 물리적 타당성 점검
- ○ 한계: 정확도 지표가 아님 (folding이 없어도 부정확할 수 있음)
- ○ 적용 메모: TRE, label DSC와 함께 보고

□ Human-AI registration QA
- ○ 정의: 정합 결과의 수용 여부를 사람이 AI 보조로 판정 (`W-PM-219`)
- ○ 장점: 실패 정합의 임상 사용 차단
- ○ 한계: 판정자 간 변동, AI 신호에 대한 과신
- ○ 적용 메모: Human-AI team 성능을 endpoint로 설정하는 설계 예시

---

### 2-7. Outcome Prediction & Longitudinal Modeling (O2B, O6B, P3)

> [!abstract]+ 2-7 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Hazard / Hazard ratio | 특정 시점까지 생존한 사람이 그 순간 사건을 겪을 순간 위험률 / 두 집단 hazard의 비 |
> | Censoring (중도절단) | 추적 종료·탈락으로 사건 발생 여부를 끝까지 관찰하지 못한 상태 |
> | Proportional hazards assumption | 두 집단 hazard의 비가 시간에 관계없이 일정하다는 Cox model 가정 |
> | Schoenfeld residual | 비례위험 가정 위반 여부를 점검하는 잔차 |
> | Linear predictor | 공변량과 계수의 선형 결합으로 계산한 위험 점수 |
> | Absolute risk | 특정 기간 내 사건이 발생할 절대 확률 (예: 3년 내 유방암 2.1%) |
> | Informative visit process | 검사 빈도가 환자 상태와 연관되어 관찰 시점 자체가 정보를 담는 상황 |
> | Enrichment (임상시험) | 사건 발생 위험이 높은 대상자를 선별 등록해 시험 효율을 높이는 전략 |
> | Biomarker | 생물학적 상태·질병 진행을 반영하는 측정 가능한 지표 (예: amyloid PET 수치) |
> | Cohort / ADNI | 공통 특성을 가진 추적 관찰 집단 / Alzheimer's Disease Neuroimaging Initiative 공개 cohort |
> | Discrimination | 사건 발생자와 비발생자를 순위로 구분하는 능력 (AUC, C-index) |
> | Recalibration | 새 인구에 맞게 예측 확률의 절편·기울기를 재추정하는 작업 |
> | Net benefit / Threshold probability | DCA에서 진양성 이득에서 위양성 손해를 가중 차감한 값 / 치료를 결정하는 최소 위험 확률 |
> | Scaled Brier score | 정보 없는 null model 대비 Brier score 개선 비율 |
> | Null model | 공변량 없이 전체 평균 위험만 예측하는 기준 model |
> | pCR | pathologic Complete Response. 수술 전 치료 후 수술 병리에서 잔존 침윤암이 없는 상태 |

□ Cox PH model / DeepSurv
- ○ 정의: Cox PH(Proportional Hazards)는 공변량이 hazard에 곱셈적으로 작용한다고 가정하는 반모수 생존 model. DeepSurv는 선형 예측자를 neural network로 대체
- ○ 장점: 중도절단(censoring) 처리. Hazard ratio로 해석 가능(Cox)
- ○ 한계: 비례위험 가정 위반 시 bias. DeepSurv는 해석성 저하, 과적합
- ○ 적용 메모: Schoenfeld residual 등 가정 점검 결과를 요구할 수 있음

□ Discrete-time survival / multi-task survival (예: `O6B` TRIAGE-MIL, `O2B` DIVER-Surv)
- ○ 정의: 추적 기간을 구간으로 나눠 구간별 사건 확률을 예측
- ○ 장점: 비례위험 가정 불필요. Neural network와 결합 쉬움
- ○ 한계: 구간 분할 방식에 결과 민감
- ○ 적용 메모: 임상적으로 의미 있는 시점(1년, 3년)의 절대위험 제시

□ Longitudinal imaging model (Neural ODE/CDE)
- ○ 정의: 반복 검사 영상의 시간 궤적을 연속시간 미분방정식으로 모델링 (`O2B` From Exams to Trajectories)
- ○ 장점: 불규칙 검사 간격 처리. 과거 검사 정보를 위험 예측에 반영
- ○ 한계: 검사 빈도 자체가 질병 상태와 연관(informative visit process)되어 bias 가능
- ○ 적용 메모: 역학적 관점에서 방문 과정의 정보성 고려 필요

□ Disease progression model (`O6B` STAMP, Alzheimer’s tau/amyloid PET)
- ○ 정의: 질병 단계·아형별 biomarker 변화 순서와 속도를 추정하는 model
- ○ 장점: 개인별 진행 속도 예측, 임상시험 대상자 선별(enrichment)에 활용
- ○ 한계: 관찰 cohort(ADNI 등)의 선택 편향. 외부 인구 일반화 제한
- ○ 적용 메모: 치료제 임상시험의 enrichment 도구로 쓰일 때 별도 검증 필요

□ C-index(Concordance index)
- ○ 정의: 무작위 환자 쌍에서 위험 점수가 높은 쪽이 먼저 사건을 겪을 확률. Harrell's C, Uno's C [R59]
- ○ 장점: 생존 model 판별력을 하나의 수치로 요약
- ○ 한계: Harrell's C는 censoring 분포에 의존. 임상적으로 중요한 시점의 성능을 가리지 못함. Calibration 정보 없음
- ○ 적용 메모: Time-dependent AUC와 calibration을 병행

□ Time-dependent AUC
- ○ 정의: 특정 시점 t까지 사건 발생 여부를 구분하는 AUC
- ○ 장점: 임상 의사결정 시점별 성능 제시
- ○ 한계: 시점 선택에 따라 결과 다름
- ○ 적용 메모: 시점을 사전 지정

□ Calibration (calibration plot, slope, intercept)
- ○ 정의: 예측 위험과 실제 관측 위험의 일치 정도. Slope < 1이면 과적합(예측이 극단적) [R16]
- ○ 장점: 절대위험 기반 의사결정(치료 여부)에 필수 정보
- ○ 한계: 외부 인구에서 쉽게 깨짐(baseline risk 차이). 충분한 사건 수 필요
- ○ 적용 메모: External validation에서 recalibration 필요 여부 판단

□ Brier score / Integrated Brier score
- ○ 정의: 예측 확률과 실제 결과(0/1)의 평균 제곱오차. 시간 적분형이 IBS
- ○ 장점: 판별력과 calibration을 함께 반영
- ○ 한계: 유병률 의존으로 절대값 해석 어려움
- ○ 적용 메모: Null model 대비 상대 개선(scaled Brier)으로 제시

□ DCA(Decision Curve Analysis)
- ○ 정의: 치료 결정 threshold 확률 범위에서 model 사용 시 net benefit을 "모두 치료/모두 비치료"와 비교 [R60]
- ○ 장점: 임상 유용성을 직접 평가. AUC 차이의 임상적 의미 해석
- ○ 한계: Threshold 범위 선택 주관성. 비용·위해의 정량 가정 필요
- ○ 적용 메모: TRIPOD+AI 권장 요소 [R17]

---

### 2-8. Foundation Model, VLM, Report Generation (P4, 각 Oral 분산)

> [!abstract]+ 2-8 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Pre-training / Fine-tuning | 대규모 data로 먼저 일반 표현을 학습 / 이후 목표 task data로 추가 학습 |
> | Linear probing | 사전학습 encoder를 고정하고 마지막 선형 분류층만 학습해 표현 품질을 평가하는 방법 |
> | Masking (masked image modeling) | 영상 일부를 가리고 복원하도록 학습하는 self-supervised 과제 |
> | Contrastive learning | 같은 영상의 변형은 가깝게, 다른 영상은 멀게 표현하도록 학습하는 방법 (CLIP은 영상–text 쌍 적용) |
> | LLM | Large Language Model. 대규모 text로 학습한 언어 생성 model |
> | Token | LLM이 처리하는 text·영상의 최소 단위 조각 |
> | Non-deterministic output | 같은 입력에도 sampling 설정에 따라 매번 다른 출력이 생성되는 성질 |
> | Benchmark | 공통 dataset·질문·metric으로 model을 비교하는 표준 평가 세트 |
> | Retrieval / Knowledge base | 질문과 관련된 문서·증례를 검색하는 과정 / 검색 대상 DB |
> | Tool calling | LLM이 외부 program(segmentation model, 계산기, DB)을 호출해 결과를 받는 기능 |
> | Audit trail | 각 단계의 입력·출력·판단 근거 기록. 사후 검증에 사용 |
> | n-gram | 연속된 n개 단어 묶음. BLEU·ROUGE의 비교 단위 |
> | Embedding | 단어·문장을 의미를 담은 수치 vector로 표현한 것 |
> | Negation / Laterality | 소견의 부정 표현('no', 'without') / 좌우 위치. 판독문 오류의 주요 유형 |
> | Labeler (CheXbert) | 판독문에서 소견 유무 label을 자동 추출하는 NLP model |
> | Entity / Relation (RadGraph) | 소견·해부 부위 등 의미 단위 / 그들 사이 관계(위치, 수식) |
> | LLM-as-judge | LLM이 생성 결과를 참조와 비교해 점수·오류를 판정하는 평가 방식 |
> | Adversarial prompt | Model의 오류·동조를 유도하도록 설계한 질문 |
> | Ablation (영상 제거 test) | 입력 일부(영상)를 제거하고 성능 변화를 보아 해당 입력의 기여도를 확인하는 실험 |
> | Grounding | 생성 text의 각 소견을 영상의 해당 위치와 연결하는 것 |

□ Foundation model
- ○ 정의: 대규모·다양한 data로 self-supervised 사전학습 후 다수 downstream task에 적응하는 범용 model [R61]
- ○ 장점: 적은 label로 새 task 적응, 여러 기관 data에서 일반화 향상 가능성
- ○ 한계: ① 사전학습 data 출처·구성 불투명 ② 검증 범위 정의 어려움(범용성 claim) ③ 계산 자원 부담
- ○ 적용 메모: 허가 대상은 "특정 intended use로 고정한 downstream model". 사전학습 model 버전 고정 필요

□ SSL(Self-Supervised Learning)
- ○ 정의: Label 없이 영상 자체에서 만든 과제(masking 복원, contrastive 학습 등)로 표현을 학습
- ○ 장점: 비표지 대량 data 활용
- ○ 한계: 학습된 표현이 임상적으로 중요한 미세 소견을 담는다는 보장 없음
- ○ 적용 메모: Linear probing과 fine-tuning 결과를 구분해 해석

□ VLM / MLLM(Vision-Language Model / Multimodal Large Language Model)
- ○ 정의: 영상 encoder와 LLM을 결합해 영상에 대한 질의응답·서술을 수행
- ○ 장점: 자유 형식 질의, 판독문 작성, 소견 설명 등 유연한 사용
- ○ 한계: Hallucination, sycophancy, modality collapse. 출력이 비결정적(같은 입력에 다른 답)
- ○ 적용 메모: 반복 실행 재현성, 오류 분류 체계 기반 평가 필요 (MFDS 생성형 AI 가이드라인 [R24])

□ Medical VQA(Visual Question Answering)
- ○ 정의: 의료영상과 질문을 입력받아 답을 생성하는 task
- ○ 장점: Model의 영상 이해 수준을 세분화해 점검
- ○ 한계: Benchmark 질문이 text만으로 풀리는 경우 많음(영상 미사용). 폐쇄형 선택지 정답률이 실제 능력 과대평가
- ○ 적용 메모: `O6B` CT-SpatialVQA처럼 공간 이해를 분리 평가하는 benchmark 증가

□ RAG(Retrieval-Augmented Generation)
- ○ 정의: 외부 지식(가이드라인, 유사 증례, 과거 검사)을 검색해 생성에 활용
- ○ 장점: 근거 기반 출력, hallucination 감소, 지식 갱신 용이
- ○ 한계: 검색 오류가 그대로 전파. 검색 DB 변경 시 성능 변동 → 변경관리 대상
- ○ 적용 메모: 검색 DB 버전을 기기 구성요소로 관리

□ AI agent (tool-using)
- ○ 정의: LLM이 계획을 세우고 외부 도구(segmentation model, 계측 도구, DB)를 호출해 다단계 작업 수행 (`O3A` DUCX, `O5C` BCER Agent, `W-PM-013` OPGAgent)
- ○ 장점: 복잡한 workflow 자동화, 중간 산출물 감사(audit) 가능
- ○ 한계: 단계별 오류 누적. 전체 system 검증 범위가 넓어짐
- ○ 적용 메모: 구성 도구별 검증 + end-to-end 검증의 2단계 필요

□ Hallucination / Sycophancy / Modality collapse
- ○ Hallucination: 영상에 없는 소견을 서술. 탐지 연구 `O3A` VIHD, `W-PM-157`
- ○ Sycophancy: 사용자가 제시한 의견에 맞춰 답을 바꾸는 현상. 판독의가 틀린 의견을 입력하면 AI가 동조할 위험 (`W-AM-181`)
- ○ Modality collapse: 영상 정보를 무시하고 text 문맥만으로 답하는 현상 (`O1B` Better Said Than Seen)
- ○ 공통 한계: 전체 정확도 지표로 드러나지 않음
- ○ 적용 메모: Adversarial prompt, 영상 제거(ablation) test를 안전성 시험으로 포함

□ RRG(Radiology Report Generation) 평가 metric

| Metric | 정의 | 장점 | 한계 |
|---|---|---|---|
| BLEU / ROUGE / METEOR | 참조 판독문과 단어 n-gram 겹침 | 계산 간단, 과거 연구와 비교 가능 | "no pneumothorax" vs "pneumothorax"를 거의 같게 취급. 임상 정확도와 상관 낮음 |
| BERTScore | 문장 embedding 유사도 | 표현 차이에 관대 | 부정(negation)·측위(좌우) 오류에 둔감 |
| CheXbert F1 | Labeler로 14개 소견 추출 후 일치도 | 임상 소견 단위 평가 | 14개 소견 밖 정보 무시. Labeler 자체 오류 |
| RadGraph F1 | 소견 entity·관계 graph 일치도 [R36] | 위치·속성까지 반영 | Graph 추출 model 오류 전파 |
| RadCliQ | 여러 metric 조합으로 radiologist 오류 수 예측 [R36] | 사람 평가와 상관 높음 | 학습된 가중치의 일반화 한계 |
| GREEN / CRIMSON / AtomiMed | LLM이 임상적 오류를 분류·계수 [R37] | 오류 유형(누락, 오기, 측위) 해석 가능 | Judge LLM 버전 의존, 재현성·bias. Judge 자체 검증 필요 |
| Radiologist 평가 | 전문의가 오류·수정 필요도 판정 | 최종 기준 | 비용 높음, 평가자 간 변동 |

- ○ 공통 근본 한계: 참조 판독문 자체의 누락·오류가 참조표준 오류로 전이
- ○ 적용 메모: 허가 목적에서는 "임상적으로 중대한 오류율"과 "판독의 수정 시간·수정률"이 설득력 있는 endpoint

---

### 2-9. Image-Guided Interventions, Robotics, Surgical Data Science (O1C, O3C, P5)

> [!abstract]+ 2-9 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Surgical phase | 수술 절차를 구성하는 순차 단계 (예: 절개 → 박리 → 봉합) |
> | Kinematics | Robot 수술 기구의 위치·속도·회전 기록 data |
> | OSATS / GEARS | Objective Structured Assessment of Technical Skills / Global Evaluative Assessment of Robotic Skills. 전문가 수술 술기 채점표 |
> | ICC | Intraclass Correlation Coefficient. 연속형 점수의 평가자 간 일치도 (3-1-2절) |
> | Frame-level / Event-level 평가 | Video frame 하나하나의 정답 비율 / 단계 전환 시점 등 사건 단위 정확도 |
> | Heat sink effect | 큰 혈관 혈류가 열을 빼앗아 소작 범위가 줄어드는 현상 |
> | PSO | Particle Swarm Optimization. 여러 후보 해가 협력하며 최적값을 찾는 최적화 기법 |
> | Sonification | 영상·센서 정보를 소리 신호로 변환해 전달하는 방법 |
> | AR | Augmented Reality. 실제 시야 위에 가상 정보를 겹쳐 보여주는 기술 |
> | Formative / Summative usability test | 개발 중 설계 개선용 사용성 평가 / 최종 설계가 안전하게 사용됨을 입증하는 검증 시험 |
> | IEC 62366-1 | 의료기기 사용적합성(usability engineering) 국제 표준 |
> | Workload | 과업 수행 시 사용자가 느끼는 정신적·신체적 부담 |

□ Surgical phase recognition / tool tracking
- ○ 정의: 수술 video에서 현재 수술 단계, 도구 위치·자세를 인식
- ○ 장점: 수술 기록 자동화, 실시간 경고, 교육
- ○ 한계: 기관·술자별 술기 차이로 일반화 어려움. Phase 경계 정의가 annotator마다 다름
- ○ 적용 메모: Frame-level accuracy보다 event-level(단계 전환 시점 오차) 평가가 임상적으로 의미 있음

□ Surgical skill assessment (GES-Net, R-MSA, CoRe-DA)
- ○ 정의: 수술 video·kinematics로 술기 수준을 점수화
- ○ 장점: 객관적 교육 평가, 자격 인증 보조
- ○ 한계: 참조표준인 OSATS/GEARS 전문가 점수의 rater variability. 점수와 환자 결과의 연관 근거 제한
- ○ 적용 메모: 전문가 간 ICC를 기준선으로 제시

□ Robotic ultrasound / LLM-based robotic agent
- ○ 정의: Robot이 초음파 probe를 조작해 영상 획득. LLM이 scanning guideline을 해석해 동작 계획 (`O1C`)
- ○ 장점: 비전문가 환경의 영상 획득 표준화, 원격 검사
- ○ 한계: 환자 안전(접촉력), 예외 상황 대응. 영상 품질 평가 기준 필요
- ○ 적용 메모: 초보자 획득 영상의 진단 적합성 평가 연구와 설계 유사 

□ Thermal ablation planning (MWA, multi-needle PSO)
- ○ 정의: 소작 범위를 시뮬레이션해 바늘 위치·출력을 최적화
- ○ 장점: 종양 완전 소작과 정상조직 보존의 균형
- ○ 한계: 조직 특성·혈류 냉각 효과(heat sink) 개인차. 시뮬레이션 검증 data 부족
- ○ 적용 메모: 시뮬레이션 credibility 평가 체계 적용 대상 [R55]

□ Human factors 평가 도구
- ○ NASA-TLX(Task Load Index)
  - 정의: 정신적·신체적·시간적 부담 등 6개 차원의 주관적 workload 척도
  - 장점: 표준화, 비교 가능
  - 한계: 자기보고 bias, 소수 참여자에서 변동 큼
- ○ SUS(System Usability Scale)
  - 정의: 10문항 사용성 척도(0~100)
  - 장점: 짧고 널리 사용
  - 한계: 사용성의 원인 진단 정보 부족
- ○ 적용 메모: IEC 62366-1 usability engineering, FDA Human Factors guidance(2016)의 summative test와는 목적이 다름 (`W-PM-031` AR guidance workload 연구)

---

### 2-10. Trustworthy AI (P5, 각 Oral 분산)

> [!abstract]+ 2-10 본문 용어 정의 (등장 순)
>
> | 용어 | 정의 |
> |---|---|
> | Aleatoric / Epistemic | Data 자체의 줄일 수 없는 불확실성 / model 지식 부족에서 오는, data 추가로 줄일 수 있는 불확실성 |
> | Dropout | 학습 중 일부 neuron을 무작위로 끄는 과적합 방지 기법 |
> | Posterior distribution | Data를 관측한 뒤 parameter·예측에 대해 갱신된 확률분포 (Bayesian 관점) |
> | Dirichlet distribution | 여러 class 확률 vector 자체의 분포. Evidential learning의 출력 형태 |
> | Logit | Softmax 적용 전 model의 원 출력 점수 |
> | Softmax | Logit을 합이 1인 class 확률로 바꾸는 함수 |
> | Confidence (확신도) | Model이 예측 class에 부여한 확률값 |
> | Coverage | Selective prediction에서 AI가 자동 처리하는 case 비율. Conformal에서는 예측 집합이 정답을 포함하는 비율 |
> | Selective prediction | 불확실한 case는 판단을 보류(전문가에게 넘김)하고 확신 있는 case만 예측하는 방식 |
> | Bin | 확률 범위를 나눈 구간 (예: 0.0–0.1, 0.1–0.2 …) |
> | Reliability diagram | Bin별 평균 확신도(x)와 실제 정답률(y)을 그린 calibration 그림. 대각선에 가까울수록 좋음 |
> | Calibration slope / intercept | 예측 logit에 대한 실제 결과의 회귀 기울기(1이 이상적) / 절편(0이 이상적, 전체 과대·과소 예측) |
> | Soft label | 0/1 대신 rater 불일치 비율 등 확률로 표현한 label (예: 3명 중 2명 양성 → 0.67) |
> | Calibration set (conformal) | Conformal prediction의 임계값을 정하기 위해 학습·test와 분리해 둔 labeled data |
> | Nonconformity score | 새 예측이 정답과 얼마나 어긋나는지를 나타내는 점수. 크기 순위로 prediction set 결정 |
> | Exchangeability | Data 순서를 바꿔도 결합분포가 같다는 가정. Calibration data와 test data가 같은 분포에서 왔다는 의미 |
> | Marginal / Conditional coverage | 전체 평균으로 보장되는 coverage / 특정 subgroup·입력 조건별 coverage |
> | OOD | Out-of-Distribution. 학습 data 분포 밖 입력 |
> | Human-in-the-loop | AI 처리 과정 중 특정 지점에 사람의 확인·판단을 포함하는 운영 방식 |
> | TPR / FPR | True Positive Rate(= sensitivity) / False Positive Rate(= 1 − specificity) |
> | Equalized odds / Demographic parity | 집단 간 TPR·FPR이 같아야 한다는 기준 / 집단 간 양성 판정 비율이 같아야 한다는 기준 |
> | Worst-group performance | 여러 subgroup 중 가장 낮은 성능. 형평성 하한 지표 |
> | Underdiagnosis | 실제 질환이 있는데 정상으로 판정되는 비율(FN)이 특정 집단에서 높은 현상 |
> | Covariate / Label / Concept shift | 입력 분포 변화 / 유병률 변화 / 입력–정답 관계(진단 기준) 변화 |
> | Domain generalization / adaptation | Target data 없이 새 domain에 일반화 / target data로 조정 |
> | Federated learning / FedAvg | Data를 공유하지 않고 기관별 학습 parameter만 모아 평균하는 분산 학습 / 대표 알고리즘 |
> | Non-IID | Non-Independent and Identically Distributed. 기관마다 data 분포가 다른 상태 |

#### 2-10-1. Uncertainty quantification

□ Aleatoric vs epistemic uncertainty
- ○ 정의: Aleatoric은 data 자체의 모호성(경계 불명확, rater 불일치). Epistemic은 model 지식 부족(학습 분포 밖 입력) [R62]
- ○ 장점: 불확실성 원인에 따라 대응 방식 구분 (aleatoric → 전문가 재판독, epistemic → 사용 제한·추가 학습)
- ○ 한계: 실제 추정치에서 두 성분 분리가 불완전
- ○ 적용 메모: "불확실성 높음" 표시가 실제 오류와 연관되는지 검증해야 사용자 정보로 가치가 있음

□ MC dropout
- ○ 정의: 추론 시 dropout을 켠 채 여러 번 예측해 분산을 uncertainty로 사용 [R63]
- ○ 장점: 기존 model에 쉽게 적용
- ○ 한계: Uncertainty 과소추정 경향, dropout 비율에 의존
- ○ 적용 메모: 추론 시간 증가 고려

□ Deep ensemble
- ○ 정의: 서로 다른 초기값으로 학습한 여러 model의 예측 분산을 uncertainty로 사용 [R64]
- ○ 장점: 성능과 uncertainty 품질 모두 우수한 표준 기준선
- ○ 한계: 학습·추론 비용이 model 수만큼 증가. CV fold model 재사용은 진짜 ensemble이 아닐 수 있음 (`O2A` Lost in the Folds)
- ○ 적용 메모: Ensemble 구성원 수와 구성 방식을 기술문서에 명시

□ Evidential deep learning
- ○ 정의: 예측 확률 자체의 분포(Dirichlet)를 한 번의 추론으로 출력 [R65]
- ○ 장점: 단일 추론으로 uncertainty 산출, 계산 효율
- ○ 한계: Uncertainty 추정의 이론적 타당성 논란. 하이퍼파라미터 민감
- ○ 적용 메모: `M-PM-109`, `W-PM-114` 등에서 사용

□ Uncertainty 평가 (AURC, selective prediction)
- ○ 정의: 불확실성이 큰 case를 순서대로 제외(전문가에게 넘김)할 때 남은 case의 오류율 변화. AURC(Area Under Risk-Coverage curve)
- ○ 장점: "AI가 확신하는 case만 자동 처리" 같은 workflow 설계의 근거
- ○ 한계: 제외된 case의 처리 비용·성능을 함께 평가해야 전체 효과를 알 수 있음
- ○ 적용 메모: 특정 coverage(예: 80%)에서의 sensitivity/specificity 제시

#### 2-10-2. Calibration

□ ECE(Expected Calibration Error)
- ○ 정의: 예측 확률을 bin으로 나눠 각 bin의 평균 확신도와 실제 정답률 차이를 가중 평균 [R14]
$$
\text{ECE}=\sum_{b=1}^{B}\frac{n_b}{N}\,\bigl|\text{acc}(b)-\text{conf}(b)\bigr|
$$
- ○ 장점: 단일 수치로 요약, ML 분야 표준
- ○ 한계: ① Bin 수·방식에 결과 의존 ② 작은 표본에서 양의 bias ③ 과신/과소신 방향 정보 손실
- ○ 적용 메모: Reliability diagram, calibration slope/intercept와 병행 [R16]. `W-PM-094` CalCErt는 bin별 통계적 인증 시도

□ Temperature scaling
- ○ 정의: Logit을 하나의 온도 파라미터로 나눠 확률을 사후 보정 [R14]
- ○ 장점: 간단, 정확도 불변
- ○ 한계: Distribution shift 후에는 보정 효과 소실
- ○ 적용 메모: 기관별 recalibration 필요성 평가

□ Multi-rater 상황의 calibration
- ○ 정의: 참조 label이 rater 간 불일치로 확률적(soft label)일 때 calibration target을 무엇으로 볼지의 문제
- ○ 장점: Aleatoric 불확실성을 정직하게 반영
- ○ 한계: 다수결 label 기준 ECE는 불일치 case에서 model을 과신/과소신으로 잘못 판정 가능 (`W-PM-162`)
- ○ 적용 메모: Rater 수와 불일치 분포를 함께 보고

#### 2-10-3. Conformal prediction

□ Conformal prediction
- ○ 정의: 별도 calibration set의 비적합도 점수(nonconformity score)를 이용해, 예측 집합 C(X)가 정답을 포함할 확률을 $P(Y\in C(X))\ge 1-\alpha$로 보장하는 방법 [R15]
- ○ 장점: Model 종류·분포 가정 없이 유한 표본 coverage 보장. 정량 측정에 "±구간" 제공
- ○ 한계: ① Exchangeability 가정 → distribution shift 시 보장 깨짐 ② 보장은 평균(marginal) coverage로, 특정 subgroup coverage는 보장 안 됨 ③ 구간이 넓으면 임상 효용 낮음
- ○ 적용 메모: Subgroup별 coverage 확인(conditional coverage). `M-PM-105`, `O6C` Efficient Conformal Volumetry

#### 2-10-4. OOD detection, failure detection

□ OOD(Out-of-Distribution) detection
- ○ 정의: 학습 분포와 다른 입력(다른 장비, 해부부위, 소아, 금속 artifact)을 식별 [R66]
- ○ 장점: Intended use 밖 입력에 대한 자동 경고
- ○ 한계: "어느 정도 다르면 OOD인가" 경계 정의 모호. 미묘한 shift는 탐지 어려움
- ○ 적용 메모: 사용설명서의 사용 조건과 OOD 탐지 기준 연계. `W-PM-044` CHILD(human-in-the-loop)

□ Failure detection (segmentation quality control)
- ○ 정의: 출력 결과가 틀렸을 가능성을 case 단위로 예측 (`O5A` Liver CT, `T-AM-111` FDRAS)
- ○ 장점: 실사용 중 오류 case를 사람 검토로 전환. Post-market monitoring 도구
- ○ 한계: Failure detector 자체의 sensitivity/specificity 검증 필요. 실제 오류 빈도가 낮아 평가 data 부족
- ○ 적용 메모: FDA AI-enabled device draft guidance의 performance monitoring 계획과 연결 [R22]

#### 2-10-5. Fairness & bias

□ Subgroup performance analysis
- ○ 정의: 성별, 연령, 인종, 기관, 장비 제조사, 중증도별로 성능 산출·비교
- ○ 장점: 평균 성능에 가려진 취약 집단 발견
- ○ 한계: Subgroup 표본 부족으로 신뢰구간 넓음. 다중비교 문제
- ○ 적용 메모: 사전 지정 subgroup과 탐색적 subgroup 구분. FDA draft guidance가 subgroup 성능 제시 강조 [R22]

□ Fairness metric (equalized odds, demographic parity, worst-group performance)
- ○ 정의: Equalized odds = 집단 간 TPR·FPR 동일 [R67]. Demographic parity = 양성 판정 비율 동일. Worst-group = 가장 낮은 집단 성능
- ○ 장점: 형평성 목표를 수치화
- ○ 한계: 여러 fairness 기준을 동시에 만족하기는 수학적으로 불가능한 경우가 많음. 유병률 차이가 실제 존재하면 demographic parity는 부적절
- ○ 적용 메모: 의료기기에서는 집단별 sensitivity·specificity 차이(equalized odds 계열)가 해석상 가장 자연스러움

□ Underdiagnosis bias / Hidden stratification
- ○ 정의: Underdiagnosis bias는 특정 집단에서 FN 증가로 질환이 과소진단되는 현상 [R31]. Hidden stratification은 평균 성능 뒤에 숨은 임상적으로 중요한 소집단(예: chest tube 없는 기흉)의 성능 저하 [R38]
- ○ 장점: 개념 자체가 검증 설계의 체크리스트 역할
- ○ 한계: 소집단을 사전에 모두 알 수 없음
- ○ 적용 메모: 임상 전문가와 함께 위험 소집단을 사전 도출(위해 분석 연계)

#### 2-10-6. Domain generalization·Federated learning

□ Domain shift 유형
- ○ Covariate shift: 입력 분포 변화(장비, protocol, 재구성 kernel). 가장 흔함
- ○ Label shift(prior shift): 유병률 변화(검진 vs 3차 병원). PPV·NPV 변동의 원인
- ○ Concept shift: 진단 기준·정의 변화(분류체계 개정)
- ○ 적용 메모: External validation site 선정 시 각 shift 유형을 의도적으로 포함

□ Domain generalization / adaptation
- ○ 정의: Generalization은 target domain data 없이 새 domain에서도 작동하도록 학습. Adaptation은 target data(label 유/무)로 조정
- ○ 장점: 다기관 배포 시 성능 저하 완화
- ○ 한계: "보지 못한 domain" 성능은 결국 실측 검증 필요
- ○ 적용 메모: 논문의 "unseen domain" test가 실제 intended use 환경을 대표하는지 확인

□ Federated learning
- ○ 정의: Data를 기관 밖으로 옮기지 않고 model parameter만 공유해 다기관 공동 학습 [R68]
- ○ 장점: 개인정보 보호, 다양한 data 확보
- ○ 한계: 기관 간 data 이질성(non-IID)으로 수렴 저하. 학습 data 품질 직접 검증 어려움
- ○ 적용 메모: 학습 참여 기관과 검증 기관의 독립성 확보. 참여 기관별 data 특성 요약 제출 필요

---

## 3. 관심 축별 심화 정리

### 3-1. ① 평가 metric

#### 3-1-1. Task별 metric 선택 지도

| Task | 권장 primary metric | 보조 metric | 임상시험 endpoint로 전환 시 | 흔한 함정 |
|---|---|---|---|---|
| 이진 분류 (CADx, screening) | Sensitivity, Specificity (사전 고정 threshold) | AUROC, PPV/NPV | Co-primary (sens & spec 각각 성능목표 또는 NI) | Enriched set의 PPV 보고, threshold 사후 선택 |
| 병변 검출 (CADe) | Lesion-level sensitivity, FP/image | FROC, JAFROC FOM | MRMC reader study의 AUC/JAFROC 차이 | Localization 기준 미정의 |
| Triage (CADt) | Sensitivity, Specificity | Time-to-notification | Standard of care 대비 시간 단축 | 진단 성능 claim으로 오해 |
| Segmentation | DSC + boundary metric(NSD/HD95) | Lesion-wise F1 | 측정값 agreement(Bland–Altman, ICC) | 작은 구조물 DSC 과소평가, empty mask 처리 |
| 정량 측정 (volumetry, 계측) | Bias, LoA | ICC, CCC, RMSE | Equivalence margin 사전 정의 | Correlation을 agreement로 오해 |
| Grading (ordinal) | Quadratic weighted kappa | Confusion matrix | 전문가 panel 대비 agreement | 참조 panel 자체 kappa 미보고 |
| 예후 예측 | C-index + calibration | Brier, DCA | Clinical utility (net benefit) | Calibration 누락 |
| 영상 생성·재구성 | Task-based metric, reader score | PSNR/SSIM/FID | Reader study (진단 화질 비열등) | FID만으로 임상 품질 주장 |
| 판독문 생성 | 임상적 중대 오류율, 소견별 F1 | RadGraph F1, LLM-as-judge | Radiologist 수정률·수정 시간 | BLEU/ROUGE 의존 |

#### 3-1-2. Agreement(일치도) 지표 — 정량 기기·참조표준 품질 평가의 핵심

□ Bland–Altman analysis
- ○ 정의: 두 측정법 차이의 평균(bias)과 95% LoA $=\bar d \pm 1.96\,s_d$를 산출하고 차이 vs 평균 plot으로 표시 [R48]
- ○ 장점: 측정 단위로 해석. 측정값 크기에 따른 오차 경향(비례 bias) 확인 가능
- ○ 한계: 차이가 정규분포이고 측정 범위 전체에서 일정하다는 가정. 반복측정·clustering 시 수정 방법 필요
- ○ 적용 메모: 허용 LoA를 임상 근거로 사전 설정 → 관측 LoA의 신뢰구간이 허용범위 안인지 판정

□ ICC(Intraclass Correlation Coefficient)
- ○ 정의: 전체 분산 중 대상 간 분산 비율. Two-way random/mixed, absolute agreement/consistency, single/average 등 형태가 다름 [R69]
- ○ 장점: 다수 rater·다수 측정의 신뢰도를 하나로 요약
- ○ 한계: 대상 간 변동이 크면 오차가 커도 ICC가 높게 나옴. 형태(model) 선택에 따라 값이 크게 다름
- ○ 적용 메모: ICC(2,1) absolute agreement 등 사용 형태를 명시. Bland–Altman과 병행

□ CCC(Lin’s Concordance Correlation Coefficient)
- ○ 정의: Pearson 상관에 평균·척도 차이를 벌점으로 반영한 일치도 [R70]
- ○ 장점: 두 측정법 간 동일선(y = x) 일치 정도를 직접 반영
- ○ 한계: ICC와 같이 대상 범위에 의존
- ○ 적용 메모: 두 방법 비교(AI vs 전문가 1인 평균)에 적합

□ Cohen’s kappa / Fleiss’ kappa
- ○ 정의: 범주형 판정의 우연 일치를 보정한 일치도. Fleiss는 3인 이상
- ○ 장점: 명목형 참조표준의 rater 일치도 표준 지표
- ○ 한계: 유병률 극단 시 일치율이 높아도 kappa가 낮아지는 paradox. 순서형에는 weighted kappa 사용
- ○ 적용 메모: 관찰 일치율(percent agreement), PABAK를 함께 제시

#### 3-1-3. 추정·추론 방법

□ 비율의 신뢰구간 (Wilson, Clopper–Pearson)
- ○ 정의: Sensitivity 등 이항 비율의 구간 추정. Clopper–Pearson은 exact, Wilson은 score 방법
- ○ 장점: Wald보다 극단 비율(>0.9)에서 coverage 양호
- ○ 한계: Clopper–Pearson은 보수적(구간 넓음)
- ○ 적용 메모: 성능목표 검정 방식과 구간 방법을 SAP에 일치시킴

□ Cluster bootstrap / GEE / mixed model (clustered data)
- ○ 정의: 한 환자의 여러 병변·영상, 한 기관의 여러 환자처럼 상관된 data에서 분산을 올바르게 추정하는 방법
- ○ 장점: 표준오차 과소추정(→ 위양성 결론) 방지
- ○ 한계: Cluster 수가 적으면(예: 기관 3개) 추정 불안정
- ○ 적용 메모: MICCAI 논문 다수는 lesion을 독립으로 취급. 발표 질의 포인트

□ DeLong test
- ○ 정의: 같은 case에 대한 두 AUC의 차이를 U-statistic 분산으로 검정 [R49]
- ○ 장점: 비모수, paired 설계에 적합
- ○ 한계: Reader 변동을 반영하지 않음 → 판독의 포함 연구에는 MRMC 방법 필요. 작은 표본·nested model 비교에서 부정확
- ○ 적용 메모: Standalone AI vs 다른 AI 비교에 사용

□ Multiplicity (다중성)
- ○ 정의: 여러 endpoint·subgroup·threshold를 검정할 때 1종 오류 증가
- ○ 장점(통제 시): 결론의 신뢰도 확보
- ○ 한계: 과도한 보정은 검정력 손실
- ○ 적용 메모: Co-primary(모두 충족), hierarchical testing(순서 검정), gatekeeping 구조를 사전 지정

#### 3-1-4. Benchmark·challenge 결과 해석

□ Metric aggregation
- ○ 정의: Case별 metric을 평균할지, 전체 voxel·병변을 pooled 계산할지 결정
- ○ 장점(명시 시): 결과 재현·비교 가능
- ○ 한계: 방식에 따라 순위가 바뀜. 큰 구조물·다병변 환자가 pooled 값을 지배
- ○ 적용 메모: 집계 단위(환자 기준)를 protocol에 명시 [R1]

□ Ranking robustness
- ○ 정의: Bootstrap 재표본으로 방법 간 순위의 안정성 평가 [R5]
- ○ 장점: "1위"가 우연인지 판단
- ○ 한계: Test set 자체의 대표성 문제는 해결 못함
- ○ 적용 메모: Benchmark 논문(`O1B` national-scale, `W-AM-104` MedFM-Robust) 해석 시 확인

□ Metric 선택 원칙 요약 (Metrics Reloaded [R1][R2])
- ○ Problem fingerprint 먼저 정의: task 유형, 구조물 크기, class imbalance, 참조표준 불확실성
- ○ 상호 보완 metric 조합(overlap + boundary + detection)
- ○ 임상 질문 단위(환자, 병변, 측정값)와 metric 단위 일치

---

### 3-2. ② 참조표준(Reference standard) 설정

#### 3-2-1. 기본 용어

□ Reference standard vs Gold standard vs Ground truth
- ○ 정의: Reference standard는 target condition을 판정하는 최선의 가용 방법(STARD) [R18]. Gold standard는 오류 없는 이상적 기준. Ground truth는 ML 분야 관용어
- ○ 장점: "Reference standard" 용어는 오류 가능성을 인정해 한계 논의를 자연스럽게 함
- ○ 한계: "Ground truth" 표현은 참조 오류를 간과하게 만듦
- ○ 적용 메모: 규제 문서·SAP에서는 reference standard로 통일

□ Truthing
- ○ 정의: FDA CAD guidance에서 참조표준을 확립하는 절차 전체(판정자, 정보, 규칙, 위치 기준) [R25]
- ○ 장점: 절차 요소를 분리해 문서화하도록 유도
- ○ 한계: 절차가 복잡할수록 비용 증가
- ○ 적용 메모: Truthing plan을 임상시험 protocol의 부록으로 사전 확정

#### 3-2-2. 참조표준 유형별 장단점

□ 조직병리(histopathology)
- ○ 정의: 생검·수술 조직의 병리 진단
- ○ 장점: 악성 여부 판정에서 가장 객관적
- ○ 한계: ① 생검한 case만 확인 가능 → verification bias ② 표본오차(생검이 병변을 빗나감) ③ 음성 case에는 적용 불가
- ○ 적용 메모: 음성 case는 추적 관찰로 보완하는 composite 설계 필요

□ 임상 추적(clinical follow-up)
- ○ 정의: 일정 기간 추적 후 질환 발생 여부로 판정 (예: mammography 음성 = 1~2년 내 암 진단 없음)
- ○ 장점: 음성 case의 참조표준 확보
- ○ 한계: 추적 탈락, 기간 설정 근거, 추적 중 새로 생긴 병변과의 구분
- ○ 적용 메모: 추적 기간을 질환 자연사·검진 간격 근거로 설정

□ 다른 검사 결과(superior modality)
- ○ 정의: 더 정확한 검사로 판정 (예: CXR 결절을 CT로, 초음파를 MRI로)
- ○ 장점: 비침습, 모든 case 적용 가능
- ○ 한계: 참조 검사 자체의 오류. 두 검사 시점 차이
- ○ 적용 메모: 검사 간 허용 시간 간격 명시

□ 전문가 panel 판정
- ○ 정의: 복수 전문가가 독립 판독 후 규칙에 따라 판정
- ○ 장점: 병리·추적이 불가능한 task(segmentation, 화질, 정상 판정)에 적용 가능
- ○ 한계: Panel 구성·숙련도·규칙에 결과 의존. 판정자 공통의 체계적 오류는 해소 불가
- ○ 적용 메모: 3-2-3의 설계 요소를 사전 확정

□ Composite reference standard
- ○ 정의: 여러 정보원(병리, 영상, 추적, 임상)을 사전 규칙으로 결합
- ○ 장점: 단일 정보원의 결손 보완
- ○ 한계: 결합 규칙에 따라 accuracy 추정이 달라짐. 규칙이 index test와 상관되면 bias
- ○ 적용 메모: 규칙을 사전 정의하고 다른 규칙으로 sensitivity analysis

□ Latent class analysis (LCA)
- ○ 정의: 참 질병 상태를 관측되지 않는 잠재변수로 보고, 여러 불완전 검사 결과로부터 각 검사의 정확도를 추정 [R6][R7]
- ○ 장점: Gold standard 없는 상황에서 통계적 추정 가능
- ○ 한계: 조건부 독립 가정(검사 간 오류 독립) 위반 시 bias. 식별성(identifiability) 위해 검사 3개 이상 필요한 경우 많음
- ○ 적용 메모: 규제 primary 분석보다는 보조 분석으로 제시하는 편이 수용성이 높음

□ STAPLE(Simultaneous Truth and Performance Level Estimation)
- ○ 정의: 여러 annotator의 segmentation에서 EM 알고리즘으로 참 mask와 각 annotator의 sensitivity/specificity를 동시 추정 [R8]
- ○ 장점: Annotator 품질 차이를 반영한 가중 통합. Annotator별 성능 정보도 산출
- ○ 한계: Voxel 간 독립 가정, annotator 수가 적으면 불안정. 체계적 공통 오류 보정 불가
- ○ 적용 메모: 다수결 대비 결과 차이를 sensitivity analysis로 제시. `M-PM-042` Deep EM이 확장 형태

#### 3-2-3. 전문가 panel 설계 요소

| 설계 요소 | 선택지 | 장점 | 한계 |
|---|---|---|---|
| 판정 규칙 | Majority vote (예: 3인 중 2인) | 단순, 재현 가능 | 소수 의견 정보 손실. 짝수 인원 불가 |
|  | Adjudication (불일치 case만 제3자 판정) | 효율적, 판정 부담 감소 | 제3자 1인 판단 의존. 일치 case의 공통 오류 미검출 |
|  | Consensus meeting | 논의로 정확도 향상 | 권위자 영향(dominance bias). 재현성 낮음 |
|  | Soft label (불일치 유지) | Aleatoric 불확실성 보존 | 이진 sens/spec 계산이 어려움 |
| 판정자 독립성 | Truther ≠ reader, 개발 미참여 | Incorporation bias 방지 | 적격 전문가 확보 부담 |
| 제공 정보 | 영상만 | Index test와 동일 조건 | 참조 정확도 낮음 |
|  | 영상 + 임상정보 + 추적 결과 | 참조 정확도 향상 | 현실 판독 조건과 다름 (참조로는 적절) |
| 위치 기준 | Contour / bounding box / 중심점 + 허용거리 | Localization 평가 가능 | 기준에 따라 TP 판정 변동 |
| 자격 | 전문의, 경력 연수, 연간 판독량 | 신뢰도 확보 | 과도한 기준은 모집 어려움 |

#### 3-2-4. 참조표준 관련 bias [R71][R72]

□ Verification bias (partial/differential verification)
- ○ 정의: 일부 case만 참조표준으로 확인(partial)하거나, case마다 다른 참조표준을 적용(differential)해 생기는 bias
- ○ 영향: 보통 sensitivity 과대, specificity 과소 추정
- ○ 대응: 전 case 동일 참조표준, 불가 시 Begg–Greenes 보정 등 통계 보정 [R73]

□ Incorporation bias
- ○ 정의: Index test(AI) 결과가 참조표준 판정에 포함되거나 노출되어 생기는 bias
- ○ 영향: 정확도 과대추정
- ○ 대응: Truther에게 AI 결과 blinding. AI 보조로 만든 annotation을 검증 참조로 쓰지 않음(SAM 기반 annotation 주의)

□ Spectrum bias
- ○ 정의: 연구 대상의 중증도·난이도 분포가 intended use population과 달라 생기는 bias
- ○ 영향: 명확한 case 위주 선택 시 성능 과대
- ○ 대응: Consecutive sampling, 난이도·크기별 층화 보고

□ Imperfect reference standard bias
- ○ 정의: 참조표준 자체의 오류로 index test 정확도가 왜곡되는 현상
- ○ 영향: AI가 참조보다 정확해도 "오답"으로 계산될 수 있음. AI와 참조의 오류가 상관되면 과대추정
- ○ 대응: 3-2-2의 composite, LCA, 불일치 case 전문가 재검토(단, discrepant analysis는 bias 유발로 지양)

□ Discrepant analysis (지양 대상)
- ○ 정의: AI와 참조가 불일치한 case만 추가 검사로 재판정
- ○ 장점: 비용 절감처럼 보임
- ○ 한계: 일치 case의 공통 오류는 그대로 두고 불일치만 교정 → AI에 유리한 방향의 체계적 bias
- ○ 적용 메모: 규제 심사에서 지적 빈도 높은 설계

#### 3-2-5. Multi-rater·label noise — MICCAI 최신 흐름

□ Label noise 탐지·보정
- ○ 정의: 학습·검증 annotation의 오류를 자동 탐지하거나 학습 시 영향을 줄이는 기법 (`T-AM-063`)
- ○ 장점: 대규모 dataset 품질 관리 비용 절감
- ○ 한계: "noise"로 판정된 case가 실제로는 어려운 진짜 case일 수 있음 → 검증 set에서 제거 시 성능 과대
- ○ 적용 메모: 검증 set 정제는 AI와 독립된 전문가 재검토로만 수행

□ Rater bias·variability 모델링
- ○ 정의: Annotator별 체계적 경향(과대·과소 contour)과 무작위 변동을 model에 포함 (`W-PM-080` Gaussian Process, `M-PM-140`)
- ○ 장점: 참조 불확실성을 결과 해석에 반영
- ○ 한계: Rater 정보(ID)가 dataset에 있어야 함
- ○ 적용 메모: 임상시험 참조 panel 설계 시 rater별 annotation 보존 권장

□ Annotation 없는 학습 (`O5B`/`W-AM-160` VesselSim, `W-PM-192` synthetic pretraining)
- ○ 정의: 시뮬레이션·합성 data로 학습해 전문가 annotation을 줄임
- ○ 장점: 비용 절감, 희귀 구조 학습
- ○ 한계: Sim-to-real gap
- ○ 적용 메모: 학습은 annotation 없이 하더라도 검증은 독립 전문가 참조표준 필수

---

### 3-3. ③ 임상 평가 디자인

#### 3-3-1. 평가 단계 구조 (Park & Han [R12][R13])

```
Technical validation ─▶ Standalone performance ─▶ Reader study (MRMC) ─▶ Prospective / Workflow ─▶ Clinical outcome (RCT)
 (내부 test set)        (external, 사전 고정)      (AI 보조 효과)           (DECIDE-AI 단계)           (CONSORT-AI)
```

| 단계 | 질문 | 장점 | 한계 |
|---|---|---|---|
| Technical validation | Model이 내부 data에서 작동하는가 | 빠름, 저비용 | 과적합·data leakage 탐지 불가 |
| Standalone (external) | 독립 환경에서 AI 단독 정확도는 | 재현성 높음, 후향적 수행 가능 | 판독의와의 상호작용 효과 미반영 |
| MRMC reader study | AI 보조 시 판독의 성능이 향상되는가 | Reader·case 일반화, 규제 수용성 높음 | 실험실 판독 환경(laboratory effect) |
| Prospective workflow | 실제 진료 흐름에서 작동하는가 | 실사용 조건 반영 | 비용·기간, 비교군 설정 어려움 |
| RCT | 환자 결과가 개선되는가 | 인과 효과 최고 근거 | 비용 최대, AI 버전 변경 시 결과 노후화 |

- ○ 규제 허가 대부분은 standalone + MRMC 조합 (CADe/CADx 510(k), MFDS 확증 임상시험)
- ○ Autonomous AI, 새로운 사용 목적은 prospective 임상시험 요구 경향 [R21]

#### 3-3-2. Standalone performance study 설계 요소

□ External validation
- ○ 정의: 학습 data와 독립된 기관·장비·환자로 성능 평가
- ○ 장점: 일반화 가능성의 직접 증거
- ○ 한계: "External"의 수준 차이 큼 (같은 병원 다른 시기 ≠ 다른 국가·장비)
- ○ 적용 메모: 학습·검증 기관 목록, 장비 제조사·모델, 획득 시기를 표로 제시

□ Temporal validation
- ○ 정의: 같은 기관의 이후 시기 data로 평가
- ○ 장점: 시간에 따른 drift(protocol 변경) 점검
- ○ 한계: 기관 간 일반화 근거로는 약함
- ○ 적용 메모: External validation 보완용

□ Consecutive vs Enriched sampling
- ○ Consecutive
  - 정의: 일정 기간 해당 검사를 받은 환자를 연속 포함
  - 장점: 실제 유병률·spectrum 반영, PPV/NPV 추정 가능
  - 한계: 저유병률 질환은 양성 case 확보에 대규모 표본 필요
- ○ Enriched
  - 정의: 양성 case를 의도적으로 추가해 비율 상향
  - 장점: 표본 효율, 희귀 소견 평가 가능
  - 한계: PPV/NPV 왜곡, 판독의 행동 변화(양성 기대)
- ○ 적용 메모: Enriched 시 sens/spec 중심 보고 + 유병률 보정 PPV 제시

□ Performance goal(성능목표) vs Comparator 설계
- ○ Performance goal
  - 정의: 문헌·기존 기기 근거로 설정한 목표 수치(예: sensitivity 하한 > 0.85)와 비교
  - 장점: 단일군 설계로 효율적
  - 한계: 목표값 근거가 약하면 심사 지적. 대상군 차이로 문헌값 비교 타당성 논란
- ○ Comparator (비열등/우월)
  - 정의: 판독의 또는 기존 기기와 같은 case에서 비교
  - 장점: 해석 명확
  - 한계: NI margin 설정 근거 필요
- ○ 적용 메모: MFDS 확증 임상시험에서는 성능목표 설정 근거 문헌을 SAP에 명시하는 것이 관행

#### 3-3-3. MRMC(Multi-Reader Multi-Case) reader study

□ MRMC 개념
- ○ 정의: 복수 reader가 복수 case를 판독해 reader 변동과 case 변동을 모두 random effect로 반영하는 연구 설계
- ○ 장점: 결과를 "다른 reader, 다른 case"로 일반화 가능. CAD 허가 표준
- ○ 한계: 판독 부담 큼. 실제 진료가 아닌 실험 환경(laboratory effect)
- ○ 적용 메모: Reader 수 부족 시 reader 일반화 불가 → 통상 수 명 이상, pilot 분산 기반 산정

□ 설계 유형

| 설계 | 정의 | 장점 | 한계 |
|---|---|---|---|
| Fully-crossed | 모든 reader가 모든 case를 두 조건 모두에서 판독 | 통계 효율 최고, 분석 방법 성숙 | 판독량 = reader × case × 2 |
| Split-plot | Reader 그룹별로 다른 case block 판독 | 판독 부담 감소 | 같은 검정력에 더 많은 총 case 필요 [R27] |
| Doctor-patient (unpaired) | Reader마다 서로 다른 case | 실제 진료와 유사 | 효율 낮음, 분석 복잡 |

□ 판독 방식

| 방식 | 정의 | 장점 | 한계 |
|---|---|---|---|
| Sequential (second-read) | AI 없이 판독 기록 → 같은 session에서 AI 결과 확인 후 수정 | Washout 불필요, 빠름 | 첫 판독이 AI를 예상하고 느슨해질 수 있음. AI가 판독의를 대체하는 사용법은 평가 불가 |
| Independent crossover (concurrent 포함) | 두 조건을 다른 session에 판독, 순서 randomization, washout | Bias 최소, AI를 처음부터 보는 concurrent 사용 평가 가능 | Washout 기간(보통 4주 이상) 필요, 기간 길어짐 |

□ Washout / Randomization
- ○ 정의: Washout은 같은 case 재판독 전 기억 효과를 줄이는 기간. 판독 순서와 조건 순서를 무작위화
- ○ 장점: 기억·학습 효과(learning effect) 통제
- ○ 한계: 기간 증가로 reader 탈락 위험
- ○ 적용 메모: 순서 효과를 분석 model에 포함해 점검

□ 분석 방법

| 방법 | 정의 | 장점 | 한계 |
|---|---|---|---|
| OR(Obuchowski–Rockette) [R9] | Reader×modality별 AUC에 ANOVA, 오차 공분산 보정 | 다양한 FOM 적용, 해석 쉬움 | 공분산 추정 방식(DeLong, jackknife 등) 선택 필요 |
| DBM(Dorfman–Berbaum–Metz) [R10] | Jackknife pseudovalue에 ANOVA | 역사적 표준, OR과 수학적 동등성 입증 | Pseudovalue 해석이 직관적이지 않음 |
| U-statistic (iMRMC) [R27] | 비모수 U-statistic 분산 추정 | Split-plot 등 비대칭 설계 지원, FDA 개발 | 모수적 model 기반 sample size 기능 제한 |
| JAFROC [R11] | 위치 정확성 포함 FOM의 MRMC 분석 | CADe 가치 정확 반영, 검정력 높음 | 임상 독자에게 낯섦 |
| GLMM(sens/spec) | Reader·case random effect logistic mixed model | 이진 endpoint 직접 분석 | 수렴 문제, 분산성분 추정 불안정 |

- ○ OR model 구조

$$
\hat\theta_{ij}=\mu+\tau_i+R_j+(\tau R)_{ij}+\varepsilon_{ij},\quad
\text{Cov}(\varepsilon_{ij},\varepsilon_{i'j'})=
\begin{cases}
\text{Cov}_1 & i\ne i',\ j=j'\\
\text{Cov}_2 & i=i',\ j\ne j'\\
\text{Cov}_3 & i\ne i',\ j\ne j'
\end{cases}
$$

  - $\hat\theta_{ij}$: modality $i$(AI 유/무), reader $j$의 AUC. $\tau_i$ 고정효과, $R_j$ reader random effect
  - Case 변동은 $\text{Cov}_{1\text{–}3}$로 반영
- ○ R 도구: `MRMCaov`(OR/DBM, AUC·sens·spec), `RJafroc`(JAFROC, sample size), `iMRMC`(U-statistic, split-plot), `pROC`(단일 AUC, DeLong)

□ Sample size (MRMC)
- ○ 정의: Pilot 또는 문헌 분산성분(reader, case, 상호작용)으로 reader 수·case 수 조합별 검정력 산출 [R28]
- ○ 장점: Reader를 늘릴지 case를 늘릴지 비용 최적화 가능
- ○ 한계: Pilot 분산 추정 불확실성이 큼 → 보수적 가정 필요
- ○ 적용 메모: Reader 수 증가가 case 수 증가보다 검정력에 더 효과적인 경우가 많음

□ Reader 선정
- ○ 정의: Intended user(전문의, 일반의, 전공의)를 대표하도록 숙련도·경력 분포 구성
- ○ 장점: 결과의 외적 타당도 확보. 숙련도별 효과 차이 확인
- ○ 한계: 소수 reader로 층별 분석은 검정력 부족
- ○ 적용 메모: `T-PM-069` gaze 기반 숙련도 예측은 reader 특성 정량화 보조 아이디어로 참고

□ Automation bias
- ○ 정의: AI 출력에 과도하게 의존해 명백한 오류도 수용하는 현상
- ○ 장점: 해당 없음 (위험 요소)
- ○ 한계: MRMC 평균 성능 향상 뒤에서 AI 오답 case의 판독 성능이 오히려 악화될 수 있음
- ○ 적용 메모: AI 정답/오답 case로 나눈 층화 분석(AI가 틀린 case에서 reader 성능 변화)을 사전 계획

#### 3-3-4. Prospective 평가와 RCT

□ Prospective observational / silent mode(shadow) 배포
- ○ 정의: AI를 실제 진료 환경에서 작동시키되 결과를 진료에 쓰지 않고 기록만 하는 방식
- ○ 장점: 실사용 입력 분포에서 standalone 성능 측정, 환자 위해 없음
- ○ 한계: 판독의와 AI의 상호작용 효과는 측정 불가
- ○ 적용 메모: 배포 전 local validation, post-market monitoring 초기 단계로 활용

□ DECIDE-AI 단계 평가
- ○ 정의: 소규모 초기 임상 사용 단계에서 human factors, workflow 적합성, 안전성, 사용자 행동 변화를 평가·보고하는 기준 [R19]
- ○ 장점: RCT 전 실패 원인 조기 발견
- ○ 한계: 비교군이 없거나 작아 효과 추정 불가
- ○ 적용 메모: `O3C` user study 발표와 개념적으로 가장 가까운 단계

□ Individual RCT
- ○ 정의: 환자 단위로 AI 사용/미사용을 무작위 배정 (예: colonoscopy CADe RCT, ADR 54.8% vs 40.4% [R39])
- ○ 장점: 인과 효과 추정, 환자 결과 endpoint
- ○ 한계: 같은 의사가 두 조건을 오가며 학습 효과가 대조군에 전이(contamination)
- ○ 적용 메모: SPIRIT-AI/CONSORT-AI 준수 [R20]

□ Cluster RCT / Stepped-wedge
- ○ 정의: 의사·병원·기간 단위로 무작위 배정. Stepped-wedge는 cluster가 순차적으로 개입군으로 전환
- ○ 장점: Contamination 감소, 운영 현실성
- ○ 한계: 필요 표본 증가(ICC 반영), 시간 추세 교란(stepped-wedge)
- ○ 적용 메모: 설계효과(design effect) $=1+(m-1)\rho$ 반영

□ Screening 대규모 RCT 사례 (MASAI [R40])
- ○ 정의: AI 기반 위험도 분류로 single/double reading을 배정한 mammography 검진 RCT
- ○ 장점: 검출률과 workload를 동시에 평가
- ○ 한계: 중간 분석 결과는 안전성 중심. Interval cancer 등 최종 endpoint는 추적 필요
- ○ 적용 메모: 검진 AI의 임상 유용성 endpoint 설계 참고

#### 3-3-5. Lifecycle·post-market

□ Locked vs Adaptive algorithm
- ○ 정의: Locked는 배포 후 입력이 같으면 출력이 같은 고정 model. Adaptive는 배포 후 학습·변경
- ○ 장점: Locked는 검증 단순. Adaptive는 성능 개선·drift 대응
- ○ 한계: Adaptive는 변경마다 검증 필요, 규제 체계 복잡
- ○ 적용 메모: TTA·continual learning 발표(2-1-2)를 볼 때 규제 분류 관점으로 해석

□ PCCP(Predetermined Change Control Plan)
- ○ 정의: 허가 시점에 향후 변경 범위(description of modifications), 변경 방법·검증 절차(modification protocol), 영향 평가를 사전 승인받는 제도 [R23]
- ○ 장점: 매 변경마다 새 허가 없이 model 갱신
- ○ 한계: 사전 정의하지 않은 변경은 여전히 신규 허가 대상
- ○ 적용 메모: 재학습 data 기준, 성능 하한, 검증 set 고정 규칙을 명시

□ Real-world performance monitoring
- ○ 정의: 배포 후 입력 분포 drift, 성능 저하, failure를 지속 감시
- ○ 장점: 조기 위험 감지. RWE(Real-World Evidence) 축적
- ○ 한계: 실사용에서 참조표준 확보가 어려워 성능 직접 측정 제한
- ○ 적용 메모: Proxy 지표(OOD 비율, 판독의 수정률, failure detector 경보율) 설계. `O5A` Liver CT failure detection, `W-PM-044` CHILD 연결. MFDS 디지털의료제품법 체계와도 연결

#### 3-3-6. MICCAI user study vs 규제 reader study (O3C 발표 비교 포인트)

| 항목 | MICCAI user study (통상) | 규제 MRMC |
|---|---|---|
| 참여자 수 | 5~20명 | Sample size 산정 근거 기반 |
| Case 수 | 수십 case | Case 분산 반영 산정 |
| 가설 | 탐색적, 사후 지정 흔함 | 사전 등록 primary endpoint |
| 분석 | 평균 비교, paired t-test | Reader·case random effect model |
| 참조표준 | 개발팀 annotation인 경우 있음 | 독립 truther panel |
| Bias 통제 | 제한적 | Washout, randomization, blinding |

---

### 3-4. ④ 임상 적용 case — modality/질환별

| 영역 | MICCAI 2026 관련 발표 | 기존 허가·임상 근거 사례 | 참조표준 | 주요 endpoint |
|---|---|---|---|---|
| Mammography | `O4B` Semantic Feature Modulation, `M-PM-109` multi-view, `T-PM-154` MamaDino, `T-PM-103` longitudinal risk | MASAI RCT [R40], 다수 CADe/x 510(k) MRMC | 병리 + 1~2년 추적 | Recall rate, CDR, MRMC AUC |
| Chest X-ray | `O3A` DUCX, `O4A` AMFG, `W-PM-173` severity, `T-AM-017` WHO-CXRBench | 폐결절·기흉 CADe/t 다수 | CT 또는 panel | MRMC AUC, lesion sensitivity |
| Chest CT / 폐결절 | `O6B` Decouple and Reason, `M-PM-216`, `O4B` UniCT | Lung-RADS 기반 CADe/x | 병리·추적 | FROC/JAFROC |
| Stroke / 뇌 | `O4B` StrokeTimer, `T-PM-146` stroke outcome | LVO CADt (De Novo 2018) [R26] | CTA panel | Sens/spec, time-to-notification |
| Retina | `O1B` national-scale benchmark, `O1B` smartphone fundus, `T-PM-025` dementia screening | IDx-DR autonomous [R21] | Reading center grading | Sens/spec (성능목표) |
| 대장내시경 | `M-PM-081`, `W-PM-217` polyp sizing, `T-PM-034` capsule auditing | GI Genius (De Novo 2021), RCT [R39] | 병리 | ADR, APC |
| 심장초음파 | `O1A` Echo-SCAR, `O5B` Echo4DIR, `W-PM-008` echo quality, `W-PM-033` fetal CHD | AI guidance, 자동 계측 510(k) | 전문가 판정·계측 | 진단 적합 영상 비율, 계측 agreement |
| Prostate MRI | `M-PM-042`, `W-AM-216` Compass, `T-PM-050` KOAL | PI-RADS 보조 CADe/x | 표적+계통 생검 | csPCa 검출 sensitivity |
| 병리 | `O3B` QCAgent, `O5C` LRMIL, `W-PM-168`, `W-PM-121` SlideGuard | Paige Prostate (De Novo 2021) [R29] | Consensus + IHC | 병리의 MRMC sensitivity |
| 판독문 생성 | `O4B` CRIMSON, `O4C` RADAR, `W-AM-101` | MFDS 생성형 AI 가이드라인 [R24] | 판독의 판정 | 중대 오류율, 수정률 |
| Triage 일반 | `O6B` JANUS, `W-AM-082` MedTriage-LM | CADt 21 CFR 892.2080 | Panel | Time endpoint |

#### 3-4-1. 영역별 설계 선택의 장단점

□ Screening mammography
- ○ 핵심 설계: 추적 기반 참조표준 + enriched MRMC 또는 대규모 검진 cohort
- ○ 장점: 추적으로 음성 확인 가능, 대규모 검진 data 존재
- ○ 한계: Interval cancer 확인에 장기 추적 필요. Enriched MRMC의 판독 행동이 실제 검진과 다름(laboratory effect)
- ○ 메모: Prior(과거) 영상 비교 기능 model(`T-PM-103`)은 입력 조건(이전 영상 유무)별 성능 제시 필요

□ CXR·CT CADe
- ○ 핵심 설계: CT 참조 + MRMC(AUC 또는 JAFROC)
- ○ 장점: 성숙한 설계·분석 방법, 규제 사례 풍부
- ○ 한계: CT 확인 case만 포함 시 verification bias. 다중 소견 기기는 소견별 다중성
- ○ 메모: 소견별 성능 + 전체 "abnormal" 판정 성능을 계층 구조로 검정

□ Stroke CADt
- ○ 핵심 설계: Standalone sens/spec + 후향적 시간 분석
- ○ 장점: 명확한 임상 이득(시간 단축) 논리
- ○ 한계: 시간 단축이 환자 결과(mRS) 개선으로 이어지는지 근거 별도 필요
- ○ 메모: 발병시간 추정(`O4B` StrokeTimer)은 치료 적응증 결정에 영향 → CADt보다 위험도 높은 claim

□ Autonomous retina screening
- ○ 핵심 설계: Primary care prospective + reading center 참조 + 성능목표
- ○ 장점: 실사용 환경 근거, 비전문가 촬영 포함
- ○ 한계: 촬영 불가(ungradable) 비율이 실질 성능에 영향
- ○ 메모: Imageability(판독 가능 영상 비율)를 endpoint로 함께 보고. Smartphone fundus(`O1B`)는 이 비율이 핵심

□ Colonoscopy CADe
- ○ 핵심 설계: 환자 단위 RCT, ADR endpoint
- ○ 장점: 환자 결과 대리지표(ADR)와 직접 연결, 근거 수준 높음
- ○ 한계: 소형 비진행성 선종 위주 증가로 임상 이득 논쟁. 내시경의 숙련도별 효과 차이
- ○ 메모: Polyp sizing(`W-PM-217`)은 절제·추적 간격 결정에 영향 → 측정 agreement 평가 필요

□ Echo image acquisition guidance
- ○ 핵심 설계: 비전문가 획득 영상의 진단 적합성을 전문가 panel이 판정
- ○ 장점: 의료 접근성 확대 논리 명확
- ○ 한계: "진단 적합" 판정 기준의 주관성, panel variability
- ○ 메모: 기존 노트(`[[Real-Time AI based guidance of Echocardiographic Imaging by Novices...]]`)의 설계와 `W-PM-008` quality assessment 비교

□ Digital pathology
- ○ 핵심 설계: 병리의 MRMC(AI 보조 유/무) + consensus 참조
- ○ 장점: 병리의 간 변동을 줄이는 효과 입증 가능
- ○ 한계: Scanner·염색 차이, glass vs digital 판독 동등성 선행 필요
- ○ 메모: Slide QC(`W-PM-121`)를 입력 적합성 판정 기능으로 결합하는 설계 가능

□ 한국 기관 발표 (네트워킹 참고)
- ○ Oral/Spotlight: 서울대(의대 stroke segmentation, PiMoE MRI), 서울대병원(AMFG CXR), POSTECH(sulcal labeling, brain network), 성균관대(DIVER-Surv, AMD, cerebral microbleed), 고려대(LRMIL), KAIST(6D US probe tracking), DGIST(ABUS SAM2), 전북대(Bayesian prompt adaptation), 가천대(lung lesion grounding), GIST(fMRI decoding), 숭실대(tooth alignment), Samsung Electronics(3D vessel generation)
- ○ Session chair: Won Hwa Kim(POSTECH, O1B), Won-Ki Jeong(Korea Univ., O3B), Sang Hyun Park(POSTECH, O6A)

---

## 4. 규제 가이던스·보고 기준 연결표

| 구분 | 문서 | MICCAI 토픽 연결 |
|---|---|---|
| FDA | Computer-Assisted Detection Devices Applied to Radiology Images and Radiology Device Data – 510(k) Submissions (2012, 2022 update) [R25] | CAD, 참조표준 truthing, standalone test |
| FDA | Clinical Performance Assessment: Considerations for CAD Devices Applied to Radiology Images ... (2012, 2022 update) [R25] | MRMC 설계·분석 |
| FDA | Statistical Guidance on Reporting Results from Studies Evaluating Diagnostic Tests (2007) [R18b] | Sens/spec, 불완전 참조표준 |
| FDA | AI-Enabled Device Software Functions: Lifecycle Management and Marketing Submission Recommendations (Draft, 2025.1) [R22] | Subgroup/bias, data 관리, performance monitoring. 2026-09 기준 final 여부 확인 필요 |
| FDA | PCCP for AI-Enabled Device Software Functions (Final, 2024.12) [R23] | Continual learning, TTA, model 변경 |
| FDA/HC/MHRA | Good Machine Learning Practice 10 Guiding Principles (2021) | 학습·검증 data 독립성, human-AI team 성능 |
| MFDS | 인공지능 기반 의료기기 허가·심사 가이드라인 / 임상 유효성 평가 가이드라인 (최신 개정판 확인) | 확증 임상시험, 후향적 영상 임상시험 설계 |
| MFDS | 생성형 인공지능 의료기기 허가·심사 가이드라인 (2025.1) [R24] | Report generation, VLM |
| MFDS | 디지털의료제품법 (2025.1 시행) | 디지털의료기기 lifecycle |
| IMDRF | SaMD: Clinical Evaluation (N41, 2017) | Valid clinical association → analytical validation → clinical validation |
| Reporting | STARD-AI (2025) [R18] | 진단정확도 연구 |
| Reporting | TRIPOD+AI (2024) [R17] | 예측 model |
| Reporting | CLAIM 2024 update [R41] | 의료영상 AI 논문 전반 |
| Reporting | DECIDE-AI (2022) [R19], SPIRIT-AI/CONSORT-AI (2020) [R20] | 초기 임상·RCT |
| Validation | Metrics Reloaded (2024) [R1][R2] | Metric 선택 |

---

## 5. 용어집 (Glossary)

| 용어 | Full term | 의미 | 관련 세션 |
|---|---|---|---|
| ABUS | Automated Breast Ultrasound | 자동 3D 유방초음파 | O4B |
| ADR | Adenoma Detection Rate | 대장내시경 선종 발견율 | 내시경 |
| AUPRO | Area Under Per-Region Overlap curve | Anomaly localization metric | O4B |
| AURC | Area Under Risk-Coverage curve | Selective prediction 평가 | P5 |
| CADe/CADx/CADt | Computer-Aided Detection/Diagnosis/Triage | 기능별 CAD 분류 | O1B, O3A |
| CBCT | Cone-Beam CT | 치과·중재 시술용 CT | O1C |
| CCC | Concordance Correlation Coefficient | Lin의 일치도 계수 | 계측 |
| C-index | Concordance index | 생존 model 판별력 | O2B, O6B |
| DCA | Decision Curve Analysis | Net benefit 기반 임상 유용성 | O6B |
| Deep ensemble | — | 독립 초기화 다수 model 평균. Uncertainty 추정 | O2A |
| Diffusion model | — | Noise 제거 과정 역전으로 영상 생성 | O4A |
| DLR | Deep Learning Reconstruction | DL 기반 영상 재구성 | O6A |
| DSC | Dice Similarity Coefficient | Overlap metric | Segmentation |
| ECE | Expected Calibration Error | 예측 확률과 실제 정답률 차이 | P5 |
| EHG | Electrohysterography | 자궁 전기활동 측정 | O1C |
| FID | Fréchet Inception Distance | 생성 영상 분포 거리 | O4A |
| Flow matching | — | 확률 경로를 직접 학습하는 생성 model | O4A, O6A |
| FROC | Free-response ROC | 병변 수준 검출 평가 | O4B |
| HD95 | 95th percentile Hausdorff Distance | 경계 오차 | Segmentation |
| ICC | Intraclass Correlation Coefficient | 연속형 측정 일치도 | 계측 |
| INR | Implicit Neural Representation | 좌표 기반 연속 신호 표현 | O6A |
| iOCT | intraoperative Optical Coherence Tomography | 수술 중 OCT | O1C |
| JAFROC | Jackknife Alternative FROC | 위치 포함 MRMC 분석 | Reader study |
| MIL | Multiple Instance Learning | Bag-level label 학습 | O3B, O5C |
| MLLM / VLM | Multimodal LLM / Vision-Language Model | 영상+언어 통합 model | P4 |
| MoE | Mixture-of-Experts | 입력별 전문 subnetwork 선택 | O1A, O6B |
| MRMC | Multi-Reader Multi-Case | Reader·case 변동 모두 고려한 판독 연구 | 3-3절 |
| MWA | Microwave Ablation | 극초단파 소작술 | O4C |
| NSD | Normalized Surface Dice | 허용오차 내 경계 일치 비율 | Segmentation |
| OOD | Out-of-Distribution | 학습 분포 밖 입력 | P5 |
| PCCP | Predetermined Change Control Plan | 사전 승인 변경관리 계획 | 규제 |
| pCR | pathologic Complete Response | 병리학적 완전관해 | O6B |
| PQ | Panoptic Quality | Instance segmentation 종합 metric | P1 |
| PSO | Particle Swarm Optimization | 최적화 알고리즘 | O1C |
| RAG | Retrieval-Augmented Generation | 외부 지식 검색 결합 생성 | O6B, P4 |
| RadGraph F1 | — | 판독문 entity·relation 일치도 | O4B |
| SAM | Segment Anything Model | Prompt 기반 범용 segmentation | P1 |
| SSL | Self-Supervised Learning | Label 없이 표현 학습 | O3A |
| STAPLE | Simultaneous Truth and Performance Level Estimation | EM 기반 다수 annotation 통합 | 3-2절 |
| TRE | Target Registration Error | 정합 후 landmark 오차 | O6C |
| TTA | Test-Time Adaptation | 추론 시점 적응 | O1A |
| UAD | Unsupervised Anomaly Detection | 정상 데이터 기반 이상 탐지 | O4B |
| VQA | Visual Question Answering | 영상 기반 질의응답 | O3A, P4 |
| WSI | Whole Slide Image | 디지털 병리 슬라이드 | O3B |

---

## 6. 학회 현장 활용 — 질문 템플릿

□ 평가 metric
- ○ Metric 값에 신뢰구간을 제시했는가. Case·병변 clustering을 반영했는가
- ○ Threshold는 validation set에서 사전 고정했는가, test set에서 선택했는가
- ○ Calibration(ECE 외 slope/intercept)을 함께 보고했는가

□ 참조표준
- ○ 참조 annotation 작성자 수, 자격, adjudication 규칙은 무엇인가
- ○ Annotator 간 agreement(DSC/kappa)는 얼마이며, model 성능과 비교했는가
- ○ 참조표준 작성 시 model 출력이 노출되었는가 (incorporation bias)

□ 임상 평가 디자인
- ○ External test set은 site·장비·시기 측면에서 학습 data와 독립인가
- ○ Subgroup(성별·연령·장비·기관) 성능 차이를 보고했는가
- ○ Reader study라면 reader·case 모두 random effect로 분석했는가. Washout과 순서 randomization은 적용했는가
- ○ Intended use와 intended user가 정의되어 있는가

□ 임상 적용
- ○ 실제 workflow에서 AI 출력이 어떤 결정에 쓰이는가 (보조/triage/autonomous)
- ○ Distribution shift·failure 발생 시 감지와 대응 절차가 있는가
- ○ 규제 허가 또는 임상시험 계획이 있는가

---

## 7. References

> 수치·연도는 원문 확인 기준. "확인 필요" 표기 항목은 2026-09 시점 최신 상태 재확인 권장

- [R1] Maier-Hein L, Reinke A, Godau P, et al. Metrics reloaded: recommendations for image analysis validation. *Nat Methods*. 2024;21:195–212. https://www.nature.com/articles/s41592-023-02151-z
- [R2] Reinke A, Tizabi MD, Baumgartner M, et al. Understanding metric-related pitfalls in image analysis validation. *Nat Methods*. 2024;21:182–194. https://www.nature.com/articles/s41592-023-02150-0
- [R3] Nikolov S, Blackwell S, Zverovitch A, et al. Clinically applicable segmentation of head and neck anatomy for radiotherapy: deep learning algorithm development and validation study. *J Med Internet Res*. 2021;23:e26151. (NSD 제안)
- [R4] Joskowicz L, Cohen D, Caplan N, Sosna J. Inter-observer variability of manual contour delineation of structures in CT. *Eur Radiol*. 2019;29:1391–1399.
- [R5] Maier-Hein L, Eisenmann M, Reinke A, et al. Why rankings of biomedical image analysis competitions should be interpreted with care. *Nat Commun*. 2018;9:5217.
- [R6] Reitsma JB, Rutjes AWS, Khan KS, et al. A review of solutions for diagnostic accuracy studies with an imperfect or missing reference standard. *J Clin Epidemiol*. 2009;62:797–806.
- [R7] Umemneku Chikere CM, Wilson K, Graziadio S, Vale L, Allen AJ. Diagnostic test evaluation methodology: a systematic review of methods employed to evaluate diagnostic tests in the absence of gold standard. *PLoS One*. 2019;14:e0223832.
- [R8] Warfield SK, Zou KH, Wells WM. Simultaneous truth and performance level estimation (STAPLE). *IEEE Trans Med Imaging*. 2004;23:903–921.
- [R9] Obuchowski NA, Rockette HE. Hypothesis testing of diagnostic accuracy for multiple readers and multiple tests: an ANOVA approach with dependent observations. *Commun Stat Simul Comput*. 1995;24:285–308.
- [R10] Dorfman DD, Berbaum KS, Metz CE. ROC rating analysis: generalization to the population of readers and patients with the jackknife method. *Invest Radiol*. 1992;27:723–731. / Hillis SL, Berbaum KS, Metz CE. Recent developments in the Dorfman-Berbaum-Metz procedure for multireader ROC study analysis. *Acad Radiol*. 2008;15:647–661.
- [R11] Chakraborty DP. *Observer Performance Methods for Diagnostic Imaging: Foundations, Modeling, and Applications with R-Based Examples*. CRC Press; 2017.
- [R12] Park SH, Han K. Methodologic guide for evaluating clinical performance and effect of artificial intelligence technology for medical diagnosis and prediction. *Radiology*. 2018;286:800–809.
- [R13] Park SH, Han K, Jang HY, et al. Methods for clinical evaluation of artificial intelligence algorithms for medical diagnosis. *Radiology*. 2023;306:20–31.
- [R14] Guo C, Pleiss G, Sun Y, Weinberger KQ. On calibration of modern neural networks. *ICML*. 2017.
- [R15] Angelopoulos AN, Bates S. Conformal prediction: a gentle introduction. *Found Trends Mach Learn*. 2023;16:494–591.
- [R16] Van Calster B, McLernon DJ, van Smeden M, et al. Calibration: the Achilles heel of predictive analytics. *BMC Med*. 2019;17:230.
- [R17] Collins GS, Moons KGM, Dhiman P, et al. TRIPOD+AI statement. *BMJ*. 2024;385:e078378.
- [R18] Sounderajah V, et al. The STARD-AI reporting guideline for diagnostic accuracy studies using artificial intelligence. *Nat Med*. 2025. https://www.nature.com/articles/s41591-025-03953-8 (PubMed 40954311)
- [R18b] FDA. Statistical Guidance on Reporting Results from Studies Evaluating Diagnostic Tests. 2007.
- [R19] Vasey B, Nagendran M, Campbell B, et al. DECIDE-AI reporting guideline. *Nat Med*. 2022;28:924–933.
- [R20] Liu X, Cruz Rivera S, Moher D, et al. CONSORT-AI extension. *Nat Med*. 2020;26:1364–1374. / Cruz Rivera S, et al. SPIRIT-AI extension. *Nat Med*. 2020;26:1351–1363.
- [R21] Abràmoff MD, Lavin PT, Birch M, Shah N, Folk JC. Pivotal trial of an autonomous AI-based diagnostic system for detection of diabetic retinopathy in primary care offices. *npj Digit Med*. 2018;1:39.
- [R22] FDA. Artificial Intelligence-Enabled Device Software Functions: Lifecycle Management and Marketing Submission Recommendations. Draft Guidance. Jan 2025. https://www.federalregister.gov/documents/2025/01/07/2024-31543/artificial-intelligence-enabled-device-software-functions-lifecycle-management-and-marketing (final 여부 확인 필요)
- [R23] FDA. Marketing Submission Recommendations for a Predetermined Change Control Plan for Artificial Intelligence-Enabled Device Software Functions. Final Guidance. Dec 2024.
- [R24] 식품의약품안전처. 생성형 인공지능 의료기기 허가·심사 가이드라인. 2025.1. (보도자료: https://eiec.kdi.re.kr/policy/materialView.do?num=262788)
- [R25] FDA. Computer-Assisted Detection Devices Applied to Radiology Images and Radiology Device Data – Premarket Notification [510(k)] Submissions; Clinical Performance Assessment: Considerations for Computer-Assisted Detection Devices Applied to Radiology Images and Radiology Device Data in Premarket Notification (510(k)) Submissions. 2012 (updated 2022).
- [R26] 21 CFR 892.2080 Radiological computer aided triage and notification software (De Novo DEN170073, 2018).
- [R27] Gallas BD, Bandos A, Samuelson FW, Wagner RF. A framework for random-effects ROC analysis: biases with the bootstrap and other variance estimators. *Commun Stat Theory Methods*. 2009;38:2586–2603. / iMRMC software: https://github.com/DIDSR/iMRMC
- [R28] Hillis SL, Obuchowski NA, Berbaum KS. Power estimation for multireader ROC methods: an updated and unified approach. *Acad Radiol*. 2011;18:129–142.
- [R29] Raciti P, Sue J, Ceballos R, et al. Novel artificial intelligence system increases the detection of prostate cancer in whole slide images of core needle biopsies. *Mod Pathol*. 2020;33:2058–2066.
- [R30] Chen RJ, Ding T, Lu MY, et al. Towards a general-purpose foundation model for computational pathology (UNI). *Nat Med*. 2024;30:850–862.
- [R31] Seyyed-Kalantari L, Zhang H, McDermott MBA, Chen IY, Ghassemi M. Underdiagnosis bias of artificial intelligence algorithms applied to chest radiographs in under-served patient populations. *Nat Med*. 2021;27:2176–2182.
- [R32] Badano A, Graff CG, Badal A, et al. Evaluation of digital breast tomosynthesis as replacement of full-field digital mammography using an in silico imaging trial (VICTRE). *JAMA Netw Open*. 2018;1:e185474.
- [R33] Heusel M, Ramsauer H, Unterthiner T, Nessler B, Hochreiter S. GANs trained by a two time-scale update rule converge to a local Nash equilibrium. *NeurIPS*. 2017. (FID)
- [R34] Barrett HH, Myers KJ. *Foundations of Image Science*. Wiley; 2004.
- [R35] Fitzpatrick JM, West JB. The distribution of target registration error in rigid-body point-based registration. *IEEE Trans Med Imaging*. 2001;20:917–927.
- [R36] Yu F, Endo M, Krishnan R, et al. Evaluating progress in automatic chest X-ray radiology report generation. *Patterns*. 2023;4:100802. (RadGraph F1, RadCliQ)
- [R37] Ostmeier S, Xu J, Chen Z, et al. GREEN: Generative Radiology Report Evaluation and Error Notation. *Findings of EMNLP*. 2024.
- [R38] Oakden-Rayner L, Dunnmon J, Carneiro G, Ré C. Hidden stratification causes clinically meaningful failures in machine learning for medical imaging. *ACM CHIL*. 2020.
- [R39] Repici A, Badalamenti M, Maselli R, et al. Efficacy of real-time computer-aided detection of colorectal neoplasia in a randomized trial. *Gastroenterology*. 2020;159:512–520.
- [R40] Lång K, Josefsson V, Larsson AM, et al. Artificial intelligence-supported screen reading versus standard double reading in the Mammography Screening with Artificial Intelligence trial (MASAI). *Lancet Oncol*. 2023;24:936–944.
- [R41] Tejani AS, Klontzas ME, Gatti AA, et al. Checklist for Artificial Intelligence in Medical Imaging (CLAIM): 2024 update. *Radiol Artif Intell*. 2024;6:e240300.
- [R42] MICCAI 2026 Main Conference Oral and Spotlight Program / Poster Program, revised 2026-09-10 (첨부 PDF).
- [R43] Wang D, Shelhamer E, Liu S, Olshausen B, Darrell T. Tent: fully test-time adaptation by entropy minimization. *ICLR*. 2021.
- [R44] Ronneberger O, Fischer P, Brox T. U-Net: convolutional networks for biomedical image segmentation. *MICCAI*. 2015; LNCS 9351:234–241.
- [R45] Isensee F, Jaeger PF, Kohl SAA, Petersen J, Maier-Hein KH. nnU-Net: a self-configuring method for deep learning-based biomedical image segmentation. *Nat Methods*. 2021;18:203–211.
- [R46] Kirillov A, Mintun E, Ravi N, et al. Segment Anything. *ICCV*. 2023.
- [R47] Kirillov A, He K, Girshick R, Rother C, Dollár P. Panoptic segmentation. *CVPR*. 2019.
- [R48] Bland JM, Altman DG. Statistical methods for assessing agreement between two methods of clinical measurement. *Lancet*. 1986;1:307–310.
- [R49] DeLong ER, DeLong DM, Clarke-Pearson DL. Comparing the areas under two or more correlated receiver operating characteristic curves: a nonparametric approach. *Biometrics*. 1988;44:837–845.
- [R50] Cohen J. Weighted kappa: nominal scale agreement with provision for scaled disagreement or partial credit. *Psychol Bull*. 1968;70:213–220.
- [R51] Ilse M, Tomczak J, Welling M. Attention-based deep multiple instance learning. *ICML*. 2018.
- [R52] Campanella G, Hanna MG, Geneslaw L, et al. Clinical-grade computational pathology using weakly supervised deep learning on whole slide images. *Nat Med*. 2019;25:1301–1309.
- [R53] Ho J, Jain A, Abbeel P. Denoising diffusion probabilistic models. *NeurIPS*. 2020.
- [R54] Lipman Y, Chen RTQ, Ben-Hamu H, Nickel M, Le M. Flow matching for generative modeling. *ICLR*. 2023.
- [R55] FDA. Assessing the Credibility of Computational Modeling and Simulation in Medical Device Submissions. Final Guidance. Nov 2023. / ASME V&V 40-2018.
- [R56] Wang Z, Bovik AC, Sheikh HR, Simoncelli EP. Image quality assessment: from error visibility to structural similarity. *IEEE Trans Image Process*. 2004;13:600–612.
- [R57] Zbontar J, Knoll F, Sriram A, et al. fastMRI: an open dataset and benchmarks for accelerated MRI. *arXiv*:1811.08839. 2018.
- [R58] Sitzmann V, Martel JNP, Bergman AW, Lindell DB, Wetzstein G. Implicit neural representations with periodic activation functions. *NeurIPS*. 2020.
- [R59] Harrell FE, Califf RM, Pryor DB, Lee KL, Rosati RA. Evaluating the yield of medical tests. *JAMA*. 1982;247:2543–2546. / Uno H, Cai T, Pencina MJ, D’Agostino RB, Wei LJ. On the C-statistics for evaluating overall adequacy of risk prediction procedures with censored survival data. *Stat Med*. 2011;30:1105–1117.
- [R60] Vickers AJ, Elkin EB. Decision curve analysis: a novel method for evaluating prediction models. *Med Decis Making*. 2006;26:565–574.
- [R61] Moor M, Banerjee O, Abad ZSH, et al. Foundation models for generalist medical artificial intelligence. *Nature*. 2023;616:259–265.
- [R62] Kendall A, Gal Y. What uncertainties do we need in Bayesian deep learning for computer vision? *NeurIPS*. 2017.
- [R63] Gal Y, Ghahramani Z. Dropout as a Bayesian approximation: representing model uncertainty in deep learning. *ICML*. 2016.
- [R64] Lakshminarayanan B, Pritzel A, Blundell C. Simple and scalable predictive uncertainty estimation using deep ensembles. *NeurIPS*. 2017.
- [R65] Sensoy M, Kaplan L, Kandemir M. Evidential deep learning to quantify classification uncertainty. *NeurIPS*. 2018.
- [R66] Hendrycks D, Gimpel K. A baseline for detecting misclassified and out-of-distribution examples in neural networks. *ICLR*. 2017.
- [R67] Hardt M, Price E, Srebro N. Equality of opportunity in supervised learning. *NeurIPS*. 2016.
- [R68] McMahan B, Moore E, Ramage D, Hampson S, Agüera y Arcas B. Communication-efficient learning of deep networks from decentralized data. *AISTATS*. 2017.
- [R69] Shrout PE, Fleiss JL. Intraclass correlations: uses in assessing rater reliability. *Psychol Bull*. 1979;86:420–428. / Koo TK, Li MY. A guideline of selecting and reporting intraclass correlation coefficients for reliability research. *J Chiropr Med*. 2016;15:155–163.
- [R70] Lin LI. A concordance correlation coefficient to evaluate reproducibility. *Biometrics*. 1989;45:255–268.
- [R71] Whiting PF, Rutjes AWS, Westwood ME, et al. QUADAS-2: a revised tool for the quality assessment of diagnostic accuracy studies. *Ann Intern Med*. 2011;155:529–536.
- [R72] Whiting PF, Rutjes AWS, Westwood ME, Mallett S. A systematic review classifies sources of bias and variation in diagnostic test accuracy studies. *J Clin Epidemiol*. 2013;66:1093–1104.
- [R73] Begg CB, Greenes RA. Assessment of diagnostic tests when disease verification is subject to selection bias. *Biometrics*. 1983;39:207–215.

---
