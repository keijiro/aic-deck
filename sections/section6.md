---
layout: bigtext
---

<div v-click="1" class="relative">

Verify behavior by hand

<div v-click="2" class="absolute pointer-events-none" style="left: -4%; right: -4%; top: 50%; height: 0.12em; transform: translateY(-50%); border-radius: 0.06em; background: var(--c-red);" />
</div>

<!--
So it's becoming clear that the key to cutting costs is how efficiently we can handle behavior verification.

Are there any good ideas for improving this? The first thing that comes to mind is [click]just verifying behavior by hand, but [click]that's way too sad, so let's not even go there. We'll stick with automation.
-->

---
layout: bigtext
---

Why not verify behavior

in a separate session?

<!--
Another simple idea: why not do the behavior verification in a separate session?
-->

---
clicks: 2
---

<div class="split-bars" :class="{ gap: $clicks === 1, split: $clicks > 1 }">
  <div v-for="(w, i) in [72, 45, 88, 60, 34, 79, 52, 95, 41, 67, 83, 56]" :key="i" class="row"
       :style="{ '--w': w, '--p': [0.55, 0.4, 0.6, 0.5, 0.45, 0.65, 0.5, 0.55, 0.6, 0.45, 0.5, 0.6][i], '--d': i * 0.04 + 's' }">
    <div class="bar seg-l"></div>
    <div class="bar seg-r"></div>
  </div>
</div>

<style>
.split-bars {
  width: 70%;
  height: 100%;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 12px;
}
.split-bars .row {
  position: relative;
  height: 22px;
}
.split-bars .bar {
  position: absolute;
  top: 0;
  height: 100%;
  background: var(--c-green);
  transition: left 0.8s cubic-bezier(0.65, 0, 0.35, 1), width 0.8s cubic-bezier(0.65, 0, 0.35, 1);
  transition-delay: var(--d);
}
.split-bars .seg-l { left: 0; width: calc(var(--w) * var(--p) * 1% + 1px); }
.split-bars .seg-r { left: calc(var(--w) * var(--p) * 1%); width: calc(var(--w) * (1 - var(--p)) * 1%); }
.split-bars.gap .bar { transition-duration: 0.4s; transition-delay: calc(var(--d) / 2); }
.split-bars.gap .seg-r { left: calc(var(--w) * var(--p) * 1% + 2%); }
.split-bars.split .seg-l { width: calc(var(--w) * 0.4%); }
.split-bars.split .seg-r { left: 54%; width: calc(var(--w) * 0.35%); }
</style>

<!--
So far I've been talking about one task per session. The idea here is to [click]split that further: one session for the implementation part of a task, [click]and a fresh, separate session for the verification.
-->

---
clicks: 1
---

<div class="session-chart" :class="{ split: $clicks > 0 }">
<div class="bars">
  <div v-for="(h, i) in [9, 15, 16, 21, 24, 20, 22, 34, 30, 32, 44, 40, 47, 46, 50, 47, 55, 61, 59, 64, 66, 61, 72, 73, 72, 71, 84, 82, 87, 92, 93, 95]" :key="i"
       class="bar" :class="{ late: i >= 16 }"
       :style="{ height: ($clicks > 0 && i >= 16 ? h - 33 : h) + '%' }"></div>
</div>
<div class="phases">
  <div>Implementation</div>
  <div class="late">Verification</div>
</div>
</div>

<style>
.session-chart {
  width: 80%;
  margin: 100px auto 0;
}
.session-chart .bars,
.session-chart .phases {
  display: flex;
  gap: 3px;
}
.session-chart .bars {
  height: 300px;
  align-items: flex-end;
}
.session-chart .bar {
  flex: 1 1 0;
  background: var(--c-green);
  transition: transform 0.4s cubic-bezier(0.65, 0, 0.35, 1), height 0.8s cubic-bezier(0.65, 0, 0.35, 1) 0.4s;
}
.session-chart .phases > div {
  flex: 1 1 0;
  margin-top: 6px;
  padding-top: 4px;
  border-top: 2px solid var(--c-yellow);
  font-size: 0.8rem;
  text-align: center;
  color: var(--c-yellow);
  transition: transform 0.4s cubic-bezier(0.65, 0, 0.35, 1);
}
.session-chart.split .bar,
.session-chart.split .phases > div { transform: translateX(-20px); }
.session-chart.split .bar.late,
.session-chart.split .phases > .late { transform: translateX(20px); }
</style>

