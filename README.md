# GStack for OpenCode 🚀

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)
[![OpenCode Compatibility](https://img.shields.io/badge/OpenCode-Compatible-brightgreen)](https://opencode.ai/)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-blue.svg)](CONTRIBUTING.md)

> **Port Garry Tan's GStack methodology to OpenCode.**  
> A structured, multi-model, multi-role AI programming workflow for world-class development.

---

[English](#english) | [中文](#chinese)

<a name="english"></a>

## 🌐 Overview

**GStack for OpenCode** is more than just a set of prompts; it's a **Structured Workflow System**. It transforms AI from a "jack-of-all-trades" assistant into a specialized team of experts summoned on demand.

### Why GStack for OpenCode?

- **Open Source First**: Fully compatible with [OpenCode](https://opencode.ai/), giving you complete control over your environment.
- **Model Agnostic**: Break free from provider lock-in. Use Kimi for reasoning, Claude for review, and DeepSeek for architecture.
- **True Isolation**: Each role is a separate Agent, preventing context contamination.
- **Expert Specialization**: Every task is handled by the best-fit model for the job.

## 🏗️ Architecture & Workflow

```mermaid
graph LR
    A[CEO /plan-ceo] -->|Verify Value| B[Eng Manager /plan-eng]
    B -->|Design Architecture| C[Developer Default]
    C -->|Implementation| D[Reviewer /review]
    D -->|Security Audit| E[Security /security]
    E -->|UI/UX Review| F[Design /design]
    F -->|Validation| G[QA /qa]
    G -->|Documentation| H[Docs /docs]
    H -->|Preparation| I[Ship /ship]
    I -->|Release| J(Success)
```

## 🎭 Role System

| Role | Command | Focus | Model Recommendation |
|------|---------|-------|----------------------|
| **CEO** | `/plan-ceo` | Product Vision, MVP Scope | Kimi K2.5 (Context) |
| **Eng Manager** | `/plan-eng` | Architecture, Tech Choice | DeepSeek Coder (Logic) |
| **Developer** | (Default) | Implementation | Claude 3.5 Sonnet |
| **Reviewer** | `/review` | Critical Bugs, Logic | Claude 3.5 Sonnet |
| **Security** | `/security` | Vulnerabilities, Privacy | Claude 3.5 Sonnet |
| **Designer** | `/design` | UI/UX, Accessibility | Claude 3.5 Sonnet |
| **QA** | `/qa` | Edge Cases, Automation | DeepSeek Coder |
| **Docs** | `/docs` | Documentation, Comments | GPT-4o |
| **Ship** | `/ship` | Release, Rollback Plan | Kimi |

## 🇨🇳 Domestic Model Support (DeepSeek/Kimi/GLM)

If you encounter `ERR_INVALID_URL` or other issues with `opencode auth login`, use the **Environment Variable Workaround** to connect domestic models (e.g., DeepSeek):

1. **Skip `opencode auth login`**.
2. **Export Environment Variables**:
   ```bash
   # Add these to your .zshrc or .bashrc
   export OPENAI_API_KEY="your-deepseek-api-key"
   export OPENAI_BASE_URL="https://api.deepseek.com/v1"
   ```
3. **Run OpenCode**:
   ```bash
   cd your-project
   opencode
   /plan-ceo "Analyze my project"
   ```

*Note: In this mode, GStack roles use `openai/deepseek-coder` as the model identifier.*

## 🚀 Quick Start

### Installation

```bash
# Clone the repository
git clone https://github.com/yandong2023/gstack-opencode.git

# Install using the script or Makefile
cd gstack-opencode && make install

# Validate installation
make validate
```

### Usage

1. Open your project directory.
2. Run `opencode`.
3. Invoke roles: `/plan-ceo "Build a user feedback system"`

---

<a name="chinese"></a>

## 🌐 概述

**GStack for OpenCode** 不仅仅是一组 Prompt，它是一套 **结构化工作流系统**。它将 AI 从一个「万事通」助手，转变为一支按需召唤的专家团队。

### 为什么选择 GStack for OpenCode？

- **开源优先**：完全适配 [OpenCode](https://opencode.ai/)，让你掌控自己的开发环境。
- **模型自由**：打破单一模型限制。用 Kimi 做需求分析，用 Claude 做代码审计，用 DeepSeek 做架构设计。
- **真正隔离**：每个角色都是独立 Agent，彻底杜绝上下文污染。
- **专业分工**：根据每个模型的长处分配最适合的角色任务。

## 🏗️ 架构与工作流

```mermaid
graph LR
    A[CEO /plan-ceo] -->|需求验证| B[工程经理 /plan-eng]
    B -->|架构设计| C[程序员 默认]
    C -->|代码实现| D[代码审查 /review]
    D -->|安全审计| E[安全专家 /security]
    E -->|UI/UX 评审| F[设计师 /design]
    F -->|自动化测试| G[QA /qa]
    G -->|文档审计| H[文档专家 /docs]
    H -->|发布准备| I[发布经理 /ship]
    I -->|上线发布| J(成功)
```

## 🎭 角色系统

见上表。

## 🚀 快速开始

### 安装

```bash
# 克隆仓库
git clone https://github.com/yandong2023/gstack-opencode.git

# 使用 Makefile 或脚本安装
cd gstack-opencode && make install
```

## 🤝 贡献

我们欢迎任何形式的贡献！请参阅 [CONTRIBUTING.md](CONTRIBUTING.md)。

## 📜 许可证

本项目采用 [MIT](LICENSE) 许可证。

---

## 🙏 致谢

- [Garry Tan](https://github.com/garrytan) - GStack 方法论创始人
- [OpenCode](https://opencode.ai/) - 开源 AI 编程利器
