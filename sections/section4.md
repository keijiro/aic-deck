---
layout: bigtext
---

<v-click>

Context bloat

→ <span class="swap"><span v-click.hide="2">Higher cost</span><span v-click="2">Worse reasoning</span></span>

</v-click>

<style>
.swap { display: inline-grid; }
.swap > * { grid-area: 1 / 1; }
</style>

<!--
So, getting back on track... it looks like the size of the context hits the cost directly. [click]The two aren't exactly equal, but we've learned that when the context gets bloated, the cost tends to go up.

And it's not just cost — [click]it affects reasoning performance too. You often hear that AI chats gradually get dumber the longer the conversation goes on, right? That's what I mean. It's been improved a lot lately and isn't as noticeable as it used to be, but there's still an impact on performance.

So keeping the context compact matters both for cost and for performance.
-->

---
layout: bigtext
---

<v-click>

One Task, One Session

</v-click>

<!--
So how do we keep the context compact?

Let's start with the most basic rule of all. That's the [click]"one task, one session" rule.
-->

---
layout: bigtext
---

Finished a task?

Run `/clear`

<!--

When you finish a task, close the session or clear it with the `/clear` command, and start the next task from a fresh context. That's all there is to it.

If you're used to treating a coding agent like an AI chat, this might feel a bit odd.

Once you get used to the style of moving development forward by building up a conversation with the agent, resetting everything and starting the conversation over every time can feel like a bit of a hassle.

But pretty much every coding agent's manual says to clear before starting new work. So I think it's best to think of this as the intended way to use it.
-->

---
layout: full
---

<svg class="merc absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <image href="/images/sec3/human.png" x="260" y="330" width="300" height="300" />
  <g v-click="[1,2]">
    <image href="/images/sec4/business.png" x="820" y="330" width="300" height="300" transform="translate(1940 0) scale(-1 1)" />
    <g class="bubble" transform="translate(120 70)">
      <path d="M 404 150 H 516 A 24 24 0 0 1 540 174 V 206 A 24 24 0 0 1 516 230 H 440 L 380 262 L 400 230 A 24 24 0 0 1 380 206 V 174 A 24 24 0 0 1 404 150 Z" />
      <circle cx="430" cy="190" r="7" /><circle cx="460" cy="190" r="7" /><circle cx="490" cy="190" r="7" />
    </g>
    <g class="bubble later" transform="translate(280 -10)">
      <path d="M 444 270 H 556 A 24 24 0 0 1 580 294 V 326 A 24 24 0 0 1 560 349 L 600 382 L 540 350 H 444 A 24 24 0 0 1 420 326 V 294 A 24 24 0 0 1 444 270 Z" />
      <circle cx="470" cy="310" r="7" /><circle cx="500" cy="310" r="7" /><circle cx="530" cy="310" r="7" />
    </g>
  </g>
  <g class="enter" v-click="2">
    <g class="leave" v-click.hide="4">
      <image class="face" href="/images/sec4/merc-knight.png" x="820" y="330" width="300" height="300" />
      <g class="quest" v-click="3">
        <image href="/images/sec4/quest.png" x="602" y="420" width="160" height="123" />
      </g>
    </g>
  </g>
  <g class="leave" v-click.hide="7">
    <g class="quest" v-click="5">
      <image href="/images/sec4/quest.png" x="602" y="420" width="160" height="123" />
    </g>
    <g class="enter" v-click="6">
      <image class="face" href="/images/sec4/merc-rogue.png" x="820" y="330" width="300" height="300" />
    </g>
  </g>
  <g class="enter" v-click="8">
    <image class="face" href="/images/sec4/merc-horned.png" x="820" y="330" width="300" height="300" />
  </g>
</svg>

