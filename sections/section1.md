# Ground Rules for This Talk

<v-clicks depth="2">

- Assumes pay-as-you-go API pricing
  - May feel a bit off if you're on a flat-rate subscription
- Costs shown in "points" (pts.), not real money

</v-clicks>

<!--
Before we get started, I'd like to lay out a few ground rules for this talk.

Today I'm going to talk about the cost of using coding agents, and the whole discussion is built around [click]how much things cost under pay-as-you-go API pricing. [click]If you use a coding agent on a personal subscription, it's basically flat-rate, so you probably don't think much about how much each task actually costs.

But when a company adopts these tools, it's very often on a pay-as-you-go API plan. And even on a flat-rate plan, finding ways to reduce your usage matters a lot if you want to make the most of your quota.

So even if you're on a subscription, this stuff matters, and I hope you'll bear with me for today's talk.

One more thing: I'm going to talk about cost not in real dollars or yen, but in [click]a virtual unit I'll call "points."

I actually made the slides with real amounts at first, but it all felt a bit too much about money, a bit too raw, and honestly it put even me off.

What I want to talk about today isn't how much something costs in absolute terms. It's about relative changes, like "with a bit of ingenuity, the cost dropped by half." So I figured a virtual unit would work just fine. It may feel a little odd, but please bear with me.
-->

---

<!--
Now that we've covered the ground rules, let's get into the main part.
-->

---
layout: bigtext
---

The Story

So Far

<!--
The story so far...

A lot of you are using coding agents, right? Actually, I'd guess pretty much 100% of the people in this session are.

By the way, when did you first start using a coding agent? Let's take a quick look back at the history.
-->

---
layout: full
clicks: 10
---

