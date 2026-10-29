---
clicks: 8
---

<div class="pts-compare">
  <div class="pts-card" :class="{ on: $clicks >= 1 }">
    <LoopVideo src="/videos/sec1/salvonix-small.mp4" />
    <div class="name">Salvonix</div>
    <div class="pts">1,800 pts.</div>
  </div>
  <div class="pts-card" :class="{ on: $clicks >= 2, dim: [4, 6, 8].includes($clicks) }">
    <img src="/images/sec6/tower-defense-1.jpg" />
    <div class="name">Tower Defense URP 移行</div>
    <div class="pts">2,000 pts.</div>
  </div>
  <div class="pts-card" :class="{ on: $clicks >= 3, dim: [4, 5, 8].includes($clicks) }">
    <img src="/images/sec4/bunny-blitz-after.png" />
    <div class="name">Bunny Blitz 無敵アイテム</div>
    <div class="pts">200 pts.</div>
  </div>
</div>

<style>
.pts-compare {
  height: 100%;
  display: grid;
  grid-template-columns: repeat(3, minmax(0, 1fr));
  gap: 32px;
  align-items: center;
}
.pts-card {
  text-align: center;
  opacity: 0;
  transition: opacity 0.4s, filter 0.4s;
}
.pts-card.on { opacity: 1; }
.pts-card.dim { filter: brightness(0.4); }
.pts-card video,
.pts-card img {
  width: 100%;
  aspect-ratio: 16 / 9;
  object-fit: cover;
  border-radius: 4px;
}
.pts-card .name {
  margin-top: 16px;
  font-size: 1.3em;
}
.pts-card .pts {
  font-size: 2.4em;
  font-weight: bold;
  color: var(--c-yellow);
}
</style>

<!--
さて、話を戻しましょう。いよいよ最後の話題に移ります。

ここまでコストについて色々お話ししてきたわけですが、もしかしたら、ここでちょっとした疑問に当たるかもしれません。

[click]最初に紹介したこのプロジェクト、１プロンプトで実装が完了して、コーディングエージェント側のコストは 1,800 ポイント程度でした。

[click]Tower Defense プロジェクトの URP 移行は、2,000 ポイントぐらいかかりましたよね。

[click]そして Bunny Blitz に無敵アイテムを実装するのは、200 ポイントかかっていました。

こうして比較すると……[click]このサンプル、コスパがあまりにも良過ぎですよね？

[click]既存のプロジェクトを URP 移行させるという、半ば機械的な作業と、プロトタイプをゼロイチで作るという創造的作業が、ほぼ同程度のコストになっています。

[click]たった１機能の実装に 200 ポイントかかっていますが、その 10 倍程度でプロトタイプが完成するというのも酷くアンバランスに見えます。

[click]このように様々な種類のタスクのコスパを比較した時に見えてくる事実が１つあります。それは、[click]１プロンプトで一気にプロトタイピングする、というタスクの異常なコスパの良さです。
-->

---

<!--
しかしなぜここまでプロトタイピングが得意なんでしょうか。

理由はいくつか考えられます。プロトタイピングはコンテキストを殆ど持たない状態から始められるので効率が良い、とか、プロトタイプに関しては大量の学習ソースが存在する、とか。色々考えられますよね。
-->

---
layout: full
---

<VideoDrift :srcs="[
  '/videos/sec1/salvonix-small.mp4',
  '/videos/sec1/football-small.mp4',
  '/videos/sec1/alchemion-small.mp4',
  '/videos/sec1/recent-projects-hq.mp4',
]" />

<!--
しかしそれでも、このコスパの良さは異常です。

これは恐らく皆さんも最新の LLM が発表される度に感じていることだと思いますが、非常に高度で完成度の高いプロトタイプを少ないプロンプトで簡単に生成できるようになってきていますよね。特に Fable 5 以降、GPT-6 Astra や Opus 5.5 などにおいてその傾向が非常に強くなっていると感じています。
-->

---
layout: full
clicks: 2
---

