---
layout: bigtext
---

<v-click>

コンテキスト肥大化

→ <span class="swap"><span v-click.hide="2">高コスト傾向</span><span v-click="2">推論性能低下</span></span>

</v-click>

<style>
.swap { display: inline-grid; }
.swap > * { grid-area: 1 / 1; }
</style>

<!--
さて、話を元に戻しますと……どうやらコンテキストの大きさがコストを直撃するらしい、[click]この２つはイコールの関係ではないものの、コンテキストが肥大化すると、高コストになる傾向がある、と言うことが分かってきました。

また、コストだけでなく[click]推論性能にも影響があります。AI チャットって長く会話を続けていると段々頭が悪くなってくる、と言われることがよくあると思うんですけど、それですね。最近は色々改良されて昔ほど顕著ではなくなったものの、それでもまだ性能に対する影響はあります。

ということで、コンテキストをコンパクトに保つことは、コストの面でも性能の面でも重要になってきます。
-->

---
layout: bigtext
---

<v-click>

１タスク１セッション

</v-click>

<!--
それでは、コンテキストをコンパクトに保つにはどうしたらいいんでしょうか。

まずは基本中の基本のルールから行きましょう。それが[click]「１タスク１セッション」のルールです。
-->

---
layout: bigtext
---

１タスク終わったら

`/clear` する

<!--

ひとつのタスクが終わったら、セッションを閉じるか、`/clear` コマンドでクリアして、まっさらなコンテキストから次のタスクを始める、と、それだけのことですね。

これはコーディングエージェントを AI チャットのノリで使っていると、なかなか違和感のある使い方かもしれません。

エージェントと会話を展開していくことで開発を進めていく、というスタイルに慣れてしまうと、毎回会話内容をリセットして、最初から会話をやり直す、というのは、ちょっと面倒に感じるかもしれませんね。

ただ、たいていどのコーディングエージェントのマニュアルにも、新しい作業の前にはクリアしましょう、って書いてあるんですよね。なので、これが本来の使い方なんだと思っていただくのが良いと思います。
-->

---
layout: full
---

<svg class="merc absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <image href="/images/sec3/human.png" x="260" y="330" width="300" height="300" />
  <g v-click="[1,2]">
    <image href="/images/sec4/butler.png" x="820" y="330" width="300" height="300" transform="translate(1940 0) scale(-1 1)" />
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
      <image href="/images/sec4/warrior1.png" x="820" y="330" width="300" height="300" />
      <g class="quest" v-click="3">
        <image href="/images/sec4/quest.png" x="602" y="420" width="160" height="123" />
      </g>
    </g>
  </g>
  <g class="leave" v-click.hide="6">
    <g class="quest" v-click="5">
      <image href="/images/sec4/quest.png" x="602" y="420" width="160" height="123" />
    </g>
    <g class="enter" v-click="5">
      <image href="/images/sec4/warrior2.png" x="820" y="330" width="300" height="300" />
    </g>
  </g>
  <g class="enter" v-click="7">
    <image href="/images/sec4/warrior1.png" x="820" y="330" width="300" height="300" />
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
  transform: translateX(-80px);
}
</style>

<!--
個人的にはこういう風に考えているという話をします。

[click]AI チャットにおける AI というのは、人間と会話を続けて情報を集めたりタスクをこなしたりする存在ですよね。

[click]コーディングエージェントはこれとは違って、一期一会のさすらいの傭兵、みたいな存在だなと思っています。[click]クエストを出すとそれを黙って受け取って、それをこなして[click]去っていく。[click]そしてまた新しいクエストを出すと、別の傭兵が現れて、またそれをこなして[click]去っていく……と、こんな感じです。

なので、必要になるのは、[click]このさすらいの傭兵向けに仕事のしやすい状態を保っておくことなんだなと思います。例えば、来たばかりでもすぐに状況が飲み込めるように、必要な情報は資料にして揃えておこう……誰かの記憶とか文脈の中に閉じ込めておかない、常に文書の形で外部化しておく、と言うことですね。
-->

---
layout: bigtext
---

１タスク１セッション

<!--
というわけで、１タスク１セッションのルールでやっていこう、となるわけですが、ここでシンプルな疑問が湧いてきます。
-->

