---
layout: bigtext
---

<div v-click="1" class="relative">

動作検証は人力でやる

<div v-click="2" class="absolute pointer-events-none" style="left: -4%; right: -4%; top: 50%; height: 0.12em; transform: translateY(-50%); border-radius: 0.06em; background: var(--c-red);" />
</div>

<!--
さて、どうやらコスト改善の鍵は動作検証をいかに効率化するか、にかかっているようだ、と言うことが分かってきました。

これを改善する何かいい案は無いでしょうか？まず思いつくのは、[click]動作検証は人力でやる、と言うものですが、[click]これは余りにも悲し過ぎるので考えないことにしましょう。ちゃんと自動化の方向で考えます。
-->

---
layout: bigtext
---

動作検証は別セッションで

行えばよいのでは？

<!--
もう１つ、簡易的なアイデアとして考えられるのは、動作検証は別セッションで行えばよいのでは？というものです。
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
今まで１タスク１セッションという話をしてきましたが、[click]更にそれを細分化して、１タスクの実装作業までを１セッションで、[click]そして動作検証は新規の別のセッションで行おうという算段です。
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
  <div>実装</div>
  <div class="late">検証</div>
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
新たに作成したセッションなら、[click]コンパクトなコンテキストで作業を行うことができます。ツールコールが多くなってしまっても、これでコストを絞ることができるのではないか、ということですね。

これは一見うまく行きそうに見えますし、実際効果を発揮することもあるんですが、イマイチ効果的ではない、というのが正直な所です。
-->

---

# 動作検証はコンテキストを分離しにくい

<v-click>

1. 動作検証の手順自体が、それまでの文脈を必要とする場合がある。

</v-click>
  
<!--
この分割アプローチがうまく行かない理由は主に２つあると考えています。

[click]
ひとつは、動作検証の手順自体が、それまでの文脈を必要としている場合が多いためです。
-->

---
layout: bigtext
---

<v-click>

単体テスト総なめ → 文脈無しでもできる

</v-click>
<v-click>

Editor を操作して検証 → 知識が無いとできない

</v-click>

<!--
例えば単に[click]Test Runner を動かして単体テストを総なめするだけだったら、文脈は必要無いですよね。簡単に実行できます。

でも例えば、先ほどの Bunny Blitz の無敵アイテムのように、[click]Unity Editor を操作して検証手順を実行していくような場合、そのプロジェクトの内容を知っていないと実行できないですよね。シーン構造とかプレイヤーの実装内容とか、そういった情報がコンテキストに必要になってしまうわけです。
-->

---

# 動作検証はコンテキストを分離しにくい

1. 動作検証の手順自体が、それまでの文脈を必要とする場合がある。

<v-click>

2. 修正作業において、それまでの文脈を必要とする場合がある。

</v-click>

<!--
そしてもう一つの理由は、[click]修正作業において文脈が必要になる、というものです。
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
  <div class="impl" style="--n: 12">実装</div>
  <div class="check" style="--n: 8">検証</div>
  <div class="check fix" style="--n: 12">修正・再検証</div>
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
動作検証によって不具合が見つかった場合、[click]エージェントはそれを直すための修正作業を行います。ここではほぼ実装作業と同じ文脈が必要とされるので、結局コンテキストは膨張してしまうわけですね。
-->

---
layout: bigtext
---

小規模作業なら

そのままやった方が得

<!--
このような理由があって、結局、動作検証もコンテキストを引きずったまま行ってしまった方がいい、というケースが多いです。先ほどの Bunny Blitz の無敵アイテムのような、単発の小機能であれば、１セッションで済ませてしまった方が、大抵安上がりに済むと思います。

では、こうではなく……
-->

---
layout: bigtext
---

大規模作業の

場合はどうする？

<!--
プロジェクト全体を横断するような大規模な作業の場合はどうしましょうか。

ここはちょっと具体例で考えてみたいと思います。
-->

---

# 事例：Tower Defense サンプル

- 例：Tower Defense Template の URP 移行作業
- "/migrate-birp-to-urp" スキルを使用

<div class="flex items-center gap-4 mt-8">
  <img src="/images/sec6/tower-defense-1.jpg" class="w-[48%] rounded" />
  <img src="/images/sec6/tower-defense-2.jpg" class="w-[48%] rounded" />
</div>

<!--
ここでは例として、Unity の公式サンプルにある Tower Defense Template プロジェクトを URP に移行させるという作業を行ってみました。これは比較的古いサンプルなので、Built-in Render Pipeline で作られているんですよね。

移行作業には、Unity 公式スキルに含まれている "migrate-birp-to-urp" スキルを使いました。URP 移行作業をエージェントで自動化するスキルですね。
-->

---
layout: bigtext
---

