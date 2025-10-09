% !TeX program = XeLaTeX
% !TeX encoding = UTF-8
%%
%% 公司规章制度LaTeX文档类 (优化版本 v2.0)
%% 版本：2.0 - 文档类版本
%% 日期：2024-01-01
%% 
%% 使用方法：
%% \documentclass{company-rules}
%% 或者使用预定义配置：
%% \documentclass[small]{company-rules}  % 小字体配置
%% \documentclass[large]{company-rules}  % 大字体配置
%% \documentclass[nobracket]{company-rules}  % 条款标题不加括号
%% \documentclass[small,nobracket]{company-rules}  % 组合选项
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{company-rules}[2024-01-01 v2.0 公司规章制度文档类]

% ==================== 参数化配置 ====================

% 定义可配置参数的默认值（使用small配置作为默认）
\def\companyrules@margin{1.5in}
\def\companyrules@fontsize{15pt}
\def\companyrules@lineheight{30pt}
\def\companyrules@fakebold{3}
\def\companyrules@indent{2em}
\def\companyrules@primaryfont{STFangsong}
\def\companyrules@titlefont{STZhongsong}
\def\companyrules@titlesize{18pt}
\def\companyrules@bracket{1} % 默认使用括号

% 声明类选项（使用中文字号标准）
\DeclareOption{small}{%
  \def\companyrules@fontsize{15pt}%          % 小三号约15pt
  \def\companyrules@lineheight{30pt}%        % 适配小三号的行距
  \def\companyrules@margin{1.5in}%
  \def\companyrules@titlesize{18pt}%         % 小二号约18pt
}

\DeclareOption{large}{%
  \def\companyrules@fontsize{16pt}%          % 三号约16pt
  \def\companyrules@lineheight{32pt}%        % 适配三号的行距
  \def\companyrules@margin{1.0in}%
  \def\companyrules@titlesize{18pt}%         % 小二号约18pt
}

\DeclareOption{nobracket}{%
  \def\companyrules@bracket{0}%              % 不使用括号
}

\DeclareOption{bracket}{%
  \def\companyrules@bracket{1}%              % 使用括号（默认已启用）
}

% 处理未知选项
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{ctexart}%
  \PackageWarning{company-rules}{未知选项 '\CurrentOption'，传递给ctexart文档类}%
}

% 处理选项
\ProcessOptions\relax

% ==================== 基础文档类设置 ====================

% 加载基础文档类ctexart，并传递所有未知选项
\LoadClass[a4paper]{ctexart}

% ==================== 必要的宏包加载 ====================

% 加载必要的宏包
\RequirePackage{geometry}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{remreset}

% ==================== 页面布局设置 ====================

% 使用参数化的页面设置
\geometry{a4paper, margin=\companyrules@margin}
\ClassInfo{company-rules}{页面边距设置为: \companyrules@margin}

% ==================== 字体设置与错误处理 ====================

% 简化的字体设置，带错误处理
\IfFontExistsTF{\companyrules@primaryfont}{%
  \ClassInfo{company-rules}{找到主字体: \companyrules@primaryfont}%
  \setCJKmainfont{\companyrules@primaryfont}[
      BoldFont=*,
      BoldFeatures={FakeBold=\companyrules@fakebold},
      ItalicFont=*,
      ItalicFeatures={FakeSlant=0.2}
  ]
}{%
  \ClassWarning{company-rules}{主字体 \companyrules@primaryfont\space 未找到，使用默认字体}%
  \setCJKmainfont{SimSun}[
      BoldFont=*,
      BoldFeatures={FakeBold=\companyrules@fakebold},
      ItalicFont=*,
      ItalicFeatures={FakeSlant=0.2}
  ]
}

% 定义标题字体命令
\IfFontExistsTF{\companyrules@titlefont}{%
  \ClassInfo{company-rules}{找到标题字体: \companyrules@titlefont}%
  \newcommand{\companyrules@settitlefont}{\CJKfontspec{\companyrules@titlefont}}%
}{%
  \ClassWarning{company-rules}{标题字体 \companyrules@titlefont\space 未找到，使用默认字体}%
  \newcommand{\companyrules@settitlefont}{\CJKfontspec{SimSun}}%
}

