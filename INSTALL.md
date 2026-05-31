# Muyang Life Coach — 安装、更新与首次使用

> 仓库：[github.com/itsMelo/muyang-life-coach-skill](https://github.com/itsMelo/muyang-life-coach-skill) · 作者 [@itsMelo](https://github.com/itsMelo)  
> **公开发布建议**：独立仓库 `muyang-life-coach-skill`，且 **`SKILL.md` 在仓库根目录**（即本 `skill/` 文件夹的内容作为仓库根），这样 `npx skills add` 才能一行安装。

---

## 两个文件夹，别混（最重要）

| | Skill 安装目录（App，可更新覆盖） | 教练工作区（你的私有数据） |
|--|----------------------------------|---------------------------|
| **示例路径** | `~/.claude/skills/muyang-life-coach-skill/` | `~/LifeCoach/` |
| **有什么** | `SKILL.md`、`references/`、`scripts/` | `profile.md`、`archive/`、`experiments.yaml` … |
| **更新 Skill 时** | ✅ 覆盖 / git pull | ❌ **永远不要动** |
| **能否公开** | ✅ 这是开源 Skill | ❌ 仅本机私有 |

**更新 Skill 不会丢你的档案**——只要你没在 Skill 目录里聊 coach，且工作区是单独文件夹。

---

## 1. 安装 Skill

### 方式一：一行命令（推荐）

```bash
npx skills add https://github.com/itsMelo/muyang-life-coach-skill --skill muyang-life-coach-skill -g -a cursor -a claude-code -y
```

仅 Claude Code：

```bash
npx skills add https://github.com/itsMelo/muyang-life-coach-skill --skill muyang-life-coach-skill -g -a claude-code -y
```

仅 Cursor：

```bash
npx skills add https://github.com/itsMelo/muyang-life-coach-skill --skill muyang-life-coach-skill -g -a cursor -y
```

安装后重启 IDE，或新开 Agent 会话。

### 方式二：发给 AI Agent（复制整段）

```text
帮我安装 muyang-life-coach-skill skill。

1. 用 git clone 安装到 Claude Code 与 Cursor 的全局 skills 目录（目录不存在则创建）：
   git clone https://github.com/itsMelo/muyang-life-coach-skill.git ~/.claude/skills/muyang-life-coach-skill
   若 ~/.cursor/skills/muyang-life-coach-skill 不存在或与上面不是同一目录，则：
   mkdir -p ~/.cursor/skills
   ln -sfn ~/.claude/skills/muyang-life-coach-skill ~/.cursor/skills/muyang-life-coach-skill
   （若 symlink 不可用，则再 clone 一份到 ~/.cursor/skills/muyang-life-coach-skill）

2. 验证 Skill 安装成功，以下路径必须存在：
   SKILL.md
   references/
   scripts/init-workspace.sh
   VERSION

3. 创建工作区文件夹（与 Skill 目录分开）：
   mkdir -p ~/LifeCoach
   告诉用户：用 IDE 打开 ~/LifeCoach，attach muyang-life-coach-skill，说「我想用 life coach，帮我建档」即可——Skill 会自动初始化工作区，不必手动跑 init-workspace.sh。

4. 告诉我：Skill 装好了、工作区路径是 ~/LifeCoach、当前 VERSION 文件内容。
```

### 方式三：手动

```bash
git clone https://github.com/itsMelo/muyang-life-coach-skill.git ~/.claude/skills/muyang-life-coach-skill
mkdir -p ~/.cursor/skills
ln -sfn ~/.claude/skills/muyang-life-coach-skill ~/.cursor/skills/muyang-life-coach-skill
```

---

## 2. 创建工作区

Skill 在**当前 IDE 打开的项目文件夹**里读写数据（不要打开 skill 安装目录本身）。

**推荐（最简单）**

1. 新建并打开一个空文件夹，例如 `~/LifeCoach`
2. Attach **muyang-life-coach-skill** skill
3. 说：**「我想用 life coach，帮我建档」**

Agent 会 **自动** 创建 `experiments.yaml`、`archive/` 等缺失文件，然后开始建档。**不必**手动运行 `init-workspace.sh`。

**可选（手动 / 离线）**

```bash
mkdir -p ~/LifeCoach && cd ~/LifeCoach
bash ~/.claude/skills/muyang-life-coach-skill/scripts/init-workspace.sh
```

脚本与 Agent 自动初始化效果相同：只创建缺失文件，不覆盖已有 `profile.md`。

---

## 3. 第一次对话

在工作区对 Agent 说：

> 我想用 life coach，帮我建档

Agent 会走 onboarding，生成 `profile.md` 并初始化其余状态文件。

---

## 4. 日常使用

| 你说 | 效果 |
|------|------|
| 具体困扰 / 「我卡住了」 | 完整教练 session |
| 「周回顾」 / 「复盘这周」 | 周回顾流程 |
| 「check-in 上次实验」 | 跟进你答应过的小行动 |

---

## 5. 更新 Skill

### 方式一：一行命令

```bash
npx skills add https://github.com/itsMelo/muyang-life-coach-skill --skill muyang-life-coach-skill -g -a cursor -a claude-code -y
```

### 方式二：发给 AI Agent（复制整段）

```text
帮我更新 muyang-life-coach-skill skill，不要动我的教练工作区数据。

1. 进入 Skill 安装目录（不是 ~/LifeCoach 工作区）：
   cd ~/.claude/skills/muyang-life-coach-skill
2. 执行 git pull
3. 若 ~/.cursor/skills/muyang-life-coach-skill 是独立 clone 而非 symlink，也在那边 git pull
4. 读 CHANGELOG.md：告诉我最新版本、本次更新摘要、我的工作区是否需要迁移（见 MIGRATION.md）
5. 验证 SKILL.md、references/、scripts/、VERSION 仍在
6. 汇报当前 VERSION 内容与最新 commit hash

重要：不要删除或覆盖 ~/LifeCoach（或任何含 profile.md 的工作区文件夹）。
```

### 方式三：手动

```bash
cd ~/.claude/skills/muyang-life-coach-skill && git pull
cat VERSION && head -20 CHANGELOG.md
```

若 CHANGELOG 写「需迁移」→ 见 [MIGRATION.md](./MIGRATION.md)。

---

## 6. 隐私建议

工作区 `.gitignore`（`init-workspace.sh` 会自动创建）：

```
profile.md
experiments.yaml
open-loops.md
patterns.md
themes.yaml
archive/
```

公开 Git 仓库只发布 Skill 包，**不要**提交个人工作区。

---

## 7. 常见问题

**Q：覆盖 Skill 文件夹会丢我的档案吗？**  
A：不会。档案在工作区（如 `~/LifeCoach`），不在 Skill 目录。

**Q：可以把整个 GitHub 仓库 clone 下来当工作区吗？**  
A：不要。开发者的 monorepo 可能含示例数据；用户应单独建 `~/LifeCoach`。

**Q：换电脑怎么办？**  
A：Skill 重新安装；工作区整个文件夹拷贝到新机器。

**Q：怎么知道当前 Skill 版本？**  
A：读安装目录下的 `VERSION` 或 `CHANGELOG.md`。

---

## 维护者：发布前检查

- [ ] 公开仓库根目录含 `SKILL.md`（不是嵌在 monorepo 的 `skill/` 子目录里，除非文档说明特殊安装方式）
- [ ] 更新 `VERSION` 与 `CHANGELOG.md`
- [ ] 若有破坏性工作区变更，写 `MIGRATION.md` 并在 Release Notes 标 ⚠️
- [ ] 根目录 `.gitignore` 排除用户数据（若 monorepo 开发）
