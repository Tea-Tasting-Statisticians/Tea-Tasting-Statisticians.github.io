---
title: Fisher와 Tea Tasting Lady
date: 2025-08-10
categories: [KOR]
math: true
tags: [korean]   # lower case 
author: <Tea Tasting Lady>
--- 
![](/img/Teas.jpg)

Tea Tasting Lady란 닉네임으로  2021년 초부터 게시판 하나를 맡아 통계 관련 글을 쓰기 시작했습니다.     
필명인 Tea Tasting Lady는 통계학자 Fisher의  The Design of Experiments에 나오는  Lady Muriel의 일화에서 아이디어를 얻어 지었습니다. 

Lady Muriel이 홍차를 마실때 우유를 먼저 따랐는지 홍차를 따른 후 우유를 따랐는지를 맛만 봐서 구분할 수 있다고 Fisher에게 이야기하자 정말 그런 능력이 있는 지 아니면 그냥 우연인지를 알아보기 위한 실험 experiment을 Fisher가 고안했다고 합니다.

구체적으로는, 차 8잔을 4잔은 우유를 먼저, 나머지 4잔은 홍차를 먼저  따른 후 우유를 부었는데 Lady Muriel이 우유 또는 홍차를 먼저 따른 4잔을 정확히 고를 수 있는 지에 대한 실험이었습니다. 

8잔 중 4잔을 고르는 경우의 수 [8!/{4!(8-4)!}]는 70가지이고 4잔을 고른 것에 대해 순서를 정확히 고를 수 있는 경우는 0잔부터 4잔까지 아래와 같이 success count와 경우의 수가 정의될 수 있습니다. 

![](/img/TTS_dist.png)
* Image from [https://en.wikipedia.org/wiki/Lady_tasting_tea](https://en.wikipedia.org/wiki/Lady_tasting_tea) 

이 setting에서 4잔의 순서를 모두 맞추는 확률은 1/70 = 0.014이고 통상적으로 설정하는 유의수준 5% 기준에서 4잔을 모두 정확하게 골랐으면 Lady Muriel이 차를 따른 순서를 구분할 수 없다는 null hypothesis를 기각(reject the null hypothesis)하게 됩니다. 이 실험의 경우 4잔 중 3잔 이상의 순서를 정확히 고를 확률은 (16+1)/70 = 24.3% 가 되어 4잔을 모두 정확하게 구분해야만 유의수준 5%기준에서 우연히 순서를 맞추었을 가능성을 기각할 수 있게 됩니다. 

처음 통계 관련 글을 쓸 필명을 고민할 때 이 이야기가 떠올라서 Tea Tasting Lady를 필명으로 쓰게 되었습니다. 

Fisher와 같은 위대한 통계학자는 아니지만, Lady Muriel이  그랬던 것처럼 통계와 연관되서 nudge를 줄 수 있는 글들을 소소히 써보고 공유해왔고, 이런 활동을 통해 만나고 교제하게 된 남편은 필명이 자연스레 Tea Tasting Gentleman이 되었습니다. 이제는 함께 Tea Tasting Statisticians 블로그를 운영하고 있습니다. 