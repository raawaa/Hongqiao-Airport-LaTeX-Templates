# LaTeX 公司规章制度文档类使用说明

## 使用方法

```latex
\documentclass{company-rules}  % 使用文档类

% 设置文档信息
\title{您的文档标题}
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

- `small`：小字体配置（默认）
- `large`：大字体配置
- `nobracket`：条款标题不加括号
- `bracket`：条款标题加括号（默认）

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

样式包支持两种配置选项，仅在字体大小上有差异：

**Small配置（默认）：**
- 正文：仿宋小三号（15pt）
- 标题：华文中宋伪粗体二号（22pt）
- 章节标题：华文中宋伪粗体小三号（15pt）居中
- 条款标题：仿宋伪粗体小三号（15pt）

**Large配置：**
- 正文：仿宋三号（16pt）
- 标题：华文中宋伪粗体二号（22pt）
- 章节标题：华文中宋伪粗体三号（16pt）居中
- 条款标题：仿宋伪粗体三号（16pt）

### 格式设置
- 页面边距：左、右页边距为2.8cm，上页边距为3.7cm，下页边距为3.5cm（统一设置）
- 段落首行缩进：2字符
- 列表格式：中文编号，对齐正文缩进
- 页码：底部居中
- 标题与正文间距：1行

### 自定义命令
- `\article{条款标题}`：创建条款（自动编号）
- `\showcompanyrulescfg`：显示当前配置信息（用于调试）
- `\setcompanyrulescfg{参数名}{参数值}`：动态修改配置参数，可配置的参数包括：
  - `leftmargin`：左页边距（例如：`2.8cm`）
  - `rightmargin`：右页边距（例如：`2.8cm`）
  - `topmargin`：上页边距（例如：`3.7cm`）
  - `bottommargin`：下页边距（例如：`3.5cm`）
  - `fontsize`：正文字体大小（例如：`15pt` 或 `16pt`）
  - `lineheight`：行距（例如：`30pt` 或 `32pt`）
  - `fakebold`：伪粗体强度（例如：`3`）
  - `indent`：段落首行缩进（例如：`2em`）
  - `primaryfont`：主字体名称（例如：`STFangsong`）
  - `titlefont`：标题字体名称（例如：`STZhongsong`）
  - `titlesize`：文档标题字体大小（例如：`22pt`）
  - `bracket`：条款标题是否使用括号（`1`表示使用，`0`表示不使用）

## 注意事项

1. 使用文档类方式无需手动加载`ctexart`
2. 确保系统已安装所需字体（仿宋、华文中宋）
3. 使用 XeLaTeX 编译器，不是 PDFLaTeX
4. 修改样式请直接编辑 `company-rules.cls` 文件