<!--
With a freshly created session, [click]you can work with a compact context. Even if there are a lot of tool calls, this should keep the cost down, right?

It looks like it should work, and sometimes it actually does help, but honestly, it's not all that effective.
-->

---

# Verification is hard to isolate from context

<v-click>

1. The verification steps themselves may need the prior context.

</v-click>
  
<!--
I think there are two main reasons this split approach doesn't work well.

[click]
The first is that the verification procedure itself often needs the context from the earlier work.
-->

---
layout: bigtext
---

<v-click>

Run all unit tests → no context needed

</v-click>
<v-click>

Verify via the Editor → needs project knowledge

</v-click>

<!--
For example, if you're just [click]running the Test Runner and going through all the unit tests, you don't need any context. That's easy.

But take the invincibility item in Bunny Blitz from earlier. When [click]the verification means operating the Unity Editor step by step, you can't do it without knowing the project. The scene structure, how the player is implemented — that kind of information has to be in the context.
-->

---

# Verification is hard to isolate from context

1. The verification steps themselves may need the prior context.

<v-click>

2. Fixing issues may need the prior context.

</v-click>

<!--
And the second reason is that [click]fixing things needs context.
-->

---
clicks: 1
---

<div class="fix-chart" :class="{ fixing: $clicks > 0 }">
<div class="bars">
  <div v-for="(h, i) in [9, 15, 16, 21, 24, 20, 22, 34, 30, 32, 44, 47]" :key="'i' + i"
       class="bar impl" :style="{ height: h + '%' }"></div>
  <div v-for="(h, i) in [12, 14, 13, 17, 16, 19, 18, 22]" :key="'c' + i"
       class="bar check" :style="{ height: h + '%' }"></div>
  <div v-for="(h, i) in [27, 33, 31, 38, 44, 41, 49, 55, 52, 60, 64, 71]" :key="'f' + i"
       class="bar check fix"
       :style="{ height: ($clicks > 0 ? h : 0) + '%', transitionDelay: i * 0.05 + 's' }"></div>
</div>
<div class="phases">
  <div class="impl" style="--n: 12">Implementation</div>
  <div class="check" style="--n: 8">Verification</div>
  <div class="check fix" style="--n: 12">Fix & re-verify</div>
</div>
</div>

<style>
.fix-chart {
  width: 80%;
  margin: 100px auto 0;
}
.fix-chart .bars,
.fix-chart .phases {
  display: flex;
  gap: 3px;
}
.fix-chart .bars {
  height: 300px;
  align-items: flex-end;
}
.fix-chart .bar {
  flex: 1 1 0;
  background: var(--c-green);
  transition: height 0.4s cubic-bezier(0.65, 0, 0.35, 1);
}
.fix-chart .impl { transform: translateX(-20px); }
.fix-chart .check { transform: translateX(20px); }
.fix-chart .phases > div {
  flex: none;
  width: calc(var(--n) * (100% - 93px) / 32 + (var(--n) - 1) * 3px);
  margin-top: 6px;
  padding-top: 4px;
  border-top: 2px solid var(--c-yellow);
  font-size: 0.8rem;
  white-space: nowrap;
  text-align: center;
  color: var(--c-yellow);
}
.fix-chart .phases > .fix {
  opacity: 0;
  transition: opacity 0.4s ease;
}
.fix-chart.fixing .phases > .fix { opacity: 1; }
</style>

<!--
When verification finds a bug, [click]the agent goes on to fix it. That needs pretty much the same context as the implementation, so the context ends up bloating anyway.
-->

---
layout: bigtext
---

For small tasks, just

keep going in one session

<!--
For these reasons, in many cases you're better off just doing the verification while still carrying the context. For a small, one-off feature like the Bunny Blitz invincibility item... well, after all that long explanation, I hate to say it, but the bottom line is that keeping it all in one session is usually cheaper.

