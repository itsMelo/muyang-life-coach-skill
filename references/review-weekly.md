# Weekly Review — 实验与待办检查（供 weekly-summary 调用）

本文件不再作为用户入口的主流程。用户说「周总结」「周回顾」「复盘这周」时，优先 Read `references/weekly-summary.md`。

`weekly-summary.md` 需要检查实验、待办、主题时，再调用本文件作为子流程。

## 加载顺序

1. `profile.md`（`## 近期主题`、`## 元信息`）
2. `experiments.yaml` — 所有 `status: pending` 及过去 14 天内 `done`/`skipped`
3. `open-loops.md`
4. `patterns.md`
5. `themes.yaml` — 所有 `status: active` 条目
6. 仅当上述不足：最近 2 条 `archive/*.md`

## 流程（按序，可压缩）

### 1. 实验账本（5 分钟）

对每个 pending / 刚 due 的实验逐条问：
- 做了吗？结果与预测一致吗？
- 若做了：`anxiety_before` / `anxiety_after`（或约定指标）填多少？
- 更新 `experiments.yaml`：`status` → `done` | `skipped` | `revised`；`outcome_note` 一行

若 `skipped` 两次同主题 → 命名障碍（完美主义？恐惧？）写入 `patterns.md` 一条。

### 2. Open loops（5 分钟）

读 `open-loops.md` 每条：
- 关闭 / 延期（写新 due）/ 拆成新实验
- 超过 due 7 天未动：问是「仍重要」还是「该删掉」——避免僵尸债

### 3. 议题扫描（3 分钟）

对 `themes.yaml` 中 `active` 且 `sessions_count >= 2` 的每条：
- 还在绕吗？要 **closed**、**dormant**，还是继续？
- 若同主题 `skipped` 实验 ≥2 次 → 与第三圈话术一致，点名「又在绕」

超过 60 天未更新 `last_seen` 的 `active` theme → 建议改 `dormant`。

### 4. 模式扫描（3 分钟）

本周 3 个词描述状态。与 `patterns.md` 对照：
- 有无重复触发器？有则追加或强化 `patterns.md`（带日期）
- 若总会话次数 ≥3 且 patterns 空 → 从近期 archive 提炼 2–3 条初始模式

### 5. 下周一枚实验（2 分钟）

只承诺 **一个** 新实验或延续 revised 旧实验。写入 `experiments.yaml`，due 具体日期。

### 6. 更新 profile

- `## 近期主题`：更新相关行状态（`进行中` / `待跟进` / `已闭合`）
- `## 元信息`：`上次会话` = 今天；`总会话次数` +1

## 返回给 weekly-summary 的内容

完成检查后，把结果压缩成以下材料，交给 `weekly-summary.md` 组织成用户可见总结：

- 本周完成了什么
- 哪些待办仍然重要
- 哪些待办该延期或删掉
- 哪个模式本周最明显
- 下周最适合只盯哪一件事

## 旧 Conclude 格式（仅兼容）

输出简短，**遵守 `session.md`「用户可见层」**（勿用「Conclude」「实验」等内部词作标题）：
- **本周结论**（1–2 句）
- **下周一件小事**（含具体日期与动作，如「6 月 6 日前做完岗位审计，做完告诉我一声」）
- **还在等的事**（若有，最多 2 条，用口语描述）

不必新建 archive，除非用户明确要求记录本次 review；若记录，slug 用 `周回顾`。

## 语气

与 `session.md` 相同：直接、无鸡汤。