% ==================== 字体大小和行距设置 ====================

% 重新定义\normalsize命令，使用参数化设置
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize{\companyrules@fontsize}{\companyrules@lineheight}%
  \linespread{1}%
  \selectfont%
}

% 设置段落首行缩进
\setlength{\parindent}{\companyrules@indent}

% ==================== 列表格式设置 ====================

% 设置全局有序列表格式，使用参数化缩进
\setlist[enumerate]{%
  label=（\chinese*）, 
  wide=\companyrules@indent, 
  labelsep=0pt, 
  itemsep=0pt, 
  listparindent=\companyrules@indent%
}

% ==================== 章节标题格式（统一设置）====================

% 统一设置章节格式，避免重复配置
\ctexset{
    % 章标题设置
    section/name = {第,章},
    section/number = \chinese{section},
    section/format = \centering\fontsize{\companyrules@titlesize}{\companyrules@titlesize}\companyrules@settitlefont\selectfont,
    % 条款标题设置（合并设置，消除冗余）
    subsection/name = {第,条},
    subsection/number = \chinese{subsection},
    subsection/format = \fontsize{\companyrules@fontsize}{\companyrules@lineheight}\selectfont\bfseries,
    subsection/aftername = {\hspace{0.5em}},
    subsection/beforeskip = 0pt,
    subsection/afterskip = 0pt,
    subsection/indent = \companyrules@indent,
}

% ==================== 条款编号格式 ====================

% 重定义subsection标题显示格式
\renewcommand{\thesubsection}{第\chinese{subsection}条}

% 将条款计数器从section中分离，使其在整个文档中连续编号
\makeatletter
\@removefromreset{subsection}{section}
\makeatother

% 定义条款标题命令，增加错误处理
\makeatletter
\newcommand{\article}[1]{%
  \@ifundefined{subsection}{%
    \ClassError{company-rules}{subsection命令未定义}{请确保使用支持subsection的文档类}%
  }{%
    \ifnum\companyrules@bracket=1
      \subsection[#1]{（#1）}%
    \else
      \subsection[#1]{#1}%
    \fi
    \normalfont%
  }%
}
\makeatother

% ==================== 页面样式设置 ====================

% 设置页面样式为plain，显示页码在底部居中
\pagestyle{plain}

% ==================== 文档标题格式 ====================

% 重定义\title命令，使其自动应用文档类的字体样式
\makeatletter
\let\original@title\title
\renewcommand{\title}[1]{%
  \original@title{\fontsize{\companyrules@titlesize}{\companyrules@titlesize}\companyrules@settitlefont\selectfont #1}%
}
\makeatother


% ==================== 辅助命令 ====================

% 提供配置查看命令（调试用）
\makeatletter
\newcommand{\showcompanyrulescfg}{%
  \typeout{=== Company Rules v2 配置信息 ===}%
  \typeout{边距: \companyrules@margin}%
  \typeout{正文字体大小: \meaning\companyrules@fontsize}%
  \typeout{标题字体大小: \meaning\companyrules@titlesize}%
  \typeout{行距: \companyrules@lineheight}%
  \typeout{段落缩进: \companyrules@indent}%
  \typeout{主字体: \companyrules@primaryfont}%
  \typeout{标题字体: \companyrules@titlefont}%
  \typeout{伪粗体强度: \companyrules@fakebold}%
  \typeout{===============================}%
}
\makeatother

% 版本信息命令
\newcommand{\companyruleslversion}{%
  \ClassInfo{company-rules}{版本: 2.0, 日期: 2024-01-01}%
}

% 提供运行时配置修改命令
\makeatletter
\newcommand{\setcompanyrulescfg}[2]{%
  \@ifundefined{companyrules@#1}{%
    \ClassWarning{company-rules}{未知配置项: #1}%
  }{%
    \expandafter\def\csname companyrules@#1\endcsname{#2}%
    \ClassInfo{company-rules}{配置 #1 已更新为: #2}%
  }%
}
\makeatother

% 结束文档类定义
\endinput