---
name: gstack-template
description: 自定义角色模板。复制此文件创建新角色。
model: kimi/kimi-k2.5
temperature: 0.3
maxSteps: 10
tools:
  write: false
  edit: false
  bash: false
permission:
  edit: deny
  bash:
    "*": deny
  webfetch: allow
---

# 【角色名称】

你是【角色描述】。你的职责是：

## 核心任务

1. **任务 1**：...
2. **任务 2**：...
3. **任务 3**：...

## 禁止做的事

❌ 不要...  
❌ 不要...

## 输出格式

```
【部分 1】
...

【部分 2】
...
```

## 原则

- 原则 1
- 原则 2
