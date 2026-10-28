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
  <g class="leave" v-click.hide="7">
    <g class="quest" v-click="5">
      <image href="/images/sec4/quest.png" x="602" y="420" width="160" height="123" />
    </g>
    <g class="enter" v-click="6">
      <image href="/images/sec4/warrior2.png" x="820" y="330" width="300" height="300" />
    </g>
  </g>
  <g class="enter" v-click="8">
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

[click]コーディングエージェントはこれとは違って、一期一会のさすらいの傭兵、みたいな存在だなと思っています。[click]クエストを出すとそれを黙って受け取って、それをこなして[click]去っていく。[click]そしてまた新しいクエストを出すと、[click]別の傭兵が現れて、またそれをこなして[click]去っていく……と、こんな感じです。

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

※ただし動作検証は省略する

<div class="flex items-center gap-4 mt-8">
  <img src="/images/sec4/bunny-blitz-before.png" class="w-[45%] rounded" />
  <div class="text-4xl" style="color: var(--c-yellow)">→</div>
  <img src="/images/sec4/bunny-blitz-after.png" class="w-[45%] rounded" />
</div>

<!--
ここでひとつ、実験を行なってみました。Unity 公式のサンプルプロジェクト、Bunny Blitz でこのような機能を実装してもらいます。

「無敵アイテムを実装してください」「白黒２値化エフェクトを実装してください」「UI を和訳して下さい」

ここでは、敢えて関係の無さそうな、ランダムな作業を３つ並べてみました。

なお、ここでは動作検証は敢えて行わず、実装作業だけやってもらいました。この理由については少し後で解説します。

そして、これらの作業を１セッションの中で、コンテキストを区切らずに順に実行した場合、コストはこのようになりました。
-->

---
layout: cost-table
table: cost-single
note: Opus 5.5, medium, 1h TTL, 4回試行の平均
clicks: 6
---

| タスク | コンテキスト | 出力 | キャッシュ<br>読み取り | キャッシュ<br>書き込み | コスト |
| --- | ---: | ---: | ---: | ---: | ---: |
| 無敵アイテム | 65K | 18 pts. | 15 pts. | 39 pts. | 72 pts. |
| 白黒２値化 | 98K | 28 pts. | 28 pts. | 26 pts. | 83 pts. |
| UI和訳 | 130K | 20 pts. | 35 pts. | 25 pts. | 80 pts. |
| 合計 | | 66 pts. | 77 pts. | 91 pts. | 235 pts. |

<!--
最終的な合計コストは[click]235 pts. ですね。[click]細かくデータを見ていくと、[click]コンテキストはクリアしていないので、単純増加していっていますね。最終的に [click]130K トークンにまで膨らんでいます。それに伴って、[click]キャッシュ読み取りのコストも増加していってます。

キャッシュ読み取りってかなり格安なはずなんですが、それでもやはり、膨らんだコンテキストの負荷っていうのは無視できないんだなというのを感じさせます。[click]

では次に、１タスク毎にコンテキストをクリアした場合のコストを見てみましょう。
-->

---
layout: cost-table
table: cost-cleared
note: Opus 5.5, medium, 1h TTL, 4回試行の平均
clicks: 2
---

| タスク | コンテキスト | 出力 | キャッシュ<br>読み取り | キャッシュ<br>書き込み | コスト |
| --- | ---: | ---: | ---: | ---: | ---: |
| 無敵アイテム | 62K | 17 pts. | 12 pts. | 35 pts. | 63 pts. |
| 白黒２値化 | 47K | 23 pts. | 8 pts. | 28 pts. | 59 pts. |
| UI和訳 | 60K | 18 pts. | 13 pts. | 40 pts. | 71 pts. |
| 合計 | | 58 pts. | 33 pts. | 102 pts. | 194 pts. |

<!--
こんな感じです。合計コストは[click]194 pts.ということで、少し安くなっています。[click]コンテキストのサイズとかキャッシュ読み取りのコストが増加せず安定しているのがさっきとの違いですね。

２つのデータを並べて比較してみましょう。
-->

---
layout: cost-table
table: cost-compare
clicks: 10
---

