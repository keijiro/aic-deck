---
layout: bigtext
---

Context

<!--
First, we need to understand the concept of context in coding agents.

What exactly is "context" in a coding agent?
-->

---
layout: full
---

<svg class="absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g transform="translate(344 192) scale(0.5)">
    <image href="/images/sec3/smart-ai.png" width="1376" height="768" />
  </g>
</svg>

<svg v-click class="absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g transform="translate(344 192) scale(0.5)">
    <g v-for="(s, k) in [{ stroke: 'white', 'stroke-width': 12 }, { fill: 'black' }]" :key="k" :fill="s.fill ?? 'none'" :stroke="s.stroke" :stroke-width="s['stroke-width']">
      <circle v-for="([cx, cy, r], i) in [[1085, 120, 81], [1007, 137, 55], [1163, 137, 55], [1033, 68, 55], [1137, 68, 55], [1085, 42, 52], [1046, 185, 47], [1127, 185, 47]]" :key="i" :cx="cx" :cy="cy" :r="r" />
      <circle cx="940" cy="215" r="18" />
      <circle cx="905" cy="245" r="11" />
    </g>
    <text x="1085" y="120" fill="white" style="font-size: 130px; font-weight: bold"
          text-anchor="middle" dominant-baseline="central">?</text>
  </g>
</svg>

<!--
The LLM inside the coding agent you're using is a very smart entity, but it has one important limitation.

[click] The LLM itself has no concept of memory.
-->

---
layout: full
clicks: 6
---

<svg class="chat dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <image href="/images/sec3/human.png" x="150" y="400" width="320" height="320" />
  <svg x="953" y="431" width="305" height="270" viewBox="300 90 700 620">
    <image href="/images/sec3/smart-ai.png" width="1376" height="768" />
  </svg>
  <g v-if="$clicks === 1">
    <g v-for="(m, i) in [['1+1?'], ['It’s 2'], ['×3?'], ['It’s 6']]" :key="i" class="msg" :class="i % 2 ? 'to-human' : 'to-llm'" :style="{ animationDelay: i * 1.25 + 's' }">
      <rect :x="-30 - Math.max(...m.map(l => l.length)) * 12" :y="-36 - (m.length - 1) * 26" :width="60 + Math.max(...m.map(l => l.length)) * 24" :height="72 + (m.length - 1) * 52" rx="20" />
      <text v-for="(l, j) in m" :key="j" :y="(j * 2 - m.length + 1) * 26" :class="{ muted: j < m.length - 1 }">{{ l }}</text>
    </g>
  </g>
  <g v-if="$clicks === 2">
    <g v-for="(m, i) in [['1+1?'], ['It’s 2'], ['(1+1?)', '(It’s 2)', '×3?']]" :key="i" class="msg" :class="[i % 2 ? 'to-human' : 'to-llm', { hold: i === 2 }]" :style="{ animationDelay: i * 1.25 + 's' }">
      <rect :x="-30 - Math.max(...m.map(l => l.length)) * 12" :y="-36 - (m.length - 1) * 26" :width="60 + Math.max(...m.map(l => l.length)) * 24" :height="72 + (m.length - 1) * 52" rx="20" />
      <text v-for="(l, j) in m" :key="j" :y="(j * 2 - m.length + 1) * 26" :class="{ muted: j < m.length - 1 }">{{ l }}</text>
    </g>
  </g>
  <g v-if="$clicks === 3">
    <g v-for="(m, i) in [['(1+1?)', '(It’s 2)', '×3?'], ['It’s 6']]" :key="i" class="msg" :class="i ? 'to-human' : 'resume'" :style="{ animationDelay: i * 1.02 + 's' }">
      <rect :x="-30 - Math.max(...m.map(l => l.length)) * 12" :y="-36 - (m.length - 1) * 26" :width="60 + Math.max(...m.map(l => l.length)) * 24" :height="72 + (m.length - 1) * 52" rx="20" />
      <text v-for="(l, j) in m" :key="j" :y="(j * 2 - m.length + 1) * 26" :class="{ muted: j < m.length - 1 }">{{ l }}</text>
    </g>
  </g>
  <g v-click="[4, 6]">
    <path d="M 444 310 H 616 A 24 24 0 0 1 640 334 V 366 A 24 24 0 0 1 616 390 H 490 L 420 430 L 450 390 H 444 A 24 24 0 0 1 420 366 V 334 A 24 24 0 0 1 444 310 Z" />
    <text x="530" y="350">÷2?</text>
  </g>
  <g v-click="[5, 6]">
    <path d="M 764 340 H 956 A 24 24 0 0 1 980 364 V 396 A 24 24 0 0 1 956 420 H 950 L 990 460 L 920 420 H 764 A 24 24 0 0 1 740 396 V 364 A 24 24 0 0 1 764 340 Z" />
    <text x="860" y="380">What…?</text>
  </g>
  <g v-click="6">
    <path d="M 444 160 H 976 A 24 24 0 0 1 1000 184 V 366 A 24 24 0 0 1 976 390 H 490 L 420 430 L 450 390 H 444 A 24 24 0 0 1 420 366 V 184 A 24 24 0 0 1 444 160 Z" />
    <text x="710" y="210" class="muted">(1+1?) (It’s 2)</text>
    <text x="710" y="275" class="muted">(×3?) (It’s 6)</text>
    <text x="710" y="340">÷2?</text>
  </g>