---
layout: bigtext
---

疑問：１タスクとは何？

<!--
１タスクとは何ですか、と。大体どれくらいの大きさの作業の事を１タスクって言ってるんですか、と、疑問に思いますよね。

ここではコーディングエージェントの効率の面から、その最適な粒度を考えてみたいと思います。
-->

---

# 実験：Bunny Blitz

- 無敵アイテムを実装してください
- 白黒２値化エフェクトを実装してください
- UIを和訳して下さい

<div class="flex items-center gap-4 mt-8">
  <img src="/images/sec4/bunny-blitz-before.png" class="w-[45%] rounded" />
  <div class="text-4xl" style="color: var(--c-yellow)">→</div>
  <img src="/images/sec4/bunny-blitz-after.png" class="w-[45%] rounded" />
</div>

<!--
ここでひとつ、実験を行なってみました。Unity 公式のサンプルプロジェクト、Bunny Blitz でこのような機能を実装してもらいます。

「無敵アイテムを実装してください」「白黒２値化エフェクトを実装してください」「UI を和訳して下さい」

ここでは、敢えて関係の無さそうな、ランダムな作業を３つ並べてみました。

そして、これらの作業を１セッションの中で、コンテキストを区切らずに実行した場合、コストはこのようになりました。
-->

---
layout: center
clicks: 6
---

<div class="cost-hl cost-single" :class="`hl-${$clicks}`">

| タスク | コンテキスト | 出力 | キャッシュ<br>読み取り | キャッシュ<br>書き込み | コスト |
| --- | ---: | ---: | ---: | ---: | ---: |
| 無敵アイテム | 65K | $0.18 | $0.15 | $0.39 | $0.72 |
| 白黒２値化 | 98K | $0.28 | $0.28 | $0.26 | $0.83 |
| UI和訳 | 130K | $0.20 | $0.35 | $0.25 | $0.80 |
| 合計 | | $0.66 | $0.77 | $0.91 | $2.35 |

</div>

<p class="text-sm text-right" style="color: var(--c-muted)">Opus 5.5, medium, 1h TTL, 4回試行の平均</p>

<!--
最終的な合計コストは[click]$2.35 ですね。[click]細かくデータを見ていくと、[click]コンテキストはクリアしていないので、単純増加していっていますね。最終的に [click]130K トークンにまで膨らんでいます。それに伴って、[click]キャッシュ読み取りのコストも増加していってます。

キャッシュ読み取りってかなり格安なはずなんですが、それでもやはり、膨らんだコンテキストの負荷っていうのは無視できないんだなというのを感じさせます。[click]

では次に、１タスク毎にコンテキストをクリアした場合のコストを見てみましょう。
-->

---
layout: center
clicks: 2
---

<div class="cost-hl cost-cleared" :class="`hl-${$clicks}`">

| タスク | コンテキスト | 出力 | キャッシュ<br>読み取り | キャッシュ<br>書き込み | コスト |
| --- | ---: | ---: | ---: | ---: | ---: |
| 無敵アイテム | 62K | $0.17 | $0.12 | $0.35 | $0.63 |
| 白黒２値化 | 47K | $0.23 | $0.08 | $0.28 | $0.59 |
| UI和訳 | 60K | $0.18 | $0.13 | $0.40 | $0.71 |
| 合計 | | $0.58 | $0.33 | $1.02 | $1.94 |

</div>

<p class="text-sm text-right" style="color: var(--c-muted)">Opus 5.5, medium, 1h TTL, 4回試行の平均</p>

<!--
こんな感じです。合計コストは[click]$1.94ということで、少し安くなっています。[click]コンテキストのサイズとかキャッシュ読み取りのコストが増加せず安定しているのがさっきとの違いですね。

２つのデータを並べて比較してみましょう。
-->

---
layout: center
clicks: 10
---

<div class="cost-hl cost-compare" :class="`hl-${$clicks}`">

