# Themes — 议题纵向追踪与第三圈规则

`themes.yaml` 记录**同一人生议题**跨多少次会议被提起，避免只依赖「最近 3 篇 archive」。

## 文件结构

```yaml
themes:
  - slug: zimeiti-qibu          # 英文/拼音短标识，稳定不变
    title: 自媒体起步            # 人类可读名
    aliases: [内容创作, 发第一条]  # 可选，用于匹配用户措辞
    sessions_count: 2           # 已归档会话次数（不含进行中本场）
    first_seen: 2026-05-29
    last_seen: 2026-05-30
    status: active              # active | dormant | closed
    linked_archives:
      - archive/2026-05-29-自媒体起步.md
    linked_experiment_ids:
      - exp-2026-05-29-001
    lap_note: ""                # 可选：第三圈时的核心观察，避免重复啰嗦
```

## 议题匹配（本场）

在 Deconstruct 之前判断「本场主议题」对应哪个 `slug`：

1. 用户首条消息的核心问题
2. `profile.md` → `## 近期主题` 中 `进行中` / `决策期` 条目
3. `open-loops.md` / `experiments.yaml` 的 `topic` 字段
4. `aliases` 与用户用词

若无匹配且是新议题 → 归档时 **新建** theme（`sessions_count: 0` → 归档后变 1）。

一场 session **只有一个主 theme**；次要提及不单独 +1。

## 第三圈规则（强制）

**定义**：`sessions_count` = 该议题已归档次数。用户**再次**提起同一议题时，若 `sessions_count >= 2`，本场至少是**第三圈**。

**开场必须**（匹配到该 theme 且 `sessions_count >= 2`）：

在首条实质性回复中、进入常规 Deconstruct **之前或之中**，说出第三圈观察。句式要具体，禁止空泛：

- 「[title] 这件事，档案里已经是第 [sessions_count+1] 次坐下来聊了——不是新问题，是 **又绕回来了**。上次归档时结论是 [lap_note 或最近 linked archive 一句 insight]。今天你想打破循环，还是只想把焦虑说完？」
- 若 `patterns.md` 有相关模式 → 点名模式（如完美主义、损失厌恶）
- 若 `sessions_count >= 4` → 可直说「第四圈/第五圈」，语气更锋利但仍尊重

**禁止**：假装第一次讨论；禁止只读最近 3 篇 archive 而忽略 themes。

**lap_note**：第三圈观察后，用一句话写入该 theme 的 `lap_note`（本场最有力的那句），供下次第三圈引用。

## 归档时同步（Step 4 必做）

1. 确定本场 `primary_theme_slug`
2. 若 slug 不存在 → 新建条目，`sessions_count: 1`，`first_seen`/`last_seen` = 今天
3. 若存在 → `sessions_count += 1`，`last_seen` = 今天，追加 `linked_archives`（不重复路径）
4. 链接本场新建/更新的 `experiment.id` 到 `linked_experiment_ids`
5. `status`：用户宣布议题结束 → `closed`；超过 60 天未再提 → 可标 `dormant`（review 时处理）

## 与 patterns 的分工

| 文件 | 记什么 |
|------|--------|
| `themes.yaml` | **哪件事**回来了、第几圈、链到哪些会话 |
| `patterns.md` | **怎么反应**（拖延、追近、损失厌恶等） |

第三圈话术应 **同时** 引用 theme 次数 + 相关 pattern（若有）。

## 迁移 / 回填

工作区有 `archive/` 但无 `themes.yaml`：

1. 列出 `archive/*.md`，按文件名与 `# Session:` 标题归纳 theme
2. 同一议题合并，`sessions_count` = 归档篇数，`linked_archives` 全列
3. 写回 `themes.yaml`，并在本场告知用户「已从历史归档生成议题追踪」

## 周回顾

`review-weekly.md` 中增加：扫描 `active` 且 `sessions_count >= 2` 的 theme，问用户是否要继续、关闭或合并议题。
