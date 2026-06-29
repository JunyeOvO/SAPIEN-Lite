# 从仿生学报告到 SAPIEN-Lite Agent 工作流的过程还原

## Source

本还原基于本地报告：

`C:\Users\fujunye\Downloads\从第一性原理重构 Agent 工作流：人类仿生学与软件工程的模拟、对比与迭代研究 (1).docx`

只抽取报告的结构、机制和评价维度，不复制报告全文。

## 1. 阅读报告得到的问题定义

报告的起点不是“再实现一个更复杂的 Agent”，而是把 Agent 看成一个在部分可观测、资源受限、风险不对称环境中行动的系统。由此推导出的核心代价包括：

- 任务损失。
- token、工具调用、时延与能耗。
- 不可逆风险。
- 解释缺口。
- 多 Agent 协调开销。

因此，SAPIEN-Lite 的本地工作流不应以“默认多想几轮”作为主策略，而应先预测预期观察，再用惊异、风险和证据冲突决定是否升级审议。

## 2. 从报告机制到本地 Agent 规则

报告提出 SAPIEN：Surprise-driven Active Prediction, Immune Evaluation, and Neural consolidation。转成本地 Agent workflow 后，它对应以下规则：

1. 先做感知门控：只读与目标、状态变化、安全和证据有关的材料。
2. 限制工作记忆：每轮只保留目标、约束、证据、下一步动作四类活跃信息。
3. 先预测后行动：每次关键检查前写出 expected observation。
4. 用 utility-risk-cost 选择动作：优先低风险、高证据、低成本动作。
5. 用免疫守卫拦截异常：路径错误、注入文本、schema 不匹配、全局副作用和越权写入都先隔离。
6. 只有高惊异、高风险或证据冲突时才进入慢回路审议。
7. 用黑板工件协作：把状态写进 `work/`，不要只留在聊天历史。
8. 用 replay 巩固：把结果变成测试、规则、文档或 harness 字段。
9. 用稳态预算控制：简单任务不浪费长推理，高风险任务不省略验证。

## 3. 本次建立 Agent 工作流的实际过程

### Phase A - 空仓库 scaffold

初始 SAPIEN-Lite 仓库只有 `README.md`。先建立了三件 project-local scaffold：

- `work/codex-blackboard.md`
- `work/codex-verification-log.md`
- `work/codex-evaluation-harness.md`

当时的目标是先创建轻量、本地、可逆、可审计的 workflow 框架。

### Phase B - 路径与远端纠偏

第一次落地时误把 scaffold 推到了 World 系统仓库。用户纠正后，workflow 被推送到 `JunyeOvO/SAPIEN-Lite.git`，并将真实本地目录对齐到：

`C:\Users\fujunye\Desktop\Agent\SAPIEN-Lite`

随后经用户明确批准，World 仓库中的误推提交被 revert push。这个过程成为 SAPIEN-Lite 的第一条免疫守卫样例：当仓库目标与实际写入位置不一致时，必须停止扩大修改，先用 git 状态、远端、路径和用户授权恢复边界。

### Phase C - 报告注入为设计源

用户提供仿生学报告后，工作流从通用 scaffold 升级为报告驱动的 SAPIEN-Lite：

- 读取 DOCX，抽取 SAPIEN 定义、九模块、研究问题、仿真变量、评价指标、消融设计和风险约束。
- 将报告中的机制映射到本地 `work/` 文件。
- 将 evaluation harness 从通用 30-task log 重构为仿生学升级 harness。

## 4. 当前 SAPIEN-Lite 的最小文件边界

SAPIEN-Lite 暂不需要全局配置、hooks 或根级 `AGENTS.md`。当前最小边界是：

- `README.md`：入口说明。
- `work/codex-blackboard.md`：目标、约束、模块映射、队列。
- `work/codex-verification-log.md`：expected vs actual 证据。
- `work/codex-evaluation-harness.md`：仿生学升级评价 harness。
- `work/bionics-agent-workflow-reconstruction.md`：从报告到工作流的过程复盘。

## 5. 仿生学升级 Harness 方案

### 5.1 任务输入

每个评测 episode 至少包含：

- `goal`：任务目标。
- `category`：代码、文档、研究、工具使用、仓库治理等。
- `baseline_behavior`：被替代的普通 Agent 行为。
- `risk_level`：低、中、高。
- `expected_observation`：行动前预测。
- `acceptance_criteria`：完成证据。

### 5.2 过程观测

每轮记录：

- 读取了哪些源，为什么相关。
- 预测了什么观察。
- 实际观察与预测是否一致。
- 是否触发 surprise。
- 是否触发 immune guard。
- 是否需要 slow deliberation。
- 是否产生 replay consolidation。

### 5.3 输出指标

Harness 必须覆盖报告中的多维收益，而不是只看完成/未完成：

- 成功率。
- token/cost discipline。
- latency discipline。
- explanation quality。
- user interaction quality。
- perturbation robustness。
- contract violation rate。
- replay consolidation quality。

### 5.4 消融实验

对同一任务集比较：

- full SAPIEN-Lite。
- no immune guard。
- no expected-observation prediction。
- no bounded memory。
- no replay consolidation。
- no homeostatic budget。

如果某个模块移除后成本下降但成功率、安全或解释显著退化，不能把它视为有效优化。

## 6. 下一步实现建议

1. 把 `work/codex-evaluation-harness.md` 的表格转成机器可读 `jsonl` 或 `yaml`。
2. 增加最小 CLI：新增 episode、校验字段、生成汇总。
3. 为每个 episode 输出 replay artifact：测试、规则、文档补丁或明确 no-op reason。
4. 在真实 Agent 任务中累计 30 条 episode 后做第一次 ablation review。
