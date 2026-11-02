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
    <div class="name">Tower Defense URP migration</div>
    <div class="pts">2,000 pts.</div>
  </div>
  <div class="pts-card" :class="{ on: $clicks >= 3, dim: [4, 5, 8].includes($clicks) }">
    <img src="/images/sec4/bunny-blitz-after.png" />
    <div class="name">Bunny Blitz invincibility item</div>
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
OK, let's get back on track. We're finally moving on to the last topic.

I've talked a lot about cost so far, and maybe at this point you've run into a little question.

[click]This project I showed at the beginning was implemented with a single prompt, and the cost on the coding agent side was around 1,800 points.

[click]The URP migration of the Tower Defense project cost about 2,000 points.

[click]And implementing the invincibility item in Bunny Blitz cost 200 points.

When you compare them like this... [click]isn't this sample just way too cost-effective?

[click]The semi-mechanical job of migrating an existing project to URP and the creative job of building a prototype from scratch cost about the same.

[click]A single feature cost 200 points, yet a whole prototype was done for only about ten times that. That looks badly unbalanced.

[click]When you compare the cost-effectiveness of different kinds of tasks like this, one fact stands out: [click]prototyping in one go with a single prompt is abnormally cost-effective.
-->

---

<!--
But why are they so good at single-prompt prototyping?

I can think of a few reasons. Prototyping starts from almost no context, so it's efficient. Or there was a huge amount of training material for prototypes. Lots of possibilities.
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
Even so, I think this level of cost-effectiveness is abnormal.

You've probably felt this every time a new model is released: it's become easy to generate very sophisticated, complex prototypes with just a few prompts. Especially since Fable 5, and with GPT-6 Astra, Opus 5.5 and so on, I feel this trend has become really strong.
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
I'm by no means an AI expert, so please take this purely as a non-expert's guess, but I think [click]recent LLMs have gone through [click]very large-scale training specifically on single-prompt prototyping.

I don't know exactly what changed, but between the latest generation and the one before it, I feel there's a big leap that can't be explained just by progress as a language model. Don't you feel that too? My guess is they've set up some system to crank through reinforcement learning at massive scale.
-->

---

<!--
Now, it wouldn't be fair to only show the examples that went well, so let me show you a failure too.
-->

---
clicks: 2
---

# "Anime opening sequence"

<div class="video-grid titled sharp">
  <LoopVideo src="/videos/sec7/anime-op-1.mp4" />
  <LoopVideo src="/videos/sec7/anime-op-2.mp4" />
  <LoopVideo src="/videos/sec7/anime-op-3.mp4" />
  <LoopVideo src="/videos/sec7/anime-op-4.mp4" />
</div>

<img src="/images/sec7/anime-op-qr.svg" class="slide-qr" alt="QR code" />

<PopupVideo src="/videos/sec7/anime-op-hq.mp4" />

<!--
This is one where I thought, "The latest models can probably make something like an anime opening sequence," and just handed the whole thing over to try it. Let's watch a quick digest.

[click](play)[click]

As you can see, and I hate to say it, it came out looking amateurish — basically, its ambition far outran its skill. A pretty clumsy result.

But at this point I thought, there's no way the latest frontier model is only this good. So I made a few adjustments and tried again.
-->

---
clicks: 2
---

# Improved version

<div class="video-grid titled sharp">
  <LoopVideo src="/videos/sec7/music-video-1.mp4" />
  <LoopVideo src="/videos/sec7/music-video-2.mp4" />
  <LoopVideo src="/videos/sec7/music-video-3.mp4" />
  <LoopVideo src="/videos/sec7/music-video-4.mp4" />
</div>

<img src="/images/sec7/music-video-qr.svg" class="slide-qr" alt="QR code" />

<PopupVideo src="/videos/sec7/music-video-hq.mp4" />

<!--
Here's the result. Again, let's watch a quick digest.

[click](play)[click]

Pretty watchable now, don't you think?

If you look closely, of course there are still flaws. The progression is a bit generic, and some of the drawings fall apart. But relatively speaking, it's dramatically better.

So what kind of adjustments did I make?
-->

---

# What changed

<v-clicks>

- Changed the goal<br/>
  "Anime OP" → "Lyric video"
- Provided a visual reference<br/>
  (concept art / image board)

</v-clicks>

<div v-click="3" class="absolute inset-x-0 top-[50%] bottom-0 flex items-center justify-center">
  <img src="/images/sec7/schoolgirl-trio.png" class="h-[80%] rounded" />
</div>
<!--
There are two big differences.

[click]First, I changed the request from an "anime opening" to a "lyric video." I felt an anime opening was just way beyond what the current models and harnesses can do. So I set a somewhat easier goal as the landing point.

[click]Second, I gave it a visual reference. [click]I provided concept art like this and told it to build on top of that.

I think this "giving a visual reference" is a really important factor when prototyping with today's frontier models.
-->

---

<script setup>
import { useNav } from '@slidev/client'
const { isPrintMode } = useNav()
</script>

