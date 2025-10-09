# LaTeX 通用公文文档类使用说明（common-doc v1.1）


## 快速开始

### 最小示例

```latex
% !TeX program = XeLaTeX
% !TeX encoding = UTF-8

\documentclass{common-doc}

\title{关于加强机场安全管理工作的通知}

\begin{document}
\maketitle

% 一级标题（中文序号 + 顿号）
\section{提高安全意识，落实安全责任}

% 二级标题（带星号形态为“行内标题”，不换行）
\subsection*{加强组织领导}
行内说明文字……

% 三级标题（阿拉伯数字序号）
\subsubsection{具体措施}
正文……

% 四级标题（段内编号样式：（1）（2）…）
\paragraph{具体要求}
正文……

% 无额外上下间距的列表
\begin{enumerate}
  \item 每月组织一次全面检查；
  \item 建立台账并闭环整改。
\end{enumerate}

\end{document}
```

### 固定行距与字号

- **正文字号**: 默认 16pt（三号）
- **行距**: 默认 30pt，采用“固定行距”策略（禁用自动拉伸），版式更贴近办公软件排版。

### 页面边距（A4）

- 左 2.8cm  右 2.8cm  上 3.7cm  下 3.5cm

## 功能与用法

### 标题体系

- `\section`：中文数字编号，形如“一、二、三、…”，粗体；
- `\subsection`：中文括号编号，形如“（一）（二）…”，采用楷体；
- `\subsubsection`：阿拉伯数字“1. 2. 3.”；
- `\paragraph`：段内编号“（1）（2）…”。

带星号形式（如 `\subsection*{...}`、`\subsubsection*{...}`、`\paragraph*{...}`）提供“行内标题”效果：编号仍递增，但不另起一段，紧随其后为正文，更适合条例式结构。

### 列表与段落

- 默认保留 `2em` 首行缩进；
- `enumerate` 列表已去除额外上下间距，列表内外行距一致。

### 动态配置

在文档中可通过 `\setcommondoccfg{键}{值}` 动态调整配置，例如：

```latex
% 版面与排版
\setcommondoccfg{leftmargin}{3cm}
\setcommondoccfg{rightmargin}{2.6cm}
\setcommondoccfg{topmargin}{3.7cm}
\setcommondoccfg{bottommargin}{3.5cm}
\setcommondoccfg{indent}{2em}

% 字体与字号
\setcommondoccfg{fontsize}{16pt}          % 正文字号（三号）
\setcommondoccfg{lineheight}{30pt}        % 固定行距
\setcommondoccfg{primaryfont}{STFangsong} % 仿宋（正文）
\setcommondoccfg{titlefont}{STZhongsong}  % 中宋（标题）
\setcommondoccfg{maintitlesize}{22pt}     % 主标题字号
\setcommondoccfg{subtitlefont}{STKaiti}   % 楷体（副标题）
\setcommondoccfg{subtitlefontsize}{16.5pt}% 副标题字号
\setcommondoccfg{fakebold}{3}             % 伪粗体强度
```

支持的键包括但不限于：

- `leftmargin`、`rightmargin`、`topmargin`、`bottommargin`
- `fontsize`、`lineheight`
- `indent`
- `primaryfont`、`titlefont`、`maintitlesize`
- `subtitlefont`、`subtitlefontsize`、`subtitlebaseline`
- `fakebold`

### 调试与版本信息

- `\showcommondoccfg`：在编译日志中输出当前关键配置（行距、字号、字体等）；
- `\commondocversion`：在编译信息中输出文档类版本与日期。

## 环境要求

- **LaTeX 发行版**: TeX Live 2020+ 或 MiKTeX 2.9+
- **编译器**: XeLaTeX（需 `fontspec`/`ctex` 支持中文系统字体）
- **字体建议**: `STFangsong`、`STZhongsong`、`STKaiti`（缺失时自动回退到 `SimSun`、`SimHei`、`KaiTi` 并给出警告）

## 编译方法

使用 XeLaTeX 编译（建议在同一目录中执行）：

```bash
xelatex example.tex
```

生成目录或引用时请至少编译两次：

```bash
xelatex example.tex
xelatex example.tex
```
