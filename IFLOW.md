# 国有企业公文模板项目

## 项目概述

这是一个为国有企业开发的 LaTeX 文档模板项目，提供两套主要的文档模板：
1. **公司规章制度模板** (`company-rule.cls` v2.0) - 用于创建公司内部规章制度文档
2. **通用公文模板** (`common-doc.cls` v1.1) - 用于创建通用正式公文，如事件报告、发文稿、联系单等

项目采用模块化设计，通过 `soe-common.sty` (v1.0) 共享工具包提供通用功能，确保两个模板的一致性和可维护性。

## 技术栈

- **LaTeX** - 文档排版系统
- **XeLaTeX** - 编译器（必须使用，支持中文和系统字体）
- **ctex** - 中文支持宏包
- **fontspec** - 字体设置宏包
- **geometry** - 页面布局设置
- **enumitem** - 列表格式控制

## 项目结构

```
LaTeX模板/
├── soe-common.sty                    # 共享工具包 (v1.0)
├── company-rule.cls                  # 规章制度文档类 (v2.0)
├── common-doc.cls                    # 通用公文文档类 (v1.1)
├── company-rule-example.tex          # 规章制度示例文档
├── common-doc-example.tex            # 通用公文示例文档
├── 规章制度/
│   └── README.md                     # 规章制度详细使用说明
├── 通用公文/
│   └── README.md                     # 通用公文详细使用说明
├── README.md                         # 项目总体说明
├── IFLOW.md                          # 项目详细文档
├── LICENSE                           # MIT 许可证
└── .gitignore                        # Git 忽略文件
```

**简化使用**：现在用户只需将根目录中的 `.cls` 和 `.sty` 文件复制到自己的项目即可使用，无需考虑相对路径问题。

## 核心功能特性

### 公司规章制度模板 (company-rule.cls v2.0)
- 支持两种字体配置：small（小三号15pt）和 large（三号16pt）
- 可选条款标题括号样式：bracket（带括号）和 nobracket（不带括号）
- 自动条款编号系统（第一条、第二条...）
- 标准中文公文格式和页面布局
- **动态配置系统**：支持运行时调整页面边距、字体、行距等参数
- **配置验证工具**：提供配置检查和调试信息输出

### 通用公文模板 (common-doc.cls v1.1)
- 四级标题体系：中文数字、中文括号、阿拉伯数字、段内编号
- **行内标题功能**（带星号标题不换行，如 `\subsection*{标题}`）
- 固定行距系统（30pt，模拟Word固定行距）
- 附件环境支持
- **动态配置系统**：支持运行时调整所有排版参数
- **增强字体支持**：副标题字体独立配置

### 共享工具包 (soe-common.sty v1.0)
- **智能字体检测与自动回退机制**
- 统一页面布局设置
- **配置信息显示和验证工具**
- 标题格式重置工具
- **统一配置系统接口**：提供标准化的配置管理

## 编译要求

### 必需环境
- **TeX Live 2020+** 或 **MiKTeX 2.9+**
- **XeLaTeX** 编译器（不支持 PDFLaTeX）

### 推荐字体
- `STFangsong` (华文仿宋) - 主字体
- `STZhongsong` (华文中宋) - 标题字体
- `STKaiti` (华文楷体) - 副标题字体

如果系统缺少推荐字体，模板会自动回退到：
- `SimSun` (宋体)
- `SimHei` (黑体)
- `KaiTi` (楷体)

## 编译方法

```bash
# 基本编译
xelatex example.tex

# 生成目录或引用时需要编译两次
xelatex example.tex
xelatex example.tex
```

## 开发约定

### 代码风格
- 使用 UTF-8 编码
- 文件头部包含 TeX 程序指令和编码声明
- 详细的注释说明，特别是配置参数和自定义命令
- 模块化设计，功能分离

### 版本管理
- 遵循语义化版本控制
- 类文件头部包含版本号和更新日期
- 重要变更需要更新版本号

### 配置系统
- 使用 `@` 前缀的内部变量存储配置
- 提供用户友好的配置命令接口
- **支持运行时动态配置修改**
- **配置验证和调试信息输出**

## 使用方法

