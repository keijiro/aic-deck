---
clicks: 1
---

<div class="session-bars" :class="{ shrunk: $clicks > 0 }">
  <div v-for="(w, i) in [72, 45, 88, 60, 34, 79, 52, 95, 41, 67, 83, 56]" :key="i"
       class="bar" :style="{ width: w + '%', transitionDelay: i * 0.04 + 's' }"></div>
</div>

<style>
.session-bars {
  width: 70%;
  height: 100%;
  margin: 0 auto;
  display: flex;
  flex-direction: column;
  justify-content: center;
  gap: 12px;
}
.session-bars .bar {
  height: 22px;
  background: var(--c-green);
  transform-origin: left center;
  transition: transform 0.8s cubic-bezier(0.65, 0, 0.35, 1);
}
.session-bars.shrunk .bar { transform: scaleX(0.35); }
</style>

<!--
So far, we've talked about basically doing one task per session. The next focus is [click]how to reduce the cost of each of those sessions.

Let's jump right in and break down the cost structure of a single session.
-->

---
clicks: 3
---

<div class="req-chart mt-13" style="--bars: 48">
  <div class="bars" :class="{ shown: $nav.currentPage === $page }" :data-focus="[null, 'inv', 'impl', 'check'][$clicks]">
    <div class="bar inv" style="--i: 1"><i class="r" style="height:3.1%"></i><i class="o" style="height:2.0%"></i><i class="w" style="height:94.3%"></i></div>
    <div class="bar inv" style="--i: 2"><i class="r" style="height:5.5%"></i><i class="o" style="height:3.1%"></i><i class="w" style="height:18.6%"></i></div>
    <div class="bar inv" style="--i: 3"><i class="r" style="height:6.0%"></i><i class="o" style="height:3.2%"></i><i class="w" style="height:15.0%"></i></div>
    <div class="bar inv" style="--i: 4"><i class="r" style="height:6.3%"></i><i class="o" style="height:2.5%"></i><i class="w" style="height:8.2%"></i></div>
    <div class="bar inv" style="--i: 5"><i class="r" style="height:6.5%"></i><i class="o" style="height:5.2%"></i><i class="w" style="height:47.0%"></i></div>
    <div class="bar inv" style="--i: 6"><i class="r" style="height:7.7%"></i><i class="o" style="height:3.2%"></i><i class="w" style="height:17.5%"></i></div>
    <div class="bar inv" style="--i: 7"><i class="r" style="height:8.2%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:16.6%"></i></div>
    <div class="bar inv" style="--i: 8"><i class="r" style="height:8.6%"></i><i class="o" style="height:6.7%"></i><i class="w" style="height:15.2%"></i></div>
    <div class="bar inv" style="--i: 9"><i class="r" style="height:9.0%"></i><i class="o" style="height:9.1%"></i><i class="w" style="height:7.7%"></i></div>
    <div class="bar inv" style="--i: 10"><i class="r" style="height:9.1%"></i><i class="o" style="height:3.0%"></i><i class="w" style="height:4.0%"></i></div>
    <div class="bar inv" style="--i: 11"><i class="r" style="height:9.2%"></i><i class="o" style="height:2.4%"></i><i class="w" style="height:2.0%"></i></div>
    <div class="bar inv" style="--i: 12"><i class="r" style="height:9.3%"></i><i class="o" style="height:4.2%"></i><i class="w" style="height:15.9%"></i></div>
    <div class="bar inv" style="--i: 13"><i class="r" style="height:9.7%"></i><i class="o" style="height:15.2%"></i><i class="w" style="height:3.3%"></i></div>
    <div class="bar inv" style="--i: 14"><i class="r" style="height:9.8%"></i><i class="o" style="height:7.6%"></i><i class="w" style="height:11.4%"></i></div>
    <div class="bar inv" style="--i: 15"><i class="r" style="height:10.1%"></i><i class="o" style="height:6.5%"></i><i class="w" style="height:10.5%"></i></div>
    <div class="bar impl" style="--i: 16"><i class="r" style="height:10.3%"></i><i class="o" style="height:31.4%"></i><i class="w" style="height:8.8%"></i></div>
    <div class="bar" style="--i: 17"><i class="r" style="height:10.5%"></i><i class="o" style="height:5.5%"></i><i class="w" style="height:15.2%"></i></div>
    <div class="bar" style="--i: 18"><i class="r" style="height:10.9%"></i><i class="o" style="height:0.5%"></i><i class="w" style="height:11.6%"></i></div>
    <div class="bar" style="--i: 19"><i class="r" style="height:11.2%"></i><i class="o" style="height:0.5%"></i><i class="w" style="height:1.0%"></i></div>
    <div class="bar" style="--i: 20"><i class="r" style="height:11.2%"></i><i class="o" style="height:13.6%"></i><i class="w" style="height:0.5%"></i></div>
    <div class="bar" style="--i: 21"><i class="r" style="height:11.3%"></i><i class="o" style="height:10.0%"></i><i class="w" style="height:6.8%"></i></div>
    <div class="bar" style="--i: 22"><i class="r" style="height:11.4%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:4.7%"></i></div>
    <div class="bar check" style="--i: 23"><i class="r" style="height:11.5%"></i><i class="o" style="height:3.6%"></i><i class="w" style="height:5.0%"></i></div>
    <div class="bar check" style="--i: 24"><i class="r" style="height:11.7%"></i><i class="o" style="height:3.1%"></i><i class="w" style="height:2.4%"></i></div>
    <div class="bar check" style="--i: 25"><i class="r" style="height:11.7%"></i><i class="o" style="height:0.9%"></i><i class="w" style="height:2.0%"></i></div>
    <div class="bar check" style="--i: 26"><i class="r" style="height:11.8%"></i><i class="o" style="height:3.8%"></i><i class="w" style="height:3.6%"></i></div>
    <div class="bar check" style="--i: 27"><i class="r" style="height:11.9%"></i><i class="o" style="height:0.9%"></i><i class="w" style="height:2.0%"></i></div>
    <div class="bar check" style="--i: 28"><i class="r" style="height:11.9%"></i><i class="o" style="height:12.0%"></i><i class="w" style="height:3.6%"></i></div>
    <div class="bar check" style="--i: 29"><i class="r" style="height:12.0%"></i><i class="o" style="height:8.6%"></i><i class="w" style="height:8.6%"></i></div>
    <div class="bar check" style="--i: 30"><i class="r" style="height:12.2%"></i><i class="o" style="height:7.2%"></i><i class="w" style="height:7.6%"></i></div>
    <div class="bar check" style="--i: 31"><i class="r" style="height:12.4%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:10.2%"></i></div>
    <div class="bar check" style="--i: 32"><i class="r" style="height:12.7%"></i><i class="o" style="height:7.4%"></i><i class="w" style="height:6.9%"></i></div>
    <div class="bar check" style="--i: 33"><i class="r" style="height:12.8%"></i><i class="o" style="height:8.4%"></i><i class="w" style="height:6.8%"></i></div>
    <div class="bar check" style="--i: 34"><i class="r" style="height:13.0%"></i><i class="o" style="height:6.2%"></i><i class="w" style="height:7.3%"></i></div>
    <div class="bar check" style="--i: 35"><i class="r" style="height:13.2%"></i><i class="o" style="height:3.4%"></i><i class="w" style="height:6.3%"></i></div>
    <div class="bar check" style="--i: 36"><i class="r" style="height:13.3%"></i><i class="o" style="height:6.2%"></i><i class="w" style="height:1.7%"></i></div>
    <div class="bar check" style="--i: 37"><i class="r" style="height:13.4%"></i><i class="o" style="height:8.8%"></i><i class="w" style="height:6.4%"></i></div>
    <div class="bar check" style="--i: 38"><i class="r" style="height:13.6%"></i><i class="o" style="height:0.5%"></i><i class="w" style="height:4.6%"></i></div>
    <div class="bar check" style="--i: 39"><i class="r" style="height:13.7%"></i><i class="o" style="height:1.2%"></i><i class="w" style="height:0.5%"></i></div>
    <div class="bar check" style="--i: 40"><i class="r" style="height:13.7%"></i><i class="o" style="height:3.8%"></i><i class="w" style="height:0.6%"></i></div>
    <div class="bar check" style="--i: 41"><i class="r" style="height:13.7%"></i><i class="o" style="height:5.0%"></i><i class="w" style="height:5.9%"></i></div>
    <div class="bar check" style="--i: 42"><i class="r" style="height:13.8%"></i><i class="o" style="height:5.9%"></i><i class="w" style="height:2.4%"></i></div>
    <div class="bar check" style="--i: 43"><i class="r" style="height:13.9%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:6.7%"></i></div>
    <div class="bar check" style="--i: 44"><i class="r" style="height:14.1%"></i><i class="o" style="height:2.8%"></i><i class="w" style="height:7.6%"></i></div>
    <div class="bar check" style="--i: 45"><i class="r" style="height:14.3%"></i><i class="o" style="height:2.9%"></i><i class="w" style="height:1.3%"></i></div>
    <div class="bar" style="--i: 46"><i class="r" style="height:14.3%"></i><i class="o" style="height:5.3%"></i><i class="w" style="height:3.5%"></i></div>
    <div class="bar" style="--i: 47"><i class="r" style="height:14.4%"></i><i class="o" style="height:3.3%"></i><i class="w" style="height:9.5%"></i></div>
    <div class="bar" style="--i: 48"><i class="r" style="height:14.6%"></i><i class="o" style="height:12.0%"></i><i class="w" style="height:3.8%"></i></div>
  </div>
  <div class="phases" :data-focus="[null, 'inv', 'impl', 'check'][$clicks]">
    <div class="inv" style="--n: 15">Investigation</div>
    <div class="impl" style="--n: 1">Impl.</div>
    <div style="--n: 6">Setup</div>
    <div class="check" style="--n: 23">Verification</div>
    <div style="--n: 3">Cleanup</div>
  </div>
  <div class="legend">
    <span><i class="r"></i>Cache Read</span>
    <span><i class="w"></i>Cache Write</span>
    <span><i class="o"></i>Output</span>
  </div>