<svg class="tl dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g v-for="(r, i) in [[230, 2024, [0, .896, 1, 1, 1, 1, 1, 1, 1, 1, 1]], [430, 2025, [0, 0, .125, .125, .274, .425, .576, .726, .877, 1, 1]], [630, 2026, [0, 0, 0, 0, 0, 0, 0, 0, 0, .245, 1]]]" :key="i" class="row" :class="{ on: r[2][Math.min($clicks, 10)] > 0, done: r[2][Math.min($clicks, 10)] >= 1 }">
    <text class="year" x="150" :y="r[0]">{{ r[1] }}</text>
    <path class="axis start" :d="'M 240 ' + (r[0] - 12) + ' V ' + (r[0] + 12)" />
    <path class="axis end" :d="'M 1300 ' + (r[0] - 12) + ' V ' + (r[0] + 12)" />
    <path class="axis line" :d="'M 240 ' + r[0] + ' H 1300'" pathLength="1" :style="{ strokeDashoffset: 1 - r[2][Math.min($clicks, 10)] }" />
  </g>
  <g v-click="1" transform="translate(1190 170) scale(0.75)">
    <path d="M 0.0 -58.0 L 9.2 -46.1 L 22.2 -53.6 L 26.1 -39.1 L 41.0 -41.0 L 39.1 -26.1 L 53.6 -22.2 L 46.1 -9.2 L 58.0 0.0 L 46.1 9.2 L 53.6 22.2 L 39.1 26.1 L 41.0 41.0 L 26.1 39.1 L 22.2 53.6 L 9.2 46.1 L 0.0 58.0 L -9.2 46.1 L -22.2 53.6 L -26.1 39.1 L -41.0 41.0 L -39.1 26.1 L -53.6 22.2 L -46.1 9.2 L -58.0 0.0 L -46.1 -9.2 L -53.6 -22.2 L -39.1 -26.1 L -41.0 -41.0 L -26.1 -39.1 L -22.2 -53.6 L -9.2 -46.1 Z" />
    <text class="label" y="2">NEW!</text>
  </g>
  <g v-click="3" transform="translate(372 370) scale(0.75)">
    <rect x="-42" y="-40" width="84" height="56" rx="6" />
    <path d="M -42 16 L -56 36 H 56 L 42 16" />
    <text class="label" y="-12">Vibe</text>
    <text class="note" x="-40" y="-72">♪</text>
    <text class="note" x="38" y="-82">♫</text>
  </g>
  <g v-click="4" transform="translate(530 370) scale(0.75)">
    <circle r="52" />
    <path transform="translate(-19 -12)" d="M 0.0 -14.0 L 3.5 -4.9 L 13.3 -4.3 L 5.7 1.9 L 8.2 11.3 L 0.0 6.0 L -8.2 11.3 L -5.7 1.9 L -13.3 -4.3 L -3.5 -4.9 Z" />
    <path transform="translate(19 -12)" d="M 0.0 -14.0 L 3.5 -4.9 L 13.3 -4.3 L 5.7 1.9 L 8.2 11.3 L 0.0 6.0 L -8.2 11.3 L -5.7 1.9 L -13.3 -4.3 L -3.5 -4.9 Z" />
    <path d="M -26 12 Q 0 50 26 12 Z" />
  </g>
  <g v-click="5" transform="translate(690 370) scale(0.75)">
    <circle r="52" />
    <path d="M -28 -10 H -10 M 10 -10 H 28 M -18 24 H 18" />
  </g>
  <g v-click="6" transform="translate(850 370) scale(0.75)">
    <rect x="-40" y="-10" width="80" height="56" />
    <rect x="-48" y="-28" width="96" height="18" />
    <path d="M -8 -28 V 46 M 8 -28 V 46" />
    <path d="M 0 -28 C -14 -54 -44 -48 -30 -28 M 0 -28 C 14 -54 44 -48 30 -28" />
  </g>
  <g v-click="7" transform="translate(1010 370) scale(0.75)">
    <circle r="52" />
    <path transform="translate(-19 -12)" d="M 0.0 -14.0 L 3.5 -4.9 L 13.3 -4.3 L 5.7 1.9 L 8.2 11.3 L 0.0 6.0 L -8.2 11.3 L -5.7 1.9 L -13.3 -4.3 L -3.5 -4.9 Z" />
    <path transform="translate(19 -12)" d="M 0.0 -14.0 L 3.5 -4.9 L 13.3 -4.3 L 5.7 1.9 L 8.2 11.3 L 0.0 6.0 L -8.2 11.3 L -5.7 1.9 L -13.3 -4.3 L -3.5 -4.9 Z" />
    <path d="M -26 12 Q 0 50 26 12 Z" />
  </g>
  <g v-click="8" transform="translate(1170 370) scale(0.75)">
    <circle r="52" />
    <path d="M -28 -10 H -10 M 10 -10 H 28 M -18 24 H 18" />
  </g>
  <g v-click="9" transform="translate(500 570) scale(0.75)">
    <image href="/images/sec1/unity-logo.png" x="-49" y="-55" width="97" height="110" />
    <text class="beta" x="50" y="48">(β)</text>
  </g>
</svg>

<style>
.tl g path, .tl g rect, .tl g circle {
  fill: black;
  stroke: white;
  stroke-width: 5;
  stroke-linejoin: round;
  stroke-linecap: round;
}
.tl .axis {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 4;
  stroke-linejoin: round;
  stroke-linecap: round;
}
.tl .row .year, .tl .row .start, .tl .row .end {
  opacity: 0;
  transition: opacity 0.25s;
}
.tl .row.on .year, .tl .row.on .start, .tl .row.done .end {
  opacity: 1;
}
.tl .row .line {
  stroke-linecap: butt;
  stroke-dasharray: 1 1;
  transition: stroke-dashoffset 0.5s ease-in-out;
}
.tl > g.slidev-vclick-target:not(.slidev-vclick-hidden) {
  transition-delay: 0.3s;
}
.tl .year {
  fill: var(--c-yellow);
  font-size: 32px;
}
.tl .label {
  font-size: 26px;
  font-weight: bold;
}
.tl .note {
  font-size: 34px;
}
.tl .beta {
  font-size: 30px;
  text-anchor: start;
}
</style>

