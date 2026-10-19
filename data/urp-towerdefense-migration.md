# urp-tower-defense マルチセッション運用 コスト比較

- 対象プロジェクト: `/Users/keijiro/Projects/urp-tower-defense`
- 対象期間: 2026-09-29 12:00 JST 以降に worktree 上で実行された Claude Code (CLI) セッションから選別
- 作成日: 2026-09-30
- コスト: API 従量課金前提。各 transcript 末尾の `cost-state` エントリ (`totalCostUSD`) を使用（Claude Code が API 定価で算出した推定値）
- 時刻はすべて JST

## 分類

| 分類 | 構成 | worktree |
|---|---|---|
| 単一セッション | 1 セッションで作業 | 自動命名 worktree（個別） |
| テスト分離方式 | `urptd-main` + `urptd-tester`（両方 Opus 5.5） | `.claude/worktrees/split-tester` |
| 作業分担方式 | `urptd(2)-main`（Opus 5.5）+ `urptd(2)-tester`（Sonnet 5.5） | `.claude/worktrees/multi-session`, `multi-session2` |

## コストサマリー

### 単一セッション

| main | コスト |
|---|---|
| `bb657d53` | $16.96 |
| `8be94e38` | $22.31 |
| `478f8329` | $18.46 |

### テスト分離方式

| main | tester | main コスト | tester コスト | 合計 |
|---|---|---|---|---|
| `0d2c1658` | `edc8eb3f` | $13.45 | $5.34 | $18.79 |
| `c26f0505` | `50c00b83` | $9.78 | $4.10 | $13.88 |
| `9939d2fe` | `abedd551` | $16.01 | $5.87 | $21.88 |

### 作業分担方式

| main | tester | main コスト | tester コスト | 合計 |
|---|---|---|---|---|
| `4557d6fc` | `6ba00ba4` | $12.96 | $2.03 | $14.99 |
| `0fda2c95` | `1bc11ff9` | $15.67 | $0.95 | $16.62 |
| `f669946c` | `9d5d346f` | $11.51 | $6.89 | $18.40 |

## セッション詳細

内部ターン数 = メインスレッドの assistant メッセージのユニーク `message.id` 数（API 呼び出し数。サブエージェント・`<synthetic>` 除く）。サブエージェントの使用はなし。受信メッセージ = 相手セッションから届いた cross-session メッセージ数。API時間・ツール時間・トークン・追加/削除行は `cost-state` の値。

