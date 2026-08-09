# AGENTS.md

本文件是 mallchat-flutter 唯一的项目规范性文件，统一存放全局协作规则、角色分工、验收标准、Git 提交与 PR 规范。项目不再维护 `AGENTS.local.md` 等重叠规范文件，所有规范以本文件为准。

> 说明：项目已统一为单一规范文件 `AGENTS.md`，并采用 `type(scope): 中文描述` 的统一 Git 提交信息规范，其他提交风格不再使用。

## 项目开发原则

1. 项目开发遵循 MVP 原则，以最小可用功能闭环为优先，不对功能、架构、流程或文档进行过度设计。
2. 单个文件应保持清晰、可维护，原则上不要超过 200-500 行；当文件持续膨胀时，应按职责拆分为更小的模块。
3. 项目开发遵循 TDD 思想，新增或修改功能时优先使用红绿测试流程：先编写失败测试，再实现最小代码使测试通过，最后在测试保护下进行必要重构。
4. 项目开发遵循 SMART 软件工程思想，需求、任务和验收标准应尽量做到具体、可衡量、可达成、相关且有明确时间或阶段边界。
5. 每次使用 OpenSpec 执行完一个较大的 change 后，必须完成实现、测试、验证、归档和归档后校验，再使用 `type(scope): 中文描述` 格式的 Git 提交信息提交，保持工作区干净。

## 项目结构与接口约束

1. `lib/api/**` 下的接口文件、数据模型文件、序列化文件全部以后端 Swagger / OpenAPI 文档为唯一真源自动生成，不允许手写和手改。
2. 业务逻辑、页面状态、请求编排、错误处理等能力应放在生成目录之外实现。
3. 本项目内的角色配置放在 `.claude/agents/` 目录，可复用流程放在 `.claude/skills/` 目录。
4. 本项目内的 OpenSpec 配置放在 `openspec/` 目录，使用 OpenSpec 管理 change 的 proposal、tasks、spec delta 与归档。

## TDD 执行规范

1. 新增功能、修复缺陷或调整核心逻辑时，应优先使用 TDD 的红绿重构流程：先写失败测试，再写最小实现，最后在测试保护下重构。
2. 红灯阶段要让测试明确表达预期行为或缺陷复现点，避免只写无法约束实现的空测试。
3. 绿灯阶段只实现让测试通过所需的最小代码，不借机扩大功能范围或引入过度设计。
4. 重构阶段必须保持测试通过，重构目标应聚焦命名、结构、重复逻辑和可读性，不改变已验证行为。
5. 无法先写测试时，应在交付说明中解释原因，并补充可执行的验证方式、手工验证证据或后续测试补齐点。
6. 测试覆盖应优先保护核心业务规则、边界条件、回归缺陷和 OpenSpec change 的验收标准。

## Test-First PR 提交规范

1. 功能 PR 的重点不是提交代码量，而是通过测试定义需求、边界和验收标准；实现代码可以由 Agent 生成，但研发人员必须负责测试设计、结果验证和代码审查。
2. 功能分支必须先提交失败的测试、再提交实现，顺序必须与 `test: add failing tests for xxx`、`impl: make xxx tests pass`、`refactor: clean up without behavior changes`、`chore: config / formatting / generated files` 一致，提交信息均采用 `type(scope): 中文描述` 格式。
3. `test:` commit 只允许包含测试相关内容，例如 `Tests/`、`Fixtures/`、`Mocks/`、期望结果和测试辅助工具；测试应表达需求和验收标准，覆盖主要路径和关键边界，没有实现 commit 时原则上应失败。
4. `test:` commit 不允许包含业务实现、生产代码改动或为通过测试而提前加入的功能逻辑。
5. `impl:` commit 只提交让测试通过的最小实现，不夹带无关功能、不做大范围重构、不实现未被测试覆盖的行为。
6. `refactor:` commit 只能在测试通过后清理命名、结构、重复逻辑或可读性，不改变已验证行为。
7. `chore:` commit 只放配置、格式化、锁文件或生成文件等非业务变更；不得把功能实现或测试需求混入 `chore:`。
8. 不合格情况包括：测试和实现混在一个 commit、先写实现后补测试、测试覆盖不足、PR 夹带无关改动。
9. 文档修改、纯格式化、CI 配置修复、依赖锁文件更新、删除无用代码、紧急修复可不强制 test-first，但必须在 PR 中说明原因；紧急修复后续必须补测试。
10. 没有清晰测试的功能 PR，不进入实现代码审查；Agent 只能协助生成实现，测试、边界和最终质量由提交人负责。

