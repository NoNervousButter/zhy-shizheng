# ZHY-ShiZheng

中文 | [English](#english)

`ZHY-ShiZheng` 是一个面向实证论文写作的 Codex Skill，重点服务于使用 Stata 的经济学、金融、会计、管理学与相关社会科学研究。

它提供一套可复用的标准化流程，用于：

- 数据审计与样本构建
- 描述性统计
- 相关性分析
- 基准回归
- 调节效应与扩展模型
- 内生性检验
- 2-3 个稳健性检验
- Word 论文表格与结果说明输出

## 目录结构

- `SKILL.md`: Skill 主说明与流程规范
- `scripts/`: Stata 模板脚本
- `references/`: 方法标准、稳健性与 Word 表格规范
- `agents/openai.yaml`: Skill 元数据

## 适用场景

当你需要让 Codex 协助完成一套完整的实证论文流程时，可以使用这个 Skill，例如：

- 基于 `.dta` 或 `.csv` 面板数据建立 Stata 工作流
- 为新论文快速搭建描述统计、回归与稳健性框架
- 将 Stata 输出整理成符合学术论文标准的 Word 表格
- 在本地 Stata 环境中与 `stata-mcp` 配合实现自动化执行

## 快速开始

1. 准备数据集与变量定义。
2. 让 Codex 使用 `ZHY-ShiZheng` 生成或改写项目专用 `.do` 文件。
3. 根据研究设计补充：
   - 因变量
   - 核心解释变量
   - 控制变量
   - 固定效应
   - 聚类层级
   - 内生性与稳健性方案
4. 在本地 Stata 或 `stata-mcp` 环境中执行脚本。
5. 输出回归表、稳健性表和 Word 结果说明。

## 与 Stata MCP 配合

这个仓库本身是 Skill，不直接内置 Stata。

如果你已经配置好本地 `stata-mcp`，Codex 可以进一步：

- 调用本地 Stata 执行 `.do` 文件
- 读取回归输出与报错
- 自动修正脚本并迭代
- 生成 Word-ready 表格和简要结果解读

## 说明

- 这个 Skill 提供的是标准化流程与模板，不是固定变量名的黑盒程序。
- 每个新项目都可以自定义回归模型、变量映射、识别策略和稳健性检验。
- Skill 不能替代研究设计本身；识别策略是否可信仍取决于论文问题与数据条件。

---

## English

`ZHY-ShiZheng` is a Codex skill for empirical paper workflows, designed primarily for Stata-based research in economics, finance, accounting, management, and related social sciences.

It provides a reusable end-to-end structure for:

- data audit and sample construction
- descriptive statistics
- correlation analysis
- baseline regressions
- moderation and extended models
- endogeneity checks
- 2-3 robustness tests
- Word-ready academic tables and result summaries

## Repository Structure

- `SKILL.md`: main skill instructions and workflow standards
- `scripts/`: Stata workflow templates
- `references/`: methodological notes, robustness menus, and Word-table standards
- `agents/openai.yaml`: skill metadata

## Typical Use Cases

Use this skill when you want Codex to help build a full empirical-paper workflow, for example:

- creating a Stata workflow from `.dta` or `.csv` panel data
- scaffolding descriptives, regressions, and robustness tests for a new paper
- exporting results into Word-ready academic tables
- combining Codex with a local Stata environment through `stata-mcp`

## Quick Start

1. Prepare the dataset and variable definitions.
2. Ask Codex to use `ZHY-ShiZheng` to generate or adapt project-specific `.do` files.
3. Fill in the research design details:
   - dependent variable
   - key explanatory variables
   - controls
   - fixed effects
   - clustering level
   - endogeneity and robustness strategy
4. Run the workflow in local Stata or through `stata-mcp`.
5. Export regression tables, robustness tables, and short Word-ready result notes.

## Working With Stata MCP

This repository is a skill layer. It does not bundle Stata itself.

If `stata-mcp` is configured locally, Codex can also:

- run `.do` files in local Stata
- read regression output and errors
- revise scripts iteratively
- generate Word-ready tables and concise interpretations

## Notes

- This skill is a workflow template, not a fixed-variable black box.
- New datasets can use fully customized variable mappings, model choices, identification strategies, and robustness checks.
- The skill improves execution quality, but it does not replace a credible research design.
