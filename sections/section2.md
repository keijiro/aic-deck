---
layout: fullvideo
video: /videos/sec2/jacquard-hq.mp4
---

---
layout: video-split
video: /videos/sec2/jacquard-hq.mp4
---

# Jacquard

- 独自のグリッドシステムによる手続き的作曲ツール
- 「繰り返し」と「変動」を折り込んだ演奏規則を生み出す
- FM 音源によるレトロ感と近代的なエフェクトの組み合わせ
- マルチプラットフォーム対応： Windows, Mac, iOS, Android

<!--
この Jacquard はゲームではなくて作曲ツールですね。作曲とは言っても、楽譜やピアノロールのような一般的なインターフェースで入力するのではなく、先ほどお見せしたような機能ブロックをグリッド上に並べていくことでシーケンスを構築します。このシーケンスは単純なリニア再生だけでなく、手続き的な性質があって、それによって多彩な変動を織り込んだ演奏規則を作ることができる、というものです。

こういったちょっと変わったシーケンサーのアイデアは以前から持っていたんですが、なかなか実際に作ってみる機会は無かったんですよね。それが、ここまでコーディングエージェントが進化したなら、サクッと作ってみることができるんじゃないかと思って、夏休みの１週間を使って作ってみた、という感じです。

iOS, Android アプリとしても無料でリリースしておきましたので、興味のある方はぜひ触ってみてください。
-->

---
layout: bigtext
---

コストはどんなもんかな？

数万円ぐらいかかっちゃったかな 😅

<!--
で、このようなアプリを作って一旦完成となったところで、このアプリの開発にどれくらいお金がかかったのかなと思って調べてみたんですよね。まあ結構エージェントを働かせたので、数万円ぐらいはかかってるかと思ったんですが、実際のコストが……
-->

---
layout: bigtext
---

$1,317 😱

<!--
$1,317でした。ざっくりと20万円ぐらい、と言ったところですかね。まあアプリ開発で20万円なんて安い方だろと思われるかもしれませんけど、夏休みの息抜きにふと開発してみたら20万円吹き飛んでいたんですから、まあちょっとびっくりしましたよね。

でもまあリアルに考えてみてください。夏休みの息抜き、1週間、でこれですよね。息抜きじゃなくフルタイムで本気で働いたら、これの3倍ぐらいは使っちゃうんじゃないですかね。そして、1人ではなくて、例えば5人ぐらいのチームで作業したとして、1週間ではなく4週間ぐらい作業したとしましょう。20万円かける3かける5かける4でいくらですか…… 1,200万円ぐらいですかね。

まあそれでも安いと言うかもしれませんけど、普通に今まで通りの諸経費があったうえに、上乗せで1,000万ですからね。まあ油断できませんよね。節約できる部分があるんだったら節約していきましょうや、という話になるのが当然だと思います。

これを機に、コーディングエージェントって、思った以上にしっかりとお金がかかるものだぞ、と言う意識が僕の中に芽生えることになります。
-->

---
layout: bigtext
---

コスト発生の

勘所を掴む

<!--
まあ必要以上にケチになる必要はないと思うんですけど、少なくとも、今やっているこの作業にどれくらいのコストが発生しているのか、というのを感覚的に感じ取れる、勘のようなものを身につけたいと思うようになりました。
-->

---
layout: bigtext
---

疑問：何がそんなに

嵩んでいたのか

<!--
そして手始めに、まずは先ほどお見せした Jacquard プロジェクトにおいて、どのようにコストが発生していたのかを分析することにしました。
-->

---
layout: full
---

<svg class="tvc dia absolute inset-0 w-full h-full" viewBox="0 0 1376 768" preserveAspectRatio="xMidYMid meet">
  <text class="caption" x="188" y="150">トークン量</text>
  <text class="total" x="360" y="150">約18億</text>
  <text class="note" x="1188" y="150">書き込み 1.4% ／ 出力 0.4%</text>
  <rect class="read" x="188" y="180" width="975.4" height="90" rx="4" />
  <rect class="write" x="1166.4" y="180" width="14.3" height="90" rx="2" />
  <rect class="output" x="1183.7" y="180" width="4.3" height="90" rx="1" />
  <text class="seg" x="210" y="225">キャッシュ読み込み 98.1%</text>
  <path class="band read" d="M 188 270 H 1163.4 L 852.7 470 H 188 Z" />
  <path class="band write" d="M 1166.4 270 H 1180.7 L 1040 470 H 855.7 Z" />
  <path class="band output" d="M 1183.7 270 H 1188 L 1187.7 470 H 1043 Z" />
  <rect class="read" x="188" y="470" width="664.7" height="90" rx="4" />
  <rect class="write" x="855.7" y="470" width="184.3" height="90" rx="4" />
  <rect class="output" x="1043" y="470" width="144.7" height="90" rx="4" />
  <text class="seg" x="210" y="515">キャッシュ読み込み 66.9%</text>
  <text class="seg" x="947.9" y="515" style="text-anchor: middle">18.5%</text>
  <text class="seg" x="1115.4" y="515" style="text-anchor: middle">14.6%</text>
  <text class="caption" x="188" y="610">コスト</text>
  <text class="total" x="300" y="610">$1,317</text>
  <g class="legend" transform="translate(188 680)">
    <rect class="read" width="24" height="24" rx="4" />
    <text x="36" y="12">キャッシュ読み込み</text>
    <rect class="write" x="300" width="24" height="24" rx="4" />
    <text x="336" y="12">キャッシュ書き込み</text>
    <rect class="output" x="600" width="24" height="24" rx="4" />
    <text x="636" y="12">出力</text>
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
</style>

<!--
これは Jacquard プロジェクトにおけるトークンの総消費量とそのコストをグラフにまとめたものです。

まずトークンとはなんぞやという話になりますが、まあざっくりと文字数に相当するもんだと思ってください。LLM に入力する文字、出力される文字、それぞれに、その量に応じて課金が発生する、そのカウントための単位みたいなものだと考えればいいと思います。

そして、開発過程において消費されるトークンのほとんどが「キャッシュ読み込み」で発生しています。キャッシュ読み込みは価格が安いので、実コストではかなり圧縮されるものの、それでも大部分がここで発生している、という構図です。

この圧倒的な影響力を誇る「キャッシュ読み込み」とは何なのか、これを把握するには……
-->
