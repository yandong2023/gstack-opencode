# GStack for OpenCode

将 Garry Tan 的 GStack 方法论移植到 OpenCode，支持多模型、多角色的 AI 编程工作流。

## 为什么创建这个项目？

**原版 GStack 的局限**：
- 仅支持 Claude Code——一个**闭源**的 AI 编程工具
- 只能用 Claude 模型，无法使用 Kimi、GPT、DeepSeek 等其他模型
- 单一会话内切换角色，存在上下文污染问题

**本项目解决的痛点**：
- **OpenCode 是开源的**——你可以完全掌控自己的开发环境
- **模型自由**——突破 Claude 限制，使用任意模型（Kimi K2.5、GPT-4、DeepSeek 等）
- **智能分工**——根据模型特点分配角色：
  - 用 **Kimi K2.5** 做 CEO（长上下文，擅长需求分析）
  - 用 **Claude** 做代码审查（细致严谨）
  - 用 **DeepSeek** 做工程架构（推理能力强）
- **真正隔离**——每个角色独立 Agent，彻底避免上下文污染

## 核心理念

GStack 的本质不是提示词集合，而是**结构化工作流系统**——把 AI 从"万能助手"变成"按需召唤的专家团队"。

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

### 智能模型分工示例

根据不同模型的优势分配角色：

```yaml
# agents/ceo.md - 用 Kimi K2.5 做需求分析
---
model: kimi/kimi-k2.5
temperature: 0.7
---
# Kimi 长上下文强，适合梳理复杂需求

# agents/reviewer.md - 用 Claude 做代码审查
---
model: anthropic/claude-sonnet-4-20250514
temperature: 0.2
---
# Claude 细致严谨，擅长找边界情况

# agents/eng-manager.md - 用 DeepSeek 做架构设计
---
model: deepseek/deepseek-coder
---
# DeepSeek 推理能力强，适合技术方案
```

这样配置的好处：
- **成本优化**：简单任务用便宜模型，复杂任务用好模型
- **效果最大化**：每个任务都用最适合的模型
- **灵活切换**：随时可以调整，不用被单一模型锁定

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
| **工具性质** | ❌ 闭源（Anthropic 专有） | ✅ **开源**（OpenCode） |
| **支持模型** | 仅 Claude | **任意模型**（Kimi、GPT、DeepSeek 等） |
| **模型分工** | 单一模型处理所有角色 | **按模型优势分配角色** |
| **角色隔离** | 单一会话内切换 | **独立 Agent，完全隔离** |
| **可扩展性** | 固定 6 个角色 | **可自定义任意角色** |
| **数据隐私** | 依赖 Anthropic 服务 | **可自托管，完全掌控** |
| **开源协议** | 配置仓库 | **MIT** |
| **适用人群** | Claude Code 付费用户 | **所有开发者** |

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
