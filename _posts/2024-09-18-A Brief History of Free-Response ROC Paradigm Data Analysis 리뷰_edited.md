---
title: A Brief History of Free-Response ROC Paradigm Data Analysis 리뷰
date: 2024-09-18
categories: [Article Review, Medical AI]
tags: [performance metric, afroc, medical ai]     # TAG names should always be lowercase
author: <Tea Tasting Lady>
---
# Info
Chakraborty DP. A brief history of free-response receiver operating characteristic paradigm data analysis. Acad Radiol. 2013 Jul;20(7):915-9. doi: 10.1016/j.acra.2013.03.001. Epub 2013 Apr 12. PMID: 23583665; PMCID: PMC3679336.

# Intro
- “Free-Response”
    - the detection of brief audio tone against a white-noise background 연구 관련하여 1961년에 Egan이 처음 사용
    - Listener는 white-noise 사이에 true tone이 몇개가 있는 지, 알 수 없는 상황
    - Medical Imaging        
        - Mammographer도 how many lesions이 있는지 미리 알 수 없음
        - the image must be searched for regions that appear suspicious for cancer
        - If the level of suspicion of a particular suspicious region > min clinical reporting threshold
            - the mammographer reports it(digitally outline and annotate the suspicious region)
        - Screening reports
            - the locations of regions that exceed the threshold
            - the corresponding levels of suspicion (BIRADS로 report)
    - Free-response is a search paradigm
- FROC
    - Free response receiver operating characteristic (FROC) curve
    - free-response task의 performance를 visualizing 하기 위해 Miller가 auditory domain에서 처음 도입
    - Radiology application에서는 Bunch가 처음 도입
- Buch et al
    - localization task에 대해 다룸
    - location-level false positive vs location-level false negative에 대한 ambiguity on same image
    - 두 실수가 동시에 발생하였더라도 the image is scored as a “perfect” image level true positive가 될 수 있음
    - the first imaging FROC experiment 수행
        - lesion localization task에서 prototype digital chest imaging device와 conventional analog device를 비교
- Challenging factor
    - the number of marks on an image
        - >= 0
        - must be regarded as modality, reader- and image-dependent random variable
        - the randomness in the number of marks, the usual sources of randomness of the ratings due to image sampling and reader sampling 때문에 FROC 분석이 힘듬

## FROC DATA: Mark-Rating Pairs
- The mark
    - the location of the suspicious region
- The rating
    - confidence level that the region contains a lesion
- Lesion Localization (LL)인 mark
    - A mark is close enough to a real lesion 이면 LL
    - Location level의 “True Positive”를 의미
    - non-lesion localization(NL)인 mark는 location level의 “False Positive”
- Close enough?를 어떻게 정의
    - the proximity criterion
    - Acceptance radius
    - Clinical decision의 영역

# DATA ANALYSIS

## Operating Characteristics and Figures of Merit
- FOM
    - figures of merit
    - observed collection of NLs and LLs로부터 추정함
    - valid FOM의 조건
        - correct decision은 reward, incorrect decision은 penalize
    - ROC curve
        - AUC가 suitable FOM임

## The FROC curve and associated FOMs
- the FROC curve
    - plot of LL fraction vs NL fraction
    - LLF: the total number of LLs at the given threshold/(the total number of lesions)
    - NLF: the total number of NLs/(the total number of images)
        ![[Pasted image 20240823223115.png]]
    - Not contained within the unit square
    - x-axis
        - mean number of NLs per image
        - 엄밀히 말해서 “improper fraction” 임
        - 이론적으로 average number of FPs per image가 무한정 커질 수 있음
- the AFROC curve
    - the plot of LLF vs FPF(False positive fraction)
    - completely contained within the unit square
    - x-axis and y-axis 모두 probability를 의미
    - y-axis는 FROC curve와 동일
    - x-axis: FPF
        - an estimate of the probability P(FP) of observing FP
        - FPF: (# of FP images)/(# of total normal images)
    - Buch et al
        - P(n)
            - the probability of observing an image with n NLs
            - Poisson distribution 사용
                ![[Pasted image 20240823223133.png]]
            - Lambda: the mean of the distribution, estimated by NLF
        - P(FP)
            ![[Pasted image 20240823223144.png]]
            - the complement of the probability of observing an image with zero NLs
                - p(FP) = 1 - P(0)

## Estimating the FOM: Parametric Methods
- A fitted curve
- untenable independence assumption 적용
    - 비판이 많았음
    - 가령, the probability of occurrence of NLs on an image is independent of the number of true lesions present in the image와 같은 가정은 reality와 맞지 않음
        - the probability of NLs is typically larger on normal images than on abnormal images
    - 또, LL mark-rating pairs on an image are independent 가정도 안 맞음
        - in fact, satisfaction of search effect have been reported
            - the oberserver가 one lesion을 일단 찾으면 다른 lesion을 mark할 경향이 낮아짐

## Estimating the FOM: Nonparametric Methods
- the trapezoidal area under the ROC curve를 FOM으로 사용
- No curve fitting
- the empirical probability 사용
    - an abnormal image rating exceeds that of a normal image일 확률을 의미
    - the area under the trapezoidal ROC curve와 같은 값임
- Image-level bootstrapping을 사용하기도 함

## Other FROC FOMs
- The LAMBDA FOM
- the EFROC FOM

## Should one count NLs on Both Normal and Abnormal Images?
- the FROC curve abscissa
    - traditionally defined over all images
    - if the observers’s tendency to generate NLs is independent of the presence of true lesions, this would be legitimate
    - 하지만, 실제로는 normal case에서 more NL이 발생
    - asymptotic FROC curve will depend on the case mix(i.e, the ratio of abnormal to the total number of cases)
    - Solution: to define NLF over normal images only

# JAFROC SOFTWARE

## FOMs
- MRMC 연구에서 많이 활용
- nonparametric FOMS Estimation을 이런 software가 지원

## Significance Testing
- DBM ANOVA
    - The Dorfman Berbaum and Metz(DBM) analysis of variance (ANOVA)
    - For MRMC ROC data
    - pseudo-value matrix 사용

# DISCUSSION
- The history of research in free-response data analysis를 다룸
    - 어떤 FOM이 significance of the difference between two FOMs를 검정하기에 더 좋은 것일까를 찾는 과정이었음
    - DBM et al과 Hillis et al의 연구가 크게 기여
- LROC Approach
    - the localization ROC approach
    - single rating to the image and marks the most suspicious region in the image
- ROI approach
    - the region of interest
    - observer rate each region for presence of disease