<div class="tower-grid" :class="{ on: $clicks >= 1, many: $clicks >= 2 }">
  <img v-for="i in 66" :key="i" src="/images/sec7/tower-ai.png"
    :class="{ hero: i === 1 }" :style="{ '--c': (i - 1) % 11, '--r': Math.floor((i - 1) / 11) }" />
</div>

<style>
/* Square cells: 6 rows fill the height, 11 columns centered (16:9 slide) */
.tower-grid {
  position: absolute;
  inset: 0;
  --w: calc(100% / 6 * 9 / 16);
  --x0: calc((100% - var(--w) * 11) / 2);
}
.tower-grid img {
  position: absolute;
  width: var(--w);
  left: calc(var(--x0) + var(--c) * var(--w));
  top: calc(var(--r) * 100% / 6);
  opacity: 0;
  transition: opacity 0.3s calc(0.5s + (var(--c) + var(--r)) * 0.05s);
}
.tower-grid img.hero {
  width: calc(var(--w) * 3.6);
  left: calc(50% - var(--w) * 1.8);
  top: 20%;
  transition: opacity 0.3s, width 0.6s ease-in-out, left 0.6s ease-in-out, top 0.6s ease-in-out;
}
.tower-grid.on img.hero {
  opacity: 1;
}
.tower-grid.many img {
  opacity: 1;
}
.tower-grid.many img.hero {
  width: var(--w);
  left: var(--x0);
  top: 0;
}
</style>

<!--
僕は決して AI の専門家ではないので、本当にこれは単なる非専門家のいち推測として聞いて欲しいんですが、[click]最近の LLM は１プロンプトでのプロトタイピングに関して[click]かなり大規模なトレーニングが行われているのではないかと思います。

その具体的な手法については分かりませんけど、現在の最新世代と、一つ前の世代の間には、単純な言語モデルとしての進化では説明しきれない、大きな跳躍があると感じます。皆さんもそれは感じていませんかね？ 恐らくは、大規模に強化学習をブン回すような仕組みがあるんじゃないでしょうか。
-->

---

<!--
さてここで、上手くいった例ばかりを紹介するのもフェアではないので、失敗した例も挙げておきましょうか。
-->

---

# anime op sample

<!--
これは、今の最新モデルならアニメのオープニング映像みたいなものも作れるんじゃないか、と思って、試しに丸投げしてみた例です。結果はご覧の通りで、こう言ってはなんですが、まるで素人が作ったような、要するに、やろうとしている事に対して実力が伴っていないような、稚拙なものが出来上がってしまいました。

でもここで僕は、最新のフロンティアモデルの実力がこの程度である訳はない、と考えたんですよね。そこでちょっとした調整を加えて、再びトライしてみました。
-->

---

# music video sample

<!--
こちらがその結果です。かなり見れるものになったんじゃないでしょうか？

細かい所を見れば、もちろんまだ欠点はあります。展開はやや凡庸に感じられますし、作画の破綻している部分もあります。でも相対的に見れば、格段に出来は良くなっています。

さて、それでは一体どのような調整を加えたのでしょうか。
-->

---

- Lyric video
- Visual reference

<!--
大きな違いは２点あります。

[click]１つは「アニメのオープニング」ではなく「リリックビデオ」と指定を変えたことです。「アニメのオープニング」は、流石に現状のモデル及びハーネスの能力を大幅に超えてしまっている気がします。そこで、もうちょっと簡単なゴールを着地点にしました。

[click]もう１つは、ビジュアルリファレンスを与えたことです。[click]このようなコンセプトアート、これは chatgpt-image-2.5 で別途作成したものなんですが、これを与えたうえで、これをベースとして作成するように指示したわけです。

この「ビジュアルリファレンスを与える」というのは、現状のフロンティアモデルを使ってプロトタイピングを行う際に、非常に重要なファクターになると考えています。
-->

---

- Visual reference examples

<!--
実はこれまでに紹介したプロジェクトも、１プロンプトとは言ってきましたが、そのプロンプトでは必ずコンセプトアートを与えるようにしていました。

エージェントは、その画像から、新たなデザインを起こしたり、3D シーンを構築したり、世界観を補完したり、ストーリーを書いたり……本当に様々な情報を引き出していきます。その能力の高さというか「察しの良さ」には目を見張るものがあります。

