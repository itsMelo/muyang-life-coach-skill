# Changelog

本文件记录 **Skill 包**（安装目录）的变更。用户工作区里的 `profile.md`、`archive/` 等不在此列。

格式基于 [Keep a Changelog](https://keepachangelog.com/zh-CN/1.0.0/)。

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