<div class="concept-grid" :class="{ shown: $nav.currentPage === $page && !isPrintMode }">
  <div v-for="(k, n) in ['smash-bots', 'cryptbound', 'football', 'salvonix', 'cozy-room', 'explainer']" :key="k">
    <figure
      v-for="(s, m) in ['concept', 'game']" :key="s"
      :style="{ '--i': n * 2 + m, '--r': `${Math.sin((n * 2 + m) * 7.3 + 1) * 2.5}deg`,
                '--x': `${Math.sin((n * 2 + m) * 3.1 + 2) * 6}px`, '--y': `${Math.sin((n * 2 + m) * 5.7 + 3) * 5}px` }"
    >
      <img :src="`/images/sec7/${k}-${s}.jpg`" />
      <figcaption>{{ m ? 'Output' : 'Concept' }}</figcaption>
    </figure>
  </div>
</div>

<style>
.concept-grid {
  height: 100%;
  display: grid;
  grid-template-columns: repeat(2, minmax(0, 1fr));
  align-content: center;
  gap: 18px 32px;
}
.concept-grid > div {
  display: flex;
  gap: 14px;
}
/* Photo prints: white frame with a handwritten caption, slight random tilt/offset */
.concept-grid figure {
  min-width: 0;
  flex: 1;
  padding: 5px 5px 0;
  background: white;
  border-radius: 2px;
  box-shadow: 0 4px 14px rgba(0, 0, 0, 0.6);
  transform: translate(var(--x), var(--y)) rotate(var(--r));
}
.concept-grid img {
  display: block;
  width: 100%;
  aspect-ratio: 16 / 9;
  object-fit: cover;
}
.concept-grid figcaption {
  padding: 0 4px;
  font-family: 'Caveat', cursive;
  font-weight: 600;
  font-size: 19px;
  line-height: 24px;
  color: black;
}
.concept-grid.shown figure {
  animation: photo-in 0.6s cubic-bezier(0.2, 0.8, 0.3, 1) calc(var(--i) * 150ms) backwards;
}
@keyframes photo-in {
  from {
    opacity: 0;
    transform: translate(calc(var(--x) - 60px), var(--y)) rotate(calc(var(--r) - 4deg));
  }
}
</style>

<!--
Actually, for the projects I've shown so far too — I've been calling them "one prompt," but I always made sure to include concept art in that prompt.

From those images, the agent draws out all kinds of things: it comes up with new designs, builds 3D scenes, fills in the world-building, writes stories... Its ability, or how well it "reads between the lines," is really striking.

And I think this, too, is a product of large-scale training. Recent LLMs can build 3D scenes or app UIs from reference images, and when it comes to this kind of "build something from a visual reference" task, they seem far more capable than you'd imagine.

As you can see, they read an enormous amount from an image. I even get the impression that giving it an image awakens some special ability inside the LLM.
-->

---
hide: true
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
Key: provide good

visual references
</v-click>

<!--
余計な喩え話をして話が逸れましたが、言いたかったのは、現状の LLM をゲームのプロトタイピングに使用する場合、[click]適切なビジュアルリファレンスを与えることには大きなメリットがあるらしい、そしてそれは、クオリティの高い結果を得るために……つまり、プロトタイピングにおけるコスパを最大化するのに適した手段であるらしい、ということです。
-->

<!--
So, when using today's frontier models for game prototyping, [click]giving them a good visual reference seems to bring a big advantage. It seems to be a great way to get high-quality results... in other words, to maximize cost-effectiveness in prototyping.

So when you prototype, be sure to give it good visual references.
-->

---
layout: bigtext
---

<v-click>
Caution: the cost-effectiveness

doesn't last
</v-click>

<!--
And one more thing to keep in mind: this cost-effectiveness probably [click]won't last long once you're past prototyping.
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
When you can get a prototype this serious for 2,000 points, [click]you might think that paying double that, or maybe three or four times, would get you to something roughly finished.

But in reality, [click]incrementally bringing a prototype toward completion eats up far more cost than you'd imagine. Until it's in proper shape, you should budget for a lot more — something like ten times the cost.
-->

---
clicks: 6
---

<div class="req-chart mt-17" :data-focus="[null, 'proto', 'proto', null, 'big'][$clicks]">
  <div class="inset" style="top: -24px">
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
  <div v-click="6" class="sum">Total 19,231 pts.</div>
  <div class="legend">
    <span><i class="r"></i>Cache read</span>
    <span><i class="w"></i>Cache write</span>
    <span><i class="o"></i>Output</span>
  </div>
</div>

<!--
This is a breakdown of the Alchemion project I showed at the start. As you can see from this graph, [click]the first prototype was generated for about 2,200 points.

[click]At this point the core systems of the game were in place, but as you can see in this screenshot, there were still plenty of gaps.

[click]I brought it toward completion through small incremental tasks, but [click]the first big overhaul alone used 4,400 points, [click]and after that I kept paying in small amounts. In the end, [click]it came to about 19,200 points in total. So it ballooned to roughly nine times the original.

That's still cheaper than the Jacquard project I showed at the beginning, but compared with how cost-effective the prototype was, it feels like it really ballooned.

So, to bring something up to a quality you can show to other people, you should roughly budget for about ten times the cost.
-->
