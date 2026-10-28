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
さて、基本的に１タスクを１セッションでやっていこう、という話をしてきました。次に焦点となるのは、それら１セッション１セッションのコストを[click]いかに減らすかという話です。

早速、１セッションのコスト構造をブレークダウンしてみましょう。
-->

---
clicks: 3
---

<div class="req-chart mt-6">
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
    <div class="inv" style="--n: 15">調査</div>
    <div class="impl" style="--n: 1">実装</div>
    <div style="--n: 6">セットアップ</div>
    <div class="check" style="--n: 23">動作検証</div>
    <div style="--n: 3">後片付け</div>
  </div>
  <div class="legend">
    <span><i class="r"></i>キャッシュ読み取り</span>
    <span><i class="w"></i>キャッシュ書き込み</span>
    <span><i class="o"></i>出力</span>
  </div>
</div>

<style>
.req-chart .bars,
.req-chart .phases {
  display: flex;
  gap: 3px;
}
.req-chart .bar {
  flex: 1 1 0;
  height: 300px;
  display: flex;
  flex-direction: column-reverse;
  transform-origin: bottom;
  transition: opacity 0.4s ease;
}
.req-chart .bars:not(.shown) .bar {
  transform: scaleY(0);
}
.req-chart .bars.shown .bar {
  animation: req-grow 0.4s ease calc(var(--i) * 12ms) backwards;
}
@keyframes req-grow {
  from { transform: scaleY(0); }
}
.req-chart i { display: block; }
.req-chart .r { background: var(--c-green); }
.req-chart .w { background: var(--c-orange); }
.req-chart .o { background: var(--c-red); }
.req-chart .phases > div {
  flex: none;
  width: calc(var(--n) * (100% - 141px) / 48 + (var(--n) - 1) * 3px);
  margin-top: 6px;
  padding-top: 4px;
  border-top: 2px solid var(--c-muted);
  font-size: 0.8rem;
  white-space: nowrap;
  text-align: center;
  color: var(--c-muted);
  transition: opacity 0.4s ease;
}
.req-chart .phases[data-focus="inv"] > .inv,
.req-chart .phases[data-focus="impl"] > .impl,
.req-chart .phases[data-focus="check"] > .check { color: var(--c-yellow); border-color: var(--c-yellow); }
.req-chart [data-focus="inv"] > :not(.inv),
.req-chart [data-focus="impl"] > :not(.impl),
.req-chart [data-focus="check"] > :not(.check) { opacity: 0.25; }
.req-chart .legend {
  display: flex;
  justify-content: flex-end;
  gap: 1.5rem;
  margin-top: 1rem;
  font-size: 0.8rem;
  color: var(--c-muted);
}
.req-chart .legend i {
  display: inline-block;
  width: 0.8em;
  height: 0.8em;
  margin-right: 0.4em;
}
</style>

<!--
これは先ほど例として使った無敵アイテムの実装タスクをステップ単位で分析したものです。今度はちゃんと動作検証も含めて実行してもらいました。このタスクでは 48 回の API リクエストが発生しています。このグラフは、そのコストを棒グラフで表したものです。

[click]前半はプロジェクトの調査ですね。スクリプトを読み込んでいくので、キャッシュ書き込みのコストが目立ちます。

[click]その次に１本だけ大量の出力を行なっている棒があります。これがコードを書いているステップです。実装そのものは、たった１ステップで終わっているんですね。

そして注目してほしいのは[click]ここです。ここはプレイモードに入って、実装がちゃんと動いているかを検証しているフェーズです。目立って重いステップは無いんですが、ある程度膨らんでしまったコンテキストの再送信によってコストが拡大していますね。ステップ数も非常に多いです。
-->

---
layout: cost-table
table: cost-phase
clicks: 6
---

| フェーズ | リクエスト | ツール呼び出し | キャッシュ読込 | コスト |
| --- | ---: | ---: | ---: | ---: |
| 調査 | 15 | 16 | 19 pts. | 77 pts. (38%) |
| 実装 | 1 | 1 | 2 pts. | 8 pts. (4%) |
| セットアップ | 6 | 6 | 11 pts. | 23 pts. (11%) |
| 動作検証 | 23 | 33 | 47 pts. | 83 pts. (41%) |
| 後片付け | 3 | 4 | 7 pts. | 13 pts. (6%) |

<!--
フェーズ毎に集計してみました。

一番コストがかかっているのは、調査でも実装でもなく、[click]動作検証のフェーズでした。[click]全体コストの 41% がここにあります。これに対して[click]実装は 4% で済んでますから、その 10 倍のコストが検証で費やされている格好ですね。

[click]リクエストは 23 回、ツール呼び出しは 33 回。全体の半分近くのやり取りが、このフェーズに集中しています。[click]キャッシュ読み込みのコストも顕著に大きいです。膨らんだコンテキストの中でステップ数を重ねている影響が、ここに現れていますね。[click]

ということで、ここで Unity 開発、というか恐らくはゲーム開発全般に言えることだと思うんですが、問題になるコスト構造が見えてきます。それは……
-->

---
layout: bigtext
---

動作検証の

コストが高い

<!--
動作検証のコストが高い、ということです。

先ほどの計測結果にもあったように、実装作業そのものよりも、動作検証の方がコストがかかっている、というケースがざらにあるわけです。もしコスト構造を改善したいと思ったら、この動作検証のプロセスを見直すのが良さそうです。

それではまず、この動作検証フェーズの中で、一体どのようなことが行われているのか、さらに詳細にブレークダウンしていきましょう。
-->

---
layout: center
clicks: 10
---

<div class="cost-hl verify-steps grid grid-cols-2 gap-12 mt-8" :class="`hl-${$clicks}`">

<div>

- シーンを開いて再生
- アイテムを生成して撮影
- 見た目を調整して撮影
- プレイヤーを動かして取得させる
- ダメージが無効か HP を確認
- 敵にぶつけて撮影
- コンソールを確認
- ……

</div>

<div>

| ツール | 回数 |
| --- | ---: |
| eval (C# 実行) | 14 |
| capture_game_view | 9 |
| Bash | 5 |
| editor_play / stop | 3 |
| recompile / console | 2 |

</div>

</div>

<!--
これは先ほどの無敵アイテムの動作検証フェーズの中身を分析したものです。

[click]シーンを開いて再生、[click]アイテムを生成して撮影して、[click]見た目がおかしいので調整してまた撮る、[click]プレイヤーを移動してアイテムを取らせて、[click]ダメージが入っていないことを確認、[click]敵にぶつけて確認して……[click]というように、まあ要するに、人間が Unity エディタでやっているような動作検証を、エージェントが１ステップずつツール呼び出しを使って再現しているわけですね。

ツールとしては、[click]C# を実行する eval コマンドが 14 回、[click]画面の撮影が 9 回、とか、[click]小さな操作を細切れに、何回も呼び出しています。
-->

---
layout: bigtext
---

ツール呼び出し多い
<v-click>

≒ リクエスト回数多い

</v-click>
<v-click>

≒ 高コスト体質

</v-click>

<!--
このようにツール呼び出しの回数が多い作業というのは、[click]どうしても API リクエスト回数が増えて、コンテキストの入力回数が増えがちです。そして、[click]それが故に高コスト体質になりがちです。

ツール呼び出しは同時実行もできるので、この回数って必ずしもイコールにはならないんですが、動作検証みたいな場面では、結果を確認しながら順番にツールを呼び出す処理になるので、どうしても同時実行はできない、つまりリクエスト回数が増える傾向にあります。
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