そしてこれもやはり大規模トレーニングの賜物ではないかと思います。最近の LLM には、リファレンス画像から 3D シーンを構築したり、アプリの UI を構築したりする能力が備わっているわけですが、そのような「ビジュアルリファレンスから何かを構築する」というタスクに関して、想像以上に高い能力を持っているようです。

現にこのように、画像から非常に多くのことを読み取ってくれますし、また、画像を与えることで、LLM の中にある何か特別な能力が覚醒するような印象さえ覚えます。
-->

---

<div class="flex items-center justify-center gap-8 h-full">
  <img v-click src="/images/sec7/giant1.png" class="h-[75%] rounded" />
  <img v-click src="/images/sec7/giant2.png" class="h-[75%] rounded" />
</div>

<!--
ええと、すみません。今からオタクの話をします。僕はこれを、まるで巨神兵だな、と思っています。

巨神兵って、言うまでもなく「風の谷のナウシカ」の巨神兵ですね。ナウシカの原作では、[click]巨神兵って赤ん坊のような知能の存在として描かれているんですよね。それが、巨神兵に名前を与えた瞬間、[click]すごい勢いで知能が発達して、上位存在、調停者としての自我に目覚める、っていう無茶苦茶アツくてカッコいい展開があるんですよね。

あー、まるでこれじゃん、と。

現在のフロンティアモデルがどのようにトレーニングされていて、どのような機能を持っているのか、僕は詳細を知りませんが、リファレンス画像とプロトタイピングというタスクを与えた時、むちゃくちゃな大規模学習の中で形成されたスーパーパワーが目覚める。そんな不思議な感覚を覚えます。
-->

---
layout: bigtext
---

<v-click>
重要：適切なビジュアル

リファレンスを与える
</v-click>

<!--
余計な喩え話をして話が逸れましたが、言いたかったのは、現状の LLM をゲームのプロトタイピングに使用する場合、[click]適切なビジュアルリファレンスを与えることには大きなメリットがあるらしい、そしてそれは、クオリティの高い結果を得るために……つまり、プロトタイピングにおけるコスパを最大化するのに適した手段であるらしい、ということです。

プロトタイピングには、ぜひ適切なビジュアルリファレンスを与えていくようにしましょう。
-->

---
layout: bigtext
---

<v-click>
注意：コスパの良さは

長く続かない
</v-click>

<!--
そしてもう一つ意識すべきは、恐らくこのコスパの良さは、[click]プロトタイピングの後は長く続かないだろうということです。
-->

---
clicks: 2
---

