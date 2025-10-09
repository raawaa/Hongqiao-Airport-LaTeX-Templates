# LaTeX 公司规章制度文档类使用说明

## 文件结构

```
规章制度/
├── company-rules.cls    # 公司规章制度文档类（核心模板）
├── example.tex          # 使用示例（文档类版本）
├── example-small.tex    # 小字体配置示例
└── README.md            # 本使用说明
```

## 使用方法

```latex
\documentclass{company-rules}  % 使用文档类

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

```latex
% 使用默认配置（small配置，小三号字体，条款标题加括号）
\documentclass{company-rules}

% 显式指定small配置
\documentclass[small]{company-rules}

% 使用large配置
\documentclass[large]{company-rules}

% 使用nobracket选项
\documentclass[nobracket]{company-rules}

% 组合选项
\documentclass[small,nobracket]{company-rules}
\documentclass[large,nobracket]{company-rules}
```

## 模板功能

### 字体设置

样式包支持两种配置选项，它们在字体大小和页面边距方面有所不同：

**Small配置（默认）：**
- 正文：仿宋小三号（15pt）
- 标题：华文中宋伪粗体二号（22pt）
- 章节标题：华文中宋伪粗体小三号（15pt）居中
- 条款标题：仿宋伪粗体小三号（15pt）
- 页面边距：1.5英寸

**Large配置：**
- 正文：仿宋三号（16pt）
- 标题：华文中宋伪粗体二号（22pt）
- 章节标题：华文中宋伪粗体三号（16pt）居中
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

1. 使用文档类方式无需手动加载`ctexart`
2. 确保系统已安装所需字体（仿宋、华文中宋）
3. 使用 XeLaTeX 编译器，不是 PDFLaTeX
4. 条款中的百分号需要转义：`10\%`
5. 修改样式请直接编辑 `company-rules.cls` 文件

也可使用 `\setcompanyrulescfg{参数名}{参数值}` 命令在文档中动态修改配置。