### 规章制度模板
```latex
\documentclass[large]{company-rule}
\begin{document}
\section{总则}
\article{制定目的}
为规范公司内部管理，特制定本制度。

% 动态配置示例
\setcompanyrulecfg{leftmargin}{3cm}
\setcompanyrulecfg{fontsize}{16pt}

\end{document}
```

### 通用公文模板
```latex
\documentclass{common-doc}
\begin{document}
\section{一、工作概述}
这里是工作概述内容。

% 行内标题示例
\subsection*{重要说明}
这里是重要说明内容。

% 动态配置示例
\setcommondoccfg{lineheight}{32pt}
\setcommondoccfg{primaryfont}{SimSun}

\end{document}
```

## 动态配置系统

### 配置命令接口

#### 规章制度模板配置
```latex
\setcompanyrulecfg{参数名}{参数值}
```

支持的参数包括：
- `leftmargin`、`rightmargin`、`topmargin`、`bottommargin` - 页面边距
- `fontsize` - 正文字体大小
- `lineheight` - 行距
- `fakebold` - 伪粗体强度
- `indent` - 段落首行缩进
- `primaryfont` - 主字体名称
- `titlefont` - 标题字体名称
- `titlesize` - 文档标题字体大小
- `bracket` - 条款标题是否使用括号（1/0）

#### 通用公文模板配置
```latex
\setcommondoccfg{参数名}{参数值}
```

支持的参数包括：
- `leftmargin`、`rightmargin`、`topmargin`、`bottommargin` - 页面边距
- `fontsize` - 正文字号
- `lineheight` - 固定行距
- `indent` - 段落首行缩进
- `primaryfont` - 仿宋（正文）
- `titlefont` - 中宋（标题）
- `maintitlesize` - 主标题字号
- `subtitlefont` - 楷体（副标题）
- `subtitlefontsize` - 副标题字号
- `subtitlebaseline` - 副标题基线调整
- `fakebold` - 伪粗体强度

### 调试工具

#### 配置信息显示
```latex
% 规章制度模板
\showcompanyrulecfg

% 通用公文模板
\showcommondoccfg
```

#### 配置验证
```latex
% 通用配置验证（在soe-common.sty中提供）
\soe@validateConfig{配置前缀}
```

## 新增功能特性

### 1. 智能字体检测系统
- 自动检测系统字体可用性
- 智能回退到备用字体
- 编译时输出字体使用情况

### 2. 行内标题功能（通用公文模板）
- 使用 `\subsection*{标题}` 创建不换行的行内标题
- 编号仍递增但不另起段落
- 适合条例式文档结构

### 3. 固定行距系统
- 模拟Word的固定行距功能
- 禁用LaTeX的自动行距拉伸
- 保持一致的版面效果

### 4. 统一配置系统
- 标准化的配置接口
- 运行时动态修改配置
- 配置验证和调试工具

## 许可证

本项目采用 MIT 许可证，允许自由使用、修改和分发。

## 扩展指南

### 添加新的配置选项
1. 在类文件中定义默认值：`\def\classname@option{default}`
2. 声明选项：`\DeclareOption{optionname}{...}`
3. 在配置系统中注册选项
4. 添加配置验证逻辑

### 创建新的自定义命令
1. 在共享工具包中添加通用功能
2. 在具体类文件中添加特定功能
3. 提供调试和验证机制

### 字体配置
- 使用 `\IfFontExistsTF` 检测字体可用性
- 提供合理的字体回退机制
- 在编译日志中输出字体使用情况

## 注意事项

1. **必须使用 XeLaTeX 编译**，不支持 PDFLaTeX
2. 确保系统已安装所需的中文字体
3. 修改模板时请保持向后兼容性
4. 新增功能应包含相应的测试用例
5. 重要修改需要更新文档和版本号
6. **动态配置在文档开始后生效**，建议在导言区或文档开始处使用

## 版本历史

- **v2.0** (2024-01-01): 公司规章制度模板重大更新
  - 新增动态配置系统
  - 改进字体检测机制
  - 统一配置接口

- **v1.1** (2025-10-09): 通用公文模板优化
  - 新增行内标题功能
  - 改进固定行距系统
  - 增强字体支持

- **v1.0** (2025-10-31): 共享工具包更新
  - 统一配置系统接口
  - 配置验证工具
  - 智能字体检测