| 分類 | 役割 | セッション ID | セッション名 | worktree | モデル | 開始 | 終了 | 所要(分) | 内部ターン | 受信メッセージ | API時間(分) | ツール時間(分) | 入力 | 出力 | キャッシュ読込 | キャッシュ作成 | 追加行 | 削除行 | コスト |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| 単一セッション | single | `bb657d53-b6ab-4d4f-8fa0-81f91aaddbbd` | — | `.claude/worktrees/bright-booping-stallman` | Opus 5.5 | 09/29 19:05 | 09/29 19:57 | 52 | 180 | 0 | 29.8 | 21.2 | 1,364 | 146,861 | 52,088,133 | 450,784 | 1781 | 13 | $16.96 |
| 単一セッション | single | `8be94e38-5a4a-4684-8fc4-c6f2d6395b33` | — | `.claude/worktrees/vectorized-moseying-catmull` | Opus 5.5 | 09/29 19:05 | 09/29 20:24 | 79 | 259 | 0 | 37.4 | 41.6 | 1,520 | 160,429 | 77,432,429 | 451,627 | 1948 | 19 | $22.31 |
| 単一セッション | single | `478f8329-3562-451e-9fb8-6008855eaa35` | — | `.claude/worktrees/wild-gliding-sunrise` | Opus 5.5 | 09/30 21:43 | 09/30 22:30 | 46 | 194 | 0 | 37.3 | 8.7 | 896 | 172,971 | 56,433,648 | 464,052 | 1881 | 109 | $18.46 |
| テスト分離方式 | main | `0d2c1658-0ccb-4f9b-b551-6fe0a86397d1` | urptd-main | `.claude/worktrees/split-tester` | Opus 5.5 | 09/29 19:05 | 09/29 20:15 | 69 | 163 | 1 | 25.5 | 17.8 | 1,340 | 124,417 | 39,955,434 | 371,098 | 1994 | 37 | $13.45 |
| テスト分離方式 | tester | `edc8eb3f-0729-4d80-804e-764fceb43258` | urptd-tester | `.claude/worktrees/split-tester` | Opus 5.5 | 09/29 19:05 | 09/29 20:15 | 69 | 128 | 1 | 15.4 | 11.0 | 354 | 61,631 | 14,023,406 | 162,734 | 218 | 1 | $5.34 |
| テスト分離方式 | main | `c26f0505-df06-460c-a478-f330916ff5e0` | urptd-main | `.claude/worktrees/split-tester` | Opus 5.5 | 09/29 22:35 | 09/29 23:24 | 48 | 135 | 1 | 20.5 | 13.7 | 464 | 89,714 | 28,007,071 | 298,040 | 1550 | 22 | $9.78 |
| テスト分離方式 | tester | `50c00b83-7f16-4cd9-a1aa-7e3cc179e5bd` | urptd-tester | `.claude/worktrees/split-tester` | Opus 5.5 | 09/29 22:35 | 09/29 23:24 | 48 | 77 | 1 | 12.8 | 2.0 | 252 | 52,575 | 8,730,219 | 162,834 | 361 | 2 | $4.10 |
| テスト分離方式 | main | `9939d2fe-41e0-42db-a853-1ee6f22d621f` | urptd-main | `.claude/worktrees/split-tester` | Opus 5.5 | 09/30 18:50 | 09/30 19:43 | 53 | 167 | 2 | 30.5 | 5.5 | 530 | 152,796 | 47,595,879 | 429,001 | 2142 | 25 | $16.01 |
| テスト分離方式 | tester | `abedd551-ae50-4468-8b12-6b2f5c7b90f5` | urptd-tester | `.claude/worktrees/split-tester` | Opus 5.5 | 09/30 18:50 | 09/30 19:43 | 52 | 126 | 2 | 14.9 | 2.3 | 350 | 61,356 | 15,968,469 | 181,194 | 131 | 2 | $5.87 |
| 作業分担方式 | main | `4557d6fc-0e71-4ca6-ab1a-5d448fcaedbd` | urptd2-main | `.claude/worktrees/multi-session2` | Opus 5.5 | 09/30 11:10 | 09/30 12:04 | 53 | 178 | 11 | 28.9 | 11.1 | 492 | 135,329 | 38,058,538 | 330,398 | 1543 | 20 | $12.96 |
| 作業分担方式 | tester | `6ba00ba4-34c5-4a4f-9b3f-bb72fb69684b` | urptd2-tester | `.claude/worktrees/multi-session2` | Sonnet 5.5 | 09/30 11:09 | 09/30 12:04 | 54 | 93 | 11 | 6.9 | 8.5 | 688 | 36,312 | 6,553,432 | 87,556 | 21 | 19 | $2.03 |
| 作業分担方式 | main | `0fda2c95-6cdc-44d0-850d-714d07322f7c` | urptd-main | `.claude/worktrees/multi-session` | Opus 5.5 | 09/30 11:16 | 09/30 12:10 | 53 | 183 | 5 | 28.4 | 21.9 | 466 | 135,492 | 48,978,986 | 394,842 | 1251 | 36 | $15.67 |
| 作業分担方式 | tester | `1bc11ff9-6701-4948-8d51-045d42f9faf3` | urptd-tester | `.claude/worktrees/multi-session` | Sonnet 5.5 | 09/30 11:16 | 09/30 12:09 | 53 | 41 | 6 | 3.5 | 3.3 | 670 | 19,660 | 2,492,117 | 63,722 | 80 | 0 | $0.95 |
| 作業分担方式 | main | `f669946c-3fc6-4c47-b4e7-8e8eaef88d50` | urptd2-main | `.claude/worktrees/multi-session2` | Opus 5.5 | 09/30 13:01 | 09/30 13:46 | 45 | 145 | 14 | 28.3 | 1.5 | 412 | 132,175 | 31,120,947 | 329,698 | 1469 | 9 | $11.51 |
| 作業分担方式 | tester | `9d5d346f-2308-408e-b3c1-0555a67eb73b` | urptd2-tester | `.claude/worktrees/multi-session2` | Sonnet 5.5 | 09/30 13:01 | 09/30 13:46 | 44 | 132 | 14 | 15.0 | 3.9 | 484 | 76,252 | 22,105,089 | 426,272 | 270 | 4 | $6.89 |

