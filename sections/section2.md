---
layout: fullvideo
video: /videos/sec2/jacquard-hq.mp4
---

---
layout: video-split
video: /videos/sec2/jacquard-hq.mp4
qr: /images/sec2/jacquard-qr.svg
---

# Jacquard

- A procedural composition tool<br/>built on a unique grid system
- Creates performance rules that weave in "repetition" and "variation"
- Multi-platform: Windows, Mac, iOS, Android

<!--
Jacquard isn't a game; it's a music composition tool. But instead of entering notes through a typical interface like a score or a piano roll, you build sequences by placing functional blocks like these on a grid. The sequences aren't just played back linearly. They have a procedural nature, which lets you create performance rules with a lot of variation woven in.

I'd had the idea for this kind of slightly unusual sequencer for a long time, but I never really had the chance to actually build it. Then I thought, with coding agents this advanced, maybe I could just knock it out quickly. So I spent one week of my summer vacation building it.

It's also released for free as an iOS and Android app, so if you're interested, please give it a try.
-->

---
layout: bigtext
---

So, how much did it cost?

Maybe 20-30K points? 😅

<!--
So once the app was more or less finished, I got curious about how much it had cost to develop, and I looked it up. I'd kept the agent working pretty hard, so I guessed maybe around 20,000 to 30,000 points. But the actual cost was...
-->

---
layout: bigtext
---

131,700 pts. 😱

<!--
131,700 pts. That's roughly 200,000 yen. You might think 200,000 yen is cheap for developing an app, but I'd just casually built something to unwind during summer vacation, and 200,000 yen had vanished. That was quite a shock.

But think about it realistically. This was one week of relaxed summer-vacation hacking. If I'd worked on it seriously full-time, I'd probably have used about three times as much. And say it wasn't just me, but a team of five, working for four weeks instead of one. 200,000 yen times 3 times 5 times 4... that's about 12 million yen.

You could still say that's cheap, but that's 10 million yen on top of all the usual expenses. You can't take it lightly. Naturally, the conversation turns to: if there's somewhere we can save, let's save.

This was when it really sank in for me that coding agents cost a lot more than I'd thought.
-->

---
layout: bigtext
---

Get a feel for

where costs come from

<!--
I don't think you need to be stingier than necessary, but I wanted to at least develop an intuition, a kind of sixth sense, for how much the task I'm doing right now is costing.
-->

---
layout: bigtext
---

Question: what was

driving up the cost?

<!--
As a first step, I decided to analyze how the costs had built up in the Jacquard project I just showed you.
-->

---
layout: full
clicks: 3
---

<svg class="tvc dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet" :class="`hl-${$clicks}`">
  <text class="caption" x="188" y="150">Tokens</text>
  <text class="total" x="360" y="150">~1.8B</text>
  <text class="note" x="1188" y="150">Write 1.4% / Output 0.4%</text>
  <rect class="read top" x="188" y="180" width="975.4" height="90" rx="4" />
  <rect class="write" x="1166.4" y="180" width="14.3" height="90" rx="2" />
  <rect class="output" x="1183.7" y="180" width="4.3" height="90" rx="1" />
  <text class="seg top" x="210" y="225">Cache read 98.1%</text>
  <path class="band read" d="M 188 270 H 1163.4 L 852.7 470 H 188 Z" />
  <path class="band write" d="M 1166.4 270 H 1180.7 L 1040 470 H 855.7 Z" />
  <path class="band output" d="M 1183.7 270 H 1188 L 1187.7 470 H 1043 Z" />
  <rect class="read bottom" x="188" y="470" width="664.7" height="90" rx="4" />
  <rect class="write" x="855.7" y="470" width="184.3" height="90" rx="4" />
  <rect class="output" x="1043" y="470" width="144.7" height="90" rx="4" />
  <text class="seg bottom" x="210" y="515">Cache read 66.9%</text>
  <text class="seg" x="947.9" y="515" style="text-anchor: middle">18.5%</text>
  <text class="seg" x="1115.4" y="515" style="text-anchor: middle">14.6%</text>
  <text class="caption" x="188" y="610">Cost</text>
  <text class="total" x="300" y="610">131,700 pts.</text>
  <g class="legend" transform="translate(188 680)">
    <rect class="read" width="24" height="24" rx="4" />
    <text x="36" y="12">Cache read</text>
    <rect class="write" x="300" width="24" height="24" rx="4" />
    <text x="336" y="12">Cache write</text>
    <rect class="output" x="600" width="24" height="24" rx="4" />
    <text x="636" y="12">Output</text>
  </g>
</svg>

<style>
.tvc .read {
  fill: var(--c-green);
}
.tvc .write {
  fill: var(--c-orange);
}
.tvc .output {
  fill: var(--c-lime);
}
.tvc .band {
  opacity: 0.3;
}
.tvc text {
  font-size: 26px;
  text-anchor: start;
}
.tvc .caption {
  font-size: 32px;
}
.tvc .total {
  font-size: 40px;
}
.tvc .note {
  font-size: 22px;
  fill: var(--c-yellow);
  text-anchor: end;
}
.tvc .seg {
  font-size: 30px;
  font-weight: 600;
}
.tvc .legend text {
  font-size: 22px;
}
/* 1: top cache read / 2: bottom cache read; everything else dims */
.tvc > * {
  transition: opacity 0.3s;
}
.tvc.hl-1 > :not(.top),
.tvc.hl-2 > :not(.bottom) {
  opacity: 0.3;
}
.tvc.hl-1 > .band,
.tvc.hl-2 > .band {
  opacity: 0.1;
}
</style>

<!--
This graph shows the total token consumption in the Jacquard project and its cost.

First, what's a token? Roughly speaking, think of it as the equivalent of a character count. The text you feed into the LLM and the text it outputs are each billed according to their amount, and a token is the unit for counting that.

And most of the tokens consumed during development came from [click]"cache reads." Cache reads are cheap, so [click]they shrink quite a bit in actual cost, but even so, most of the cost still comes from here. [click]

So what exactly is this overwhelmingly dominant "cache read"? To understand it...
-->
