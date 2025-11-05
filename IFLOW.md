# 虹桥国际机场 LaTeX 公文模板项目

## 项目概述

这是一个为虹桥国际机场有限责任公司开发的 LaTeX 文档模板项目，提供两套主要的文档模板：
1. **公司规章制度模板** (`company-rule.cls`) - 用于创建公司内部规章制度文档
2. **通用公文模板** (`common-doc.cls`) - 用于创建通用正式公文，如事件报告、发文稿、联系单等

项目采用模块化设计，通过 `hongqiao-common.sty` 共享工具包提供通用功能，确保两个模板的一致性和可维护性。

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
├── hongqiao-common.sty          # 共享工具包
├── 规章制度/
│   ├── company-rule.cls         # 规章制度文档类
│   ├── example.tex              # 规章制度示例文档
│   └── README.md                # 规章制度使用说明
├── 通用公文/
│   ├── common-doc.cls           # 通用公文文档类
│   ├── example.tex              # 通用公文示例文档
│   └── README.md                # 通用公文使用说明
├── README.md                    # 项目总体说明
├── LICENSE                      # MIT 许可证
└── .gitignore                   # Git 忽略文件
```

## 核心功能特性

### 公司规章制度模板 (company-rule.cls)
- 支持两种字体配置：small（小三号15pt）和 large（三号16pt）
- 可选条款标题括号样式：bracket（带括号）和 nobracket（不带括号）
- 自动条款编号系统（第一条、第二条...）
- 标准中文公文格式和页面布局
- 配置系统支持动态调整参数

### 通用公文模板 (common-doc.cls)
- 四级标题体系：中文数字、中文括号、阿拉伯数字、段内编号
- 行内标题功能（带星号标题不换行）
- 固定行距系统（30pt，模拟Word固定行距）
- 附件环境支持
- 动态配置系统

### 共享工具包 (hongqiao-common.sty)
- 字体检测与自动回退机制
- 统一页面布局设置
- 配置信息显示和验证工具
- 标题格式重置工具
- 统一配置系统接口

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
- 支持运行时动态配置修改
- 配置验证和调试信息输出

## 使用方法

### 规章制度模板
```latex
\documentclass[large]{company-rule}
\begin{document}
\section{总则}
\article{制定目的}
为规范公司内部管理，特制定本制度。
\end{document}
```

### 通用公文模板
```latex
\documentclass{common-doc}
\begin{document}
\section{一、工作概述}
这里是工作概述内容。
\end{document}
```

## 许可证

本项目采用 MIT 许可证，允许自由使用、修改和分发。

## 扩展指南

### 添加新的配置选项
1. 在类文件中定义默认值：`\def\classname@option{default}`
2. 声明选项：`\DeclareOption{optionname}{...}`
3. 在配置系统中注册选项

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