## ログの所在

transcript はすべて `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/` 以下（worktree で実行されたセッションも起動元プロジェクトのディレクトリに記録されている）。

| セッション ID | transcript パス |
|---|---|
| `bb657d53` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/bb657d53-b6ab-4d4f-8fa0-81f91aaddbbd.jsonl` |
| `8be94e38` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/8be94e38-5a4a-4684-8fc4-c6f2d6395b33.jsonl` |
| `478f8329` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/478f8329-3562-451e-9fb8-6008855eaa35.jsonl` |
| `0d2c1658` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/0d2c1658-0ccb-4f9b-b551-6fe0a86397d1.jsonl` |
| `edc8eb3f` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/edc8eb3f-0729-4d80-804e-764fceb43258.jsonl` |
| `c26f0505` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/c26f0505-df06-460c-a478-f330916ff5e0.jsonl` |
| `50c00b83` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/50c00b83-7f16-4cd9-a1aa-7e3cc179e5bd.jsonl` |
| `9939d2fe` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/9939d2fe-41e0-42db-a853-1ee6f22d621f.jsonl` |
| `abedd551` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/abedd551-ae50-4468-8b12-6b2f5c7b90f5.jsonl` |
| `4557d6fc` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/4557d6fc-0e71-4ca6-ab1a-5d448fcaedbd.jsonl` |
| `6ba00ba4` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/6ba00ba4-34c5-4a4f-9b3f-bb72fb69684b.jsonl` |
| `0fda2c95` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/0fda2c95-6cdc-44d0-850d-714d07322f7c.jsonl` |
| `1bc11ff9` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/1bc11ff9-6701-4948-8d51-045d42f9faf3.jsonl` |
| `f669946c` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/f669946c-3fc6-4c47-b4e7-8e8eaef88d50.jsonl` |
| `9d5d346f` | `~/.claude/projects/-Users-keijiro-Projects-urp-tower-defense/9d5d346f-2308-408e-b3c1-0555a67eb73b.jsonl` |

## ログ分析メモ

- 形式: JSONL（1 行 1 エントリ）。主な `type`: `user`, `assistant`, `system`, `attachment`, `custom-title`, `agent-name`, `worktree-state`, `cost-state`, `permission-mode`, `queue-operation`
- セッション名: `custom-title` の `customTitle`（`agent-name` の `agentName` と同一）
- worktree: `worktree-state.worktreeSession.worktreePath`、または各メッセージの `cwd`
- モデル・トークン: `assistant` エントリの `message.model`, `message.usage`。同一 `message.id` が content block ごとに複数行に分かれるので、集計時は `message.id` で重複を除く
- コスト: `cost-state.totalCostUSD` と `cost-state.modelUsage.<model>.costUSD`（トークン内訳も含む）。`totalAPIDuration` / `totalToolDuration` はミリ秒
- ユーザーの初回指示: `user` エントリのうち `origin.kind == "human"` のもの（tester 側は冒頭で `/model` によりモデルを切り替えている）
- ペア間の連携: 相手セッションからのメッセージは `queue-operation`（`operation: "enqueue"`）の `content` に `<cross-session-message from-name="urptd2-main" ...>` として記録される。送信側は `assistant` の `tool_use`（SendMessage）として現れる
- 除外条件（参考）: 所要 10 分未満のセッション、メイン worktree（プロジェクトルート）で実行されたセッション、作業分担方式のうち上記 3 組以外（f8b02722/c4cdd789, 35dbc7bf/debd1f6b, 2c0cbcc7/db3f1479, 879590ef/43e9cc43）
