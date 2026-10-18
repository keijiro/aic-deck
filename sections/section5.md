---
layout: bigtext
---

確認フェーズのコスト

<!--
ここからは、Unity 開発ならではのコストの話をしたいと思います。キーワードは「確認フェーズ」です。
-->

---

# 解剖：無敵アイテムの実装

<div class="grid grid-cols-4 gap-6 mt-12 text-center">
  <div><div class="text-5xl font-bold" style="color: var(--c-yellow)">$2.04</div><div class="mt-2" style="color: var(--c-muted)">合計コスト</div></div>
  <div><div class="text-5xl font-bold">48</div><div class="mt-2" style="color: var(--c-muted)">リクエスト</div></div>
  <div><div class="text-5xl font-bold">60</div><div class="mt-2" style="color: var(--c-muted)">ツール呼び出し</div></div>
  <div><div class="text-5xl font-bold">118K</div><div class="mt-2" style="color: var(--c-muted)">最終コンテキスト</div></div>
</div>

<p class="text-sm text-right mt-16" style="color: var(--c-muted)">Bunny Blitz, Opus 5.5, Unity MCP 使用, 1回分のセッション</p>

<!--
先ほどの実験で使った「無敵アイテムを実装してください」というタスク、これを1回分取り出して、中身を細かく解剖してみました。

合計コストは $2.04。エージェントは LLM に48回リクエストを送っていて、その中でツールを60回呼び出しています。コンテキストは最終的に 118K トークンまで膨らみました。

この48回のリクエストが、それぞれ何をしていたのか、を見ていきます。
-->

---
clicks: 1
---

# リクエスト毎のコスト

