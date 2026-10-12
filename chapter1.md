---
layout: statement
---

# コンテキスト

<!--
このキャッシュ読み込みが何なのか知るには、まずコーディングエージェントにおけるコンテキストの概念を把握する必要があります。
-->

---
layout: full
class: bg-black
---

<svg class="absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g transform="translate(344 192) scale(0.5)">
    <image href="/images/ch1/smart-ai.png" width="1376" height="768" />
  </g>
</svg>

<svg v-click class="absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g transform="translate(344 192) scale(0.5)">
    <path d="M 1087.7 198 A 100 75 0 1 0 1043.4 167.5 L 990 220 Z"
          fill="black" stroke="white" stroke-width="6" stroke-linejoin="round" />
    <text x="1130" y="132" fill="white" style="font-size: 100px; font-weight: bold"
          text-anchor="middle" dominant-baseline="central">?</text>
  </g>
</svg>

<!--
みなさんが利用しているコーディングエージェントの中にいるLLM、とても賢い存在ですが、ひとつ重要な制約があります。

[click] LLMそのものには、記憶という概念がありません。
-->

---
layout: full
class: bg-black
---

<svg class="chat absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <image href="/images/ch1/human.png" x="150" y="400" width="320" height="320" />
  <svg x="976" y="450" width="260" height="230" viewBox="300 90 700 620">
    <image href="/images/ch1/smart-ai.png" width="1376" height="768" />
  </svg>
  <g v-click="1">
    <path d="M 454 90 H 546 A 24 24 0 0 1 570 114 V 156 A 24 24 0 0 1 546 180 L 502 180 L 440 218 L 468 180 H 454 A 24 24 0 0 1 430 156 V 114 A 24 24 0 0 1 454 90 Z" />
    <text x="500" y="135">A</text>
  </g>
  <g v-click="2">
    <path d="M 834 200 H 926 A 24 24 0 0 1 950 224 V 266 A 24 24 0 0 1 926 290 L 912 290 L 940 328 L 878 290 H 834 A 24 24 0 0 1 810 266 V 224 A 24 24 0 0 1 834 200 Z" />
    <text x="880" y="245">B</text>
  </g>
  <g v-click="3">
    <path d="M 454 310 H 546 A 24 24 0 0 1 570 334 V 376 A 24 24 0 0 1 546 400 L 502 400 L 440 438 L 468 400 H 454 A 24 24 0 0 1 430 376 V 334 A 24 24 0 0 1 454 310 Z" />
    <text x="500" y="355">C</text>
  </g>
  <g v-click="[4,5]">
    <path d="M 834 420 H 926 A 24 24 0 0 1 950 444 V 486 A 24 24 0 0 1 926 510 L 912 510 L 940 548 L 878 510 H 834 A 24 24 0 0 1 810 486 V 444 A 24 24 0 0 1 834 420 Z" />
    <text x="880" y="465">D</text>
  </g>
  <g v-click="5">
    <path d="M 654 420 H 926 A 24 24 0 0 1 950 444 V 486 A 24 24 0 0 1 926 510 L 912 510 L 940 548 L 878 510 H 654 A 24 24 0 0 1 630 486 V 444 A 24 24 0 0 1 654 420 Z" />
    <text x="790" y="465"><tspan style="fill: var(--c-muted)">(ABC)</tspan> D</text>
  </g>
</svg>

<style>
.chat path {
  fill: black;
  stroke: white;
  stroke-width: 3.5;
  stroke-linejoin: round;
}
.chat text {
  fill: white;
  font-size: 52px;
  font-weight: 600;
  text-anchor: middle;
  dominant-baseline: central;
}
</style>

<!--
エージェントを使っていると、まるで記憶を持った知能との会話を続けているように感じられますよね。[click:4]

でも実際には、LLM側には会話の文脈を記憶する機能がありません。会話を成立させるには、[click:5]それまでのやり取りをすべて入力し直してやる必要があります。この図で言えば、ここで"C"だけを入力してもダメで、今までの文脈"ABC"を入力してやる必要があるんですね。

これがコンテキストと呼ばれるものです。
-->

---
layout: full
class: bg-black
---