<style>
.merc .bubble path {
  fill: black;
  stroke: white;
  stroke-width: 3.5;
  stroke-linejoin: round;
}
.merc .bubble circle {
  fill: white;
}
.merc .slidev-vclick-target .bubble.later,
.merc .enter {
  transition: opacity 0.4s ease 0.4s, transform 0.6s ease 0.4s;
}
.merc .quest,
.merc .leave {
  transition: opacity 0.4s ease, transform 0.6s ease;
}
.merc .leave {
  transition-delay: 0.25s;
}
/* Mercenaries face left (toward the human) and turn right when leaving */
.merc .face {
  transform-box: fill-box;
  transform-origin: center;
  transform: scaleX(-1);
  transition: transform 0.25s ease;
}
.merc .leave.slidev-vclick-hidden .face {
  transform: none;
}
.merc .slidev-vclick-hidden .bubble.later {
  opacity: 0;
}
.merc .quest.slidev-vclick-hidden,
.merc .slidev-vclick-hidden > .quest {
  transform: translateX(-140px);
}
.merc .leave.slidev-vclick-hidden {
  transform: translateX(320px);
}
.merc .enter.slidev-vclick-hidden,
.merc .slidev-vclick-hidden > .enter {
  transform: translateX(160px);
}
</style>

<!--
Let me share how I personally think about this.

[click]The AI in an AI chat is something that keeps talking with a human, gathering information and getting tasks done, right?

[click]A coding agent is different. I think of it as a wandering mercenary you meet only once. [click]You hand it a quest, it silently takes it, gets it done, and [click]walks away. [click]Then you post a new quest, [click]a different mercenary shows up, gets it done, and [click]walks away... something like that.

So what you need is to [click]keep things in a state where these wandering mercenaries can work easily. For example, so that a newcomer can grasp the situation right away, keep the necessary information organized as documents... In other words, don't lock it away in someone's memory or in the conversation; always externalize it in written form.
-->

---
layout: bigtext
---

One Task, One Session

<!--
So the plan is to go with the one-task-one-session rule. But here a simple question comes up.
-->

---
layout: bigtext
---

Q: What is "one task"?

<!--
What exactly is "one task"? Roughly how big a piece of work are we talking about when we say one task? You'd naturally wonder about that.

Here I'd like to think about the optimal granularity from the perspective of the coding agent's efficiency.
-->

---

# Experiment: Bunny Blitz

- Implement an invincibility item
- Implement a black-and-white threshold effect
- Translate the UI into Japanese

\* Runtime testing skipped

<div class="flex items-center justify-center gap-4 mt-4">
  <img src="/images/sec4/bunny-blitz-before.png" class="w-[40%] rounded" />
  <div class="text-4xl" style="color: var(--c-yellow)">→</div>
  <img src="/images/sec4/bunny-blitz-after.png" class="w-[40%] rounded" />
</div>

<!--
So I ran an experiment. Using Bunny Blitz, an official Unity sample project, I had the agent implement features like these.

"Implement an invincibility item," "Implement a black-and-white threshold effect," and "Translate the UI into Japanese."

I deliberately lined up three random tasks that seem unrelated to each other.

Also, I intentionally skipped runtime testing here and only had it do the implementation work. I'll explain why a bit later.

And when I ran these tasks in order within a single session, without splitting the context, the cost came out like this.
-->

---
layout: cost-table
table: cost-single
note: Opus 5.5, medium, 1h TTL, average of 4 runs
clicks: 6
---

| Task | Context | Output | Cache<br>Read | Cache<br>Write | Cost |
| --- | ---: | ---: | ---: | ---: | ---: |
| Invincibility | 65K | 18 pts. | 15 pts. | 39 pts. | 72 pts. |
| B&W Effect | 98K | 28 pts. | 28 pts. | 26 pts. | 83 pts. |
| UI Translation | 130K | 20 pts. | 35 pts. | 25 pts. | 80 pts. |
| Total | | 66 pts. | 77 pts. | 91 pts. | 235 pts. |

<!--
The final total cost is [click]235 pts. [click]Looking at the data in detail, [click]since we never cleared the context, it just keeps growing. In the end it swells up to [click]130K tokens. Along with that, [click]the cache read cost keeps going up too.

Cache reads are supposed to be really cheap, but even so, this makes you feel that the burden of a bloated context is not something you can ignore. [click]

Next, let's look at the cost when we clear the context after each task.
-->

---
layout: cost-table
table: cost-cleared
note: Opus 5.5, medium, 1h TTL, average of 4 runs
clicks: 2
---