So instead, what about...
-->

---
layout: bigtext
---

What about

large-scale tasks?

<!--
What about large-scale work that cuts across the whole project? That sounds like the cost could really balloon, which is a bit scary.

Let's think about this with a concrete example.
-->

---

# Case study: Tower Defense sample

- Example: migrating the Tower Defense Template to URP
- Using the "/migrate-birp-to-urp" skill

<div class="flex items-center gap-4 mt-8">
  <img src="/images/sec6/tower-defense-1.jpg" class="w-[48%] rounded" />
  <img src="/images/sec6/tower-defense-2.jpg" class="w-[48%] rounded" />
</div>

<!--
As an example, I tried migrating the Tower Defense Template project, one of Unity's official samples, to URP. It's a relatively old sample, so it's built on the Built-in Render Pipeline.

For the migration, I used the "migrate-birp-to-urp" skill that comes with Unity's official skills.
-->

---
layout: bigtext
---

<v-click>

"Verify one, then roll out" strategy

</v-click>

<!--
And what I tried for this job was [click]a combination of partial verification and rolling it out horizontally.
-->

---
layout: full
clicks: 4
---

<svg class="hz absolute inset-0 w-full h-full" viewBox="0 -30 1376 768" preserveAspectRatio="xMidYMid meet">
  <g class="step" :class="{ on: $clicks >= 1 }">
    <image class="shot" href="/images/sec6/stage1.jpg" x="88" y="85" width="384" height="216" />
    <path class="dia-arrow" d="M 280 395 V 316" />
    <svg x="136" y="400" width="260" height="230" viewBox="300 90 700 620">
      <image href="/images/sec3/smart-ai.png" width="1376" height="768" transform="translate(1321 0) scale(-1 1)" />
    </svg>
  </g>
  <g class="step bubble" :class="{ on: $clicks >= 2 }">
    <path d="M 444 330 H 516 A 24 24 0 0 1 540 354 V 416 A 24 24 0 0 1 516 440 H 468 L 398 462 L 444 440 A 24 24 0 0 1 420 416 V 354 A 24 24 0 0 1 444 330 Z" />
    <g class="bulb" transform="translate(480 385) scale(0.65) translate(-480 -374)">
      <circle cx="480" cy="375" r="22" />
      <path class="neck" d="M 469 392 L 491 392 L 489 408 H 471 Z" />
      <path class="base" d="M 470 414 H 490" />
      <path class="ray" d="M 480 341 V 333 M 504 351 L 510 345 M 456 351 L 450 345 M 514 375 H 522 M 446 375 H 438" />
    </g>
  </g>
  <g class="step" :class="{ on: $clicks >= 3 }">
    <path class="dia-arrow" d="M 405 500 H 620" />
    <g class="doc">
      <path d="M 643 430 H 713 L 743 460 V 570 H 643 Z" />
      <path d="M 713 430 V 460 H 743 M 660 488 H 726 M 660 508 H 726 M 660 528 H 726 M 660 548 H 704" />
    </g>
  </g>
  <g class="step lite" :class="{ on: $clicks >= 4 }">
    <svg x="952" y="400" width="260" height="230" viewBox="84 165 1090 965">
      <image href="/images/sec6/lite-ai.png" width="1254" height="1254" transform="translate(1254 0) scale(-1 1)" />
    </svg>
    <path class="dia-arrow" d="M 760 500 H 985" />
    <path class="dia-arrow late" d="M 1096 395 V 326" />
    <image class="shot tile" href="/images/sec6/stage2.jpg" x="890" y="75" width="200" height="112.5" />
    <image class="shot tile" href="/images/sec6/stage3.jpg" x="1102" y="75" width="200" height="112.5" />
    <image class="shot tile" href="/images/sec6/stage4.jpg" x="890" y="199.5" width="200" height="112.5" />
    <image class="shot tile" href="/images/sec6/stage5.jpg" x="1102" y="199.5" width="200" height="112.5" />
  </g>
</svg>