<svg class="ctx absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g class="init" v-click>
    <rect x="448" y="96" width="480" height="64" rx="12" />
    <text x="688" y="128">システムプロンプト</text>
  </g>
  <g class="init" v-click>
    <rect x="448" y="172" width="480" height="64" rx="12" />
    <text x="688" y="204">ツール定義</text>
  </g>
  <g class="init" v-click>
    <rect x="448" y="248" width="480" height="64" rx="12" />
    <text x="688" y="280">カスタム設定</text>
  </g>
  <g class="added" v-click>
    <rect x="448" y="324" width="480" height="64" rx="12" />
    <text x="688" y="356">ユーザーの指示</text>
  </g>
  <g class="added" v-click>
    <rect x="448" y="400" width="480" height="64" rx="12" />
    <text x="688" y="432">モデルの思考</text>
  </g>
  <g class="added" v-click>
    <rect x="448" y="476" width="480" height="64" rx="12" />
    <text x="688" y="508">モデルの応答</text>
  </g>
  <g class="added" v-click>
    <rect x="448" y="552" width="480" height="120" rx="12" />
    <text x="688" y="612">ツールの実行結果</text>
  </g>
</svg>

<style>
.ctx .init rect {
  fill: var(--c-red);
}
.ctx .added rect {
  fill: var(--c-green);
}
.ctx text {
  fill: white;
  font-size: 32px;
  text-anchor: middle;
  dominant-baseline: central;
}
</style>

<!--
では、そのコンテキストには何が入っているのでしょうか。

まず会話を開始する前の初期状態として、[click]システム側で定義されているシステムプロンプトがあります。エージェントの基本的な振る舞いを定義するものですね。

そして、[click]ファイル読み書きやコマンド実行などの基本的なツールの定義があります。あとは、[click]ユーザーの定義するカスタム設定があります。CLAUDE.md とか AGENTS.md とかのカスタムインストラクションなどがここに含まれますね。

コンテキストは、こんな感じの状態でスタートします。

[click]そしてユーザーがプロンプトを打って指示をしますよね。[click]すると LLM 側で思考が行われて、[click]ファイルを読んだり書いたり、ツールを呼び出したりといった応答が行われます。[click]そして、ツールの実行結果を受け取ることになります。こんな感じの内容が、文脈として積み上げられていくことになります。

ここでちょっと注目しておきたいのは、最後の「ツールの実行結果」です。ファイルを1つ読めば、その中身がコンテキストに入ります。テストを走らせれば、そのログが入ります。これらの要素の中でも、このツールの実行結果というのは、どうしても膨らんでいきがちなんですよね。実際にどのように膨らんでいくのかは、また後ほど見ていきたいと思います。
-->

---
layout: full
class: bg-black
---

<svg class="flow absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <defs>
    <marker id="flow-head" viewBox="0 0 10 10" refX="8" refY="5"
            markerWidth="5" markerHeight="5" orient="auto-start-reverse">
      <path d="M 0 0 L 10 5 L 0 10 Z" style="fill: var(--c-yellow)" />
    </marker>
  </defs>
  <g transform="translate(0 40)">
  <svg x="900" y="230" width="320" height="283" viewBox="300 90 700 620">
    <image href="/images/ch1/smart-ai.png" width="1376" height="768" />
  </svg>
  <g class="init">
    <rect x="150" y="100" width="400" height="50" rx="10" />
    <text x="350" y="125">システムプロンプト</text>
  </g>
  <g class="init">
    <rect x="150" y="158" width="400" height="50" rx="10" />
    <text x="350" y="183">ツール定義</text>
  </g>
  <g class="init">
    <rect x="150" y="216" width="400" height="50" rx="10" />
    <text x="350" y="241">カスタム設定</text>
  </g>
  <g class="added" v-click="1">
    <rect x="150" y="274" width="400" height="50" rx="10" />
    <text x="350" y="299">ユーザーの指示</text>
  </g>
  <g class="send" v-click="[1,2]">
    <path class="bracket" d="M 566 100 H 586 V 324 H 566" />
    <path class="arrow" d="M 600 212 L 880 330" />
  </g>
  <g class="added from-llm" v-click="2">
    <rect x="150" y="332" width="400" height="50" rx="10" />
    <text x="350" y="357">ツール呼び出し</text>
  </g>
  <g class="send" v-click="[2,3]">
    <path class="arrow" d="M 880 420 L 566 357" />
  </g>
  <g class="tool" v-click="[3,4]">
    <path class="file" d="M 640 410 H 680 L 700 430 V 490 H 640 Z" />
    <path class="file-line" d="M 652 440 H 688 M 652 456 H 688 M 652 472 H 678" />
    <text class="caption" x="670" y="520">ファイル読み込み</text>
    <path class="arrow" d="M 628 445 L 566 445" />
  </g>
  <g class="added" v-click="3">
    <rect x="150" y="390" width="400" height="110" rx="10" />
    <text x="350" y="445">ツールの実行結果</text>
  </g>
  <g class="send" v-click="[4,5]">
    <path class="bracket" d="M 566 100 H 586 V 500 H 566" />
    <path class="arrow" d="M 600 300 L 880 330" />
  </g>
  <g class="added from-llm" v-click="5">
    <rect x="150" y="508" width="400" height="50" rx="10" />
    <text x="350" y="533">次の行動</text>
  </g>
  <g class="send" v-click="5">
    <path class="arrow" d="M 880 420 L 566 533" />
  </g>
  </g>