| Task | Context | Output | Cache<br>Read | Cache<br>Write | Cost |
| --- | ---: | ---: | ---: | ---: | ---: |
| Invincibility | 62K | 17 pts. | 12 pts. | 35 pts. | 63 pts. |
| B&W Effect | 47K | 23 pts. | 8 pts. | 28 pts. | 59 pts. |
| UI Translation | 60K | 18 pts. | 13 pts. | 40 pts. | 71 pts. |
| Total | | 58 pts. | 33 pts. | 102 pts. | 194 pts. |

<!--
Here it is. The total cost is [click]194 pts., so it's a bit cheaper. [click]The difference from before is that the context size and the cache read cost stay stable instead of growing.

Let's put the two side by side and compare.
-->

---
layout: cost-table
table: cost-compare
clicks: 10
---

| Task | Cache Read | Cache Write | Cost |
| --- | ---: | ---: | ---: |
| Invincibility | 15 pts. → 12 pts. <span style="color: var(--c-green)">(-3 pts.)</span> | 39 pts. → 35 pts. <span style="color: var(--c-green)">(-4 pts.)</span> | 72 pts. → 63 pts. <span style="color: var(--c-green)">(-9 pts.)</span> |
| B&W Effect | 28 pts. → 8 pts. <span style="color: var(--c-green)">(-20 pts.)</span> | 26 pts. → 28 pts. <span style="color: var(--c-red)">(+2 pts.)</span> | 83 pts. → 59 pts. <span style="color: var(--c-green)">(-24 pts.)</span> |
| UI Translation | 35 pts. → 13 pts. <span style="color: var(--c-green)">(-22 pts.)</span> | 25 pts. → 40 pts. <span style="color: var(--c-red)">(+15 pts.)</span> | 80 pts. → 71 pts. <span style="color: var(--c-green)">(-9 pts.)</span> |
| Total | 77 pts. → 33 pts. <span style="color: var(--c-green)">(-44 pts.)</span> | 91 pts. → 102 pts. <span style="color: var(--c-red)">(+11 pts.)</span> | 235 pts. → 194 pts. <span style="color: var(--c-green)">(-41 pts.)</span> |

<!--
Looking task by task, [click]the first task has the same conditions, so the difference is within the margin of error. [click]The second one got a bit cheaper. [click]The third one didn't get much cheaper. [click]

Let's also look at the cache read and write costs. In the second task, [click]the cache read cost dropped noticeably. That looks like the effect of clearing the context.

[click]The third task shows a similar drop in cache reads. But here, [click]the cache writes went up.

[click]So when you split sessions like this, [click]the cache read cost goes down, but [click]the cache write cost tends to go up.

Let's think a little about why that happens.
-->

---
layout: full
clicks: 4
---

<svg class="ctx-venn dia absolute inset-0 w-full h-full" viewBox="-90 -77 1564 873" preserveAspectRatio="xMidYMid meet">
  <g class="row1" :class="{ left: $clicks >= 2, up: $clicks >= 3 }">
    <g :class="{ venn: $clicks >= 1 }">
      <g class="task t1"><circle cx="150" cy="200" r="100" /><text x="150" y="200">Invincibility</text></g>
      <g class="task t2"><circle cx="370" cy="200" r="100" /><text x="370" y="200">B&amp;W Effect</text></g>
      <g class="task t3"><circle cx="590" cy="200" r="100" /><text x="590" y="200"><tspan x="590" dy="-0.6em">UI</tspan><tspan x="590" dy="1.2em">Translation</tspan></text></g>
    </g>
    <g class="bars" :class="{ show: $clicks >= 2 }">
      <g class="bar"><rect x="740" y="110" width="260" height="40" /></g><text x="1012" y="130">65K</text>
      <g class="bar"><rect class="base" x="740" y="180" width="260" height="40" /><rect x="1000" y="180" width="132" height="40" /></g><text x="1144" y="200">+33K</text>
      <g class="bar"><rect class="base" x="740" y="250" width="392" height="40" /><rect x="1132" y="250" width="128" height="40" /></g><text x="1272" y="270">+32K</text>
    </g>
  </g>
  <g class="split" :class="{ show: $clicks >= 3 }">
    <g class="task t1"><circle cx="150" cy="560" r="100" /><text x="150" y="560">Invincibility</text></g>
    <g class="task t2"><circle cx="370" cy="560" r="100" /><text x="370" y="560">B&amp;W Effect</text></g>
    <g class="task t3"><circle cx="590" cy="560" r="100" /><text x="590" y="560"><tspan x="590" dy="-0.6em">UI</tspan><tspan x="590" dy="1.2em">Translation</tspan></text></g>
  </g>
  <g class="bars" :class="{ show: $clicks >= 4 }">
    <g class="bar"><rect x="740" y="470" width="248" height="40" /></g><text x="1000" y="490">62K</text>
    <g class="bar"><rect x="740" y="540" width="188" height="40" /></g><text x="940" y="560">47K</text>
    <g class="bar"><rect x="740" y="610" width="240" height="40" /></g><text x="992" y="630">60K</text>
  </g>