<style>
.hz .step {
  opacity: 0;
  transition: opacity 0.3s ease;
}
.hz .step.on {
  opacity: 1;
}
.hz .shot {
  clip-path: inset(0 round 8px);
}
.hz .bubble > path {
  fill: black;
  stroke: white;
  stroke-width: 3.5;
  stroke-linejoin: round;
}
.hz .bulb circle,
.hz .bulb .neck {
  fill: var(--c-yellow);
}
.hz .bulb .base,
.hz .bulb .ray {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 6;
  stroke-linecap: round;
}
.hz .doc {
  transform: translateX(-60px);
  transition: transform 0.5s cubic-bezier(0.65, 0, 0.35, 1);
}
.hz .on .doc {
  transform: none;
}
.hz .doc path {
  fill: black;
  stroke: white;
  stroke-width: 4;
  stroke-linejoin: round;
}
.hz .doc path + path {
  fill: none;
  stroke-linecap: round;
}
/* Lite model: the remaining stages pop in one by one after the model appears */
.hz .lite .late,
.hz .lite .tile {
  opacity: 0;
  transition: opacity 0.3s ease;
}
.hz .lite.on .late,
.hz .lite.on .tile {
  opacity: 1;
}
.hz .lite.on .late { transition-delay: 0.5s; }
.hz .lite.on .tile:nth-of-type(1) { transition-delay: 0.9s; }
.hz .lite.on .tile:nth-of-type(2) { transition-delay: 1.4s; }
.hz .lite.on .tile:nth-of-type(3) { transition-delay: 1.9s; }
.hz .lite.on .tile:nth-of-type(4) { transition-delay: 2.4s; }
</style>

<!--
Here's how it works. First, [click]we take just Stage 1 and get the migration, verification, and fixes all done for it.

Once that's finished, [click]the context should have accumulated the know-how: what this game's URP migration needs, and where the problems are. [click]We pull all of that out and write it up as an instruction document.

[click]Then we open a new session and work through the remaining stages following those instructions. No hard problem-solving is needed at this point, so we can use a cheap, lightweight model.
-->

---
layout: full
clicks: 4
---

<svg class="xp absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g class="step" :class="{ on: $clicks >= 1 }">
    <rect class="frame" x="121" y="69" width="170" height="170" rx="20" />
    <image href="/images/sec6/variants/char0.png" x="131" y="79" width="150" height="150" />
  </g>
  <g class="step" :class="{ on: $clicks >= 2 }">
    <rect class="frame" x="121" y="299" width="170" height="170" rx="20" />
    <image href="/images/sec6/variants/stage0.png" x="131" y="309" width="150" height="150" />
  </g>
  <g class="step" :class="{ on: $clicks >= 3 }">
    <rect class="frame" x="121" y="529" width="170" height="170" rx="20" />
    <image href="/images/sec6/variants/item0.png" x="131" y="539" width="150" height="150" />
  </g>
  <g class="spread" :class="{ on: $clicks >= 4 }">
    <path class="dia-arrow" d="M 328 154 H 406" />
    <image class="var" href="/images/sec6/variants/char1.png" x="441" y="79" width="150" height="150" style="--d: 0.15s" />
    <image class="var" href="/images/sec6/variants/char2.png" x="671" y="79" width="150" height="150" style="--d: 0.27s" />
    <image class="var" href="/images/sec6/variants/char3.png" x="901" y="79" width="150" height="150" style="--d: 0.39s" />
    <image class="var" href="/images/sec6/variants/char4.png" x="1131" y="79" width="150" height="150" style="--d: 0.51s" />
  </g>
  <g class="spread" :class="{ on: $clicks >= 4 }">
    <path class="dia-arrow" d="M 328 384 H 406" />
    <image class="var" href="/images/sec6/variants/stage1.png" x="441" y="309" width="150" height="150" style="--d: 0.25s" />
    <image class="var" href="/images/sec6/variants/stage2.png" x="671" y="309" width="150" height="150" style="--d: 0.37s" />
    <image class="var" href="/images/sec6/variants/stage3.png" x="901" y="309" width="150" height="150" style="--d: 0.49s" />
    <image class="var" href="/images/sec6/variants/stage4.png" x="1131" y="309" width="150" height="150" style="--d: 0.61s" />
  </g>
  <g class="spread" :class="{ on: $clicks >= 4 }">
    <path class="dia-arrow" d="M 328 614 H 406" />
    <image class="var" href="/images/sec6/variants/item1.png" x="441" y="539" width="150" height="150" style="--d: 0.35s" />
    <image class="var" href="/images/sec6/variants/item2.png" x="671" y="539" width="150" height="150" style="--d: 0.47s" />
    <image class="var" href="/images/sec6/variants/item3.png" x="901" y="539" width="150" height="150" style="--d: 0.59s" />
    <image class="var" href="/images/sec6/variants/item4.png" x="1131" y="539" width="150" height="150" style="--d: 0.71s" />
  </g>