## SMART 执行规范

1. `Specific`：需求、任务和 OpenSpec change 必须描述清楚要解决的问题、目标用户、影响范围和不做事项，避免模糊表述。
2. `Measurable`：每个任务都应有可验证的验收标准，优先使用测试、lint、接口响应、页面状态、日志或文档检查。
3. `Achievable`：方案应符合当前项目资源、技术栈和时间约束，优先选择 MVP 范围内可以落地的最小实现。
4. `Relevant`：实现内容必须服务于当前需求，不引入与目标无关的重构、依赖、功能或文档扩展。
5. `Time-bound`：较大的任务应拆成有阶段边界的步骤，明确本次完成范围、后续延迟项和交付检查点。
6. 交付总结应回到 SMART 标准，说明目标是否完成、验收是否可衡量、范围是否受控，以及是否存在延期或后续事项。

## README 编写规范

1. README 必须按用户指定的目录层级编写；如果用户要求为多个子目录分别编写 README，不应改为只写根目录 README。
2. README 内容应基于真实文件结构、配置和已有规范，不凭空描述不存在的功能、命令或目录。
3. README 应优先包含目录定位、核心功能、文件结构、角色分工、OpenSpec 使用约定、验收标准和维护原则。
4. 文件结构示例必须与当前目录实际结构保持一致；结构变更后应同步更新 README。
5. README 应保持 MVP 风格，说明必要信息即可，不写营销化、空泛化或与项目无关的内容。
6. README 的验收标准应可检查，至少能验证关键文件是否存在、目录位置是否正确、规范是否覆盖、单文件行数是否符合要求。

## docs 目录规范

1. 项目文档应按类型写入 `docs/` 下的对应子目录，避免把 PRD、计划、设计、验收和运维文档混放。
2. `docs/prd/` 存放产品需求、范围定义、用户故事和 MVP 边界。
3. `docs/plans/` 存放执行计划、阶段拆解、任务清单和排期安排。
4. `docs/design/` 存放技术方案、架构决策、接口设计和实现设计。
5. `docs/acceptance/` 存放验收标准、测试记录、验证报告和回归证据。
6. `docs/operations/` 存放发布流程、Git/PR 规范、部署说明和运行手册。
7. `docs/` 只存放会对项目产生长期真实影响的文档，例如需求边界、设计决策、验收标准、发布流程和运维规范。
8. 执行 todo、临时任务清单、过程性进展记录、一次性排查记录不应写入 `docs/`；这类内容应在 OpenSpec change 的 tasks 中执行，并随 change 归档闭环。
9. 正式 docs 文档必须使用 YAML frontmatter 描述 `layer`、`doc_no`、`audience`、`purpose`、`owner`、`inputs`、`outputs`、`triggers` 和 `downstream` 等元信息。
10. `docs/TEMPLATE.md` 是正式文档模板，新增 PRD、计划、设计、验收或运维文档时应优先复用。
11. 每个 docs 子目录必须有 README，说明该目录放什么、不放什么，以及文档命名建议。

## 角色结构与执行流程

1. 本项目协作基于 `.claude/agents/*.md` 角色配置和 `.claude/skills/*.md` 可复用流程。
2. 复杂任务优先使用多角色协作；简单任务可合并为 `PM -> Builder -> Tester` 三段式执行。
3. 标准角色：`PM`（需求拆解/范围/验收标准）、`Builder`（最小实现）、`Tester`（测试/回归）、`Explorer`（事实核验）、`Reporter`（交付汇总）。
4. 标准执行流程：`Explorer -> PM -> Builder -> Tester -> Reporter`。
5. 大任务必须先由 PM 或主代理产出任务拆分与并行执行计划；子角色产出清洁结果，主代理只做处理器。
6. 角色模型分配遵循 OpenSpec 工具链与默认代理配置。

## OpenSpec change 收口规范