<div class="req-chart mt-20">
  <div class="est-chart" :style="{ '--n': [1, 6, 31][$clicks] }">
    <div class="bars proto" :class="{ shown: $nav.currentPage === $page }">
      <div class="bar" style="--i: 0"><i class="r" style="height:50%"></i></div>
    </div>
    <div class="bars" :class="{ shown: $clicks === 1 }">
      <div class="bar" style="--i: 1"><i class="r" style="height:38%"></i></div>
      <div class="bar" style="--i: 2"><i class="r" style="height:30%"></i></div>
      <div class="bar" style="--i: 3"><i class="r" style="height:44%"></i></div>
      <div class="bar" style="--i: 4"><i class="r" style="height:26%"></i></div>
      <div class="bar" style="--i: 5"><i class="r" style="height:35%"></i></div>
    </div>
    <div class="bars" :class="{ shown: $clicks >= 2 }">
      <div class="bar" style="--i: 1"><i class="r" style="height:4%"></i></div>
      <div class="bar" style="--i: 2"><i class="r" style="height:7%"></i></div>
      <div class="bar" style="--i: 3"><i class="r" style="height:3%"></i></div>
      <div class="bar" style="--i: 4"><i class="r" style="height:12%"></i></div>
      <div class="bar" style="--i: 5"><i class="r" style="height:5%"></i></div>
      <div class="bar" style="--i: 6"><i class="r" style="height:2%"></i></div>
      <div class="bar" style="--i: 7"><i class="r" style="height:9%"></i></div>
      <div class="bar" style="--i: 8"><i class="r" style="height:6%"></i></div>
      <div class="bar" style="--i: 9"><i class="r" style="height:58%"></i></div>
      <div class="bar" style="--i: 10"><i class="r" style="height:4%"></i></div>
      <div class="bar" style="--i: 11"><i class="r" style="height:3%"></i></div>
      <div class="bar" style="--i: 12"><i class="r" style="height:8%"></i></div>
      <div class="bar" style="--i: 13"><i class="r" style="height:15%"></i></div>
      <div class="bar" style="--i: 14"><i class="r" style="height:5%"></i></div>
      <div class="bar" style="--i: 15"><i class="r" style="height:2%"></i></div>
      <div class="bar" style="--i: 16"><i class="r" style="height:6%"></i></div>
      <div class="bar" style="--i: 17"><i class="r" style="height:4%"></i></div>
      <div class="bar" style="--i: 18"><i class="r" style="height:63%"></i></div>
      <div class="bar" style="--i: 19"><i class="r" style="height:7%"></i></div>
      <div class="bar" style="--i: 20"><i class="r" style="height:3%"></i></div>
      <div class="bar" style="--i: 21"><i class="r" style="height:10%"></i></div>
      <div class="bar" style="--i: 22"><i class="r" style="height:5%"></i></div>
      <div class="bar" style="--i: 23"><i class="r" style="height:2%"></i></div>
      <div class="bar" style="--i: 24"><i class="r" style="height:4%"></i></div>
      <div class="bar" style="--i: 25"><i class="r" style="height:11%"></i></div>
      <div class="bar" style="--i: 26"><i class="r" style="height:6%"></i></div>
      <div class="bar" style="--i: 27"><i class="r" style="height:3%"></i></div>
      <div class="bar" style="--i: 28"><i class="r" style="height:55%"></i></div>
      <div class="bar" style="--i: 29"><i class="r" style="height:5%"></i></div>
      <div class="bar" style="--i: 30"><i class="r" style="height:8%"></i></div>
    </div>
  </div>
  <div v-click.hide="1" class="sum">2,000 pts</div>
</div>

<!--
2,000 ポイントでこのような本格的なプロトタインピングができてしまうと、[click]その倍とか、あるいは３〜４倍ぐらい出せば、とりあえずの完成まで持っていけるのではないか、と思ってしまうかもしれません。

しかし実際には、[click]プロトタイプからインクリメンタルに完成に近づけていく作業は、想像以上にコストを食います。ちゃんとした形に整えるまでは、もっと多くの、例えば 10 倍程度のコストを考えるべきでしょう。
-->

---
clicks: 6
---

