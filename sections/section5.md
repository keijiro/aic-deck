<!--
さて、基本的に１タスクを１セッションでやっていこう、という話をしてきました。次に焦点となるのは、それら１セッション１セッションの中でどのようにコストを減らせるのかという話です。

そして、ここで最も重要になるのは……
-->

---
layout: bigtext
---

動作検証の

コストが高い

<!--
動作検証のコストが高い、ということです。

これが存外に侮れなくて、実のところ、実装作業そのものよりも、動作検証の方がコストがかかる、というケースが度々あるんですよね。
-->

---
clicks: 3
---

<div class="req-chart mt-6">
  <div class="bars" :data-focus="[null, 'inv', 'impl', 'check'][$clicks]">
    <div class="bar inv"><i class="r" style="height:3.1%"></i><i class="o" style="height:2.0%"></i><i class="w" style="height:94.3%"></i></div>
    <div class="bar inv"><i class="r" style="height:5.5%"></i><i class="o" style="height:3.1%"></i><i class="w" style="height:18.6%"></i></div>
    <div class="bar inv"><i class="r" style="height:6.0%"></i><i class="o" style="height:3.2%"></i><i class="w" style="height:15.0%"></i></div>
    <div class="bar inv"><i class="r" style="height:6.3%"></i><i class="o" style="height:2.5%"></i><i class="w" style="height:8.2%"></i></div>
    <div class="bar inv"><i class="r" style="height:6.5%"></i><i class="o" style="height:5.2%"></i><i class="w" style="height:47.0%"></i></div>
    <div class="bar inv"><i class="r" style="height:7.7%"></i><i class="o" style="height:3.2%"></i><i class="w" style="height:17.5%"></i></div>
    <div class="bar inv"><i class="r" style="height:8.2%"></i><i class="o" style="height:4.8%"></i><i class="w" style="height:16.6%"></i></div>
    <div class="bar inv"><i class="r" style="height:8.6%"></i><i class="o" style="height:6.7%"></i><i class="w" style="height:15.2%"></i></div>
    <div class="bar inv"><i class="r" style="height:9.0%"></i><i class="o" style="height:9.1%"></i><i class="w" style="height:7.7%"></i></div>
    <div class="bar inv"><i class="r" style="height:9.1%"></i><i class="o" style="height:3.0%"></i><i class="w" style="height:4.0%"></i></div>
    <div class="bar inv"><i class="r" style="height:9.2%"></i><i class="o" style="height:2.4%"></i><i class="w" style="height:2.0%"></i></div>
    <div class="bar inv"><i class="r" style="height:9.3%"></i><i class="o" style="height:4.2%"></i><i class="w" style="height:15.9%"></i></div>
    <div class="bar inv"><i class="r" style="height:9.7%"></i><i class="o" style="height:15.2%"></i><i class="w" style="height:3.3%"></i></div>
    <div class="bar inv"><i class="r" style="height:9.8%"></i><i class="o" style="height:7.6%"></i><i class="w" style="height:11.4%"></i></div>
    <div class="bar inv"><i class="r" style="height:10.1%"></i><i class="o" style="height:6.5%"></i><i class="w" style="height:10.5%"></i></div>
    <div class="bar impl"><i class="r" style="height:10.3%"></i><i class="o" style="height:31.4%"></i><i class="w" style="height:8.8%"></i></div>
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
.req-chart .phases[data-focus="inv"] > .inv,
.req-chart .phases[data-focus="impl"] > .impl { color: var(--c-yellow); border-color: var(--c-yellow); }
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
先ほど例として使った無敵アイテムの実装タスク、今回は動作検証もちゃんと含めて実行してもらいました。このタスクでは 48 回の API リクエストが発生しました。このグラフは、その 48 回のリクエストのコストを棒グラフで表したものです。

[click]前半はプロジェクトの調査ですね。スクリプトを読み込んでいくので、キャッシュ書き込みのコストが目立ちます。

[click]その次に１本だけ大量の出力を行なっている棒がありますね。これがコードを書いているステップです。実装そのものは、たった１回のリクエストで終わっています。

