---
title: Adjustment of Baseline Covariates in Randomized Controlled Trial (ENG)
date: 2025-10-20
categories: [ENG, Clinical Trial Designs (ENG), Advanced designs for clinical trial (ENG)]
tags: [clinical trial design, adjustment of baseline covariates, precision, confounder]   # lower case 
author: <Tea Tasting Gentleman>
math: true
--- 
It has only been a few years since the FDA published the guidance recommending that clinical trials pre-specify baseline covariates in the protocol and conduct statistical analyses while controlling for these covariates. When randomization is implemented, the association between potential confounders and treatment (X) is eliminated, so these variables no longer act as confounders. However, they can still remain as variables that affect the outcome (Y). Adjusting for these variables has the advantage of making outcome estimates more precise and narrowing the confidence interval. However, there are important considerations when using adjustment variables in linear versus non-linear models. I would like to explain this.

A linear functional is a linear map from a vector space V to a field F (e.g., the real numbers or complex numbers). In statistics, the expectation (expected value) is a linear functional. The expectation plays a particularly important role in statistical models because statistical inference, as we commonly discuss it, is centered around expectations.

Let's consider a special case for the following discussion: randomly assigning people to treatment and control groups. In such cases, there are generally no confounders, only variables that affect the outcome. Therefore, let Y be the outcome, X be the variable indicating treatment status, and Z be the adjustment variable (e.g., a variable that only affects Y). Then our interest is in E(Y|X=1,Z)-E(Y|X=0,Z), as this represents the effect of a 1-unit increase in X on Y when adjusting for Z. This can be expressed as:
Y = α₀ + α₁X + α₂Z + ε
Here, the effect of X adjusted for Z is α₁ (=E(Y|X=1,Z)-E(Y|X=0,Z)).
For E(Y|X), this represents the effect on Y when X increases by 1 unit. This can be written as the following model:
Y = β₀ + β₁*X + ε
Here, the effect of X is the regression coefficient β₁, where β₁ = E[Y|X=1] - E[Y|X=0].

When randomization is implemented, in linear models (e.g., linear regression models), the values of E(Y|X=1,Z)-E(Y|X=0,Z) and E(Y|X=1,Z)-E(Y|X=0,Z) are generally similar (i.e., β₁ ≈ α₁). This is because randomization eliminates variables that simultaneously affect both X and Y. However, when introducing a non-linear link function (such as the logit in logistic regression or Cox regression), E(Y|X=1,Z)-E(Y|X=0,Z) and E(Y|X=1,Z)-E(Y|X=0,Z) can differ, meaning β₁ ≠ α₁.

Consider the following law of iterated expectations:
E(Y|X) = E_z[E(Y|X,Z)]
This holds true. However, when considering a non-linear link function g:
g(E(Y|X)) ≠ E_z[g(E(Y|X,Z))]
This situation can occur. In this case, whether Z is a confounder or not, the estimates can differ due to the non-linear function. This should be interpreted as the effect of X on Y for groups with condition Z when adjusting for Z.

The guidance presents several different models depending on the situation due to issues that can arise in non-linear models, which I plan to organize in a future discussion.