| タスク | キャッシュ読込 | キャッシュ書込 | コスト |
| --- | ---: | ---: | ---: |
| 無敵アイテム | 15 pts. → 12 pts. <span style="color: var(--c-green)">(-3 pts.)</span> | 39 pts. → 35 pts. <span style="color: var(--c-green)">(-4 pts.)</span> | 72 pts. → 63 pts. <span style="color: var(--c-green)">(-9 pts.)</span> |
| 白黒２値化 | 28 pts. → 8 pts. <span style="color: var(--c-green)">(-20 pts.)</span> | 26 pts. → 28 pts. <span style="color: var(--c-red)">(+2 pts.)</span> | 83 pts. → 59 pts. <span style="color: var(--c-green)">(-24 pts.)</span> |
| UI和訳 | 35 pts. → 13 pts. <span style="color: var(--c-green)">(-22 pts.)</span> | 25 pts. → 40 pts. <span style="color: var(--c-red)">(+15 pts.)</span> | 80 pts. → 71 pts. <span style="color: var(--c-green)">(-9 pts.)</span> |
| 合計 | 77 pts. → 33 pts. <span style="color: var(--c-green)">(-44 pts.)</span> | 91 pts. → 102 pts. <span style="color: var(--c-red)">(+11 pts.)</span> | 235 pts. → 194 pts. <span style="color: var(--c-green)">(-41 pts.)</span> |

<!--
タスク毎に見てみると、[click]最初のタスクは条件が同じなので差は誤差の範囲内ですね。[click]２つ目はちょっと安くなりました。[click]３つ目はあんまり安くならなかったようです。[click]

キャッシュの読み書きのコストも見てみましょう。２つ目のタスクでは、[click]キャッシュ読み込みのコストが顕著に減っています。これはコンテキストをクリアした効果が現れているようですね。

[click]３つ目のタスクでも同様にキャッシュ読み込み量の減少が見られます。ただしこちらでは[click]キャッシュ書き込み量が増えてしまいました。

[click]このようにセッションを分割すると、[click]キャッシュ読み込みのコストは下がるんだけど、[click]キャッシュ書き込みのコストは上がる、と言うことが起きがちです。

なんでそうなるのか、少し考えてみましょう。
-->

---
layout: full
clicks: 4
---