</div>

<!--
This is a step-by-step analysis of the invincibility item task I used as an example earlier. This time I had it run properly, including runtime verification. This task made 48 API requests, and this bar chart shows the cost of each one.

[click]The first part is investigating the project. It's reading in scripts, so the cache write cost stands out.

[click]Next, there's a single bar with a huge amount of output. That's the step where it writes the code. The implementation itself is done in just one step.

And what I want you to look at is [click]this part. This is the phase where it enters Play mode and verifies that the implementation actually works. There's no single step that's especially heavy, but the cost adds up from resending a context that has grown fairly large. And there are a lot of steps.
-->

---
layout: cost-table
table: cost-phase
clicks: 6
---

| Phase | Requests | Tool Calls | Cache Read | Cost |
| --- | ---: | ---: | ---: | ---: |
| Investigation | 15 | 16 | 19 pts. | 77 pts. (38%) |
| Implementation | 1 | 1 | 2 pts. | 8 pts. (4%) |
| Setup | 6 | 6 | 11 pts. | 23 pts. (11%) |
| Verification | 23 | 33 | 47 pts. | 83 pts. (41%) |
| Cleanup | 3 | 4 | 7 pts. | 13 pts. (6%) |

<!--
I totaled it up by phase.

The most expensive phase wasn't investigation or implementation — it was [click]verification. [click]41% of the total cost is here. Meanwhile, [click]implementation only takes 4%, so verification costs about 10 times as much.