注目してほしいのは[click]ここです。ここはプレイモードに入って、実装がちゃんと動いているかを検証しているフェーズです。目立って重いステップはありませんが、ある程度膨らんでしまったコンテキストの中で細かくコストを重ねているのが分かりますね。ステップ数も多いです。23 回リクエストしています。
-->

---
layout: center
---

| フェーズ | リクエスト | ツール呼び出し | キャッシュ読込 | コスト |
| --- | ---: | ---: | ---: | ---: |
| 調査 | 15 | 16 | $0.19 | $0.77 (38%) |
| 実装 | 1 | 1 | $0.02 | $0.08 (4%) |
| セットアップ | 6 | 6 | $0.11 | $0.23 (11%) |
| <span style="color: var(--c-yellow)">動作検証</span> | <span style="color: var(--c-yellow)">23</span> | <span style="color: var(--c-yellow)">33</span> | <span style="color: var(--c-yellow)">$0.47</span> | <span style="color: var(--c-yellow)">**$0.83 (41%)**</span> |
| 後片付け | 3 | 4 | $0.07 | $0.13 (6%) |

<!--
フェーズ別に数値を集計してみました。

一番コストがかかっているのは、調査でも実装でもなく、動作検証のフェーズでした。全体の41% を使っています。実装そのものは 4% なので、その 10 倍ですね。

リクエスト数は 23 回、ツール呼び出しは 33 回。全体の半分近くのやり取りが、この動作検証フェーズに集中しています。キャッシュ読み込みのコストも顕著に大きいです。膨らんだコンテキストの中でステップ数を重ねている影響が、ここに現れていますね。

さて、それでは、この動作検証フェーズの中では、一体どのようなことを行なっているのでしょうか？
-->

---

# 動作検証フェーズの中身

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
動作検証フェーズの中身を覗いてみましょう。

シーンを開いて再生する、アイテムを生成してスクリーンショットを撮る、見た目がおかしいので調整してまた撮る「プレイヤーをアイテムの位置に動かして取得させる「ダメージが無効になっているか HP を読んで確かめる、敵にぶつけてまた撮る、最後にコンソールの警告を確認する……と、こんな感じです。

まあ要するに、人間が Unity エディタでやっているような動作検証を、エージェントが１ステップずつツールで再現しているわけですね。エディタ上で C# を実行する eval が 14 回、ゲーム画面の撮影が 9 回、とか、小さな操作を細切れに、何回も呼び出しています。
-->

---

# 動作検証の高コスト体質

<v-click>

- ツール呼び出しの往復が多い

</v-click>
<v-click>

- それらのツール呼び出しを１回にまとめることができない。

</v-click>
<v-click>

- ツールを使う → 結果を受け取る → 次の行動を判断する<br />
  というループが多い。

</v-click>
<v-click>

- 入出力がコンテキストを太らせ続ける。

</v-click>
<v-click>

- １往復ごとにコンテキストが全送信。

</v-click>

<!--
困ったことに、このような動作検証は高コストになりがちな体質を持っています。

[click]先ほど見たように動作検証フェーズでは多数のツール呼び出しが行われますが、[click]これらのリクエストはまとめて１回にすることができません。[click]ツール呼び出しの結果を受け取ってから、次の行動を判断する、というような、前の結果への依存性を、大抵の場合持っているためです。どうしてもリクエスト回数が増えてしまいmす。

[click]そしてそれらのツール呼び出しには入出力が伴います。コンパクトにまとめられていれば良いですが、JSON 形式などを利用して入出力を行うと、どうしても冗長な表現になってコンテキストを膨らませがちになります。[click]そして、そうして太ったコンテキストが、１リクエスト毎に毎回全送信されるわけです。

先ほどのグラフを見ると、実装作業自体は１ステップで完了していたのが印象的ですよね。本来の実装は、実はかなりコスト効率が高いんです。それと比べると、これだけコストを悪化させる理由が揃っているので、まあ不利だと言わざるをえませんよね。
-->

---
layout: bigtext
---

対策を考えましょう

<!--
なので、対策を考えましょう。どうすれば、この「動作検証が重い」という問題を軽減することができるか。

一例として考えられるのは……
-->
