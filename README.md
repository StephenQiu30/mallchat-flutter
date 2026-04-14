# MallChat Flutter

MallChat Flutter 是一个面向 IM 场景的跨端客户端项目，使用 Flutter 构建，当前重点围绕“类似 QQ 的即时通讯系统”进行演进。

本项目的一个核心约束是：`lib/api/**` 下的接口文件、数据模型文件、序列化文件全部以后端 Swagger / OpenAPI 文档为唯一真源自动生成，不允许手写和手改。业务逻辑、页面状态、请求编排、错误处理等能力应放在生成目录之外实现。

## 1. 项目目标

当前项目的主要建设方向如下：

- 基于 Flutter 搭建跨端 IM 客户端
- 对齐后端微服务 Swagger 接口，构建稳定可维护的前端 API 层
- 以“会话、消息、联系人、登录资料联动”为核心逐步完善系统能力
- 保证接口层始终可重新生成，避免前后端字段漂移后出现隐藏错误

## 2. 技术栈

项目当前使用的核心技术如下：

- Flutter
- Dart
- GetX
- Dio
- Retrofit
- json_serializable
- swagger_parser
- build_runner
- tdesign_flutter

其中接口生成链路的关键依赖如下：

- `swagger_parser`
- `retrofit_generator`
- `json_serializable`
- `build_runner`

## 3. 项目结构说明

下面是当前项目中与开发最相关的目录说明：

```text
mallchat_flutter/
├── lib/
│   ├── api/                    # Swagger 自动生成的 API 代码目录，禁止手改
│   │   ├── user/
│   │   ├── file/
│   │   ├── notification/
│   │   ├── log/
│   │   ├── ai/
│   │   ├── chat/
│   │   └── request.dart        # 手写请求入口，封装 Dio 与生成后的 client
│   ├── pages/                  # 页面层
│   ├── store/                  # GetX 状态管理
│   ├── components/             # 组件层
│   ├── layout/                 # 桌面端 / 移动端布局适配
│   ├── styles/                 # 主题与样式
│   └── main.dart               # 应用入口
├── tool/
│   └── generate_api.sh         # API 统一生成脚本
├── swagger_parser.yaml         # Swagger 生成配置
├── build.yaml                  # build_runner / json_serializable / retrofit 配置
├── api-docs                    # 当前仓库中的接口文档快照文件
└── pubspec.yaml                # Flutter 依赖定义
```

## 4. API 设计原则

本项目 API 层采用“生成层 + 业务层”分离的方式：

### 4.1 生成层

生成层位于 `lib/api/**`，职责只有一个：承接后端 Swagger 文档并自动生成 Dart 接口与模型。

生成层包含：

- `client`
- `controller client`
- `request / response models`
- `*.g.dart`
- `export.dart`

生成层的规则如下：

- 不允许手写接口类
- 不允许手改生成后的 model
- 不允许在生成文件中插入业务逻辑
- 后端接口有变更时，必须通过重新生成来同步

### 4.2 业务层

业务层位于 `lib/api/**` 之外，例如：

- `store`
- `pages`
- 后续可新增的 `service` 或 `repository`

业务层负责：

- 请求时机编排
- 状态管理
- optimistic UI
- 用户提示
- 页面展示逻辑
- 会话与消息数据流组织

业务层可以调用生成后的 client，但不能重新定义一套重复的接口字段。

## 5. 当前 Swagger 配置

Swagger 生成配置文件为 [swagger_parser.yaml](/Users/stephenqiu/Desktop/StephenQiu30/MallChat/mallchat_flutter/swagger_parser.yaml)。

当前配置的微服务 Swagger 地址如下：

- 用户服务：`http://localhost:8081/api/v3/api-docs`
- 文件服务：`http://localhost:8082/api/v3/api-docs`
- 通知服务：`http://localhost:8083/api/v3/api-docs`
- 日志服务：`http://localhost:8084/api/v3/api-docs`
- AI 服务：`http://localhost:8085/api/v3/api-docs`
- 聊天服务：`http://localhost:8086/api/v3/api-docs`

生成输出目录如下：

