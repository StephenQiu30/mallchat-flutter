---
layer: acceptance
doc_no: A-001
audience: Dev, QA, Ops
purpose: 记录 AGENTS 规范迁移和 Flutter CI 门禁调整的验收结论
owner: StephenQiu30
inputs: AGENTS.md, .github/workflows/ci.yml
outputs: Flutter 规范迁移与 CI 结论
triggers: 规范入口迁移、CI 门禁变更
downstream: GitHub Actions
---

# AGENTS 迁移与 Flutter CI 验收结论

## 1. 计划范围

1. 将 `CLAUDE.md` / `CLAUDE.local.md` 迁移为 `AGENTS.md` / `AGENTS.local.md`。
2. 同步贡献说明、docs 说明和仓库校验脚本中的规范入口命名。
3. 将 GitHub Actions 调整为 Flutter 真实可执行的门禁：固定 Flutter 3.38.9、安装依赖、仓库结构校验、静态分析、测试。
4. 修复 `flutter analyze` 报出的 `prefer_final_fields` 提示，并修复 `flutter test` 暴露的本地消息列表类型推断问题。
5. 不提交构建产物、临时过程记录或一次性排查日志。

## 2. 已执行命令

```bash
bash scripts/validate-repository.sh
flutter analyze
flutter test
```

## 3. 测试结论

1. 仓库结构与规范入口校验已通过。
2. `flutter analyze` 已通过。
3. `flutter test` 已通过。
4. CI 已从不存在的 `npm test` 改为固定 Flutter 3.38.9 后执行 `flutter analyze` 和 `flutter test`，避免 GitHub latest stable 与 `tdesign_flutter 0.2.7` 兼容性漂移。
5. 已修复 `AuthProvider._isBootstrapping` 的静态分析提示。
6. 已修复 `ChatProvider._prependMessage` 的 `List<dynamic>` 类型推断问题。
7. 本次未修改 Flutter 业务逻辑，未新增业务测试。

## 4. 残余风险

1. 本仓库提交前已存在本地 `ahead 1` 提交；推送时会与本次提交一起进入远端。

## 5. 变更记录

| 日期 | 作者 | 变更说明 |
| --- | --- | --- |
| 2026-05-19 | Stephen Qiu | 初始化 AGENTS 迁移与 Flutter CI 验收结论 |