</svg>

<style>
.ctx-venn .row1 {
  transform: translate(322px, 160px);
  transition: transform 0.8s ease;
}
.ctx-venn .row1.left {
  transform: translate(0, 160px);
}
.ctx-venn .row1.left.up {
  transform: translate(0, 0);
}
.ctx-venn .task {
  transition: transform 0.8s ease;
}
.ctx-venn .task circle {
  fill: color-mix(in srgb, var(--c-green) 25%, transparent);
  stroke: var(--c-green);
  stroke-width: 4;
}
.ctx-venn text {
  font-size: 26px;
}
.ctx-venn .task text {
  font-size: 22px;
}
.ctx-venn .venn .t1 { transform: translate(145px, -43px); }
.ctx-venn .venn .t2 { transform: translate(0, 87px); }
.ctx-venn .venn .t3 { transform: translate(-145px, -43px); }
.ctx-venn .split {
  opacity: 0;
  transition: opacity 0.4s ease;
}
.ctx-venn .split.show {
  opacity: 1;
  transition-delay: 0.6s;
}
.ctx-venn .bars rect {
  fill: var(--c-green);
}
.ctx-venn .bars rect.base {
  fill: color-mix(in srgb, var(--c-green) 35%, transparent);
}
.ctx-venn .bar {
  transform: scaleX(0);
  transform-box: fill-box;
  transform-origin: left;
  transition: transform 0.6s ease;
}
.ctx-venn .bars text {
  text-anchor: start;
  opacity: 0;
  transition: opacity 0.3s ease;
}
.ctx-venn .bars.show .bar {
  transform: scaleX(1);
}
.ctx-venn .bars.show text {
  opacity: 1;
  transition-delay: 0.5s;
}
.ctx-venn .row1 .bars.show .bar {
  transition-delay: 0.6s;
}
.ctx-venn .row1 .bars.show text {
  transition-delay: 1.1s;
}
</style>

<!--
These three tasks do quite different things, but even so, [click]there are parts where their context overlaps. For example, every task will probably refer to the project settings, and they'll look at some common parts of the scene structure too. Anything the agent already knows doesn't need to be added to the context again, so [click]the context grows more and more slowly. That means the newly added part of the context — in other words, the amount of cache writes — gradually goes down.

On the other hand, when we separate the three tasks, [click]each context is completely isolated, and [click]each of the three sessions builds up its context from zero. So the cache writes directly reflect the size of each context.

Because of this, the bigger the overlap, the smaller the benefit of splitting sessions.

With that in mind, I ran the next experiment.
-->

---

# Experiment 2

- Implement an invincibility item
- Implement a jump boost item
- Implement a speed boost item

<!--
Same Bunny Blitz, but this time I lined up three tasks that are pretty close to each other. The first one, the invincibility item, is the same as before, but the second is a jump boost item and the third is a speed-up item. These are features that would likely share a very similar context.
-->

---
layout: cost-table
table: cost-single2
note: Opus 5.5, medium, 1h TTL, average of 4 runs
clicks: 2
---

