# LaTeX 基建项目合同模板使用说明

## 文件结构

```
规章制度/
├── company-rules.sty    # 公司规章制度样式包（核心模板）
├── example.tex        # 使用示例
└── README.md          # 本使用说明
```

## 使用方法

### 方法1：使用样式包（推荐）

1. 复制 `company-rules.sty` 到您的工作目录
2. 创建新的 `.tex` 文件，引用样式包：

```latex
\documentclass[UTF8]{ctexart}
\usepackage{company-rules}  % 引用样式模板

% 设置文档信息
\setdoctitle{您的文档标题}
\author{作者名}
\date{日期}

\begin{document}
\maketitle

% 您的内容从这里开始
\section{章节标题}
\article{条款标题}
条款内容...

\end{document}
```

### 配置选项

样式包支持多种配置选项：

```latex
% 使用默认配置（small配置，小三号字体，条款标题加括号）
\usepackage{company-rules}

% 显式指定small配置（小三号字体，条款标题加括号）
\usepackage[small]{company-rules}

% 使用large配置（三号字体，条款标题加括号）
\usepackage[large]{company-rules}

% 使用nobracket选项（条款标题不加括号）
\usepackage[nobracket]{company-rules}

% 组合选项
\usepackage[small,nobracket]{company-rules}
\usepackage[large,nobracket]{company-rules}
```

## 模板功能

### 字体设置

样式包支持两种配置选项，它们在字体大小和页面边距方面有所不同：

**Small配置（默认）：**
- 正文：仿宋小三号（15pt）
- 标题：华文中宋小二号（18pt）
- 章节标题：华文中宋小三号（18pt）居中
- 条款标题：仿宋伪粗体小三号（15pt）
- 页面边距：1.5英寸

**Large配置：**
- 正文：仿宋三号（16pt）
- 标题：华文中宋小二号（18pt）
- 章节标题：华文中宋小三号（18pt）居中
- 条款标题：仿宋伪粗体三号（16pt）
- 页面边距：1.0英寸

无论使用哪种配置，章节和条款的编号格式、段落缩进、列表格式等其他样式保持一致。

### 格式设置
- 页面边距：默认1.5英寸（small配置）或1.0英寸（large配置）
- 段落首行缩进：2字符
- 列表格式：中文编号，对齐正文缩进
- 页码：底部居中

### 自定义命令
- `\setdoctitle{标题}`：设置文档标题
- `\article{条款标题}`：创建条款（自动编号）
- `\showcompanyrulescfg`：显示当前配置信息（用于调试）

## 编译方法

使用 XeLaTeX 编译：
```bash
xelatex 您的文件名.tex
```

## 注意事项

1. 确保系统已安装所需字体（仿宋、华文中宋）
2. 使用 XeLaTeX 编译器，不是 PDFLaTeX
3. 条款中的百分号需要转义：`10\%`
4. 如需修改样式，请编辑 `company-rules.sty` 文件

## 扩展功能

如需添加新功能，可以在 `company-rules.sty` 中添加：
- 新的自定义命令
- 额外的宏包引用
- 自定义环境
- 特殊格式设置

也可使用 `\setcompanyrulescfg{参数名}{参数值}` 命令在文档中动态修改配置。