</svg>

<style>
.chat rect, .chat path {
  fill: black;
  stroke: white;
  stroke-width: 3.5;
  stroke-linejoin: round;
}
.chat text {
  font-size: 40px;
  font-weight: 600;
}
.chat .muted {
  fill: var(--c-muted);
}
.msg {
  opacity: 0;
  animation: 1.2s ease-in-out both;
}
.msg.to-llm { animation-name: to-llm; }
.msg.to-human { animation-name: to-human; }
.msg.hold { animation-name: hold; animation-duration: 0.18s; }
.msg.resume { animation-name: resume; animation-duration: 1.02s; }
@keyframes to-llm {
  0% { transform: translate(560px, 300px); opacity: 0; }
  15% { transform: translate(560px, 300px); opacity: 1; }
  85% { transform: translate(860px, 300px); opacity: 1; }
  100% { transform: translate(860px, 300px); opacity: 0; }
}
@keyframes hold {
  0% { transform: translate(560px, 300px); opacity: 0; }
  100% { transform: translate(560px, 300px); opacity: 1; }
}
@keyframes resume {
  0% { transform: translate(560px, 300px); opacity: 1; }
  82% { transform: translate(860px, 300px); opacity: 1; }
  100% { transform: translate(860px, 300px); opacity: 0; }
}
@keyframes to-human {
  0% { transform: translate(860px, 300px); opacity: 0; }
  15% { transform: translate(860px, 300px); opacity: 1; }
  85% { transform: translate(560px, 300px); opacity: 1; }
  100% { transform: translate(560px, 300px); opacity: 0; }
}
</style>

<!--
When you use an agent, [click]it feels like you're having an ongoing conversation with an intelligence that has memory, right?

But in reality, the LLM has no ability to remember the flow of a conversation. To keep a conversation going, [click]you have to feed it the entire exchange so far, every single time. [click]

For example, [click]if you just send "divided by 2?" from here, [click]it won't work. [click]You have to send all of this.

And this is exactly what context is: the context of this exchange.
-->

---
layout: full
---