<div class="req-chart mt-6">
  <div class="bars" :class="{ focus: $clicks >= 1 }">
    <div class="bar"><i class="r" style="height:3.1%"></i><i class="o" style="height:2.0%"></i><i class="w" style="height:94.3%"></i></div>
    <div class="bar"><i class="r" style="height:5.5%"></i><i class="o" style="height:3.1%"></i><i class="w" style="height:18.6%"></i></div>
    <div class="bar"><i class="r" style="height:6.0%"></i><i class="o" style="height:3.2%"></i><i class="w" style="height:15.0%"></i></div>
    <div class="bar"><i class="r" style="height:6.3%"></i><i class="o" style="height:2.5%"></i><i class="w" style="height:8.2%"></i></div>
    <div class="bar"><i class="r" style="height:6.5%"></i><i class="o" style="height:5.2%"></i><i class="w" style="height:47.0%"></i></div>
    <div class="bar"><i class="r" style="height:7.7%"></i><i class="o" style="height:3.2%"></i><i class="w" style="height:17.5%"></i></div>
    <div class="bar"><i class="r" style="height:8.2%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:16.6%"></i></div>
    <div class="bar"><i class="r" style="height:8.6%"></i><i class="o" style="height:6.7%"></i><i class="w" style="height:15.2%"></i></div>
    <div class="bar"><i class="r" style="height:9.0%"></i><i class="o" style="height:9.1%"></i><i class="w" style="height:7.7%"></i></div>
    <div class="bar"><i class="r" style="height:9.1%"></i><i class="o" style="height:3.0%"></i><i class="w" style="height:4.0%"></i></div>
    <div class="bar"><i class="r" style="height:9.2%"></i><i class="o" style="height:2.4%"></i><i class="w" style="height:2.0%"></i></div>
    <div class="bar"><i class="r" style="height:9.3%"></i><i class="o" style="height:4.2%"></i><i class="w" style="height:15.9%"></i></div>
    <div class="bar"><i class="r" style="height:9.7%"></i><i class="o" style="height:15.2%"></i><i class="w" style="height:3.3%"></i></div>
    <div class="bar"><i class="r" style="height:9.8%"></i><i class="o" style="height:7.6%"></i><i class="w" style="height:11.4%"></i></div>
    <div class="bar"><i class="r" style="height:10.1%"></i><i class="o" style="height:6.5%"></i><i class="w" style="height:10.5%"></i></div>
    <div class="bar"><i class="r" style="height:10.3%"></i><i class="o" style="height:31.4%"></i><i class="w" style="height:8.8%"></i></div>
    <div class="bar"><i class="r" style="height:10.5%"></i><i class="o" style="height:5.5%"></i><i class="w" style="height:15.2%"></i></div>
    <div class="bar"><i class="r" style="height:10.9%"></i><i class="o" style="height:0.5%"></i><i class="w" style="height:11.6%"></i></div>
    <div class="bar"><i class="r" style="height:11.2%"></i><i class="o" style="height:0.5%"></i><i class="w" style="height:1.0%"></i></div>
    <div class="bar"><i class="r" style="height:11.2%"></i><i class="o" style="height:13.6%"></i><i class="w" style="height:0.5%"></i></div>
    <div class="bar"><i class="r" style="height:11.3%"></i><i class="o" style="height:10.0%"></i><i class="w" style="height:6.8%"></i></div>
    <div class="bar"><i class="r" style="height:11.4%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:4.7%"></i></div>
    <div class="bar check"><i class="r" style="height:11.5%"></i><i class="o" style="height:3.6%"></i><i class="w" style="height:5.0%"></i></div>
    <div class="bar check"><i class="r" style="height:11.7%"></i><i class="o" style="height:3.1%"></i><i class="w" style="height:2.4%"></i></div>
    <div class="bar check"><i class="r" style="height:11.7%"></i><i class="o" style="height:0.9%"></i><i class="w" style="height:2.0%"></i></div>
    <div class="bar check"><i class="r" style="height:11.8%"></i><i class="o" style="height:3.8%"></i><i class="w" style="height:3.6%"></i></div>
    <div class="bar check"><i class="r" style="height:11.9%"></i><i class="o" style="height:0.9%"></i><i class="w" style="height:2.0%"></i></div>
    <div class="bar check"><i class="r" style="height:11.9%"></i><i class="o" style="height:12.0%"></i><i class="w" style="height:3.6%"></i></div>
    <div class="bar check"><i class="r" style="height:12.0%"></i><i class="o" style="height:8.6%"></i><i class="w" style="height:8.6%"></i></div>
    <div class="bar check"><i class="r" style="height:12.2%"></i><i class="o" style="height:7.2%"></i><i class="w" style="height:7.6%"></i></div>
    <div class="bar check"><i class="r" style="height:12.4%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:10.2%"></i></div>
    <div class="bar check"><i class="r" style="height:12.7%"></i><i class="o" style="height:7.4%"></i><i class="w" style="height:6.9%"></i></div>
    <div class="bar check"><i class="r" style="height:12.8%"></i><i class="o" style="height:8.4%"></i><i class="w" style="height:6.8%"></i></div>
    <div class="bar check"><i class="r" style="height:13.0%"></i><i class="o" style="height:6.2%"></i><i class="w" style="height:7.3%"></i></div>
    <div class="bar check"><i class="r" style="height:13.2%"></i><i class="o" style="height:3.4%"></i><i class="w" style="height:6.3%"></i></div>
    <div class="bar check"><i class="r" style="height:13.3%"></i><i class="o" style="height:6.2%"></i><i class="w" style="height:1.7%"></i></div>
    <div class="bar check"><i class="r" style="height:13.4%"></i><i class="o" style="height:8.8%"></i><i class="w" style="height:6.4%"></i></div>
    <div class="bar check"><i class="r" style="height:13.6%"></i><i class="o" style="height:0.5%"></i><i class="w" style="height:4.6%"></i></div>
    <div class="bar check"><i class="r" style="height:13.7%"></i><i class="o" style="height:1.2%"></i><i class="w" style="height:0.5%"></i></div>
    <div class="bar check"><i class="r" style="height:13.7%"></i><i class="o" style="height:3.8%"></i><i class="w" style="height:0.6%"></i></div>
    <div class="bar check"><i class="r" style="height:13.7%"></i><i class="o" style="height:5.0%"></i><i class="w" style="height:5.9%"></i></div>
    <div class="bar check"><i class="r" style="height:13.8%"></i><i class="o" style="height:5.9%"></i><i class="w" style="height:2.4%"></i></div>
    <div class="bar check"><i class="r" style="height:13.9%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:6.7%"></i></div>
    <div class="bar check"><i class="r" style="height:14.1%"></i><i class="o" style="height:2.8%"></i><i class="w" style="height:7.6%"></i></div>
    <div class="bar check"><i class="r" style="height:14.3%"></i><i class="o" style="height:2.9%"></i><i class="w" style="height:1.3%"></i></div>
    <div class="bar"><i class="r" style="height:14.3%"></i><i class="o" style="height:5.3%"></i><i class="w" style="height:3.5%"></i></div>
    <div class="bar"><i class="r" style="height:14.4%"></i><i class="o" style="height:3.3%"></i><i class="w" style="height:9.5%"></i></div>
    <div class="bar"><i class="r" style="height:14.6%"></i><i class="o" style="height:12.0%"></i><i class="w" style="height:3.8%"></i></div>
  </div>
  <div class="phases" :class="{ focus: $clicks >= 1 }">
    <div style="--n: 15">調査</div>
    <div style="--n: 1">実装</div>
    <div style="--n: 6">コンパイル</div>
    <div class="check" style="--n: 23">プレイモードで確認</div>
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
  transition: opacity 0.4s ease;
}
.req-chart i { display: block; }
.req-chart .r { background: var(--c-lime); }
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
.req-chart .phases > .check { color: var(--c-yellow); border-color: var(--c-yellow); }
.req-chart .focus > :not(.check) { opacity: 0.25; }
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
48回のリクエストを、1本ずつ棒グラフにしてみました。棒の高さが1回のリクエストのコストです。色はコストの種類で、緑がキャッシュ読み取り、オレンジがキャッシュ書き込み、赤が出力です。

