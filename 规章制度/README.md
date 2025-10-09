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



## 模板功能

### 字体设置
- 正文：仿宋小三号
- 标题：华文中宋小二号
- 章节标题：华文中宋小三号居中
- 条款标题：小三号仿宋伪粗体

### 格式设置
- 页面边距：1.2英寸
- 段落首行缩进：2字符
- 列表格式：中文编号，对齐正文缩进
- 页码：底部居中

### 自定义命令
- `\setdoctitle{标题}`：设置文档标题
- `\article{条款标题}`：创建条款（自动编号）

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