| タスク | キャッシュ読込 | キャッシュ書込 | コスト |
| --- | ---: | ---: | ---: |
| 無敵アイテム | $0.15 → $0.12 <span style="color: var(--c-green)">(-$0.03)</span> | $0.39 → $0.35 <span style="color: var(--c-green)">(-$0.04)</span> | $0.72 → $0.63 <span style="color: var(--c-green)">(-$0.09)</span> |
| 白黒２値化 | $0.28 → $0.08 <span style="color: var(--c-green)">(-$0.20)</span> | $0.26 → $0.28 <span style="color: var(--c-red)">(+$0.02)</span> | $0.83 → $0.59 <span style="color: var(--c-green)">(-$0.24)</span> |
| UI和訳 | $0.35 → $0.13 <span style="color: var(--c-green)">(-$0.22)</span> | $0.25 → $0.40 <span style="color: var(--c-red)">(+$0.15)</span> | $0.80 → $0.71 <span style="color: var(--c-green)">(-$0.09)</span> |
| 合計 | $0.77 → $0.33 <span style="color: var(--c-green)">(-$0.44)</span> | $0.91 → $1.02 <span style="color: var(--c-red)">(+$0.11)</span> | $2.35 → $1.94 <span style="color: var(--c-green)">(-$0.41)</span> |

</div>

<!--
タスク毎に見てみると、[click]最初のタスクは条件が同じなので差は誤差の範囲内ですね。[click]２つ目はちょっと安くなりました。[click]３つ目はあんまり安くならなかったようです。[click]

キャッシュの読み書きのコストも見てみましょう。２つ目のタスクでは、[click]キャッシュ読み込みのコストが顕著に減っています。これはコンテキストをクリアした効果が現れていますね。

[click]３つ目のタスクでも同様にキャッシュ読み込み量の減少が見られます。ただしこちらでは[click]キャッシュ書き込み量が増えてしまいました。

[click]このようにセッションを分割すると、[click]キャッシュ読み込みのコストは下がるんだけど、[click]キャッシュ書き込みのコストは上がる、と言うことが起きがちです。

なんでそうなるのか、少し考えてみましょう。
-->

---
layout: full
clicks: 4
---

