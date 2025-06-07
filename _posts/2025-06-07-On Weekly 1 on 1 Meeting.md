---
title: Weekly 1 on 1 Meeting
date: 2025-06-07
categories: [tip (KOR)]
tags: [tip, korean]   # lower case 
author: <Tea Tasting Lady>
math: true
--- 


 ![](../img/conversation.png)

## Introduction 
5월 중순에 신입 팀원이 BSA(Biostatistician Associate) 으로 합류하였습니다. 저는 BSM (Biostatistician Manager)으로써 함께 의료기기 임상통계 업무를 잘 해나갈 틀(frame)을 만들어나가고 있는 중입니다.

그 과정으로 정기적인 1 on 1 Meeting 시간을 잘 활용해보려고 1 on 1 Meeting 을 위한 template 을 만들어서 사용중입니다. 실제로 적용해보니 유용한 점이 많았고, 1 on 1 Meeting 처럼 Feedback 을 주고 받는 방식에 대해 링크드인에서 접한 내용들에 도움을 많이 받기도 했었어서 제 경험도 나눠보려고 합니다.

## Motivation
1 on 1 Meeting 은 팀원과 팀장이 1:1로 업무 관련 논의를 하는 회의입니다. 전 회사에서 팀원으로써 경험했던 1 on 1 Meeting 은 정기적으로 진행은 된 편이었지만 가볍게 tea time 을 하는 정도였고 제 개인적으로는 업무의 효율을 올리는 데 크게 도움이 되진 않았습니다. 팀의 업무에 도움이 되기 위해서는 template 등이 미리 있는  표준적인 형태로 진행되고 기록이 꾸준히 남으면 좋겠다는 생각을 했습니다. 또한, 아직 모든 것이 낯선 신입 팀원에게 하는 업무에 대해 효율적으로 도움을 줄 수 있는 시간이 되었으면 좋겠다는 생각도 했습니다. 