- `lib/api/user`
- `lib/api/file`
- `lib/api/notification`
- `lib/api/log`
- `lib/api/ai`
- `lib/api/chat`

当前生成配置还包含一些必要的替换规则，用于解决 Dart / Flutter 对某些 Swagger 类型的兼容问题，例如：

- 移除 `dart:io` 的文件类型导入
- 将 `File` 替换为 `String`
- 将 `Object` 替换为 `dynamic`

这些替换规则必须维护在 `swagger_parser.yaml` 中，而不是在生成后的文件里手动修补。

## 6. API 生成流程

### 6.1 统一生成命令

项目已经提供统一脚本：

[tool/generate_api.sh](/Users/stephenqiu/Desktop/StephenQiu30/MallChat/mallchat_flutter/tool/generate_api.sh)

执行方式：

```bash
bash tool/generate_api.sh
```

该脚本会完成两步：

1. 通过 `swagger_parser` 按 `swagger_parser.yaml` 生成 API 文件
2. 通过 `build_runner` 生成 `json_serializable` 和 `retrofit` 所需的 `*.g.dart` 文件

### 6.2 脚本内容说明

当前脚本实际执行的是：

```bash
dart run swagger_parser -f swagger_parser.yaml
dart run build_runner build --delete-conflicting-outputs
```

也就是说，后续只要 Swagger 文档变化，就应该重新执行这条脚本，而不是手动改 `lib/api/**`。

### 6.3 何时需要重新生成

以下场景必须重新生成 API：

- 后端新增接口
- 后端修改接口路径
- 后端修改请求参数
- 后端修改响应字段
- 后端新增或修改数据模型
- Swagger 配置本身被调整

## 7. 开发环境要求

建议本地环境至少满足以下条件：

- Flutter SDK 已安装
- Dart SDK 可用
- 可执行 `flutter pub get`
- 本地后端 Swagger 地址可访问

如果你使用的是当前配置，那么在生成 API 时，默认要求本地相关微服务已经启动，并且各自对外暴露 `/api/v3/api-docs`。

## 8. 本地启动流程

建议按以下顺序进行本地开发：

### 8.1 拉取依赖

```bash
flutter pub get
```

### 8.2 启动后端微服务

确保以下 Swagger 地址可访问：

- `http://localhost:8081/api/v3/api-docs`
- `http://localhost:8082/api/v3/api-docs`
- `http://localhost:8083/api/v3/api-docs`
- `http://localhost:8084/api/v3/api-docs`
- `http://localhost:8085/api/v3/api-docs`
- `http://localhost:8086/api/v3/api-docs`

### 8.3 生成 API

```bash
bash tool/generate_api.sh
```

### 8.4 启动 Flutter 应用

```bash
flutter run
```

## 9. 请求入口说明

项目当前统一请求入口位于：

[lib/api/request.dart](/Users/stephenqiu/Desktop/StephenQiu30/MallChat/mallchat_flutter/lib/api/request.dart)

当前职责包括：

- 初始化全局 Dio
- 配置网关地址
- 注入 `Authorization` 请求头
- 打印基础请求日志
- 暴露各微服务生成后的 client

当前网关地址为：

```dart
http://localhost:8080/api
```

这意味着 Flutter 客户端默认通过网关访问服务，而具体接口定义仍然从各个微服务的 Swagger 文档生成。

## 10. build_runner 配置说明

[build.yaml](/Users/stephenqiu/Desktop/StephenQiu30/MallChat/mallchat_flutter/build.yaml) 当前主要用于：

- 开启 `json_serializable`
- 支持 `retrofit_generator`
- 统一生成 `*.g.dart`

该文件不直接定义业务逻辑，只服务于代码生成。

## 11. 开发规范

为了保证后续多人协作时 API 层不失控，必须遵守以下规范。

### 11.1 严禁手改生成目录

以下目录中的文件禁止手工修改：

- `lib/api/user/**`
- `lib/api/file/**`
- `lib/api/notification/**`
- `lib/api/log/**`
- `lib/api/ai/**`
- `lib/api/chat/**`

如果你发现某个生成文件不符合预期，应优先排查：