</svg>

<style>
.flow .init rect {
  fill: var(--c-red);
}
.flow .added rect {
  fill: var(--c-green);
}
.flow text {
  fill: white;
  font-size: 26px;
  text-anchor: middle;
  dominant-baseline: central;
}
.flow .caption {
  font-size: 20px;
  fill: var(--c-yellow);
}
.flow .bracket {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 3;
}
.flow .arrow {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 4;
  stroke-dasharray: 14 10;
  marker-end: url(#flow-head);
  animation: flow-march 0.6s linear infinite;
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
.flow .added.slidev-vclick-hidden {
  transform: translateY(-16px);
}
.flow .from-llm.slidev-vclick-hidden {
  transform: translateX(40px);
}
@keyframes flow-march {
  to {
    stroke-dashoffset: -24;
  }
}
</style>

<!--
次に、コンテキストがどう延びていくのかを、実際の流れで見てみましょう。

[click]まずユーザーからプロンプトが入力されました。これはコンテキストの末尾に追加されて LLM に送られます。

[click]すると LLM は「このファイルを読みたい」とツール呼び出しを出力しました。

[click]エージェントはそのファイルを読み込んで、その結果をコンテキストの末尾に追加します。

[click]延びたコンテキスト全体を、再び LLM に送ります。

[click]そして LLM は再び次の行動を決めます。これを作業完了まで繰り返すわけです。

このようにエージェントは、ユーザーの指示を受け取ると、その中で何十回、ときには何百回もモデルを呼び出します。そしてその度にコンテキスト全体が LLM に入力されます。しかもそのコンテキストは徐々に膨らみ続けていくわけですね。
-->

---
layout: full
class: bg-black
---

<svg class="calc absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
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
    <text x="536" y="380" text-anchor="end">× 100</text>
    <text x="820" y="180">120K</text>
  </g>
</svg>

<style>
.calc .init {
  fill: var(--c-red);
}
.calc .step,
.calc .grow {
  fill: url(#calc-steps);
}
.calc text {
  fill: white;
  font-size: 32px;
  text-anchor: start;
  dominant-baseline: central;
}
.calc .bracket {
  fill: none;
  stroke: var(--c-yellow);
  stroke-width: 3;
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
ここで簡単な計算をしてみます。[click]システムプロンプトとツール定義で最初に２万トークン消費して、[click]ツールを１回使うごとに平均 1,000 トークンずつ増えていくとします。[click]これで 100 ステップ作業すると、最終的にコンテキストは約 12 万トークンになります。

ですが、モデルに送られた入力の合計は 12 万トークンではありません。
-->

---
layout: full
class: bg-black
---

<svg class="sum absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
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
  <text class="caption" v-click="4" x="687" y="700">100 回</text>
  <text class="total" v-click="5" x="780" y="470">≈ 7M</text>
</svg>

<style>
.sum .init {
  fill: var(--c-red);
}
.sum .added {
  fill: var(--c-green);
}
.sum text {
  fill: white;
  font-size: 26px;
  text-anchor: middle;
  dominant-baseline: central;
}
.sum .caption {
  font-size: 32px;
  fill: var(--c-yellow);
}
.sum .total {
  font-size: 80px;
  font-weight: bold;
  stroke: black;
  stroke-width: 10px;
  paint-order: stroke;
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
[click]1 回目に2万、[click]2回目に2万1千、[click]3回目に2万2千……と毎回全体を送るので、[click]100回分を足し合わせると[click]約700万トークンになります。

コンテキストの長さはステップ数に比例して増えますが、送信量の合計はステップ数の2乗に比例して増えます。これが、エージェントの使用量が想像以上に大きくなる根本的な理由です。
-->
