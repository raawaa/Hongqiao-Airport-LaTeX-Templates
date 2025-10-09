# LaTeX 通用公文文档类使用说明

## 文件结构

```
通用公文/
├── common-doc.cls    # 通用公文文档类（核心模板）
├── example.tex         # 使用示例
└── README.md           # 本使用说明
```

## 使用方法

### 基础使用

```latex
% !TeX program = XeLaTeX
% !TeX encoding = UTF-8

\documentclass{common-doc}

\title{文档标题}

\begin{document}

\maketitle
\docorgan{发文机关}
\docnumber{文件编号}
\docdate{发文日期}
\vspace{1em}
\docrecipient{主送机关}

% 文档正文内容

\doccc{抄送机关}
\docattachment{附件列表}
\doctopic{主题词}

\end{document}
```

### 字体配置

文档类统一使用三号字作为正文字体，无需额外配置选项：

```latex
\documentclass{common-doc}  % 统一使用三号字
```

- **small**: 正文字号约15pt，行距30pt
- **large**: 正文字号约16pt，行距32pt

### 页面边距

页面边距已统一设置为：
- 左页边距: 2.8cm
- 右页边距: 2.8cm
- 上页边距: 3.7cm
- 下页边距: 3.5cm

## 特色功能

### 公文特有命令

1. **\docorgan{机关名称}**: 设置发文机关
2. **\docnumber{文号}**: 设置文件编号
3. **\docdate{日期}**: 设置发文日期
4. **\docrecipient{机关}**: 设置主送机关
5. **\doccc{机关}**: 设置抄送机关
6. **\docattachment{附件}**: 设置附件列表
7. **\doctopic{主题词}**: 设置主题词

### 动态配置参数

文档类支持在文档中动态修改配置参数，使用 `\setofficialdoccfg{参数名}{参数值}` 命令：

```latex
\setofficialdoccfg{fontsize}{16pt}     % 修改正文字体大小
\setofficialdoccfg{lineheight}{32pt}   % 修改行距
\setofficialdoccfg{leftmargin}{3cm}    % 修改左页边距
```

可配置的参数包括：
- `leftmargin`: 左页边距（例如：`2.8cm`）
- `rightmargin`: 右页边距（例如：`2.8cm`）
- `topmargin`: 上页边距（例如：`3.7cm`）
- `bottommargin`: 下页边距（例如：`3.5cm`）
- `fontsize`: 正文字体大小（例如：`15pt`）
- `lineheight`: 行距（例如：`30pt`）
- `fakebold`: 伪粗体强度（例如：`3`）
- `indent`: 段落首行缩进（例如：`2em`）
- `primaryfont`: 正文字体（例如：`STFangsong`）
- `titlefont`: 标题字体（例如：`STZhongsong`）
- `maintitlesize`: 主标题字体大小（例如：`22pt`）
- `subtitlefont`: 副标题字体（例如：`STKaiti`）

### 调试命令

- `\showofficialdoccfg`: 显示当前配置信息（用于调试）

## 环境要求

- **LaTeX 发行版**: TeX Live 2020+ 或 MiKTeX 2.9+
- **编译器**: XeLaTeX（支持中文系统字体）
- **必需字体**: 仿宋、华文中宋、楷体

## 编译方法

使用 XeLaTeX 编译：

```bash
xelatex example.tex
```

如需生成目录，需要编译两次：

```bash
xelatex example.tex
xelatex example.tex
```