| Task | Context | Output | Cache<br>Read | Cache<br>Write | Cost |
| --- | ---: | ---: | ---: | ---: | ---: |
| Invincibility | 71K | 21 pts. | 16 pts. | 40 pts. | 77 pts. |
| Jump Boost | 85K | 11 pts. | 11 pts. | 11 pts. | 33 pts. |
| Speed Boost | 96K | 8 pts. | 8 pts. | 9 pts. | 26 pts. |
| Total | | 40 pts. | 35 pts. | 60 pts. | 135 pts. |

<!--
Here are the results from a single session.

Compared to before, [click]the context grows much more slowly. It piles up 71K in one go at the start, but after that the growth is very gradual. In other words, a lot can be done with the same knowledge as the first task — it can reuse the context as is — so I'd guess it manages to avoid bloating the context. The total cost was [click]135 pts.
-->

---
layout: cost-table
table: cost-cleared2
note: Opus 5.5, medium, 1h TTL, average of 4 runs
clicks: 3
---

| Task | Context | Output | Cache<br>Read | Cache<br>Write | Cost |
| --- | ---: | ---: | ---: | ---: | ---: |
| Invincibility | 72K | 23 pts. | 22 pts. | 43 pts. | 88 pts. |
| Jump Boost | 59K | 17 pts. | 15 pts. | 39 pts. | 71 pts. |
| Speed Boost | 51K | 12 pts. | 7 pts. | 32 pts. | 52 pts. |
| Total | | 52 pts. | 44 pts. | 114 pts. | 211 pts. |

<!--
Next, the results when clearing the session. [click]Here, each task builds up more than 50K of context from zero. Because of that, [click]the cache writes have piled up quite a bit. The total cost went up to [click]211 pts.
-->

---
layout: cost-table
table: cost-compare2
clicks: 4
---

| Task | Cache Read | Cache Write | Cost |
| --- | ---: | ---: | ---: |
| Invincibility | 16 pts. → 22 pts. <span style="color: var(--c-red)">(+6 pts.)</span> | 40 pts. → 43 pts. <span style="color: var(--c-red)">(+3 pts.)</span> | 77 pts. → 88 pts. <span style="color: var(--c-red)">(+11 pts.)</span> |
| Jump Boost | 11 pts. → 15 pts. <span style="color: var(--c-red)">(+4 pts.)</span> | 11 pts. → 39 pts. <span style="color: var(--c-red)">(+28 pts.)</span> | 33 pts. → 71 pts. <span style="color: var(--c-red)">(+38 pts.)</span> |
| Speed Boost | 8 pts. → 7 pts. <span style="color: var(--c-green)">(-1 pts.)</span> | 9 pts. → 32 pts. <span style="color: var(--c-red)">(+23 pts.)</span> | 26 pts. → 52 pts. <span style="color: var(--c-red)">(+26 pts.)</span> |
| Total | 35 pts. → 44 pts. <span style="color: var(--c-red)">(+9 pts.)</span> | 60 pts. → 114 pts. <span style="color: var(--c-red)">(+54 pts.)</span> | 135 pts. → 211 pts. <span style="color: var(--c-red)">(+76 pts.)</span> |

<!--
Let's compare. This time, [click]there's little benefit even on cache reads, and [click]on the write side it's clearly in the red. [click]Overall, it's a big loss.

[click]So you can see that when you have the agent do similar things in a row, splitting the context actually ends up costing more.
-->

---
clicks: 5
---

# Basic Rule: One Task, One Session

<ul v-click="1">
<li>However, <span class="text-hl" :class="{ on: $clicks === 2 }">closely related tasks</span> may be better grouped into one session.
<ul><li v-click="4">e.g. tasks that touch the same files.</li></ul>
</li>
</ul>

<v-click at="5">

<div class="mt-12 mx-auto w-fit">

| File | Tokens |
| --- | ---: |
| PlayerBehaviour.cs | 12,500 |
| PlayerMovement.cs | 11,500 |

</div>

</v-click>

<!--
Let's sum up. I started by presenting the basic rule of one task, one session, but there's an exception. [click]Closely related tasks may be better grouped into a single session.

But then the next question is, [click]what exactly counts as "closely related tasks"? [click]