1. 使用 OpenSpec 执行较大 change 时，必须完整走完 proposal、tasks、spec delta、实现、测试、验证、归档和归档后校验流程。
2. 每个 change 对应一个独立 `openspec/` change 目录；并发 change 应互相隔离，不要同时覆盖同一批生成文件。
3. change 未完成测试或验收前，不得归档；change 未归档并完成归档后校验前，不得进行最终 Git 提交。
4. 生成文件（`lib/api/**`）的改动应以 `swagger_parser` 和 `build_runner` 重新生成为准，避免手改与漂移。
5. 归档后应再次执行 OpenSpec 校验，确认 specs 与归档状态一致。
6. Git 提交前应检查工作区，只提交本次已完成 change 的相关文件，保持任务完成后的工作区干净。

## Git 提交规范

1. 每次完成较大的 OpenSpec change 后，应先完成测试、验证、归档和归档后校验，再使用 `type(scope): 中文描述` 格式的 Git 提交信息提交本次改动。
2. 提交信息统一格式为 `<type>(<scope>): <中文描述>`；`type` 使用小写标准英文类型，`scope` 使用改动所在的模块或领域（如 `api`、`chat`、`auth`、`docs`、`ci`），描述使用中文简洁说明改动内容。
3. 提交前必须检查工作区范围，确认只包含本次 change 相关文件；无关修改不得混入提交。
4. 单个提交应保持职责单一，不能混合测试、实现、重构、文档和配置变更。
5. 中间产物、临时文件、一次性报告、本地缓存、测试输出目录和调试日志不需要提交到 GitHub；如果必须保留长期证据，应沉淀为正式 docs 文档或验收记录。
6. 提交后应再次检查工作区状态，确认没有遗漏文件、未暂存文件或意外生成物。
7. 如果用户明确要求暂不提交，应在交付说明中记录原因、当前工作区状态和后续提交建议。

## PR 提交与合并规范

1. 创建或更新 PR 前，应先确认分支、提交范围、验证结果和是否存在可复用的已有 PR。
2. PR 标题和描述应使用中文，说明修改内容、验证方式、影响范围、风险和 OpenSpec change 状态。
3. 同一任务已有 PR 时，应优先更新已有 PR，不要无意义创建重复 PR。
4. PR 合并前必须检查状态、CI、冲突和目标分支最新状态；不能只因为代码已完成就合并。
5. 合并前可打 tag 作为回滚点，命名体现合并对象和日期，例如 `pre-merge-pr12-20260508`。
6. 多个 PR 需要合并时，应按用户指定顺序逐个合并；每合并一个后重新检查后续 PR 的冲突和 CI。
7. PR 合并后应同步本地分支状态，执行必要的仓库健康检查，确认没有工作区污染。
8. 功能 PR 描述必须包含 Test-first Evidence、Tests added、Commands run、Result、Agent Usage 和 Reviewer Checklist；Reviewer 先审 `test:` commit，再审 `impl:` commit。
9. CI 必须包含完整测试入口，至少运行仓库结构检查、Markdown 空白检查和 `npm test`；项目增加真实单元、集成、UI、快照或性能测试后，应把对应命令接入 CI。

## PR 模板要求

功能 PR 描述必须覆盖以下内容：

````markdown
# PR Summary

## Test-first Evidence

- Failing test commit:
- Test fails before implementation:
  - [ ] Yes
  - [ ] No
  - [ ] Not applicable

## Tests added

- [ ] Unit
- [ ] Integration
- [ ] UI
- [ ] Snapshot
- [ ] Performance

## Commands run

```bash
# test command
```

## Result

- Failed before implementation
- Passed after implementation

## Agent Usage

Human-authored:
- Acceptance criteria:
- Test cases:
- Edge cases:

Agent-generated:
- Implementation:
- Refactor:
- Boilerplate:

## Git 提交规范核对

- [ ] 提交使用 `type(scope): 中文描述` 格式
- [ ] test: 与 impl: 分离

## Reviewer Checklist

- [ ] Test commit reviewed first
- [ ] Tests express requirement
- [ ] Edge cases covered
- [ ] Implementation is minimal
- [ ] No unrelated changes
- [ ] Agent code reviewed
- [ ] CI passed
````

## 交付输出要求

每次任务完成时，输出至少包含：

1. 修改了什么。
2. 如何验证。
3. 是否存在未验证内容或残余风险。
4. 涉及的关键文件。
5. Git 提交状态：是否已提交、具体提交信息格式是否正确。
6. PR 状态：是否已创建或更新 PR、是否需要合并、合并前 tag 是否已创建。