<svg class="flow dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g transform="translate(0 20)">
  <svg x="900" y="230" width="320" height="283" viewBox="300 90 700 620">
    <image href="/images/sec3/smart-ai.png" width="1376" height="768" />
  </svg>
  <g class="init" v-click="1">
    <rect x="150" y="100" width="400" height="50" rx="10" />
    <text x="350" y="125">Tool definitions</text>
  </g>
  <g class="init" v-click="2">
    <rect x="150" y="158" width="400" height="50" rx="10" />
    <text x="350" y="183">System prompt</text>
  </g>
  <g class="init" v-click="3">
    <rect x="150" y="216" width="400" height="50" rx="10" />
    <text x="350" y="241">Custom settings</text>
  </g>
  <g class="added" v-click="4">
    <rect x="150" y="274" width="400" height="50" rx="10" />
    <text x="350" y="299">User instructions</text>
  </g>
  <g class="send" v-click="[4,5]">
    <path class="bracket" d="M 566 100 H 586 V 324 H 566" />
    <path class="dia-arrow" d="M 600 212 L 880 330" />
  </g>
  <g class="added from-llm" v-click="5">
    <rect x="150" y="332" width="400" height="50" rx="10" />
    <text x="350" y="357">Model thinking</text>
  </g>
  <g class="added from-llm" v-click="5" style="transition-delay: 0.3s">
    <rect x="150" y="390" width="400" height="50" rx="10" />
    <text x="350" y="415">Tool call</text>
  </g>
  <g class="send" v-click="[5,6]">
    <path class="dia-arrow" d="M 880 420 L 566 386" />
  </g>
  <g class="tool" v-click="[6,7]">
    <path class="file" d="M 640 438 H 680 L 700 458 V 518 H 640 Z" />
    <path class="file-line" d="M 652 468 H 688 M 652 484 H 688 M 652 500 H 678" />
    <text class="caption" x="670" y="548">Read file</text>
    <path class="dia-arrow" d="M 628 473 L 566 473" />
  </g>
  <g class="added" v-click="6">
    <rect x="150" y="448" width="400" height="50" rx="10" />
    <text x="350" y="473">Tool result</text>
  </g>
  <g class="send" v-click="[7,8]">
    <path class="bracket" d="M 566 100 H 586 V 498 H 566" />
    <path class="dia-arrow" d="M 600 299 L 880 330" />
  </g>
  <g class="added from-llm" v-click="8">
    <rect x="150" y="506" width="400" height="50" rx="10" />
    <text x="350" y="531">Model thinking</text>
  </g>
  <g class="added from-llm" v-click="8" style="transition-delay: 0.3s">
    <rect x="150" y="564" width="400" height="50" rx="10" />
    <text x="350" y="589">Next action</text>
  </g>
  <g class="send" v-click="8">
    <path class="dia-arrow" d="M 880 420 L 566 560" />
  </g>
</g>
</svg>

<style>
.flow text {
  font-size: 26px;
}
.flow .caption {
  font-size: 20px;
}
.flow .file {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 3;
  stroke-linejoin: round;
}
.flow .file-line {
  stroke: var(--c-yellow);
  stroke-width: 3;
}
.flow .slidev-vclick-target {
  transition: opacity 0.3s ease, transform 0.3s ease;
}
.flow .init.slidev-vclick-hidden,
.flow .added.slidev-vclick-hidden {
  transform: translateY(-16px);
}
.flow .from-llm.slidev-vclick-hidden {
  transform: translateX(40px);
}
</style>

<!--
So, in an actual coding agent, what kind of information goes into the context? Let's follow the actual flow.

First, in the initial state before the conversation starts, there are [click]definitions of basic tools, like reading and writing files and running commands.

Next, [click]there's the system prompt defined on the system side. It defines the agent's basic behavior.

Then [click]there are the custom settings defined by the user. Custom instructions like CLAUDE.md or AGENTS.md, plus things like the list of skills, go here. The context starts out in a state like this.

[click]Then the user enters a prompt. It's appended to the end of the context and sent to the LLM.

[click]The LLM first thinks, and then outputs a tool call saying "I want to read this file."

[click]The agent reads that file and appends the result to the end of the context.

[click]Then it sends the entire, now larger, context to the LLM again.

[click]And the LLM thinks again and decides on the next action. This repeats until the task is done.

So once an agent receives a user instruction, it calls the LLM dozens, sometimes hundreds of times. And every time, the entire context is re-sent to the LLM. On top of that, the context keeps growing bit by bit.
-->

---
layout: full
---

<svg class="calc dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <defs>
    <pattern id="calc-steps" width="200" height="4" patternUnits="userSpaceOnUse">
      <rect width="200" height="4" style="fill: var(--c-green)" />
      <rect width="200" height="1" fill="black" opacity="0.5" />
    </pattern>
  </defs>
  <g v-click="1">
    <rect class="init" x="588" y="580" width="200" height="80" />
    <text x="820" y="620">20K</text>
  </g>
  <rect class="step" v-click="2" x="588" y="576" width="200" height="4" style="transition-delay: 0ms" />
  <rect class="step" v-click="2" x="588" y="572" width="200" height="4" style="transition-delay: 250ms" />
  <rect class="step" v-click="2" x="588" y="568" width="200" height="4" style="transition-delay: 500ms" />
  <text v-click="[2,3]" x="820" y="572">+1K</text>
  <rect class="grow" v-click="3" x="588" y="180" width="200" height="400" />
  <g class="late" v-click="3">
    <path class="bracket" d="M 572 184 H 556 V 576 H 572" />
    <text x="536" y="380" style="text-anchor: end">× 100</text>
    <text x="820" y="180">120K</text>
  </g>