<svg class="ctx-venn dia absolute inset-0 w-full h-full" viewBox="-90 -77 1564 873" preserveAspectRatio="xMidYMid meet">
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
  fill: color-mix(in srgb, var(--c-green) 25%, transparent);
  stroke: var(--c-green);
  stroke-width: 4;
}
.ctx-venn text {
  font-size: 26px;
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
  fill: var(--c-green);
}
.ctx-venn .bars rect.base {
  fill: color-mix(in srgb, var(--c-green) 35%, transparent);
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
同じ Bunny Blitz ですが、今度はかなり近めのタスクを３つ並べてみました。１つ目の無敵アイテムは先ほどと同じですが、２つ目はジャンプ力の増加アイテム、３つ目はスピードアップアイテムです。かなり似たような文脈を持ちうる機能ですよね。
-->

---
layout: cost-table
table: cost-single2
note: Opus 5.5, medium, 1h TTL, 4回試行の平均
clicks: 2
---

| タスク | コンテキスト | 出力 | キャッシュ<br>読み取り | キャッシュ<br>書き込み | コスト |
| --- | ---: | ---: | ---: | ---: | ---: |
| 無敵アイテム | 71K | 21 pts. | 16 pts. | 40 pts. | 77 pts. |
| ジャンプ力増加 | 85K | 11 pts. | 11 pts. | 11 pts. | 33 pts. |
| 移動速度増加 | 96K | 8 pts. | 8 pts. | 9 pts. | 26 pts. |
| 合計 | | 40 pts. | 35 pts. | 60 pts. | 135 pts. |

<!--
単一セッションでの実行結果はこんな感じです。

先ほどと比べると、[click]コンテキストの増加速度はかなり緩やかになっているようです。最初に 71K をガツンと積み上げていますが、それ以降の増加は非常に緩やかです。つまり、最初のタスクと同じような知識でできる事が多い、文脈をそのまま使い回せているので、コンテキストを膨張させずに済んでいるのだと推測できます。総コストは[click]135 pts. でした。
-->

---
layout: cost-table
table: cost-cleared2
note: Opus 5.5, medium, 1h TTL, 4回試行の平均
clicks: 3
---

| タスク | コンテキスト | 出力 | キャッシュ<br>読み取り | キャッシュ<br>書き込み | コスト |
| --- | ---: | ---: | ---: | ---: | ---: |
| 無敵アイテム | 72K | 23 pts. | 22 pts. | 43 pts. | 88 pts. |
| ジャンプ力増加 | 59K | 17 pts. | 15 pts. | 39 pts. | 71 pts. |
| 移動速度増加 | 51K | 12 pts. | 7 pts. | 32 pts. | 52 pts. |
| 合計 | | 52 pts. | 44 pts. | 114 pts. | 211 pts. |

<!--
次にセッションをクリアした場合の結果です。[click]こちらはタスク毎に 50K 以上のコンテキストをゼロから積み上げています。これのせいで、[click]キャッシュ書き込みがだいぶ嵩んでしまっていますね。総コストは[click]211 pts. に増えてしまいました。
-->

---
layout: cost-table
table: cost-compare2
clicks: 4
---

| タスク | キャッシュ読込 | キャッシュ書込 | コスト |
| --- | ---: | ---: | ---: |
| 無敵アイテム | 16 pts. → 22 pts. <span style="color: var(--c-red)">(+6 pts.)</span> | 40 pts. → 43 pts. <span style="color: var(--c-red)">(+3 pts.)</span> | 77 pts. → 88 pts. <span style="color: var(--c-red)">(+11 pts.)</span> |
| ジャンプ力増加 | 11 pts. → 15 pts. <span style="color: var(--c-red)">(+4 pts.)</span> | 11 pts. → 39 pts. <span style="color: var(--c-red)">(+28 pts.)</span> | 33 pts. → 71 pts. <span style="color: var(--c-red)">(+38 pts.)</span> |
| 移動速度増加 | 8 pts. → 7 pts. <span style="color: var(--c-green)">(-1 pts.)</span> | 9 pts. → 32 pts. <span style="color: var(--c-red)">(+23 pts.)</span> | 26 pts. → 52 pts. <span style="color: var(--c-red)">(+26 pts.)</span> |
| 合計 | 35 pts. → 44 pts. <span style="color: var(--c-red)">(+9 pts.)</span> | 60 pts. → 114 pts. <span style="color: var(--c-red)">(+54 pts.)</span> | 135 pts. → 211 pts. <span style="color: var(--c-red)">(+76 pts.)</span> |

<!--
比較してみましょう。今回は[click]キャッシュ読み込みについても効果は薄く、[click]書き込みの方では明らかな赤字になっています。[click]トータルでは大幅な負けですね。

[click]このように、近いことを連続してやらせる場合は、コンテキストを分割した方が、却って高くついてしまう、というのがわかると思います。
-->

---
clicks: 5
---

# 基本ルール：１タスク１セッション

<ul v-click="1">
<li>ただし、<span class="text-hl" :class="{ on: $clicks === 2 }">性質の近いタスク</span>は１セッションにまとめた方が良いかもしれない。
<ul><li v-click="4">同じファイルを扱うタスクなど。</li></ul>
</li>
</ul>

<v-click at="5">

<div class="mt-12 mx-auto w-fit">

| ファイル | トークン数 |
| --- | ---: |
| PlayerBehaviour.cs | 12,500 |
| PlayerMovement.cs | 11,500 |

</div>

</v-click>

<!--
まとめましょう。最初に１タスク１セッションという基本ルールを提示したわけですが、これには例外があります。[click]ただし、性質の近いタスクは１セッションにまとめた方が良いかもしれない、ということですね。

ただ、すると、次はこの[click]「性質の近いタスク」って一体何なのか、と言う疑問が湧いてくると思います。[click]

これを厳密に定義するのは難しいんですが、ただ確実に言えそうなのは、[click]同じスクリプトや同じファイルを弄るようなタスクは、必然的に文脈を共有しうる、ということです。

先ほどの３つのアイテム追加タスクでも、コンテキストで重い比重を占めていたのは[click]プレイヤー関連のスクリプトなんですよね。どちらも１万トークン以上あります。プレイヤーの挙動を変更するのに、これらのスクリプトをコンテキストに取り込まないといけない。それを３回取り込み直すよりも、１回で済ませてしまった方が安かった、ということですね。
-->

---
layout: bigtext
hide: true
---

余談：スキルのコスト

<!--
さて、次の話題に移る前に、また一つ余談を挟みたいと思います。それはスキルのコストについてのお話です。
-->

---
layout: bigtext
hide: true
---

余計なスキル

入れまくってませんか？

<!--
みなさん、余計なスキル入れまくってませんか？

そのスキル、コストを増加させているかもしれませんよ。
-->

---
hide: true
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
hide: true
---

# ２００回のリクエストにかかる負担

| スキル量 | 書き込み (x1) | 読み取り (x199) | 合計 |
| ---: | ---: | ---: | ---: |
| 10K | 8 pts. | 40 pts. | **48 pts.** |
| 3.9K | 3 pts. | 16 pts. | **19 pts.** |

<p class="text-sm text-right" style="color: var(--c-muted)">Opus 5.5, 1h TTL</p>

<!--
この２つのケースで200回コンテキストを送信した場合に、どれだけコストに差が出てくるかを計算しました。約30 pts.の違いということで、まあ案外気にするほどではないかもしれませんね。でも確実に差は出ます。

これがもし、プロジェクトと関係のある、使う可能性が少なからず存在するスキルであれば、まあ許容できるコストなんじゃないかなと思います。そこまでケチになる必要は無いかなと思います。でも、もしこれが、何かの気まぐれで入れたような、全くもって使うあての無いようなスキルだったら、やっぱりそれは削除すべきだと思いますね。意味のないものに着実にお金を吸われているわけですから、シンプルに勿体無いです。
-->

---
hide: true
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
