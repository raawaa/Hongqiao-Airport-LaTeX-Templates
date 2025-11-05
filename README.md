# 国有企业公文模板项目

## 项目概述

为国有企业提供一套贴近内部文档规范的 LaTeX 模板。

## 模板状态

- [x] 公司规章制度模板：用于创建公司内部的规章制度文档。
- [x] 通用公文模板：用于创建通用的正式公文，如事件报告、发文稿、联系单等。

## 使用方法

### 公司规章制度模板

将以下文件复制到你的LaTeX项目目录：
- `company-rule.cls` - 规章制度文档类文件
- `soe-common.sty` - 共享工具包（必需）

然后在你的 `.tex` 文件中使用：

```latex
\documentclass{company-rule}

% 可选配置
% \documentclass[small]{company-rule}         % 小字体（小三号15pt）
% \documentclass[large]{company-rule}         % 大字体（三号16pt）
% \documentclass[nobracket]{company-rule}     % 条款标题不加括号
% \documentclass[small,nobracket]{company-rule} % 组合选项

\begin{document}

% 使用 article 环境创建条款
\article{总则}
第一条 本制度适用于公司全体员工。

% 动态配置示例（可选）
\setcompanyrulecfg{leftmargin}{3cm}
\setcompanyrulecfg{fontsize}{16pt}

\article{附则}
第二十条 本制度自发布之日起施行。

\end{document}
```

#### 默认版面设置

**页面布局：**
- 纸张大小：A4（210mm × 297mm）
- 页边距：左2.8cm，右2.8cm，上3.7cm，下3.5cm
- 页面样式：plain（页码居中显示在页脚）

**字体设置：**
- 主字体：华文仿宋（STFangsong），小三号（15pt）
- 标题字体：华文中宋（STZhongsong），二号（22pt）
- 伪粗体强度：3（用于模拟粗体效果）
- 备选字体：如系统无华文字体，自动使用宋体（SimSun）

**段落格式：**
- 行距：30pt固定行距（Word式固定值，不自动拉伸）
- 段落缩进：2字符（2em）
- 条款间距：0pt（条款间无额外间距）

**条款编号：**
- 章标题："第X章"格式，居中显示
- 条款标题："第X条"格式，默认带括号（如"（总则）"）
- 条款编号：全文连续编号，不重置
- 列表格式：中文数字编号，带括号（如"（一）"）

### 通用公文模板

将以下文件复制到你的LaTeX项目目录：
- `common-doc.cls` - 通用公文文档类文件
- `soe-common.sty` - 共享工具包（必需）

然后在你的 `.tex` 文件中使用：

```latex
\documentclass{common-doc}

\begin{document}

% 四级标题体系
\section{一、工作概述}              % 一级标题：中文数字编号
这里是工作概述内容。

\subsection*{重要说明}             % 行内标题：不换行，编号递增
这里是重要说明内容。

\subsubsection{具体措施}           % 三级标题：阿拉伯数字
正文内容...

\paragraph{具体要求}               % 四级标题：段内编号
正文内容...

% 动态配置示例（可选）
\setcommondoccfg{lineheight}{32pt}
\setcommondoccfg{primaryfont}{SimSun}

% 列表环境
\begin{enumerate}
  \item 第一项内容
  \item 第二项内容
\end{enumerate}

\end{document}
```

#### 默认版面设置

**页面布局：**
- 纸张大小：A4（210mm × 297mm）
- 页边距：左2.8cm，右2.8cm，上3.7cm，下3.5cm
- 页面样式：plain（页码居中显示在页脚）

**字体设置：**
- 主字体：华文仿宋（STFangsong），三号（16pt）
- 标题字体：华文中宋（STZhongsong），二号（22pt）
- 副标题字体：华文楷体（STKaiti），16.5pt
- 粗体字体：华文黑体（STHeiti）
- 伪粗体强度：3（用于模拟粗体效果）
- 备选字体：如系统无华文字体，自动使用宋体（SimSun）、黑体（SimHei）、楷体（KaiTi）

**段落格式：**
- 行距：30pt固定行距（Word式固定值，不自动拉伸）
- 段落缩进：2字符（2em）
- 标题间距：0pt（各级标题间无额外间距）
- 列表间距：0pt（列表项间无额外间距）

**四级标题体系：**
- 一级标题（section）：中文数字编号，如"一、"，黑体，段首缩进
- 二级标题（subsection）：中文数字编号，如"（一）"，楷体，段首缩进
- 三级标题（subsubsection）：阿拉伯数字编号，如"1."，仿宋，段首缩进
- 四级标题（paragraph）：阿拉伯数字编号，如"（1）"，仿宋，段首缩进

#### 特殊功能说明

**行内标题**：
- 使用 `\subsection*{标题}`、`\subsubsection*{标题}`、`\paragraph*{标题}` 创建不换行的行内标题
- 编号仍会递增，但标题与正文在同一行
- 适合条例式文档结构

**附件环境**：
- 使用 `\begin{attachments}` 或 `\begin{附件}` 创建附件列表
- 自动编号，格式为"附件：1. 附件名称"
- 支持多附件，自动换行对齐

**动态配置**：
- `\setcompanyrulecfg{参数}{值}` - 规章制度模板配置
- `\setcommondoccfg{参数}{值}` - 通用公文模板配置
- 支持运行时调整页面边距、字体、行距等参数

### 可配置参数

**规章制度模板 (company-rule)：**

- `leftmargin` - 左页边距（默认：2.8cm）
- `rightmargin` - 右页边距（默认：2.8cm）
- `topmargin` - 上页边距（默认：3.7cm）
- `bottommargin` - 下页边距（默认：3.5cm）
- `fontsize` - 字体大小（默认：15pt）
- `lineheight` - 行距（默认：30pt）
- `primaryfont` - 主字体（默认：STFangsong）
- `titlefont` - 标题字体（默认：STZhongsong）
- `titlesize` - 标题字号（默认：22pt）
- `indent` - 段落缩进（默认：2em）
- `fakebold` - 伪粗体强度（默认：3）
- `bracket` - 条款标题是否加括号（默认：1，加括号）

**通用公文模板 (common-doc)：**
- `leftmargin` - 左页边距（默认：2.8cm）
- `rightmargin` - 右页边距（默认：2.8cm）
- `topmargin` - 上页边距（默认：3.7cm）
- `bottommargin` - 下页边距（默认：3.5cm）
- `fontsize` - 字体大小（默认：16pt）
- `lineheight` - 行距（默认：30pt）
- `primaryfont` - 主字体（默认：STFangsong）
- `titlefont` - 标题字体（默认：STZhongsong）
- `subtitlefont` - 副标题字体（默认：STKaiti）
- `subtitlefontsize` - 副标题字号（默认：16.5pt）
- `maintitlesize` - 主标题字号（默认：22pt）
- `indent` - 段落缩进（默认：2em）
- `fakebold` - 伪粗体强度（默认：3）
- `subtitlebaseline` - 副标题基线调整（默认：0.1ex）



## 许可证

本项目采用 MIT 许可证，详见 [LICENSE](LICENSE) 文件。

