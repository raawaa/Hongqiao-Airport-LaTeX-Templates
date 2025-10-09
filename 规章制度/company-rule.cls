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
\def\companyrule@leftmargin{2.8cm}% 左页边距
\def\companyrule@rightmargin{2.8cm}% 右页边距
\def\companyrule@topmargin{3.7cm}% 上页边距
\def\companyrule@bottommargin{3.5cm}% 下页边距
\def\companyrule@fontsize{15pt}
\def\companyrule@lineheight{30pt}
\def\companyrule@fakebold{3}
\def\companyrule@indent{2em}
\def\companyrule@primaryfont{STFangsong}
\def\companyrule@titlefont{STZhongsong}
\def\companyrule@titlesize{22pt}% 二号约22pt
\def\companyrule@bracket{1} % 默认使用括号

% 声明类选项（使用中文字号标准）
\DeclareOption{small}{%
  \def\companyrule@fontsize{15pt}%          % 小三号约15pt
  \def\companyrule@lineheight{30pt}%        % 适配小三号的行距
  \def\companyrule@titlesize{22pt}%         % 二号约22pt
}

\DeclareOption{large}{%
  \def\companyrule@fontsize{16pt}%          % 三号约16pt
  \def\companyrule@lineheight{32pt}%        % 适配三号的行距
  \def\companyrule@titlesize{22pt}%         % 二号约22pt
}

\DeclareOption{nobracket}{%
  \def\companyrule@bracket{0}%              % 不使用括号
}

\DeclareOption{bracket}{%
  \def\companyrule@bracket{1}%              % 使用括号（默认已启用）
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
\geometry{a4paper, left=\companyrule@leftmargin, right=\companyrule@rightmargin, top=\companyrule@topmargin, bottom=\companyrule@bottommargin}
\ClassInfo{company-rules}{页面边距设置为: 左=\companyrule@leftmargin, 右=\companyrule@rightmargin, 上=\companyrule@topmargin, 下=\companyrule@bottommargin}

% ==================== 字体设置与错误处理 ====================

% 简化的字体设置，带错误处理
\IfFontExistsTF{\companyrule@primaryfont}{%
  \ClassInfo{company-rules}{找到主字体: \companyrule@primaryfont}%
  \setCJKmainfont{\companyrule@primaryfont}[
      BoldFont=*,
      BoldFeatures={FakeBold=\companyrule@fakebold},
      ItalicFont=*,
      ItalicFeatures={FakeSlant=0.2}
  ]
}{%
  \ClassWarning{company-rules}{主字体 \companyrule@primaryfont\space 未找到，使用默认字体}%
  \setCJKmainfont{SimSun}[
      BoldFont=*,
      BoldFeatures={FakeBold=\companyrule@fakebold},
      ItalicFont=*,
      ItalicFeatures={FakeSlant=0.2}
  ]
}

% 定义标题字体命令
\IfFontExistsTF{\companyrule@titlefont}{%
  \ClassInfo{company-rules}{找到标题字体: \companyrule@titlefont}%
  \newcommand{\companyrule@settitlefont}{\CJKfontspec{\companyrule@titlefont}[FakeBold=\companyrule@fakebold]}%
}{%
  \ClassWarning{company-rules}{标题字体 \companyrule@titlefont\space 未找到，使用默认字体}%
  \newcommand{\companyrule@settitlefont}{\CJKfontspec{SimSun}[FakeBold=\companyrule@fakebold]}%
}

% ==================== 字体大小和行距设置 ====================

% 重新定义\normalsize命令，使用参数化设置
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize{\companyrule@fontsize}{\companyrule@lineheight}%
  \linespread{1}%
  \selectfont%
}

% 设置段落首行缩进
\setlength{\parindent}{\companyrule@indent}

% ==================== 列表格式设置 ====================

% 设置全局有序列表格式，使用参数化缩进
\setlist[enumerate]{%
  label=（\chinese*）, 
  wide=\companyrule@indent, 
  labelsep=0pt, 
  itemsep=0pt,
  parsep=\parskip,
  topsep=\parskip,
  partopsep=0pt, 
  listparindent=\companyrule@indent%
}

% ==================== 章节标题格式（统一设置）====================

% 统一设置章节格式，避免重复配置
\ctexset{
    % 章标题设置
    section/name = {第,章},
    section/number = \chinese{section},
    section/format = \centering\fontsize{\companyrule@fontsize}{\companyrule@lineheight}\companyrule@settitlefont\selectfont,
    % 条款标题设置（合并设置，消除冗余）
    subsection/name = {第,条},
    subsection/number = \chinese{subsection},
    subsection/format = \fontsize{\companyrule@fontsize}{\companyrule@lineheight}\selectfont\bfseries,
    subsection/aftername = {\hspace{0.5em}},
    subsection/beforeskip = 0pt,
    subsection/afterskip = 0pt,
    subsection/indent = \companyrule@indent,
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
    \ifnum\companyrule@bracket=1
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
  \original@title{\fontsize{\companyrule@titlesize}{\companyrule@titlesize}\companyrule@settitlefont\selectfont #1}%
}

% 重定义\maketitle命令，控制标题与正文间的间距为一行
\let\original@maketitle\maketitle
\renewcommand{\maketitle}{%
  \begingroup%
  \centering%
  \@title\par%
  \vspace{\baselineskip}% 仅添加一行行距
  \endgroup%
}
\makeatother

% ==================== 辅助命令 ====================

% 提供配置查看命令（调试用）
\makeatletter
\newcommand{\showcompanyrulecfg}{%  
  \typeout{=== Company Rules v2 配置信息 ===}%
  \typeout{左页边距: \companyrule@leftmargin}%
  \typeout{右页边距: \companyrule@rightmargin}%
  \typeout{上页边距: \companyrule@topmargin}%
  \typeout{下页边距: \companyrule@bottommargin}%
  \typeout{正文字体大小: \meaning\companyrule@fontsize}%
  \typeout{标题字体大小: \meaning\companyrule@titlesize}%
  \typeout{行距: \companyrule@lineheight}%
  \typeout{段落缩进: \companyrule@indent}%
  \typeout{主字体: \companyrule@primaryfont}%
  \typeout{标题字体: \companyrule@titlefont}%
  \typeout{伪粗体强度: \companyrule@fakebold}%
  \typeout{===============================}%
}
\makeatother

% 版本信息命令
\newcommand{\companyrulelversion}{%
  \ClassInfo{company-rules}{版本: 2.0, 日期: 2024-01-01}%
}

% 提供运行时配置修改命令
\makeatletter
\newcommand{\setcompanyrulecfg}[2]{%
  \@ifundefined{companyrule@#1}{%
    \ClassWarning{company-rules}{未知配置项: #1}%
  }{%
    \expandafter\def\csname companyrule@#1\endcsname{#2}%
    \ClassInfo{company-rules}{配置 #1 已更新为: #2}%
  }%
}
\makeatother

% 结束文档类定义
\endinput