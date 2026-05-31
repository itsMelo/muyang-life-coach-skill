# 工作区迁移指南

**Skill 更新 ≠ 工作区重装。** 绝大多数版本只需更新 Skill 安装目录；只有 Release Notes 写明「需迁移」时才动工作区。

## 原则

| 操作 | 影响 Skill（App） | 影响工作区（你的数据） |
|------|------------------|----------------------|
| `npx skills add` / `git pull` 更新 Skill | ✅ 更新 | ❌ 不动 |
| 覆盖 `~/.cursor/skills/muyang-life-coach-skill/` | ✅ 更新 | ❌ 不动 |
| 在工作区跑 `init-workspace.sh` | ❌ | ✅ 仅**创建缺失**文件，不覆盖已有 |
| 删除工作区 `profile.md` | ❌ | ⚠️ 丢档案 |

**千万不要**把 Skill 安装目录当作教练工作区打开聊天（例如在 `~/.claude/skills/muyang-life-coach-skill/` 里生成 `profile.md`）。

---

## v0.2 → v0.3：补 `themes.yaml`

**症状**：有 `profile.md` 和 `archive/`，但没有 `themes.yaml`。

**做法（任选其一）**：

对 Agent 说（在工作区目录）：

```text
请初始化 muyang-life-coach-skill 工作区缺失文件。
```

或手动：

```bash
cd ~/LifeCoach   # 换成你的工作区路径
bash ~/.claude/skills/muyang-life-coach-skill/scripts/init-workspace.sh
```

然后对 Agent 说：

```text
我的 muyang-life-coach-skill 工作区缺 themes.yaml，请按 references/themes.md 的「迁移 / 回填」节，从 archive/ 归纳议题并写回 themes.yaml，不要丢历史。
```

---

## v0.3 → v0.4

无需迁移。Skill 对话语气与安装文档有更新，工作区文件格式不变。

---

## 不确定时

对 Agent 说：

```text
我刚更新了 muyang-life-coach-skill skill，请读 CHANGELOG.md 和 MIGRATION.md，检查我的工作区是否需要迁移。工作区路径是：~/LifeCoach
```

（把路径换成你的实际文件夹。）
