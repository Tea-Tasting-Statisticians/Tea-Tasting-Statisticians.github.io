---
title: Speical ROC Curves
date: 2024-09-28
categories: [Clinical Study, Performance metric]
tags: [performance metric, medical ai]     # TAG names should always be lowercase
author: <Tea Tasting Lady>
---

![[Topics_mindmap.png]]
흉부 X-ray나 Mammogram과 같은 의료 영상에 폐암, 유방암과 같은 
병변(lesion)이 있는 지 여부와 그 위치 정확도까지 전문가(Radiologists)나 
Medical AI가 얼마나 잘 평가할 수 있는 지에 대한 척도가 여럿 있습니다.

이번 포스팅에서는 Special ROC curves로 통칭한 이런 척도들에 대해 
소개하려고 합니다.

1. LROC (Localization ROC) Curve
![[LROC.png]]
- 평가하는 영상에 병변은 포함되어 있지 않거나 포함되어 있더라도 최대 1개가 포함되어 있다고 가정합니다. 
- X축: 평가자가 위양성으로 평가하였지만 실제로는 병변이 없는 영상의 비율 
- Y축: 평가자가 병변의 여부 및 위치를 정확히 평가한 영상의 비율
- AUC estimation 이 가능

2. FROC (Free-response ROC) Curve
![[FROC.png]]
- Free-response, 즉, 평가하는 영상에 포함된 병변의 개수에 제약을 두지 않고 평가를 진행합니다. 
- X축: 영상 당 평균 위양성의 개수 
	- 100개의 영상을 평가해서 실제로는 병변이 없는데 병변이 있다고 잘못 표시한 개수가 250개이면, 이 때의 각 영상 당 평균 위양성 개수(Average number of false-positive detctions per image)는 250/100 = 2.5 입니다  
	- 비율이 아니므로 범위에 제약이 없습니다
- Y축: 평가자가 병변의 여부 및 위치를 정확히 평가한 영상의 비율
- X축과 Y축의 범위가 다른 ROC curve처럼 0에서 1사이가 아님
	- 두 FROC Curve의 비교가 X축 범위가 다른 것 때문에 어렵습니다.  

3. AFROC(Alternative FROC) Curve
![[AFROC.png]]

- X축 범위 제약이 없는 FROC curve의 대안
- X축과 Y축 모두 0 ~ 1 범위이므로 AUC 계산을 통한 두 곡선의 비교가 가능해집니다. 
- X축: 위양성이 있는 영상의 비율
- Y축: 평가자가 병변의 여부 및 위치를 정확히 평가한 영상의 비율

4. JAFROC(Jackknife Alternative FROC) Curve
- J가 앞에 붙지만, AFROC curve입니다 
- AFROC 앞에 붙은 J는 Jackknife resampling 방법을 의미합니다
	- 여러 명의 리더가 여러 개의 의료영상을 판독하는 연구(Multi Reader Multi Case Study)에서 통계 검정을 할 때 필요한 분산 variance 을 계산할 때 Jackknife resampling 방법을 사용할 수 있습니다.

5. wAFROC (weighted Alternative FROC) Curve
![[weight.png]]
- AFROC Curve 의 한 종류입니다. 
- 병변의 개수가 많은 영상이 최종 결과(AUC)에 영향을 너무 많이 주지 않게 하기 위해 weight을 설정합니다.
	- weight을 통해 병변이 포함된 영상의 기여도를 동일하게 만듭니다. 
	- 가령, 병변이 3개 포함된 영상이 있으면 각 병변마다 1/3의 weight을 설정할 수 있습니다.

### 참고자료
- AFROC, FROC Curve image source
1. Metz CE. Receiver operating characteristic analysis: a tool for the quantitative evaluation of observer performance and imaging systems. J Am Coll Radiol. 2006 Jun;3(6):413-22. doi: 10.1016/j.jacr.2006.02.021. PMID: 17412096. 
- 개념 참조 
2. https://dpc10ster.github.io/RJafrocFrocBook/