</svg>

<style>
.xp image {
  mix-blend-mode: lighten;
}
.xp .step {
  opacity: 0;
  transition: opacity 0.3s ease;
}
.xp .step.on {
  opacity: 1;
}
.xp .frame {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 4;
}
.xp .dia-arrow {
  opacity: 0;
  transition: opacity 0.3s ease;
}
.xp .spread.on .dia-arrow {
  opacity: 1;
}
/* Variations slide in one after another, spreading out from the prototype */
.xp .var {
  opacity: 0;
  transform: translateX(-60px);
  transition: opacity 0.4s ease, transform 0.5s cubic-bezier(0.33, 1, 0.68, 1);
}
.xp .spread.on .var {
  opacity: 1;
  transform: none;
  transition-delay: var(--d);
}
</style>

<!--
I think this approach works well for games that have lots of assets of the same kind. Like [click]characters, [click]stages, [click]items — there's one "template," and [click]variations of it get rolled out. Most games have that kind of structure, I think. So we optimize on that assumption.
-->

---
layout: center
---

<div class="cost-tables flex justify-center items-start gap-10">
<v-click>
<div>
<div class="mb-1" style="color: var(--c-yellow)">Single session</div>

| Total |
|---:|
| 1,696 pts. |
| 2,231 pts. |
| 1,846 pts. |

</div>
</v-click>
<v-click>
<div>
<div class="mb-1" style="color: var(--c-yellow)">Split</div>

| Parent | Child | Total |
|---:|---:|---:|
| 1,345 pts. | 534 pts. | 1,879 pts. |
| 978 pts. | 410 pts. | 1,388 pts. |
| 1,601 pts. | 587 pts. | 2,188 pts. |

</div>
</v-click>
<v-click>
<div>
<div class="mb-1" style="color: var(--c-yellow)">Roll-out</div>

| Parent | Child | Total |
|---:|---:|---:|
| 1,341 pts. | 61 pts. | 1,402 pts. |
| 1,924 pts. | 180 pts. | 2,104 pts. |
| 980 pts. | 95 pts. | 1,075 pts. |

</div>
</v-click>
</div>

<style>
.cost-tables table { margin: 0; width: auto; }
.cost-tables th, .cost-tables td { padding: 0.15rem 0.75rem; }
</style>

<!--
So I actually ran the migration several times and measured the cost.

First is [click]the case where everything ran in a single session, next is [click]the case where only the verification was moved to a separate session, and then [click]the "roll-out" approach I just described.

That said, even though I measured it, unfortunately the numbers vary so much that it may be hard to rely on them. In the end, how thoroughly the agent verifies things depends on its mood, so it's hard to get stable measurements.

Still, you might get a rough sense of the trend. At least in these measurements, the roll-out approach seems to do relatively well. At the very least, it doesn't look like using it makes efficiency much worse.

And this sample only has five stages. With more stages — in other words, a wider roll-out — I think the benefits of this approach would grow.
-->

---

# Side note: why not use subagents?

<v-click>

- Skipped on purpose: they showed extra cost.

</v-click>

<!--
Another quick side note: you might think of using subagents for this kind of context separation. Subagents basically don't inherit the parent's context, so they're useful when you want to separate context like this.

However, while doing this cost investigation, [click]I saw behavior where extra cost was incurred on the subagent side, so I deliberately left them out.

Actually, subagents let you automate the kind of thing I'm doing here, so they're really handy. When you think about your own work, please do consider them as an option.
-->