## Tools 
속한 회사에서 OKR 설정과 1 on 1 Meeting 관리에 특화된 [레몬베이스](https://lemonbase.com/) 란 서비스를 작년 가을부터 활용하고 있어, 이 tool 에 1 on 1 Meeting 기록을 남겨놓기로 하였습니다. 
1 on 1 Meeting 은 일주일에 두번, 월요일과 금요일에 진행하여 월요일에는 그 주에 진행될 업무에 대해, 금요일에는 그 주에 진행된 업무에 대해 논의하는 것으로 목적을 다르게 정했고 간결한 진행을 위해 미팅 시간은 30분으로 정하였습니다. 
미팅의 목적과 시간 제한(30분)을 제시하여 meeting template 은 [구글 제미나이](https://gemini.google.com/gem/career-guide/) 에서 기본적인 형태를 markdown format 으로 만들었습니다. 

## Application
이렇게 작성한 template 을 사용하여 1 on 1 Meeting 을 몇차례 진행해보았습니다. 레몬베이스의 Shard memo tab 에 미리 meeting template 을 복사해놓고 미팅을 하는 동안 논의된 내용을 채워넣는 형식으로 처음에 진행했습니다. 
실제 해보니 markdown 문법이 레몬베이스의 memo 에 반영이 되지 않아 가독성이 떨어지고 미팅 후에 제가 사용하는 markdown editor 인 Obsidian 에 다시 붙여넣어야 하는 등의 불편함이 있었습니다. 그래서 지금은 Obsidian 에 실시간으로 논의되는 내용을 기록한 후, 회의 마치고 레몬베이스에 내용을 공유하는 것으로 형식을 바꾸었습니다.
또한 처음 사용한 meeting template 은 일반적인 목적으로 작성된 부분이 많아, 함께 하는 임상통계 업무에 맞게 형식을 계속 고쳐나가고 있습니다. 

## Reflections
한 주의 시작과 끝에 30분씩 1 on 1 Meeting 을 몇차례 진행해보았습니다. 
팀 업무에 대해 월요일 오전에 논의하면서 한 주를 시작하고, 금요일 오후에는 월요일 오전에 계획했던 것이 어떻게 진행되었는 지를 함께 확인하고 그 주를 마무리하는 것이 업무의 진행상황을 확인하고 계획하는 것에 기대대로 유용하였습니다.  
팀장으로 팀원에게 Feedback 을 일방적으로 주는 게 아니라 팀장이 도와줄 부분이 있는 지, 그리고 개선할 부분에 대한 의견을 구하는 과정을 template 에 넣어놓으니 팀원도 자연스럽게 의견을 이야기하기 편한 시간이 되었습니다. 
30분의 시간을 정해놓고 미팅을 진행하니 너무 늘어지지 않으면서도 효율적으로 진행을 할 수 있어서 1주일에 2번 진행하는 것의 부담이 생각보다는 훨씬 적었습니다. 


## Template
제가 사용하는 월요일 , 금요일의 1 on 1 Meeting template을 공유합니다. 각자의 상황에 맞게 변경하여 사용하시는 데에 도움이 되면 좋겠습니다. 
Template 형식은 markdown format 으로, 날짜 부분은 Obsidian 의 templater 에 적용하시면 Obsidian 에서 해당 날짜가 반영되어 file 이 생성되게 됩니다. 

## Monday Template

## 2025_Week00_1st_1 on 1 

**Date:** <% tp.date.now("YYYY-MM-DD") %>
**Week**: <% tp.date.now("YYYY-[W]ww") %>
## 1. Casual Check-in (~ 5 mins)
* How was your weekend?
* Anything interesting to share or on your mind as we start the week?
    * 

## 2. This Week's Priorities & Agenda, Action Items, Support Plan (~ 15 mins)
* **Key Projects/Tasks for the Week:**
    *  **Task 1:** 
        * **Objective:** 
        * **Context/Why:** 
        * **Expected Deadline:**
        * **Relevant Resources:** 
	*  **Task 2:** 
        * **Objective:** 
        * **Context/Why:** 
        * **Expected Deadline:**
        * **Relevant Resources:** 
    *  **Task 3:** 
        * **Objective:** 
        * **Context/Why:** 
        * **Expected Deadline:** 
        * **Relevant Resources:** 
	*   **Task 4:** 
        * **Objective:** 
        * **Context/Why:** 
        * **Expected Deadline:** 
        * **Relevant Resources:** 
* **Your Initial Thoughts/Questions on these priorities?**
    * 
## 3. Support Plan (~ 5 mins) 
*  **Support Needed this Week (from me, team, or resources):
	* 

## 4. Open Floor: Questions & Clarifications (~ 5 mins)
* What else is on your mind?
* Any roadblocks you foresee or anything unclear?

## Friday Template
## 2025_Week00_2nd_1 on 1 

**Date:** <% tp.date.now("YYYY-MM-DD") %>
**Week**: <% tp.date.now("YYYY-[W]ww") %>

## 1. Casual Check-in (~5 minutes)
* How was your week overall?
* Any highlights or lowlights from the past few days?
    * 

## 2. Review of This Week's Progress (~15 minutes)
*  **Task 1:** 
    * **Objective:** 
    * **Context/Why:** 
    * **Expected Deadline:**
    * **Relevant Resources:** 
*  **Task 2:** 
    * **Objective:** 
    * **Context/Why:** 
    * **Expected Deadline:**
    * **Relevant Resources:** 
*  **Task 3:** 
    * **Objective:** 
    * **Context/Why:** 
    * **Expected Deadline:** 
    * **Relevant Resources:** 
*   **Task 4:** 
    * **Objective:** 
    * **Context/Why:** 
    * **Expected Deadline:** 
    * **Relevant Resources:** 
  
* **Overall, what are you most proud of accomplishing this week?**

## 3. Challenges, Learnings & Problem-Solving (~5 mins)
* Were there any significant roadblocks or frustrations?
    * How did you approach them?
    * Is there anything we can do to prevent these in the future?
* What’s one key thing you learned this week (technical or otherwise)?

## 4. Feedback Exchange (~ 5 mins)
* **My Feedback for You:**
    * Something I observed that went really well this week was 
    * An area we can focus on for development is 
* **Your Feedback/Needs from Me:**
    * Is there anything I could do differently to better support you?
* **Next Week Preview** 
	* Any immediate thoughts or known priorities for early next week?
	* Any other topics, questions, or ideas on your mind?
	* How is your workload feeling?