<svg class="ctx-venn absolute inset-0 w-full h-full" viewBox="-90 -77 1564 873" preserveAspectRatio="xMidYMid meet">
  <g class="row1" :class="{ left: $clicks >= 2, up: $clicks >= 3 }">
    <g :class="{ venn: $clicks >= 1 }">
      <g class="task t1"><circle cx="150" cy="200" r="100" /><text x="150" y="200"><tspan x="150" dy="-0.6em">無敵</tspan><tspan x="150" dy="1.2em">アイテム</tspan></text></g>
      <g class="task t2"><circle cx="370" cy="200" r="100" /><text x="370" y="200">白黒２値化</text></g>
      <g class="task t3"><circle cx="590" cy="200" r="100" /><text x="590" y="200">UI和訳</text></g>
    </g>
    <g class="bars" :class="{ show: $clicks >= 2 }">
      <g class="bar"><rect x="740" y="110" width="260" height="40" /></g><text x="1012" y="130">65K</text>
      <g class="bar"><rect class="base" x="740" y="180" width="260" height="40" /><rect x="1000" y="180" width="132" height="40" /></g><text x="1144" y="200">+33K</text>
      <g class="bar"><rect class="base" x="740" y="250" width="392" height="40" /><rect x="1132" y="250" width="128" height="40" /></g><text x="1272" y="270">+32K</text>
    </g>
  </g>
  <g class="split" :class="{ show: $clicks >= 3 }">
    <g class="task t1"><circle cx="150" cy="560" r="100" /><text x="150" y="560"><tspan x="150" dy="-0.6em">無敵</tspan><tspan x="150" dy="1.2em">アイテム</tspan></text></g>
    <g class="task t2"><circle cx="370" cy="560" r="100" /><text x="370" y="560">白黒２値化</text></g>
    <g class="task t3"><circle cx="590" cy="560" r="100" /><text x="590" y="560">UI和訳</text></g>
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
  fill: color-mix(in srgb, var(--c-lime) 25%, transparent);
  stroke: var(--c-lime);
  stroke-width: 4;
}
.ctx-venn text {
  fill: white;
  font-size: 26px;
  text-anchor: middle;
  dominant-baseline: central;
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
  fill: var(--c-lime);
}
.ctx-venn .bars rect.base {
  fill: color-mix(in srgb, var(--c-lime) 35%, transparent);
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
この３つの作業はかなり異なる事をやっていますが、それでも[click]文脈が重なっている部分はあります。例えばプロジェクト設定はどの作業でも参照するでしょうし、シーン構造もある程度共通した部分を見ることになるでしょう。既に知っていることはコンテキストに追加する必要が無いので、[click]コンテキストの膨張速度は徐々に低下します。そのため、新しくコンテキストに追加される部分、つまりキャッシュ書き込みの量は、徐々に低下していくわけです。

これに対して３つの作業を分離した場合、[click]それぞれのコンテキストは完全に分離していて、[click]３つのセッションそれぞれでコンテキストを１から積み上げていきます。そのため、キャッシュ書き込みの量は、それぞれのコンテキストの大きさをそのまま反映することになります。

このような事情があるので、重なる領域が大きければ大きいほど、セッションを分割することのメリットは低下していきます。

これを念頭に置いて、次にこのような実験を行なってみました。
-->

---

# 実験その２

- 無敵アイテムを実装してください
- ジャンプ力増加アイテムを実装してください
- 移動速度増加アイテムを実装してください

<!--
同じBunny Blitzですが、今度はかなり近めのタスクを３つ並べてみました。１つ目の無敵アイテムは先ほどと同じですが、２つ目はジャンプ力の増加アイテム、３つ目は速度増加アイテムです。かなり似たような文脈を持ちうる作業ですよね。
-->

---
layout: center
clicks: 2
---

<div class="cost-hl cost-single2" :class="`hl-${$clicks}`">

| タスク | コンテキスト | 出力 | キャッシュ<br>読み取り | キャッシュ<br>書き込み | コスト |
| --- | ---: | ---: | ---: | ---: | ---: |
| 無敵アイテム | 71K | $0.21 | $0.16 | $0.40 | $0.77 |
| ジャンプ力増加 | 85K | $0.11 | $0.11 | $0.11 | $0.33 |
| 移動速度増加 | 96K | $0.08 | $0.08 | $0.09 | $0.26 |
| 合計 | | $0.40 | $0.35 | $0.60 | $1.35 |

</div>

<p class="text-sm text-right" style="color: var(--c-muted)">Opus 5.5, medium, 1h TTL, 4回試行の平均</p>

<!--
単一セッションでの実行結果はこんな感じです。

先ほどと比べると、[click]コンテキストの増加速度はかなり緩やかになっているようです。最初に 71K をガツンと積み上げていますが、それ以降の増加は非常に緩やかです。つまり、最初のタスクと同じような知識でできる事が多い、文脈をそのまま使い回せているので、コンテキストを膨張させずに済んでいるのだと推測できます。総コストは[click]$1.35 でした。
-->

---
layout: center
clicks: 3
---

<div class="cost-hl cost-cleared2" :class="`hl-${$clicks}`">

| タスク | コンテキスト | 出力 | キャッシュ<br>読み取り | キャッシュ<br>書き込み | コスト |
| --- | ---: | ---: | ---: | ---: | ---: |
| 無敵アイテム | 72K | $0.23 | $0.22 | $0.43 | $0.88 |
| ジャンプ力増加 | 59K | $0.17 | $0.15 | $0.39 | $0.71 |
| 移動速度増加 | 51K | $0.12 | $0.07 | $0.32 | $0.52 |
| 合計 | | $0.52 | $0.44 | $1.14 | $2.11 |

</div>

<p class="text-sm text-right" style="color: var(--c-muted)">Opus 5.5, medium, 1h TTL, 4回試行の平均</p>

<!--
次にセッションをクリアした場合の結果です。[click]こちらはタスク毎に 50K 以上のコンテキストをゼロから積み上げています。これのせいで、[click]キャッシュ書き込みがだいぶ嵩んでしまっていますね。総コストは[click]$2.11 に増えてしまいました。
-->

---
layout: center
clicks: 4
---

<div class="cost-hl cost-compare2" :class="`hl-${$clicks}`">

| タスク | キャッシュ読込 | キャッシュ書込 | コスト |
| --- | ---: | ---: | ---: |
| 無敵アイテム | $0.16 → $0.22 <span style="color: var(--c-red)">(+$0.06)</span> | $0.40 → $0.43 <span style="color: var(--c-red)">(+$0.03)</span> | $0.77 → $0.88 <span style="color: var(--c-red)">(+$0.11)</span> |
| ジャンプ力増加 | $0.11 → $0.15 <span style="color: var(--c-red)">(+$0.04)</span> | $0.11 → $0.39 <span style="color: var(--c-red)">(+$0.28)</span> | $0.33 → $0.71 <span style="color: var(--c-red)">(+$0.38)</span> |
| 移動速度増加 | $0.08 → $0.07 <span style="color: var(--c-green)">(-$0.01)</span> | $0.09 → $0.32 <span style="color: var(--c-red)">(+$0.23)</span> | $0.26 → $0.52 <span style="color: var(--c-red)">(+$0.26)</span> |
| 合計 | $0.35 → $0.44 <span style="color: var(--c-red)">(+$0.09)</span> | $0.60 → $1.14 <span style="color: var(--c-red)">(+$0.54)</span> | $1.35 → $2.11 <span style="color: var(--c-red)">(+$0.76)</span> |

</div>

<!--
比較してみましょう。今回は[click]キャッシュ読み込みについても効果は薄く、[click]書き込みの方では明らかな赤字になっています。[click]トータルでは大幅な負けですね。

[click]このように、近いことを連続してやらせる場合は、１セッションにまとめた方が安くつく、というのがわかったと思います。
-->

---

# 基本ルール：1セッション1タスク

<v-click>

- ただし、性質の近いタスクは連続させた方が良いかもしれない。

</v-click>

<v-click>

<div class="mt-12 mx-auto w-fit">

| ファイル | 行数 |
| --- | ---: |
| PlayerBehaviour.cs | 770 |
| PlayerMovement.cs | 652 |

</div>

</v-click>

<!--
まとめましょう。最初に1セッション1タスクという基本ルールを話したわけですが、これには例外があります。[click]ただし、性質の近いタスクは連続させた方が良いかもしれない。これですね。

ただ、すると、次はこの「性質の近さ」って一体何なのか、と言う話になるんですが、これは実のところ僕もよく分かっていません。ただ確実に言えそうなのは、同じスクリプトや同じファイルを弄るようなタスクは連続させちゃった方がいいんじゃないか、と言うことです。

先ほどの３つのアイテム追加タスクについても、コンテキストで重い比重を占めていたのは[click]プレイヤー関連のスクリプトなんですよね。プレイヤーの挙動を変更するのに、これらのスクリプトを一旦読まないといけない。コンテキストをクリアしてしまうと、これが全部読み直しになってしまうので、そのまま作業を続けた方がいいかもしれない……とか、そんなことを考えながら、エージェントへの指示を考えていこう、と言う感じですね。
-->

---
layout: bigtext
---

余談：スキルのコスト

<!--
さて、次の話題に移る前に、また一つ余談を挟みたいと思います。それはスキルのコストについてのお話です。
-->

---
layout: bigtext
---

余計なスキル

入れまくってませんか？

<!--
みなさん、余計なスキル入れまくってませんか？

そのスキル、コストを増加させているかもしれませんよ。
-->

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

# ２００回のリクエストにかかる負担

| スキル量 | 書き込み (x1) | 読み取り (x199) | 合計 |
| ---: | ---: | ---: | ---: |
| 10K | $0.08 | $0.40 | **$0.48** |
| 3.9K | $0.03 | $0.16 | **$0.19** |

<p class="text-sm text-right" style="color: var(--c-muted)">Opus 5.5, 1h TTL</p>

<!--
この２つのケースで200回コンテキストを送信した場合に、どれだけコストに差が出てくるかを計算しました。約$0.3の違いということで、まあ案外気にするほどではないかもしれませんね。でも確実に差は出ます。

これがもし、プロジェクトと関係のある、使う可能性が少なからず存在するスキルであれば、まあ許容できるコストなんじゃないかなと思います。そこまでケチになる必要は無いかなと思います。でも、もしこれが、何かの気まぐれで入れたような、全くもって使うあての無いようなスキルだったら、やっぱりそれは削除すべきだと思いますね。意味のないものに着実にお金を吸われているわけですから、シンプルに勿体無いです。
-->

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