- Swagger 文档是否正确
- `swagger_parser.yaml` 配置是否正确
- `replacement_rules` 是否需要调整
- `build_runner` 是否完整执行

### 11.2 自定义逻辑放在哪里

以下内容应该写在生成目录之外：

- 页面逻辑
- Store 状态管理
- Service / Repository 封装
- 错误提示映射
- 会话与消息状态转换
- 本地缓存策略
- 业务级重试逻辑

### 11.3 接口更新流程

推荐统一采用以下流程更新接口：

1. 后端更新 Swagger
2. 前端执行 `bash tool/generate_api.sh`
3. 修复因接口变更导致的业务层编译错误
4. 验证页面和状态流是否正常
5. 提交生成后的 API 文件和业务代码修改

## 12. 当前业务模块说明

当前项目已具备以下基础模块：

- 登录
- 消息列表
- 聊天详情
- 联系人
- 个人中心

当前已接入的 API 模块包括：

- `user`
- `file`
- `notification`
- `log`
- `ai`
- `chat`

其中，聊天相关能力是当前最重要的建设方向。

## 13. 当前 IM 能力建设重点

当前阶段建议优先建设以下能力：

- 会话列表
- 历史消息加载
- 文本消息发送
- 已读上报
- 会话删除
- 会话置顶
- 好友列表
- 好友申请
- 创建私聊房间
- 登录资料联动刷新

在这些能力里，所有请求模型、响应模型、client 方法都应来自 Swagger 自动生成层。

## 14. 常见问题

### 14.1 为什么不能手写 API 文件

因为手写 API 文件会造成以下问题：

- 前后端字段不一致
- Swagger 更新后难以追踪差异
- 生成层与手写层混杂，后续无法整体重建
- 多人协作时容易出现重复定义

统一自动生成可以显著降低接口漂移和维护成本。

### 14.2 为什么需要 `build_runner`

因为 `swagger_parser` 生成的代码依赖：

- `json_serializable`
- `retrofit_generator`

所以除了生成源码本身，还需要继续执行 `build_runner` 生成对应的 `*.g.dart` 文件。

### 14.3 如果 Swagger 服务不可访问怎么办

优先检查以下内容：

- 对应后端服务是否启动
- Swagger 路径是否仍为 `/api/v3/api-docs`
- 本地端口是否变更
- 是否被网关、鉴权或跨域配置拦截

如果短期无法访问在线 Swagger，可以临时保留快照文件进行排查，但最终仍应回归到真实 Swagger 真源。

### 14.4 生成时报错怎么办

建议按顺序检查：

1. `flutter pub get` 是否执行成功
2. `dart run swagger_parser -f swagger_parser.yaml` 是否可正常执行
3. `dart run build_runner build --delete-conflicting-outputs` 是否可正常执行
4. Swagger 文档中是否存在不兼容字段类型
5. `swagger_parser.yaml` 的替换规则是否需要补充

### 14.5 为什么请求地址和 Swagger 地址不一样

这是当前项目的设计结果：

- Swagger 生成阶段直接读取各微服务 Swagger 地址
- Flutter 运行时请求默认走统一网关 `http://localhost:8080/api`

也就是说：

- “生成来源”是各个微服务
- “运行入口”是网关

这两者职责不同，不冲突。

## 15. 推荐开发流程

在后续日常开发中，建议使用以下节奏：

1. 先确认后端 Swagger 已更新
2. 执行 `bash tool/generate_api.sh`
3. 只在业务层接入新的接口能力
4. 不修改生成目录
5. 每完成一个接口闭环后做页面联调

## 16. 后续建议

为了让项目更适合长期维护，后续可以继续补充以下内容：

- 增加 `service` / `repository` 层，隔离 Store 与 generated client
- 增加 README 中的环境变量说明
- 增加接口联调清单
- 增加状态流说明文档
- 增加测试说明与回归清单
- 增加 CI 自动校验，确保生成文件与 Swagger 配置一致

## 17. 一句话原则

这个项目的 API 层原则只有一句话：

后端 Swagger 是唯一真源，`lib/api/**` 只允许生成，不允许手写。