</svg>

<style>
.calc .step,
.calc .grow {
  fill: url(#calc-steps);
}
.calc text {
  font-size: 32px;
  text-anchor: start;
}
.calc .step,
.calc .grow {
  transform-box: fill-box;
  transform-origin: bottom;
  transition: opacity 0.2s ease, transform 0.3s ease;
}
.calc .grow {
  transition: opacity 0.2s ease, transform 1.2s ease-in-out;
}
.calc .step.slidev-vclick-hidden,
.calc .grow.slidev-vclick-hidden {
  transform: scaleY(0);
}
.calc .late {
  transition-delay: 1s;
}
</style>

<!--
Let's do a quick calculation. [click]Say the initial definitions take up 20,000 tokens, [click]and each tool use adds 1,000 tokens on average. [click]After 100 steps of work, the context ends up at about 120,000 tokens.

But the total input sent to the model isn't 120,000 tokens.
-->

---
layout: full
---

<svg class="sum dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g v-click="[1,4]">
    <rect class="init" x="260" y="580" width="60" height="80" />
    <text x="290" y="550">20K</text>
  </g>
  <g v-click="[2,4]">
    <rect class="init" x="340" y="580" width="60" height="80" />
    <rect class="added" x="340" y="576" width="60" height="4" />
    <text x="370" y="546">21K</text>
  </g>
  <g v-click="[3,4]">
    <rect class="init" x="420" y="580" width="60" height="80" />
    <rect class="added" x="420" y="572" width="60" height="8" />
    <text x="450" y="542">22K</text>
    <text x="530" y="620">…</text>
  </g>
  <g v-for="i in 100" :key="i" class="col" v-click="4" :style="{ transitionDelay: i * 8 + 'ms' }">
    <rect class="init" :x="229 + i * 9" y="580" width="7" height="80" />
    <rect class="added" :x="229 + i * 9" :y="584 - i * 4" width="7" :height="i * 4 - 4" />
  </g>
  <text class="caption" v-click="4" x="687" y="700">100 steps</text>
  <text class="total" v-click="5" x="780" y="470">≈ 7M</text>
</svg>

<style>
.sum text {
  font-size: 26px;
}
.sum .caption {
  font-size: 32px;
}
.sum .total {
  font-size: 80px;
}
.sum .col {
  transform-box: fill-box;
  transform-origin: bottom;
  transition: opacity 0.2s ease, transform 0.4s ease;
}
.sum .col.slidev-vclick-hidden {
  transform: scaleY(0);
}
</style>

<!--
Since the whole thing is sent every time, [click]20,000 the first time, [click]21,000 the second time, [click]22,000 the third time... [click]add up all 100 calls and [click]you get about 7 million tokens.

The context length grows linearly with the number of steps, but the total amount sent grows with the square of the number of steps. That's why token usage in coding agents gets so much bigger than you'd imagine.

But if all that input were fully processed every single time, it would be terrible for both time and cost. So what's used here is...
-->

---
layout: bigtext
---

Prompt caching

<!--
Prompt caching.
-->

---
layout: full
---

<svg class="pc dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g class="server">
    <rect x="1110" y="268" width="150" height="64" rx="8" />
    <rect x="1110" y="340" width="150" height="64" rx="8" />
    <rect x="1110" y="412" width="150" height="64" rx="8" />
    <circle cx="1134" cy="300" r="7" />
    <circle cx="1134" cy="372" r="7" />
    <circle cx="1134" cy="444" r="7" />
    <path d="M 1160 300 H 1236 M 1160 372 H 1236 M 1160 444 H 1236" />
  </g>
  <g v-click.hide="4">
    <rect class="init" x="180" y="230" width="220" height="60" rx="10" />
    <rect class="added drop" v-click="1" x="180" y="300" width="220" height="60" rx="10" />
    <rect class="added drop" v-click="2" x="180" y="370" width="220" height="60" rx="10" />
    <rect class="added drop" v-click="3" x="180" y="440" width="220" height="60" rx="10" />
    <g class="fly absorb" v-click="1" style="--ty: 77px">
      <rect class="init" x="180" y="230" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="300" width="220" height="60" rx="10" />
    </g>
    <rect class="flash" v-click="1" x="1100" y="258" width="170" height="228" rx="14" />
    <g class="fly absorb" v-click="2" style="--ty: 42px">
      <rect class="init" x="180" y="230" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="300" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="370" width="220" height="60" rx="10" />
    </g>
    <rect class="flash" v-click="2" x="1100" y="258" width="170" height="228" rx="14" />
    <g class="fly absorb" v-click="3" style="--ty: 7px">
      <rect class="init" x="180" y="230" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="300" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="370" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="440" width="220" height="60" rx="10" />
    </g>
    <rect class="flash" v-click="3" x="1100" y="258" width="170" height="228" rx="14" />
  </g>
  <g v-click="4">
    <rect class="frame" x="804" y="214" width="252" height="302" rx="14" />
    <text class="label" x="930" y="186">Cache</text>
    <rect class="ghost late init" v-click="5" x="820" y="230" width="220" height="60" rx="10" />
    <rect class="ghost late added" v-click="5" x="820" y="300" width="220" height="60" rx="10" />
    <rect class="ghost late added" v-click="6" x="820" y="370" width="220" height="60" rx="10" />
    <rect class="ghost late added" v-click="7" x="820" y="440" width="220" height="60" rx="10" />
    <rect class="init" x="180" y="230" width="220" height="60" rx="10" />
    <rect class="added drop" v-click="5" x="180" y="300" width="220" height="60" rx="10" />
    <rect class="added drop" v-click="6" x="180" y="370" width="220" height="60" rx="10" />
    <rect class="added drop" v-click="7" x="180" y="440" width="220" height="60" rx="10" />
    <g class="fly dock" v-click="[5,6]">
      <rect class="init" x="180" y="230" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="300" width="220" height="60" rx="10" />
    </g>
    <g class="late" v-click="[5,6]">
      <path class="bracket" d="M 796 230 H 780 V 360 H 796" />
      <text class="caption write" x="766" y="295">Cache write</text>
    </g>
    <g class="fly dock" v-click="[6,7]">
      <rect class="init hit" x="180" y="230" width="220" height="60" rx="10" />
      <rect class="added hit" x="180" y="300" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="370" width="220" height="60" rx="10" />
    </g>
    <g class="late" v-click="[6,7]">
      <path class="bracket" d="M 796 230 H 780 V 356 H 796" />
      <text class="caption read" x="766" y="293">Cache read</text>
      <path class="bracket" d="M 796 374 H 780 V 430 H 796" />
      <text class="caption write" x="766" y="402">Cache write</text>
    </g>
    <g class="fly dock" v-click="7">
      <rect class="init hit" x="180" y="230" width="220" height="60" rx="10" />
      <rect class="added hit" x="180" y="300" width="220" height="60" rx="10" />
      <rect class="added hit" x="180" y="370" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="440" width="220" height="60" rx="10" />
    </g>
    <g class="late" v-click="7">
      <path class="bracket" d="M 796 230 H 780 V 426 H 796" />
      <text class="caption read" x="766" y="328">Cache read</text>
      <path class="bracket" d="M 796 444 H 780 V 500 H 796" />
      <text class="caption write" x="766" y="472">Cache write</text>
    </g>
  </g>
</svg>

<style>
.pc .init {
  fill: var(--c-red);
  stroke: var(--c-red);
}
.pc .added {
  fill: var(--c-green);
  stroke: var(--c-green);
}
.pc rect.init,
.pc rect.added {
  stroke-width: 0;
}
.pc .ghost {
  fill-opacity: 0.3;
  stroke-width: 2 !important;
}
.pc .server rect,
.pc .server path {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 4;
}
.pc .server circle {
  fill: var(--c-yellow);
}
.pc .flash {
  fill: var(--c-yellow);
  opacity: 0;
}
.pc .frame {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 3;
  stroke-dasharray: 10 8;
}
.pc text {
  fill: var(--c-yellow);
  font-size: 26px;
}
.pc .caption {
  font-size: 24px;
  text-anchor: end;
}
.pc .drop {
  transition: opacity 0.3s ease, transform 0.3s ease;
}
.pc .drop.slidev-vclick-hidden {
  transform: translateY(-16px);
}
.pc .fly,
.pc .late,
.pc .flash {
  transition: none;
}
.pc .fly {
  transform-box: fill-box;
  transform-origin: center;
}
.pc .absorb:not(.slidev-vclick-hidden) {
  animation: pc-absorb 1.2s ease-in 0.4s both;
}
.pc .dock:not(.slidev-vclick-hidden) {
  animation: pc-dock 0.9s ease-in-out 0.4s both;
}
.pc .dock:not(.slidev-vclick-hidden) .hit {
  animation: pc-hit 0.8s ease 1.4s both;
}
.pc .late:not(.slidev-vclick-hidden) {
  animation: pc-fade 0.4s ease 1.4s both;
}
.pc .flash:not(.slidev-vclick-hidden) {
  animation: pc-flash 0.6s ease 1.3s both;
}
@keyframes pc-absorb {
  0% { opacity: 0; transform: none; }
  1% { opacity: 1; transform: none; }
  75% { opacity: 1; transform: translate(895px, var(--ty)) scale(0.3); }
  100% { opacity: 0; transform: translate(895px, var(--ty)) scale(0.3); }
}
@keyframes pc-dock {
  0% { opacity: 0; transform: none; }
  1% { opacity: 1; transform: none; }
  100% { opacity: 1; transform: translateX(640px); }
}
@keyframes pc-hit {
  0% { opacity: 1; stroke: var(--c-yellow); stroke-width: 0; }
  40% { opacity: 1; stroke: var(--c-yellow); stroke-width: 8; }
  100% { opacity: 0; stroke: var(--c-yellow); stroke-width: 8; }
}
@keyframes pc-fade {
  from { opacity: 0; }
  to { opacity: 1; }
}
@keyframes pc-flash {
  0% { opacity: 0; }
  30% { opacity: 0.5; }
  100% { opacity: 0; }
}
</style>

<!--
I just said that [click]the context grows bit by bit, [click]and gets re-sent every time. [click]But actually, LLM servers have a feature that [click]caches the results of previous computations [click]on the server side. [click]And when this cache is used, [click]a cache read price applies, which is much cheaper than the normal price.
-->

---
layout: full
---

<svg class="csum dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g class="dim">
    <g v-for="i in 99" :key="i">
      <rect class="init" :x="238 + i * 9" y="580" width="7" height="80" />
      <rect class="added" :x="238 + i * 9" :y="584 - i * 4" width="7" :height="i * 4 - 4" />
    </g>
  </g>
  <g class="cached" v-click.hide="1">
    <g v-for="i in 99" :key="i">
      <rect class="init" :x="238 + i * 9" y="580" width="7" height="80" />
      <rect class="added" :x="238 + i * 9" :y="584 - i * 4" width="7" :height="i * 4 - 4" />
    </g>
  </g>
  <g>
    <rect class="init" x="238" y="580" width="7" height="80" />
    <rect v-for="i in 99" :key="i" class="added" :x="238 + i * 9" :y="580 - i * 4" width="7" height="4" />
  </g>
  <g class="write" v-click="2">
    <rect x="238" y="580" width="7" height="80" />
    <rect v-for="i in 99" :key="i" :x="238 + i * 9" :y="580 - i * 4" width="7" height="4" />
  </g>
  <text class="total" v-click.hide="1" x="780" y="470">≈ 7M</text>
  <g v-click="1">
    <text class="caption" x="820" y="410">Cache read</text>
    <text class="total" x="820" y="480">≈ 6.8M</text>
  </g>
  <g v-click="2">
    <text class="caption" x="420" y="240">Cache write</text>
    <text class="total small" x="420" y="305">≈ 120K</text>
    <path class="dia-arrow solid" d="M 500 350 L 586 412" />
  </g>
</svg>

<style>
.csum .dim {
  opacity: 0.25;
}
.csum .cached {
  transition: opacity 0.6s ease;
}
.csum .write rect {
  fill: var(--c-orange);
}
.csum text {
  font-size: 26px;
}
.csum .caption {
  font-size: 32px;
}
.csum .total {
  font-size: 80px;
}
.csum .total.small {
  font-size: 56px;
}
</style>

<!--
In the earlier example, about 7 million tokens were input, [click]but here most of that becomes cache reads. So these roughly 6.8 million tokens get the bargain price, [click]and only this top layer of about 120,000 tokens is charged at the normal input plus cache write price.
-->

---
layout: bigtext
---

<v-click>

A common cause

of cache misses

</v-click>

<!--
Now, before moving on, [click]I want to touch on a very common reason this input cache gets invalidated.

And that is...
-->

---
layout: bigtext
---

Time-to-live (TTL) expiry

<!--
TTL expiry. The input cache consumes server-side resources, so it isn't kept forever; usually it has a limited time to live. The details vary by service, but to give a typical example, with Claude Code and Opus 5.5, the default is one hour.

Once that time to live is exceeded, the cache is discarded.
-->

---
layout: full
---

<svg class="ttl dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <image v-click="1" href="/images/sec3/ttl-work.png" x="109" y="190" width="230" height="230" />
  <g v-click="2">
    <path class="dia-arrow" d="M 356 305 L 416 305" />
    <image href="/images/sec3/ttl-meeting.png" x="434" y="200" width="210" height="210" />
  </g>
  <g v-click="3">
    <image href="/images/sec3/ttl-later.png" x="715" y="185" width="240" height="240" />
    <path class="dia-arrow" d="M 665 305 L 725 305" />
  </g>
  <g v-click="4">
    <path class="dia-arrow" d="M 959 305 L 1019 305" />
    <image href="/images/sec3/ttl-work.png" x="1035" y="190" width="230" height="230" />
  </g>
  <text v-click="5" class="miss" x="688" y="580">Full cache miss!</text>
</svg>

<style>
.ttl .miss {
  font-family: inherit;
  font-size: 80px;
  font-weight: bold;
}
</style>

<!--
So for example, [click]you launch your coding agent, do a big chunk of work, and just when the context is fully swollen, [click]"oh, I have a meeting," and [click]you step away for an hour. Then you come back, [click]say "OK, back to work," and enter a prompt. But the cache's time to live has already passed, so [click]the entire context gets charged at the cache write price.

This is a very obvious example of where costs come from.
-->

---

# If you care about cache misses...

<v-clicks>

- Start a new session after a long break
- Avoid resuming sessions into the next day
- It depends on how much you care

</v-clicks>

<!--
So if you care about these cache misses, the basic countermeasures are things like [click]starting a new session after you've been away, or [click]avoiding carrying sessions over with resume.

Of course, [click]you don't need to get obsessive about penny-pinching, but I think it's important to understand the basic idea.
-->

---

# Aside: Cache reads are getting cheaper

<svg class="ratio w-full h-[330px]" viewBox="0 0 1000 460">
  <g class="grid">
    <line v-for="i in 6" :key="i" x1="110" x2="900" :y1="400 - (i - 1) * 70" :y2="400 - (i - 1) * 70" />
  </g>
  <text v-for="i in 6" :key="i" class="tick" x="96" :y="400 - (i - 1) * 70" text-anchor="end">{{ (i - 1) * 10 }}%</text>
  <text v-for="(t, i) in ['2024/07', '2025/01', '2025/07', '2026/01', '2026/07']" :key="t"
        class="tick" :x="110 + i * 169.3" y="430" text-anchor="middle">{{ t }}</text>
  <line class="axis" x1="110" y1="400" x2="900" y2="400" />
  <!-- [x, y]: x = release date (28.2px / month from 2024/07), y = cache hit / base input ratio (7px / %) -->
  <circle v-for="([x, y], i) in [
    [151, 330], [195, 50], [377, 225], [412, 330], [481, 330], [482, 330], [532, 330],
    [573, 330], [584, 330], [599, 330], [650, 330], [678, 330], [717, 330], [724, 330],
    [756, 330], [767, 330], [810, 330], [843, 382.5], [863, 365], [870, 365],
    [311, 225], [435, 330], [577, 330], [605, 330], [663, 330], [748, 330]
  ]" :key="i" :cx="x" :cy="y" r="8" />
</svg>

<style>
.ratio text {
  fill: var(--c-yellow);
  font-size: 22px;
  dominant-baseline: central;
}
.ratio .grid line {
  stroke: var(--c-muted);
  stroke-opacity: 0.4;
}
.ratio .axis {
  stroke: var(--c-yellow);
  stroke-width: 2;
}
.ratio circle {
  fill: var(--c-orange);
  fill-opacity: 0.8;
}
</style>

<!--
As a quick aside, I want to mention that cache read prices have been getting cheaper year by year.

From what I've said so far, you can see that the input cache plays a crucial role in agents. To make it even more usable, competition is pushing cache hit prices down. It used to be something like 25%, then 10%, a 90% discount, became the norm, and in the latest generation 5% is becoming standard.

If this trend continues, maybe we won't need to worry about things like what I'm talking about today, saving context to lower costs.

So how cheap a provider can make cache pricing has become a really hot metric to evaluate. When a new model is released, it's interesting to keep an eye on this.
-->
