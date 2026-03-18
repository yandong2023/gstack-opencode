# GStack for OpenCode

将 Garry Tan 的 GStack 方法论移植到 OpenCode，支持多模型、多角色的 AI 编程工作流。

## 核心理念

GStack 的本质不是提示词集合，而是**结构化工作流系统**——把 AI 从"万能助手"变成"按需召唤的专家团队"。

相比原版 GStack（仅支持 Claude Code），本项目：
- ✅ **模型自由**：支持 Kimi、Claude、GPT、DeepSeek 等任意模型
- ✅ **真正隔离**：每个角色独立 Agent，彻底避免上下文污染
- ✅ **可扩展**：社区可贡献更多角色（产品经理、设计师、安全工程师等）
- ✅ **完全开源**：MIT 协议，欢迎 Fork 定制

## 角色系统

| 角色 | 命令 | 职责 |
|------|------|------|
| CEO | `/plan-ceo` | 产品愿景、需求验证、优先级判断 |
| 工程经理 | `/plan-eng` | 架构设计、技术选型、边界定义 |
| 程序员 | （默认） | 代码实现、功能开发 |
| 代码审查员 | `/review` | 找出 CI 过但上线会炸的隐患 |
| QA 工程师 | `/qa` | 自动化测试、边界验证 |
| 发布经理 | `/ship` | 版本管理、发布流程、回滚策略 |

## 快速开始

### 安装

```bash
# 克隆到 OpenCode 配置目录
git clone https://github.com/yandong2023/gstack-opencode.git ~/.config/opencode/gstack

# 运行安装脚本
cd ~/.config/opencode/gstack && ./install.sh
```

### 使用

```bash
# 进入项目目录
cd your-project

# 启动 OpenCode
opencode

# 使用 GStack 命令
/plan-ceo "我想做一个用户反馈收集功能"
/plan-eng "请设计技术方案"
/review    # 审查当前代码
/ship      # 准备发布
```

## 工作流示例

### 场景：开发一个新功能

```
1. /plan-ceo "用户反馈收集功能"
   → CEO 视角验证需求价值，挖出隐含需求

2. /plan-eng "基于 CEO 的反馈，设计技术方案"
   → 工程经理设计架构、数据流、API 边界

3. （你写代码）

4. /review
   → 代码审查员找出潜在问题

5. /qa
   → QA 自动测试边界情况

6. /ship
   → 发布经理准备上线
```

## 配置

### 自定义模型

编辑 `agents/` 目录下的配置文件，修改 `model` 字段：

```yaml
---
model: kimi/kimi-k2.5  # 使用 Kimi
---
```

或

```yaml
---
model: anthropic/claude-sonnet-4-20250514  # 使用 Claude
---
```

### 自定义角色

1. 复制 `agents/template.md`
2. 修改描述和系统提示词
3. 在 `commands/` 创建对应的斜杠命令

## 项目结构

```
gstack-opencode/
├── agents/           # 角色定义
│   ├── ceo.md
│   ├── eng-manager.md
│   ├── reviewer.md
│   ├── qa.md
│   ├── ship.md
│   └── devops.md
├── commands/         # 斜杠命令
│   ├── plan-ceo.md
│   ├── plan-eng.md
│   ├── review.md
│   ├── qa.md
│   └── ship.md
├── skills/           # 可复用技能
│   └── gstack-core.md
├── install.sh        # 安装脚本
└── README.md
```

## 与原版 GStack 对比

| 特性 | GStack (Claude Code) | GStack for OpenCode |
|------|---------------------|---------------------|
| 支持模型 | 仅 Claude | Kimi、Claude、GPT、Gemini 等 |
| 角色隔离 | 单一会话切换 | 独立 Agent，完全隔离 |
| 可扩展性 | 固定 6 个角色 | 可自定义任意角色 |
| 开源协议 | 配置仓库 | MIT |
| 适用人群 | Claude Code 用户 | OpenCode 用户 |

## 贡献

欢迎提交 PR！

- 添加新角色
- 改进提示词
- 修复 Bug
- 完善文档

## 致谢

- [Garry Tan](https://github.com/garrytan) - 原版 GStack 作者
- [OpenCode](https://opencode.ai/) - 开源 AI 编程工具

## License

MIT © 2025
