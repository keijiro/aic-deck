# この講演の前提

<v-clicks depth="2">

- API 従量課金が前提
  - 定額サブスクだと少し違和感あるかも？
- リアル金額ではなく「ポイント」(pts.) で解説

</v-clicks>

<!--
まず最初に、講演を始める前に、この講演の前提となる設定をお知らせしておきたいと思います。

この講演ではコーディングエージェントを使用する際のコストについて解説するわけですが、これは[click]API 従量課金の場合のコストがいくらか、という話を軸にしています。[click]個人でサブスクリプションでコーディングエージェントを使っていると、基本的に定額制なので、それぞれの作業にどれくらいコストがかかっているか、というのは意識していない場合も多いと思います。

ですが、企業で導入すると API 従量課金のプランになるケースが多いですし、たとえ定額制で使っていたとしても、使用量、usage を減らす工夫というのは、利用枠を有効活用するうえで大切なことになってきます。

なので、たとえサブスクで使っていたとしても、ここら辺は重要なんだよ、ということで、今日のお話にはお付き合いいただければと思います。

もう一点はですね、そのコストについて、[click]リアルなドルとか円ではなく「ポイント」という仮想的な単位でお話ししたいと思います。

これはですね、一旦はリアルな金額でスライドを作ったんですが、ちょっと余りにもお金の話過ぎて生々しいなと、自分でも引いてしまったんですよね。

今日の話は、絶対的な金額でいくらかかる、みたいな話をしたいんじゃなくて、工夫次第でコストが半分になりましたよ、みたいな、そういう相対的な変化を導く話をしたいんですよね。なので、仮想的な単位で評価しても問題無かろうということで、ちょっと違和感あるかもしれませんが、何卒よろしくお願いします。
-->

---

<!--
さて、前程のお話も済んだところで、本編に入りましょう。
-->

---
layout: bigtext
---

これまでの

あらすじ

<!--
これまでのあらすじ……

皆さん、コーディングエージェント、使っている方多いですよね。ていうか、今日このセッションに来ている方は、ほぼ 100% 使っているものかなと考えています。

ところで、最初にコーディングエージェントを使い始めたのっていつ頃でしょうかね。ちょっと軽く歴史を振り返ってみましょうか。
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
コード補完よりも高度な機能を持ったコーディングエージェントが登場したのは[click]2024 年の年末辺りでしたね。[click]2025 年の初めに Claude Code も登場し、ちょうど同時期に[click]Vibe Coding という言葉も生まれて、いわゆるエージェンティック・コーディングが最初のブームを迎えます。その後、[click]流行してしばらくすると[click]停滞して、[click]新しいモデルがでて進化すると[click]また流行して、[click]停滞して、というようなループを繰り返しながら急速に進化を続けてきました。[click]2026 年の春には Unity も AI Assistant という形でエージェンティックな開発環境を実装して、[click]ベータテストを行いました。
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
そこで僕も Unity AI Assistant を使って色々とゲームを開発してみました。この辺りの体験は CEDEC とか Unite Seoul でもお話ししたのですが……今やこんなのはお話にならないぐらい、最先端のモデルは進化を遂げていますよね。半年前のものがすっかり陳腐化してしまうという、恐ろしいスピードの中で生きていることを実感します。
-->

---

<!--
というわけで、最近はまた最新の環境を使って、新たにサンプルプロジェクトを作ってみています。ちょっと紹介動画をまとめてみたので、ご覧ください。
-->

---
layout: fullvideo
video: /videos/sec1/recent-projects-hq.mp4
---

---

<!--
といった感じで、まあ半年前とは全く作っているものの内容というかレベルが違いますよね。無茶苦茶な進化のスピードです。

ところで、今日はコストの話ですので、この中からいくつかピックアップして、そのコストを紹介してみたいと思います。
-->

---
layout: video-split
video: /videos/sec1/salvonix-small.mp4
---

# Salvonix

- 実装： 1780 pts.
- アセット生成： 258 pts.
- 制作時間： 59 分
- １プロンプト ＋ １修正プロンプト

<!--
最初は Salvonix という 3D シューティングゲームのプロトタイプです。誘導ミサイルの一斉発射で敵を倒しまくるという内容ですね。

自動制御で自由軸回転しながらスペースコロニーの中を飛び回る、という、結構複雑なセッティングだと思うんですけど、それを１プロンプトでちゃんと理解して実装してくれたのが嬉しかったですね。まさに、こんなのができるとは半年前には思っていなかった、という実例です。
-->

---
layout: video-split
video: /videos/sec1/football-small.mp4
---

# Totally Realistic Football

- 実装： 2219 pts.
- アセット生成： 382 pts.
- 制作時間： 84 分
- １プロンプト

<!--
次は Totally Realistic Football、超リアルフットボールという、ふざけた名前の、物理挙動系のシュールなゲームですね。カーソルキーの左で左足を軸とした回転、右で右足を軸とした回転を行うという、左右の足の軸回転だけで操作する激ムズ物理ゲームです。これも１プロンプトのプロトタイプなんですが、このシュールなシステムとアセットのルックが上手くマッチした形で実装できたのが嬉しかったですね。
-->

---
layout: video-split
video: /videos/sec1/alchemion-small.mp4
---

# Alchemion

- 実装： ??? pts.
- アセット生成： ??? pts.
- 制作時間： ???

<!--
次は Alchemion というデッキビルディングタイプのゲームです。主人公はこのパーティーを直接操作するのではなく、薬の素材カードを調合してパーティーを助ける、そして地下３６階に控えているレッドドラゴンを倒す、というのが目的のゲームです。

これは先ほどまでの１プロンプトのプロトタイピングとは違って、完成まで制作してみた例です。だいたい１周１時間ぐらいのボリュームがあって、ちゃんとリプレイバリューのあるゲームとして仕上げたつもりです。unityroom および Unity Play で遊べますので、興味がありましたらぜひ遊んでみて下さい。

このプロジェクトのコストについては、ここではネタバレになってしまうので隠しておきます。また後で言及します。
-->

---

<!--
とまあ、こんな感じで色々作ってみているわけですが、これらを作る前に取り組んでいたプロジェクトが、もう１つあります。それを紹介させてください。
-->