<!--
Coding agents that could do more than code completion showed up [click]around the end of 2024. [click]Claude Code arrived in early 2025, and right around the same time [click]the term "vibe coding" was born, and agentic coding had its first boom. After that, it went through a loop: [click]it gets popular, then after a while [click]it stalls, [click]a new model comes out and things evolve, [click]it gets popular again, [click]then it stalls again. And it's kept evolving rapidly that way. [click]In spring 2026, Unity also shipped an agentic development environment in the form of AI Assistant, [click]and ran a beta test.
-->

---
layout: full
---

<div class="video-grid">
  <LoopVideo src="/videos/sec1/dm-pr-small.mp4" />
  <LoopVideo src="/videos/sec1/mh-pr-small.mp4" />
  <LoopVideo src="/videos/sec1/mm-pr-small.mp4" />
  <LoopVideo src="/videos/sec1/ms-demo-small.mp4" />
</div>

<!--
So I used Unity AI Assistant to build all sorts of games. I talked about that experience at CEDEC and Unite Seoul... but today's cutting-edge models have evolved so much that these look like nothing now. Stuff from six months ago is already completely outdated. It really makes you feel like we're living at a terrifying speed.
-->

---

<!--
So recently I've been building new sample projects with the latest setup. I put together a short video showing them, so please take a look.
-->

---
layout: fullvideo
video: /videos/sec1/recent-projects-hq.mp4
---

---

<!--
As you can see, what I'm making is on a completely different level from six months ago. The pace of progress is just insane.

Anyway, today's topic is cost, so let me pick a few of these and show you what they cost.
-->

---
layout: video-split
video: /videos/sec1/salvonix-small.mp4
qr: /images/sec1/salvonix-qr.svg
---

# Salvonix

- Implementation: 1780 pts.
- Asset generation: 258 pts.
- Production time: 59 min
- 1 prompt + 1 fix-up prompt

<!--
First up is Salvonix, a prototype 3D shooter. You take out tons of enemies with salvos of homing missiles.

You fly around inside a space colony while the ship automatically rotates freely on every axis. That's a pretty complicated setup, and I was really happy it understood and implemented it properly from a single prompt. It's a perfect example of something I wouldn't have thought possible six months ago.
-->

---
layout: video-split
video: /videos/sec1/football-small.mp4
qr: /images/sec1/football-qr.svg
---

# Totally Realistic Football

- Implementation: 2219 pts.
- Asset generation: 382 pts.
- Production time: 84 min
- 1 prompt

<!--
Next is Totally Realistic Football, a surreal physics game with a silly name. The left arrow key spins you around your left foot, and the right arrow key spins you around your right foot. You control everything just by pivoting on your feet, so it's ridiculously hard. This is also a one-prompt prototype, and I was happy with how well the surreal mechanics and the look of the assets came together.
-->

---
layout: video-split
video: /videos/sec1/alchemion-small.mp4
qr: /images/sec1/alchemion-qr.svg
---

# Alchemion

- Implementation: ??? pts.
- Asset generation: ??? pts.
- Production time: ???

<!--
Next is Alchemion, a deck-building game. You don't control the party directly. Instead, you mix ingredient cards into potions to support the party, with the goal of defeating the red dragon waiting on the 36th basement floor.

Unlike the one-prompt prototypes so far, this is one I took all the way to a finished game. A single playthrough takes about an hour, and I tried to make it a proper game with replay value. You can play it on unityroom and Unity Play, so please give it a try if you're interested.

I'll keep the cost of this project hidden for now, since it would be a spoiler. I'll come back to it later.
-->

---

<!--
So that's the kind of stuff I've been making. But before these, there was one more project I was working on. Let me introduce it.
-->