It's hard to define strictly, but one thing we can say for sure is that [click]tasks that touch the same scripts or the same files will naturally share context.

In the three item tasks earlier, what took up a big share of the context was [click]the player-related scripts. Both of them are over 10,000 tokens. To change the player's behavior, the agent has to pull these scripts into the context. Doing that once was cheaper than pulling them in three separate times.
-->

---
layout: bigtext
hide: true
---

余談：スキルのコスト

<!--
さて、次の話題に移る前に、また一つ余談を挟みたいと思います。それはスキルのコストについてのお話です。
-->

---
layout: bigtext
hide: true
---

余計なスキル

入れまくってませんか？

<!--
みなさん、余計なスキル入れまくってませんか？

そのスキル、コストを増加させているかもしれませんよ。
-->

---
hide: true
---

<div class="flex items-center justify-between gap-8 h-full">

<div>

| ケース | スキル数 | 消費トークン |
| --- | ---: | ---: |
| 入れまくり | 147 skills | 10k tokens |
| 厳選 | 44 skills | 3.9k tokens |

</div>

<img src="/images/sec4/skills-list-heavy.png" class="w-[58%] rounded shadow-2xl" />

</div>

<!--
具体例を見てみましょう。これはまあ実際にあった僕のプロジェクトですが、調子に乗って色々とスキルを入れまくって、整理せずに放置してしまいました。147個もスキルが入っていて、初期状態のコンテキストで約１万トークン食っています。

その後反省してカリカリにチューニングを施し、本当に必要なスキルだけを厳選して、残りは全て削除しました。Unityの公式スキルについても、本当に必要なものだけ残すようにして見ました。その結果3.9kトークンにまで減りました。
-->

---
hide: true
---

# ２００回のリクエストにかかる負担

| スキル量 | 書き込み (x1) | 読み取り (x199) | 合計 |
| ---: | ---: | ---: | ---: |
| 10K | 8 pts. | 40 pts. | **48 pts.** |
| 3.9K | 3 pts. | 16 pts. | **19 pts.** |

<p class="text-sm text-right" style="color: var(--c-muted)">Opus 5.5, 1h TTL</p>

<!--
この２つのケースで200回コンテキストを送信した場合に、どれだけコストに差が出てくるかを計算しました。約30 pts.の違いということで、まあ案外気にするほどではないかもしれませんね。でも確実に差は出ます。

これがもし、プロジェクトと関係のある、使う可能性が少なからず存在するスキルであれば、まあ許容できるコストなんじゃないかなと思います。そこまでケチになる必要は無いかなと思います。でも、もしこれが、何かの気まぐれで入れたような、全くもって使うあての無いようなスキルだったら、やっぱりそれは削除すべきだと思いますね。意味のないものに着実にお金を吸われているわけですから、シンプルに勿体無いです。
-->

---
hide: true
---

# 油断できない理由

- やけにトークンを食うスキルがたまにある
  - みんなスキルを書き慣れていない（エージェント含む）
- グローバルスキルは特に気を付けたい

<!--
このスキル問題が油断できない理由がいくつかあります。

ひとつは、やけにトークンを食うスキルがたまにあるということです。Descriptionを無茶苦茶詳しく書いてしまって、そこだけでトークンを余計に消費しているスキルとか、本来の用途を超えて過剰に発動してしまって、その結果トークンを浪費してしまうスキルとか、そういう「上手く作られていないスキル」が存在するんですよね。

これはまだ、このスキルという概念が登場して日も浅いので作法やセオリーが熟していないというのと、あとは、スキルを作成するにもコーディングエージェントにそれを書かせることが多いと思うんですが、コーディングエージェント自身もスキルを詳細に書きすぎる癖があって、その結果として重たいスキルが量産されがち、というのがあると思います。

もう一点、スキルのインストール先として、ホームディレクトリに入れてグローバルにそれを適用するか、あるいはプロジェクトディレクトリに入れてプロジェクトスコープで適用するか、どちらにするか、という問題があると思うんですが、グローバルに入れると全てのプロジェクトにそれが負担として課されてしまうので注意が必要です。基本的にはプロジェクトスコープで管理すべきだと思います。
-->
