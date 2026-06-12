# Changelog

本文件记录 **Skill 包**（安装目录）的变更。用户工作区里的 `profile.md`、`archive/` 等不在此列。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)。

## [0.6.2] - 2026-06-11

### Changed

- 新增 `references/humanizer-quick.md`（~110 行）：合并原 humanizer-pass 教练语气规则 + 教练场景 Top 12 AI 味扫描 + 7 问终检
- 日常回复终检改为只 Read `humanizer-quick.md`；完整 bundled humanizer（582 行）仅在长文、用户投诉 AI 味、或 quick pass 不过关时读取
- `SKILL.md`、`session.md`、`follow-up.md`、`weekly-summary.md` 引用已更新
- `humanizer-pass.md` 改为指向 humanizer-quick 的兼容指针

### 用户升级说明

- 无需改工作区文件；重新 sync / attach skill 即可
- 教练回复质量规则不变，context 消耗显著降低（每条回复约少 ~650 行 reference 读取）

## [0.6.1] - 2026-06-07

### Changed

- `references/casual-chat.md`：漫谈提问从「题库抽题」改为「根据用户原话、近期状态、未闭合事项现场生成具体问题」
- 增加问题生成模板：场景化、二选一、轻量回看、贴档案追问
- 明确题库只是备用灵感，不能机械照搬，避免高频使用时重复和抽象

### 用户升级说明

- Skill 目录 `git pull` 即可；工作区数据无需迁移
- 漫谈会更像朋友追问具体场景，而不是反复问抽象问题

---

## [0.6.0] - 2026-06-07

### Added

- `references/casual-chat.md`：新增「漫谈」能力，用户没有明确问题时也能低压力聊天、观察情绪和模式
- `references/weekly-summary.md`：新增「每周总结」能力，总结本周情绪、认知、行为、完成事项、未闭合事项和下周重点
- 周末轻提醒：周六/周日用户打开对话且没有明确任务时，可询问是否做本周总结

### Changed

- `SKILL.md`：Step 3 路由新增 casual / weekly 两个独立入口
- `references/session.md`：增加 session、漫谈、周总结、追问的边界说明
- `references/review-weekly.md`：降级为 `weekly-summary.md` 的实验与待办检查子流程，避免周回顾规则打架

### 用户升级说明

- Skill 目录 `git pull` 即可；工作区数据无需迁移
- 漫谈默认不强制归档，只有出现新事实、新模式、新待办或稳定主题时才写入状态

---

## [0.5.4] - 2026-06-07

### Changed

- `references/humanizer-pass.md`：强化「关键话语独立成段并加粗」规则，让重点更清楚
- `references/session.md`：默认把私下写备忘录改为「直接回答教练的问题」，便于后续记忆和档案更新
- `references/follow-up.md`：追问收敛动作改为「回答我几个问题」，而不是只给私下练习

### 用户升级说明

- Skill 目录 `git pull` 即可；工作区数据无需迁移
- 输出会更强调重点句，并鼓励用户直接把答案回给教练

---

## [0.5.3] - 2026-06-07

### Added

- `references/follow-up.md`：新增独立「追问」能力
- 自动触发场景：用户表达不知道、矛盾、无法理解、动机不清、高赌注判断、信息不足时，先追问再给结论
- 追问节奏：默认最多 3 轮，每轮 1 个主问题，回答后先复述和提炼，再决定继续或收敛

### Changed

- `SKILL.md` Step 3：在 session 流程中加入追问模块
- `references/session.md`：用户可见流程扩展为「朋友层共鸣 → 必要时追问 → 学科/模式解释 → 教练层行动」

### 用户升级说明

- Skill 目录 `git pull` 即可；工作区数据无需迁移
- 遇到不确定、矛盾、高赌注问题时，教练会更倾向先问清楚，不会急着替用户下结论

---

## [0.5.2] - 2026-06-07

### Changed

- `references/humanizer-pass.md`：默认回复结构升级为 **朋友层共鸣 → 学科/模式解释 → 教练层行动**
- `references/session.md`：用户可见层增加「为什么这是正常反应」的解释段，强调分段落、突出重点
- 方案段限制为 1-3 个具体动作，避免长清单和模板式回复

### 用户升级说明

- Skill 目录 `git pull` 即可；工作区数据无需迁移
- 回复会更稳定地先共情，再解释模式，最后给可执行动作

---

## [0.5.1] - 2026-06-07

### Added

- `references/bundled/humanizer-main/`：完整内置 `humanizer-main` skill（`SKILL.md`、`README.md`、`LICENSE`、`AGENTS.md`、`ATTRIBUTION.md`）
- `references/humanizer-pass.md`：教练专属的人话叠加层，要求先情感共鸣，再给具体方案

### Changed

- `SKILL.md` Step 3：发送前强制读取 bundled `humanizer-main/SKILL.md`，再读取 `humanizer-pass.md`
- `references/session.md`：教练身份从 sharp direct 调整为 warm direct，并要求先接住情绪再给下一步
- 用户只需安装 / attach `muyang-life-coach-skill`，无需额外安装 `/humanizer-main`

### 用户升级说明

- Skill 目录 `git pull` 即可；工作区数据无需迁移
- 发布包现在自带 humanizer-main 能力

---

## [0.4.2] - 2026-05-31

### Changed

- Skill 正式命名为 **`muyang-life-coach-skill`**（安装目录、GitHub 仓库、`SKILL.md` name 字段）
- 产品展示名：**Muyang Life Coach**

### 用户升级说明

- 若曾安装旧名 `life-coach`：可删除旧目录或保留；重新 `npx skills add .../muyang-life-coach-skill` 即可
- **工作区数据不受影响**，无需迁移

---

## [0.4.1] - 2026-05-31

### Changed

- `SKILL.md` Step 1：**自动执行** `init-workspace.sh`（缺状态文件时），用户不必手动跑脚本
- `INSTALL.md` / `README.md`：工作区初始化改为「打开空文件夹 + 建档即可」

### 用户升级说明

- Skill 目录：`git pull` 即可；工作区无需改动

---

## [0.4.0] - 2026-05-31

### Added

- `session.md`：**用户可见层 vs 系统层**——回复正文禁止暴露 Conclude、experiment 等内部术语
- `INSTALL.md`：`npx skills add` 安装、`git pull` 更新、AI Agent 安装/更新话术
- `CHANGELOG.md`、`VERSION`、`MIGRATION.md`

### Changed

- `SKILL.md`：实验到期追问、归档收尾改为用户口语
- `review-weekly.md`：输出遵守用户可见层

### 用户升级说明

- **Skill 目录**：覆盖或 `git pull` 即可
- **工作区**：无需改动
- **迁移**：无

---

## [0.3.0] - 2026-05-30

### Added

- `themes.yaml` + 第三圈议题追踪（`references/themes.md`）
- Playbooks：habit-start、finance-risk、decision、relationship
- `scripts/init-workspace.sh`

### 用户升级说明

- **工作区迁移**：若已有 `profile.md` 但缺 `themes.yaml`，打开工作区对 Agent 说：「帮我迁移 muyang-life-coach-skill 工作区，补全 themes.yaml」——或见 `MIGRATION.md`

---

## [0.2.0] - 2026-05-29

### Added

- 初始 coach 流程：`profile.md`、`experiments.yaml`、`open-loops.md`、`patterns.md`、`archive/`
- Onboarding（`references/onboarding.md`）

### 用户升级说明

- 新用户：运行 `init-workspace.sh` 后建档即可