前半はプロジェクトの調査ですね。スクリプトを読み込んでいくので、キャッシュ書き込みのオレンジが目立ちます。真ん中の1本だけ赤い棒がコードを書いているところ。実装そのものは、たった1回のリクエストで終わっています。

[click]注目してほしいのは後半です。ここはプレイモードに入って、実装がちゃんと動いているかを確認しているフェーズです。1本1本は小さいんですが、とにかく本数が多い。23本並んでいます。そして、下の方の緑、キャッシュ読み取りの部分が、じわじわと積み上がっていっているのが分かると思います。
-->

---

# フェーズ別の集計

| フェーズ | リクエスト | ツール呼び出し | キャッシュ読込 | コスト |
| --- | ---: | ---: | ---: | ---: |
| 調査 | 15 | 16 | $0.19 | $0.77 (38%) |
| 実装 | 1 | 1 | $0.02 | $0.08 (4%) |
| コンパイル・プレハブ作成 | 6 | 6 | $0.11 | $0.23 (11%) |
| <span style="color: var(--c-yellow)">プレイモードで確認</span> | <span style="color: var(--c-yellow)">23</span> | <span style="color: var(--c-yellow)">33</span> | <span style="color: var(--c-yellow)">$0.47</span> | <span style="color: var(--c-yellow)">**$0.83 (41%)**</span> |
| 後片付け | 3 | 4 | $0.07 | $0.13 (6%) |

<!--
フェーズ別に集計するとこうなります。

一番お金がかかっているのは、実は調査でも実装でもなく、確認のフェーズでした。全体の41%、$0.83 を使っています。実装そのものは $0.08 なので、その10倍ですね。

リクエスト数は23回、ツール呼び出しは33回。全体の半分近くのやり取りが、この確認フェーズに集中しています。そしてキャッシュ読み取りのコストが $0.47 と、他のフェーズより飛び抜けて大きくなっています。
-->

---

# 確認フェーズでやっていること

<div class="grid grid-cols-2 gap-12 mt-8">

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
確認フェーズの中身を見てみましょう。

シーンを開いて再生する。アイテムを生成してスクリーンショットを撮る。見た目がおかしいので調整してまた撮る。プレイヤーをアイテムの位置に動かして取得させる。ダメージが無効になっているか HP を読んで確かめる。敵にぶつけてまた撮る。最後にコンソールの警告を確認する……と、こんな感じです。

人間が Unity エディタでやっている動作確認を、エージェントが一手ずつツールで再現しているわけですね。エディタ上で C# を実行する eval が14回、ゲーム画面の撮影が9回。小さな操作を細切れに、何度も何度も呼び出しています。
-->

---

# なぜ高くつくのか

- ツールを1回呼ぶ = リクエストが1往復増える
- 1往復ごとにコンテキスト全体（約100K）を読み直す

<div v-click class="mt-12 text-3xl text-center">
  100K × 23回 = <span style="color: var(--c-yellow)">2.4M トークン</span>の読み取り
</div>

<!--
なぜこれが高くつくのか。

エージェントがツールを呼ぶと、その結果を受け取って次の判断をするために、もう一度 LLM にリクエストを送ります。つまり、ツール呼び出し1回ごとにリクエストが1往復増えるわけです。

そしてリクエストを送るたびに、それまでのコンテキスト全体を送り直しています。確認フェーズに入る頃には、コンテキストは既に約 100K トークンに達していました。

[click]それを23回。合計で 240万トークンほどを読み直している計算になります。キャッシュ読み取りは格安なので1回あたりは2セント程度なんですが、塵も積もれば、ということで、これが確認フェーズのコストの正体です。
-->

---

# Unity 開発の特徴

- 書いたコードがすぐに確かめられない
  - コンパイル → プレイモード → 操作 → 観察
- 「確認」が細かいツール呼び出しの連鎖になりやすい
- しかも、コンテキストが最も膨らんだタイミングで行われる

<!--
これは Unity 開発、というかゲーム開発全般に言える特徴だと思います。

普通のプログラムなら、テストを1回走らせれば結果が分かる、ということが多いですよね。でも Unity では、コンパイルして、プレイモードに入って、オブジェクトを置いて、動かして、画面を見て……という段取りを踏まないと、実装が正しいかどうか確かめられません。エージェントにとっては、これが細かいツール呼び出しの連鎖になります。

しかも確認というのは作業の最後に行うものなので、調査や実装で読み込んだ情報がコンテキストに全部積み上がった状態、つまり一番コンテキストが重いタイミングで、この細切れのやり取りが発生します。コストが嵩むのは当然と言えば当然ですね。

では、どうすればこの確認フェーズのコストを抑えられるのか。次はそのお話をしたいと思います。
-->