<v-click>

「部分検証＆横展開」戦略

</v-click>

<!--
そして、この作業を行うにあたって使ってみたのが、[click]部分検証と横展開の組み合わせです。
-->

---
layout: full
clicks: 4
---

<svg class="hz absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <g class="step" :class="{ on: $clicks >= 1 }">
    <image class="shot" href="/images/sec6/stage1.jpg" x="88" y="85" width="384" height="216" />
    <path class="dia-arrow" d="M 280 395 V 316" />
    <svg x="136" y="400" width="260" height="230" viewBox="300 90 700 620">
      <image href="/images/sec3/smart-ai.png" width="1376" height="768" />
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
    <svg x="952" y="400" width="260" height="230" viewBox="300 90 700 620">
      <image href="/images/sec6/lite-ai.png" width="1376" height="768" />
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
これはどういうことかというと、まず最初に、[click]ステージ１だけを対象として、移行と動作検証、そして修正の作業を済ませてしまいます。

この作業が完了した段階で、[click]このゲームの URP 移行作業には何が必要か、そしてどこが問題になるのか、という知見がコンテキストに蓄積されているはずです。[click]それらを洗い出して、指示書にまとめます。

[click]そしたら新規セッションを開いて、この指示書に従って残りのステージを作業して行きます。ここでは難しい問題解決などは必要とされないので、安価な軽量モデルを使うことができます。
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
このようなアプローチは、同じような類型のアセットがたくさん存在するゲームにおいて有効に働くのではないかと思います。例えば[click]キャラクターとか、[click]ステージとか、[click]アイテムとか、ひとつの「型」があって、[click]それのバリエーションが横展開されていく、という構造が、どのゲームにも大抵あると思うんですよね。それを前提に最適化を狙うわけです。
-->

---
layout: center
---

<div class="cost-tables flex justify-center items-start gap-10">
<v-click>
<div>
<div class="mb-1" style="color: var(--c-yellow)">単一方式</div>

| 合計 |
|---:|
| $16.96 |
| $22.31 |
| $18.46 |

</div>
</v-click>
<v-click>
<div>
<div class="mb-1" style="color: var(--c-yellow)">分離方式</div>

| 親コスト | 子コスト | 合計 |
|---:|---:|---:|
| $13.45 | $5.34 | $18.79 |
| $9.78 | $4.10 | $13.88 |
| $16.01 | $5.87 | $21.88 |

</div>
</v-click>
<v-click>
<div>
<div class="mb-1" style="color: var(--c-yellow)">横展開方式</div>

| 親コスト | 子コスト | 合計 |
|---:|---:|---:|
| $13.41 | $0.61 | $14.02 |
| $19.24 | $1.80 | $21.04 |
| $9.80 | $0.95 | $10.75 |

</div>
</v-click>
</div>

<style>
.cost-tables table { margin: 0; width: auto; }
.cost-tables th, .cost-tables td { padding: 0.15rem 0.75rem; }
</style>

<!--
それで実際に移行作業を何回か行なって、コストを測ってみました。

まず最初は[click]単一セッションで全部実行したケース、次は[click]動作検証だけ別セッションに移してみたケース、そして[click]先ほどの「横展開方式」を試してみたものですね。

それでまあ最初に言っておきますが、残念ながらこの計測データにあまり意味はありません。あまりにもブレが大き過ぎるんですよね。どこまで細かく検証を行うか、というのが、エージェントの気まぐれで変化してしまうので、計測データを安定させることができませんでした。

それでも、何となく傾向は掴めるかもしれません。一応、今回の計測結果のうえでは、横展開方式は比較的良い結果を収めているように思えます。少なくとも、この方式を使ったことで大きく効率が悪化する、ということは無さそうです。

そして、このサンプルは高々５ステージしかありませんから、ステージ数がもっと増えたら、つまり、横展開の幅がもっと増えたら、この方式のメリットは更に増すと思います。
-->

---

# 余談：サブエージェントは使わないの？

<v-click>

- 追加コストが確認されたため、敢えて使わなかった。

</v-click>

<!--
ここでまたちょっと余談なんですが、こういったコンテキストの分離のためにサブエージェントを使うという考え方もあると思います。サブエージェントは基本的に親のコンテキストを引き継がないので、今回のようにコンテキストを分離したい場合に使えるわけです。

なのですが、今回コスト調査を行っていて、[click]サブエージェント側で追加コストが発生する挙動というのが確認されたので、敢えて外しました。

本当はサブエージェントを使うと、今回やっているようなコンテキストの分離を自動化できるので、実は非常に便利です。今回は厳密性を求めて敢えて使いませんでしたが、皆さんがこの手の戦略を考えていく上では強力な道具になると思います。
-->