[click]23 requests and 33 tool calls. Nearly half of all the back-and-forth is concentrated in this phase. [click]The cache read cost is also noticeably large. That's the effect of piling up steps on top of a bloated context. [click]

So here we can see a cost structure that's a problem for Unity development — and probably for game development in general. And that is...
-->

---
layout: bigtext
---

Verification

is expensive

<!--
Verification is expensive.

As the measurements we just saw show, it's really common for verification to cost more than the implementation work itself. If you want to improve the cost structure, revisiting this verification process looks like a good place to start.

So first, let's break down in more detail what's actually going on in this verification phase.
-->

---
layout: center
clicks: 10
---

<div class="cost-hl verify-steps grid grid-cols-2 gap-12 mt-8" :class="`hl-${$clicks}`">

<div>

- Open the scene and play
- Spawn the item, take a capture
- Tweak the look, capture again
- Move the player to pick it up
- Check HP to confirm no damage
- Hit an enemy, take a capture
- Check the console
- ...

</div>

<div>

| Tool | Count |
| --- | ---: |
| eval (run C#) | 14 |
| capture_game_view | 9 |
| Bash | 5 |
| editor_play / stop | 3 |
| recompile / console | 2 |

</div>

</div>

<!--
This is an analysis of what goes on inside the verification phase of that invincibility item task.

[click]Open the scene and hit play, [click]spawn the item and take a capture, [click]the look is off so tweak it and capture again, [click]move the player to pick up the item, [click]confirm it isn't taking damage, [click]bump into an enemy and check... [click]So basically, the agent is reproducing the kind of verification a human would do in the Unity Editor, one step at a time, using tool calls.

As for tools, [click]the eval command that runs C# was called 14 times, [click]screen captures 9 times, and so on — [click]it calls small operations in tiny pieces, over and over.
-->

---
layout: bigtext
---

Many tool calls
<v-click>

≈ Many requests

</v-click>
<v-click>

≈ Prone to high cost

</v-click>

<!--
Work with lots of tool calls like this [click]inevitably increases the number of API requests, which means the context gets sent as input more often. And [click]because of that, it tends to be expensive.

Tool calls can also run in parallel, so the two counts aren't necessarily equal. But in something like verification, the agent calls tools one after another while checking each result, so it can't really run them in parallel — which means the number of requests tends to go up.
-->

---
layout: full
clicks: 1
hide: true
---

<svg class="mux absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <svg class="unity" x="170" y="280" width="240" height="240" viewBox="0 0 24 24">
    <path d="m12.9288 4.2939 3.7997 2.1929c.1366.077.1415.2905 0 .3675l-4.515 2.6076a.4192.4192 0 0 1-.4246 0L7.274 6.8543c-.139-.0745-.1415-.293 0-.3675l3.7972-2.193V0L1.3758 5.5977V16.793l3.7177-2.1456v-4.3858c-.0025-.1565.1813-.2682.318-.1838l4.5148 2.6076a.4252.4252 0 0 1 .2136.3676v5.2127c.0025.1565-.1813.2682-.3179.1838l-3.7996-2.1929-3.7178 2.1457L12 24l9.6954-5.5977-3.7178-2.1457-3.7996 2.1929c-.1341.082-.3229-.0248-.3179-.1838V13.053c0-.1565.087-.2956.2136-.3676l4.5149-2.6076c.134-.082.3228.0224.3179.1838v4.3858l3.7177 2.1456V5.5977L12.9288 0Z" />
  </svg>
  <svg x="940" y="267" width="300" height="266" viewBox="300 90 700 620">
    <image href="/images/sec3/smart-ai.png" width="1376" height="768" />
  </svg>
  <g class="calls" v-click="1">
    <path class="dia-arrow trunk" d="M 910 400 H 840" />
    <path class="dia-arrow trunk" d="M 840 400 C 780 400 780 260 740 260 H 610 C 570 260 570 400 510 400" />
    <path class="dia-arrow trunk" d="M 840 400 C 780 400 780 330 740 330 H 610 C 570 330 570 400 510 400" />
    <path class="dia-arrow trunk" d="M 840 400 C 780 400 780 400 740 400 H 610 C 570 400 570 400 510 400" />
    <path class="dia-arrow trunk" d="M 840 400 C 780 400 780 470 740 470 H 610 C 570 470 570 400 510 400" />
    <path class="dia-arrow trunk" d="M 840 400 C 780 400 780 540 740 540 H 610 C 570 540 570 400 510 400" />
    <path class="dia-arrow" d="M 510 400 H 430" />
    <circle class="pad" cx="675" cy="260" r="26" /><svg class="tool" x="658" y="243" width="34" height="34" viewBox="0 0 256 256"><path d="M232 96a72 72 0 0 1-100.94 66L79 222.22c-.12.14-.26.29-.39.42a32 32 0 0 1-45.26-45.26c.14-.13.28-.27.43-.39L94 124.94a72.07 72.07 0 0 1 83.54-98.78a8 8 0 0 1 3.93 13.19L144 80l5.66 26.35L176 112l40.65-37.52a8 8 0 0 1 13.19 3.93A72.6 72.6 0 0 1 232 96" /></svg>
    <circle class="pad" cx="675" cy="330" r="26" /><svg class="tool" x="658" y="313" width="34" height="34" viewBox="0 0 256 256"><path d="M232 96a72 72 0 0 1-100.94 66L79 222.22c-.12.14-.26.29-.39.42a32 32 0 0 1-45.26-45.26c.14-.13.28-.27.43-.39L94 124.94a72.07 72.07 0 0 1 83.54-98.78a8 8 0 0 1 3.93 13.19L144 80l5.66 26.35L176 112l40.65-37.52a8 8 0 0 1 13.19 3.93A72.6 72.6 0 0 1 232 96" /></svg>
    <circle class="pad" cx="675" cy="400" r="26" /><svg class="tool" x="658" y="383" width="34" height="34" viewBox="0 0 256 256"><path d="M232 96a72 72 0 0 1-100.94 66L79 222.22c-.12.14-.26.29-.39.42a32 32 0 0 1-45.26-45.26c.14-.13.28-.27.43-.39L94 124.94a72.07 72.07 0 0 1 83.54-98.78a8 8 0 0 1 3.93 13.19L144 80l5.66 26.35L176 112l40.65-37.52a8 8 0 0 1 13.19 3.93A72.6 72.6 0 0 1 232 96" /></svg>
    <circle class="pad" cx="675" cy="470" r="26" /><svg class="tool" x="658" y="453" width="34" height="34" viewBox="0 0 256 256"><path d="M232 96a72 72 0 0 1-100.94 66L79 222.22c-.12.14-.26.29-.39.42a32 32 0 0 1-45.26-45.26c.14-.13.28-.27.43-.39L94 124.94a72.07 72.07 0 0 1 83.54-98.78a8 8 0 0 1 3.93 13.19L144 80l5.66 26.35L176 112l40.65-37.52a8 8 0 0 1 13.19 3.93A72.6 72.6 0 0 1 232 96" /></svg>
    <circle class="pad" cx="675" cy="540" r="26" /><svg class="tool" x="658" y="523" width="34" height="34" viewBox="0 0 256 256"><path d="M232 96a72 72 0 0 1-100.94 66L79 222.22c-.12.14-.26.29-.39.42a32 32 0 0 1-45.26-45.26c.14-.13.28-.27.43-.39L94 124.94a72.07 72.07 0 0 1 83.54-98.78a8 8 0 0 1 3.93 13.19L144 80l5.66 26.35L176 112l40.65-37.52a8 8 0 0 1 13.19 3.93A72.6 72.6 0 0 1 232 96" /></svg>
  </g>
</svg>

<style>
.mux .unity path {
  fill: white;
}
.mux .dia-arrow.trunk {
  marker-end: none;
}
.mux .pad {
  fill: black;
  stroke: var(--c-yellow);
  stroke-width: 3;
}
.mux .tool path {
  fill: var(--c-yellow);
}
</style>

<!--
本来、ツール呼び出しというのは複数のコールを[click]１回のリクエストにまとめることができるので、ツール呼び出し回数が多いことは即リクエスト回数が多いということにはなりません。
-->

---
layout: full
clicks: 6
hide: true
---

<svg class="seq absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <svg class="unity" x="170" y="280" width="240" height="240" viewBox="0 0 24 24">
    <path d="m12.9288 4.2939 3.7997 2.1929c.1366.077.1415.2905 0 .3675l-4.515 2.6076a.4192.4192 0 0 1-.4246 0L7.274 6.8543c-.139-.0745-.1415-.293 0-.3675l3.7972-2.193V0L1.3758 5.5977V16.793l3.7177-2.1456v-4.3858c-.0025-.1565.1813-.2682.318-.1838l4.5148 2.6076a.4252.4252 0 0 1 .2136.3676v5.2127c.0025.1565-.1813.2682-.3179.1838l-3.7996-2.1929-3.7178 2.1457L12 24l9.6954-5.5977-3.7178-2.1457-3.7996 2.1929c-.1341.082-.3229-.0248-.3179-.1838V13.053c0-.1565.087-.2956.2136-.3676l4.5149-2.6076c.134-.082.3228.0224.3179.1838v4.3858l3.7177 2.1456V5.5977L12.9288 0Z" />
  </svg>
  <svg x="940" y="267" width="300" height="266" viewBox="300 90 700 620">
    <image href="/images/sec3/smart-ai.png" width="1376" height="768" />
  </svg>
  <g class="step" :class="{ on: [1, 4].includes($clicks) }">
    <path class="dia-arrow" d="M 910 400 H 430" />
    <circle class="pad" cx="670" cy="400" r="30" /><svg class="tool" x="650" y="380" width="40" height="40" viewBox="0 0 256 256"><path d="M232 96a72 72 0 0 1-100.94 66L79 222.22c-.12.14-.26.29-.39.42a32 32 0 0 1-45.26-45.26c.14-.13.28-.27.43-.39L94 124.94a72.07 72.07 0 0 1 83.54-98.78a8 8 0 0 1 3.93 13.19L144 80l5.66 26.35L176 112l40.65-37.52a8 8 0 0 1 13.19 3.93A72.6 72.6 0 0 1 232 96" /></svg>
  </g>
  <g class="step" :class="{ on: [2, 5].includes($clicks) }">
    <path class="dia-arrow" d="M 430 400 H 910" />
    <circle class="pad" cx="670" cy="400" r="30" />
    <path class="file" d="M 658 384 H 676 L 686 394 V 416 H 658 Z" />
    <path class="file" d="M 664 397 H 680 M 664 405 H 680" />
  </g>
  <g class="step bubble" :class="{ on: $clicks === 3 }" transform="translate(400 -102)">
    <path d="M 444 270 H 556 A 24 24 0 0 1 580 294 V 326 A 24 24 0 0 1 560 349 L 600 382 L 540 350 H 444 A 24 24 0 0 1 420 326 V 294 A 24 24 0 0 1 444 270 Z" />
    <circle cx="470" cy="310" r="7" /><circle cx="500" cy="310" r="7" /><circle cx="530" cy="310" r="7" />
  </g>
  <g class="step" :class="{ on: $clicks === 6 }">
    <path class="dia-arrow" d="M 910 295 H 430" />
    <circle class="pad" cx="670" cy="295" r="26" /><svg class="tool" x="653" y="278" width="34" height="34" viewBox="0 0 256 256"><path d="M232 96a72 72 0 0 1-100.94 66L79 222.22c-.12.14-.26.29-.39.42a32 32 0 0 1-45.26-45.26c.14-.13.28-.27.43-.39L94 124.94a72.07 72.07 0 0 1 83.54-98.78a8 8 0 0 1 3.93 13.19L144 80l5.66 26.35L176 112l40.65-37.52a8 8 0 0 1 13.19 3.93A72.6 72.6 0 0 1 232 96" /></svg>
    <path class="dia-arrow" d="M 430 365 H 910" />
    <circle class="pad" cx="670" cy="365" r="26" />
    <path class="file" d="M 659 351 H 675 L 684 360 V 379 H 659 Z" />
    <path class="file" d="M 664 363 H 679 M 664 370 H 679" />
    <path class="dia-arrow" d="M 910 435 H 430" />
    <circle class="pad" cx="670" cy="435" r="26" /><svg class="tool" x="653" y="418" width="34" height="34" viewBox="0 0 256 256"><path d="M232 96a72 72 0 0 1-100.94 66L79 222.22c-.12.14-.26.29-.39.42a32 32 0 0 1-45.26-45.26c.14-.13.28-.27.43-.39L94 124.94a72.07 72.07 0 0 1 83.54-98.78a8 8 0 0 1 3.93 13.19L144 80l5.66 26.35L176 112l40.65-37.52a8 8 0 0 1 13.19 3.93A72.6 72.6 0 0 1 232 96" /></svg>
    <path class="dia-arrow" d="M 430 505 H 910" />
    <circle class="pad" cx="670" cy="505" r="26" />
    <path class="file" d="M 659 491 H 675 L 684 500 V 519 H 659 Z" />
    <path class="file" d="M 664 503 H 679 M 664 510 H 679" />
  </g>
</svg>

<style>
.seq .unity path {
  fill: white;
}
.seq .pad {
  fill: black;
  stroke: var(--c-yellow);
  stroke-width: 3;
}
.seq .tool path {
  fill: var(--c-yellow);
}
</style>
<style>
.seq .step {
  opacity: 0;
  transition: opacity 0.3s ease;
}
.seq .step.on {
  opacity: 1;
}
.seq .bubble path {
  fill: black;
  stroke: white;
  stroke-width: 3.5;
  stroke-linejoin: round;
}
.seq .bubble circle {
  fill: white;
}
.seq .file {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 3;
  stroke-linejoin: round;
}
</style>

<!--
ただし、この検証作業で行なっているような処理は、[click]ツール呼び出しを行なって、[click]その結果を受け取ってから、[click]次のツール呼び出しの内容を決めて、[click]次のツール呼び出しを行なって、[click]また結果を受け取って……というように、[click]前の結果に依存する内容を持つ、つまり順番に実行することに意味のある、同時に実行できないものばかりなので、どうしても往復回数が増えてしまう、つまり、リクエスト回数が増えてしまいます。

この往復の度にコンテキストが添付され、しかもそのコンテキストはツール呼び出しの入出力内容によってどんどん太っていくので、効率はどんどん悪化していくわけです。
-->
