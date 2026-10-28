---
layout: bigtext
---

コンテキスト

<!--
まずコーディングエージェントにおけるコンテキストの概念を把握する必要があります。

コーディングエージェントにおける「コンテキスト」とは何なのか。
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
みなさんが利用しているコーディングエージェントの中にいるLLM、とても賢い存在ですが、ひとつ重要な制約があります。

[click] LLMそのものには、記憶という概念がありません。
-->

---
layout: full
clicks: 5
---

<svg class="chat dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <image href="/images/sec3/human.png" x="150" y="400" width="320" height="320" />
  <svg x="953" y="431" width="305" height="270" viewBox="300 90 700 620">
    <image href="/images/sec3/smart-ai.png" width="1376" height="768" />
  </svg>
  <g v-if="$clicks === 1">
    <g v-for="(m, i) in [['１＋１は？'], ['２です'], ['×３は？'], ['６です']]" :key="i" class="msg" :class="i % 2 ? 'to-human' : 'to-llm'" :style="{ animationDelay: i * 1.25 + 's' }">
      <rect :x="-30 - Math.max(...m.map(l => l.length)) * 20" :y="-36 - (m.length - 1) * 26" :width="60 + Math.max(...m.map(l => l.length)) * 40" :height="72 + (m.length - 1) * 52" rx="20" />
      <text v-for="(l, j) in m" :key="j" :y="(j * 2 - m.length + 1) * 26" :class="{ muted: j < m.length - 1 }">{{ l }}</text>
    </g>
  </g>
  <g v-if="$clicks === 2">
    <g v-for="(m, i) in [['１＋１は？'], ['２です'], ['（１＋１は？）', '（２です）', '×３は？'], ['６です']]" :key="i" class="msg" :class="i % 2 ? 'to-human' : 'to-llm'" :style="{ animationDelay: i * 1.25 + 's' }">
      <rect :x="-30 - Math.max(...m.map(l => l.length)) * 20" :y="-36 - (m.length - 1) * 26" :width="60 + Math.max(...m.map(l => l.length)) * 40" :height="72 + (m.length - 1) * 52" rx="20" />
      <text v-for="(l, j) in m" :key="j" :y="(j * 2 - m.length + 1) * 26" :class="{ muted: j < m.length - 1 }">{{ l }}</text>
    </g>
  </g>
  <g v-click="[3, 5]">
    <path d="M 444 310 H 616 A 24 24 0 0 1 640 334 V 366 A 24 24 0 0 1 616 390 H 490 L 420 430 L 450 390 H 444 A 24 24 0 0 1 420 366 V 334 A 24 24 0 0 1 444 310 Z" />
    <text x="530" y="350">÷２は？</text>
  </g>
  <g v-click="[4, 5]">
    <path d="M 764 340 H 956 A 24 24 0 0 1 980 364 V 396 A 24 24 0 0 1 956 420 H 950 L 990 460 L 920 420 H 764 A 24 24 0 0 1 740 396 V 364 A 24 24 0 0 1 764 340 Z" />
    <text x="860" y="380">何を…？</text>
  </g>
  <g v-click="5">
    <path d="M 444 160 H 976 A 24 24 0 0 1 1000 184 V 366 A 24 24 0 0 1 976 390 H 490 L 420 430 L 450 390 H 444 A 24 24 0 0 1 420 366 V 184 A 24 24 0 0 1 444 160 Z" />
    <text x="710" y="210" class="muted">（１＋１は？）（２です）</text>
    <text x="710" y="275" class="muted">（×３は？）（６です）</text>
    <text x="710" y="340">÷２は？</text>
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
@keyframes to-llm {
  0% { transform: translate(560px, 300px); opacity: 0; }
  15% { transform: translate(560px, 300px); opacity: 1; }
  85% { transform: translate(860px, 300px); opacity: 1; }
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
エージェントを使っていると、[click]まるで記憶を持った知能との会話を続けているように感じられますよね。

でも実際には、LLMには会話の文脈を記憶する機能がありません。会話を成立させるには、[click]それまでのやり取りをすべて入力し直してやる必要があります。

例えば、[click]ここから「割る２は？」とだけ送っても[click]ダメなんですね。[click]これを全部送る必要があります。

これこそが、このやり取りにおける文脈、コンテキストです。
-->

---
layout: full
---

<svg class="ctx dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
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
.ctx text {
  font-size: 32px;
}
</style>

<!--
では、そのコンテキストには何が入っているんでしょうか。

まず会話を開始する前の初期状態として、[click]システム側で定義されているシステムプロンプトがあります。エージェントの基本的な振る舞いを定義するものですね。

そして、[click]ファイル読み書きやコマンド実行などの基本的なツールの定義があります。あとは、[click]ユーザーの定義するカスタム設定があります。CLAUDE.md とか AGENTS.md とかのカスタムインストラクションなどがここに含まれますね。

コンテキストは、こんな感じの状態でスタートします。

[click]そしてユーザーがプロンプトを打って指示をしますよね。[click]すると LLM 側で思考が行われて、[click]ファイルを読んだり書いたり、ツールを呼び出したりといった応答が行われます。[click]そして、ツールの実行結果を受け取ることになります。こんな感じの内容が、文脈として積み上げられていくことになります。

ここでちょっと注目しておきたいのは、最後の「ツールの実行結果」ですね。ファイルを1個読めば、その中身がコンテキストに入ります。テストを走らせれば、そのログが入ります。といったように、ツールの実行結果はとにかく雑多な内容で膨らみやすいんですよね。実際のプロジェクトでどのように膨らんでいくのかは、また後ほど見ていきたいと思います。
-->

---
layout: full
---

<svg class="flow dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g transform="translate(0 40)">
  <svg x="900" y="230" width="320" height="283" viewBox="300 90 700 620">
    <image href="/images/sec3/smart-ai.png" width="1376" height="768" />
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
    <path class="dia-arrow" d="M 600 212 L 880 330" />
  </g>
  <g class="added from-llm" v-click="2">
    <rect x="150" y="332" width="400" height="50" rx="10" />
    <text x="350" y="357">ツール呼び出し</text>
  </g>
  <g class="send" v-click="[2,3]">
    <path class="dia-arrow" d="M 880 420 L 566 357" />
  </g>
  <g class="tool" v-click="[3,4]">
    <path class="file" d="M 640 410 H 680 L 700 430 V 490 H 640 Z" />
    <path class="file-line" d="M 652 440 H 688 M 652 456 H 688 M 652 472 H 678" />
    <text class="caption" x="670" y="520">ファイル読み込み</text>
    <path class="dia-arrow" d="M 628 445 L 566 445" />
  </g>
  <g class="added" v-click="3">
    <rect x="150" y="390" width="400" height="110" rx="10" />
    <text x="350" y="445">ツールの実行結果</text>
  </g>
  <g class="send" v-click="[4,5]">
    <path class="bracket" d="M 566 100 H 586 V 500 H 566" />
    <path class="dia-arrow" d="M 600 300 L 880 330" />
  </g>
  <g class="added from-llm" v-click="5">
    <rect x="150" y="508" width="400" height="50" rx="10" />
    <text x="350" y="533">次の行動</text>
  </g>
  <g class="send" v-click="5">
    <path class="dia-arrow" d="M 880 420 L 566 533" />
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
.flow .added.slidev-vclick-hidden {
  transform: translateY(-16px);
}
.flow .from-llm.slidev-vclick-hidden {
  transform: translateX(40px);
}
</style>

<!--
次に、コンテキストがどう延びていくのかを、実際の流れで見てみましょう。

[click]まずユーザーからプロンプトが入力されました。これはコンテキストの末尾に追加されて LLM に送られます。

[click]するとLLMは「このファイルを読みたい」とツール呼び出しを出力しました。

[click]エージェントはそのファイルを読み込んで、その結果をコンテキストの末尾に追加します。

[click]膨らんだコンテキスト全体を、再びLLMに送ります。

[click]そしてLLMは再び次の行動を決めます。これを作業完了まで繰り返すわけです。

このようにエージェントは、ユーザーの指示を受け取ると、その中で何十回、ときには何百回もLLMを呼び出します。そしてその度にコンテキスト全体がLLMに入力されます。しかもそのコンテキストは徐々に膨らみ続けていくわけですね。
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
ここで簡単な計算をしてみます。[click]システムプロンプトとツール定義で最初に2万トークン消費して、[click]ツールを1回使うごとに平均1,000トークンずつ増えていくと仮定します。[click]これで100ステップ作業すると、最終的にコンテキストは約12万トークンになります。

ですが、モデルに送られた入力の合計は12万トークンではありません。
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
  <text class="caption" v-click="4" x="687" y="700">100 回</text>
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
[click]1回目に2万、[click]2回目に2万1千、[click]3回目に2万2千……と毎回全体を送るので、[click]100回分を足し合わせると[click]約700万トークンになります。

コンテキストの長さはステップ数に比例して増えますが、送信量の合計はステップ数の2乗に比例して増えます。これが、コーディングエージェントにおけるトークン使用量が想像以上に大きくなる理由です。

しかし、このような入力を毎回まともに処理していたら、時間もコストも大変なことになってしまいます。そこで使われるのが……
-->

---
layout: bigtext
---

プロンプトキャッシュ

<!--
プロンプトキャッシュです。
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
    <text class="label" x="930" y="186">キャッシュ</text>
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
      <text class="caption write" x="766" y="295">キャッシュ書き込み</text>
    </g>
    <g class="fly dock" v-click="[6,7]">
      <rect class="init hit" x="180" y="230" width="220" height="60" rx="10" />
      <rect class="added hit" x="180" y="300" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="370" width="220" height="60" rx="10" />
    </g>
    <g class="late" v-click="[6,7]">
      <path class="bracket" d="M 796 230 H 780 V 356 H 796" />
      <text class="caption read" x="766" y="293">キャッシュ読み込み</text>
      <path class="bracket" d="M 796 374 H 780 V 430 H 796" />
      <text class="caption write" x="766" y="402">キャッシュ書き込み</text>
    </g>
    <g class="fly dock" v-click="7">
      <rect class="init hit" x="180" y="230" width="220" height="60" rx="10" />
      <rect class="added hit" x="180" y="300" width="220" height="60" rx="10" />
      <rect class="added hit" x="180" y="370" width="220" height="60" rx="10" />
      <rect class="added" x="180" y="440" width="220" height="60" rx="10" />
    </g>
    <g class="late" v-click="7">
      <path class="bracket" d="M 796 230 H 780 V 426 H 796" />
      <text class="caption read" x="766" y="328">キャッシュ読み込み</text>
      <path class="bracket" d="M 796 444 H 780 V 500 H 796" />
      <text class="caption write" x="766" y="472">キャッシュ書き込み</text>
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
先ほど、[click]コンテキストは徐々に伸びていく、[click]そして毎回入力し直す[click]という話をしましたが、実はLLMサーバーには、[click]前回までの計算結果を[click]サーバー側にキャッシュしておく機能が備わっています。[click]そしてこのキャッシュを使用した場合は、[click]通常と比べてずっと安いキャッシュ読み込み価格というのが適用されることになっています。

ちなみに、キャッシュ書き込みにも追加でコストが発生するので、キャッシュに乗った分は格安、新しい追加分は割高、って感じなりますね。
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
    <text class="caption" x="820" y="410">キャッシュ読み込み</text>
    <text class="total" x="820" y="480">≈ 6.8M</text>
  </g>
  <g v-click="2">
    <text class="caption" x="420" y="240">キャッシュ書き込み</text>
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
先ほどの例では約700万トークンが入力されるという結果になっていましたが、[click]ここではそのほとんどがキャッシュ読み込みになります。つまり、この約680万トークンは格安価格になって、[click]この上っ面の約12万トークンだけが、通常入力＋キャッシュ書き込みの価格が適用される、ということですね。
-->

---
layout: bigtext
---

<v-click>

ありがちな

キャッシュミスの原因

</v-click>

<!--
さて、コンテキストをどう管理するかという詳しい話を始める前に、[click]この入力キャッシュが無効化されてしまう、非常によくある原因について触れておきたいと思います。

それが……
-->

---
layout: bigtext
---

生存期間 (TTL) 切れ

<!--
生存期間切れですね。入力キャッシュはサーバー側の資源を食うので、無限に保持されるわけではなくて、たいてい限られた生存期間が設定されています。この辺りの仕様はサービスの内容によって異なるんですが、まあ代表的なところで言うと、Claude Code と Opus 5.5 の組み合わせであれば、デフォルトは１時間に設定されています。

この生存期間を超えてしまうと、キャッシュは破棄されてしまいます。

なので例えば、コーディングエージェントを起動して、ガッツリ作業して、コンテキストが膨らみきったところで、あ、会議だ、と言って１時間作業を中断する。そして戻ってきて、作業再開だ、と言ってプロンプトを入力すると、キャッシュの生存期間を既に過ぎてしまっているので、全コンテキストがキャッシュ書き込み価格になってしまいます。

これは次の日に作業を持ち越す場合なんかも同じですね。朝出社して、昨日のセッションをレジュームして、コンテキストを引き継いで作業するぞ……なんてすると、またガッツリとキャッシュ書き込みが発生してしまう。

これは、ものすごく分かりやすい形でコストの発生するポイントですね。セッションのレジュームは基本的に使わない、とか、離席したらセッションは作り直す、とか、そういったことが基本的な対策となります。

もちろん、そこまでムキになってケチケチする必要は無いんですけど、基本的な考えとしてこれを理解しておくのは重要だと思います。
-->

---

# 余談：キャッシュ読み込みの廉価化

<svg class="ratio w-full" viewBox="0 0 1000 460">
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
ここでちょっと余談として、キャッシュ読み込み価格が年々安くなっている、という話をしておきたいと思います。

ここまでの話から、エージェントにおいては入力キャッシュが非常に重要な働きをするというのが分かると思いますが、これをより使いやすくするために、キャッシュヒット時の価格を安くする方向に競争が働いています。昔は 25% とかあったのが、10%、つまり９割引が常識になって、最新世代では 5% が標準になりつつあります。

この進化がこのまま続けば、今日話しているような、コンテキストを節約してコストを下げましょう、みたいな話も気にしなくてよくなるのかもしれません。

ということで、このキャッシュ価格をいかに安くするか、というのは、評価ポイントとして、とてもアツい指標になっています。最新モデルがリリースされた時には、ここに注目してみると面白いと思います。
-->