<div class="req-chart mt-11" :data-focus="[null, 'proto', 'proto', null, 'big'][$clicks]">
  <div class="inset">
    <img class="proto" :class="{ zoom: $clicks === 2 }" src="/images/sec7/alchemion-prototype.jpg" />
    <svg class="dia" width="72" height="20"><path class="dia-arrow solid" d="M 4 10 L 62 10" /></svg>
    <img src="/images/sec7/alchemion-released.jpg" />
  </div>
  <div class="bars" :class="{ shown: $nav.currentPage === $page }">
    <div class="bar proto" style="--i: 1"><i class="r" style="height:22.3%"></i><i class="o" style="height:12.8%"></i><i class="w" style="height:9.1%"></i><b>2,206</b></div>
    <div class="bar" style="--i: 2"><i class="r" style="height:0.1%"></i><i class="o" style="height:0.1%"></i><i class="w" style="height:0.6%"></i></div>
    <div class="bar big" style="--i: 3"><i class="r" style="height:55.9%"></i><i class="o" style="height:14.2%"></i><i class="w" style="height:18.6%"></i><b>4,434</b></div>
    <div class="bar" style="--i: 4"><i class="r" style="height:0.7%"></i><i class="o" style="height:0.7%"></i><i class="w" style="height:0.8%"></i></div>
    <div class="bar" style="--i: 5"><i class="r" style="height:0.0%"></i><i class="o" style="height:0.1%"></i><i class="w" style="height:0.4%"></i></div>
    <div class="bar" style="--i: 6"><i class="r" style="height:4.1%"></i><i class="o" style="height:2.5%"></i><i class="w" style="height:2.6%"></i></div>
    <div class="bar" style="--i: 7"><i class="r" style="height:1.1%"></i><i class="o" style="height:0.6%"></i><i class="w" style="height:1.1%"></i></div>
    <div class="bar" style="--i: 8"><i class="r" style="height:3.4%"></i><i class="o" style="height:1.9%"></i><i class="w" style="height:2.9%"></i></div>
    <div class="bar" style="--i: 9"><i class="r" style="height:2.8%"></i><i class="o" style="height:1.8%"></i><i class="w" style="height:1.9%"></i></div>
    <div class="bar" style="--i: 10"><i class="r" style="height:0.1%"></i><i class="o" style="height:0.1%"></i><i class="w" style="height:0.3%"></i></div>
    <div class="bar" style="--i: 11"><i class="r" style="height:0.6%"></i><i class="o" style="height:0.4%"></i><i class="w" style="height:0.8%"></i></div>
    <div class="bar" style="--i: 12"><i class="r" style="height:4.0%"></i><i class="o" style="height:1.5%"></i><i class="w" style="height:2.9%"></i></div>
    <div class="bar" style="--i: 13"><i class="r" style="height:0.9%"></i><i class="o" style="height:0.8%"></i><i class="w" style="height:1.4%"></i></div>
    <div class="bar" style="--i: 14"><i class="r" style="height:5.1%"></i><i class="o" style="height:2.8%"></i><i class="w" style="height:5.7%"></i></div>
    <div class="bar" style="--i: 15"><i class="r" style="height:0.3%"></i><i class="o" style="height:0.3%"></i><i class="w" style="height:0.7%"></i></div>
    <div class="bar" style="--i: 16"><i class="r" style="height:4.0%"></i><i class="o" style="height:2.2%"></i><i class="w" style="height:4.6%"></i></div>
    <div class="bar" style="--i: 17"><i class="r" style="height:0.1%"></i><i class="o" style="height:0.0%"></i><i class="w" style="height:0.3%"></i></div>
    <div class="bar" style="--i: 18"><i class="r" style="height:16.8%"></i><i class="o" style="height:7.6%"></i><i class="w" style="height:7.7%"></i><b>1,604</b></div>
    <div class="bar" style="--i: 19"><i class="r" style="height:3.7%"></i><i class="o" style="height:1.2%"></i><i class="w" style="height:2.6%"></i></div>
    <div class="bar" style="--i: 20"><i class="r" style="height:0.5%"></i><i class="o" style="height:0.3%"></i><i class="w" style="height:0.8%"></i></div>
    <div class="bar" style="--i: 21"><i class="r" style="height:3.4%"></i><i class="o" style="height:1.7%"></i><i class="w" style="height:2.3%"></i></div>
    <div class="bar" style="--i: 22"><i class="r" style="height:1.7%"></i><i class="o" style="height:1.0%"></i><i class="w" style="height:1.3%"></i></div>
    <div class="bar" style="--i: 23"><i class="r" style="height:2.5%"></i><i class="o" style="height:1.3%"></i><i class="w" style="height:1.6%"></i></div>
    <div class="bar" style="--i: 24"><i class="r" style="height:0.3%"></i><i class="o" style="height:0.2%"></i><i class="w" style="height:0.4%"></i></div>
    <div class="bar" style="--i: 25"><i class="r" style="height:0.3%"></i><i class="o" style="height:0.2%"></i><i class="w" style="height:0.5%"></i></div>
    <div class="bar" style="--i: 26"><i class="r" style="height:10.6%"></i><i class="o" style="height:7.6%"></i><i class="w" style="height:5.6%"></i><b>1,187</b></div>
    <div class="bar" style="--i: 27"><i class="r" style="height:2.0%"></i><i class="o" style="height:1.0%"></i><i class="w" style="height:1.7%"></i></div>
    <div class="bar" style="--i: 28"><i class="r" style="height:2.6%"></i><i class="o" style="height:2.4%"></i><i class="w" style="height:3.0%"></i></div>
    <div class="bar" style="--i: 29"><i class="r" style="height:2.2%"></i><i class="o" style="height:1.6%"></i><i class="w" style="height:1.8%"></i></div>
    <div class="bar" style="--i: 30"><i class="r" style="height:6.3%"></i><i class="o" style="height:3.2%"></i><i class="w" style="height:3.1%"></i></div>
    <div class="bar" style="--i: 31"><i class="r" style="height:1.5%"></i><i class="o" style="height:0.7%"></i><i class="w" style="height:1.1%"></i></div>
    <div class="bar" style="--i: 32"><i class="r" style="height:3.8%"></i><i class="o" style="height:2.7%"></i><i class="w" style="height:2.5%"></i></div>
    <div class="bar" style="--i: 33"><i class="r" style="height:2.8%"></i><i class="o" style="height:1.4%"></i><i class="w" style="height:2.0%"></i></div>
    <div class="bar" style="--i: 34"><i class="r" style="height:1.5%"></i><i class="o" style="height:1.5%"></i><i class="w" style="height:2.6%"></i></div>
    <div class="bar" style="--i: 35"><i class="r" style="height:1.0%"></i><i class="o" style="height:0.8%"></i><i class="w" style="height:1.3%"></i></div>
    <div class="bar" style="--i: 36"><i class="r" style="height:0.1%"></i><i class="o" style="height:0.1%"></i><i class="w" style="height:0.6%"></i></div>
    <div class="bar" style="--i: 37"><i class="r" style="height:5.8%"></i><i class="o" style="height:3.0%"></i><i class="w" style="height:3.1%"></i></div>
    <div class="bar" style="--i: 38"><i class="r" style="height:2.3%"></i><i class="o" style="height:1.0%"></i><i class="w" style="height:1.4%"></i></div>
    <div class="bar" style="--i: 39"><i class="r" style="height:1.2%"></i><i class="o" style="height:1.0%"></i><i class="w" style="height:1.2%"></i></div>
    <div class="bar" style="--i: 40"><i class="r" style="height:2.9%"></i><i class="o" style="height:1.9%"></i><i class="w" style="height:2.2%"></i></div>
    <div class="bar" style="--i: 41"><i class="r" style="height:1.3%"></i><i class="o" style="height:0.7%"></i><i class="w" style="height:1.3%"></i></div>
    <div class="bar" style="--i: 42"><i class="r" style="height:0.9%"></i><i class="o" style="height:0.6%"></i><i class="w" style="height:1.0%"></i></div>
    <div class="bar" style="--i: 43"><i class="r" style="height:1.7%"></i><i class="o" style="height:1.6%"></i><i class="w" style="height:1.4%"></i></div>
    <div class="bar" style="--i: 44"><i class="r" style="height:0.3%"></i><i class="o" style="height:0.2%"></i><i class="w" style="height:0.6%"></i></div>
  </div>
  <div v-click="6" class="sum">合計 19,231 pts.</div>
  <div class="legend">
    <span><i class="r"></i>キャッシュ読み取り</span>
    <span><i class="w"></i>キャッシュ書き込み</span>
    <span><i class="o"></i>出力</span>
  </div>
</div>

<!--
これは冒頭で紹介した Alchemion プロジェクトの分析です。このグラフからも分かるように、[click]最初のプロトタイプは約 2,200 ポイントで生成されています。

[click]この時点でゲームの骨格となる仕組みは出来上がっていましたが、このスクリーンショットからも分かるように、不十分な点は沢山残されていました。

[click]これを細かなインクリメンタル作業で完成に近づけていくわけですが、[click]最初の大規模改修で 4,400 ポイントも使用し、[click]その後も細かくコストを払い続けました。結局、[click]合計で約 19,200 ポイントとなっています。当初の９倍ぐらいにまで膨れ上がったということですね。

これでも、最初に紹介した Jacquard プロジェクトの例と比較すると安めで済んでいますが、プロトタイプのコスパの良さからすると、だいぶ膨れ上がったなという感があります。

やはり、他人に見せられるぐらいのクオリティまで引き上げるには、大雑把に 10 倍ぐらいのコストは見積もっておいた方がいいということでしょう。
-->
