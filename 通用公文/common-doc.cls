% !TeX program = XeLaTeX
% !TeX encoding = UTF-8
%%
%% 通用公文LaTeX文档类 (v1.1 - 优化版)
%% 版本：1.1 - 改用 article + ctex 宏包，精确控制行距
%% 日期：2025-10-09
%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-doc}[2025-10-09 v1.1 通用公文文档类]

% ==================== 参数化配置 ====================

\def\commondoc@leftmargin{2.8cm}
\def\commondoc@rightmargin{2.8cm}
\def\commondoc@topmargin{3.7cm}
\def\commondoc@bottommargin{3.5cm}
\def\commondoc@fontsize{16pt}      % 三号字
\def\commondoc@subtitlefontsize{16.5pt}  % 楷体字，比仿宋大0.5pt
\def\commondoc@lineheight{30pt}    % 严格固定行距（Word 式固定值）
\def\commondoc@fakebold{3}
\def\commondoc@indent{2em}
\def\commondoc@primaryfont{STFangsong}
\def\commondoc@titlefont{STZhongsong}
\def\commondoc@maintitlesize{22pt}
\def\commondoc@subtitlefont{STKaiti}
\def\commondoc@subtitlebaseline{0.1ex}

% ==================== 选项处理 ====================

\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{article}%
  \PackageWarning{common-doc}{未知选项 '\CurrentOption'，传递给 article 文档类}%
}
\ProcessOptions\relax

% ==================== 基础文档类与中文支持 ====================

% 使用标准 article 类 + ctex 宏包（关键：禁用自动字体和行距缩放）
\LoadClass[a4paper]{article}
\RequirePackage[
  fontset=none,     % 禁止 ctex 自动设置字体
  linespread=1,     % 禁用行距缩放（核心！）
  autoindent=true,  % 保留首行缩进
  heading=true       % 启用标题格式设置功能
]{ctex}

% ==================== 必要宏包 ====================

\RequirePackage{geometry}
\RequirePackage{indentfirst}
\RequirePackage{enumitem}
\RequirePackage{remreset}
\RequirePackage{hyperref}

% ==================== 页面布局 ====================

\geometry{
  a4paper,
  left=\commondoc@leftmargin,
  right=\commondoc@rightmargin,
  top=\commondoc@topmargin,
  bottom=\commondoc@bottommargin
}
\ClassInfo{common-doc}{页面边距: 左=\commondoc@leftmargin, 右=\commondoc@rightmargin, 上=\commondoc@topmargin, 下=\commondoc@bottommargin}

% ==================== 字体设置（带错误处理） ====================

% 主字体（仿宋）
\IfFontExistsTF{\commondoc@primaryfont}{%
  \setCJKmainfont{\commondoc@primaryfont}[
    BoldFont=*,
    BoldFeatures={FakeBold=\commondoc@fakebold},
    ItalicFont=*,
    ItalicFeatures={FakeSlant=0.2}
  ]
}{%
  \ClassWarning{common-doc}{主字体 \commondoc@primaryfont\space 未找到，使用 SimSun}%
  \setCJKmainfont{SimSun}[
    BoldFont=*,
    BoldFeatures={FakeBold=\commondoc@fakebold},
    ItalicFont=*,
    ItalicFeatures={FakeSlant=0.2}
  ]
}

% 标题字体（中宋）
\IfFontExistsTF{\commondoc@titlefont}{%
  \newcommand{\commondoc@settitlefont}{\CJKfontspec{\commondoc@titlefont}[FakeBold=\commondoc@fakebold]}%
}{%
  \ClassWarning{common-doc}{标题字体 \commondoc@titlefont\space 未找到，使用 SimSun}%
  \newcommand{\commondoc@settitlefont}{\CJKfontspec{SimSun}[FakeBold=\commondoc@fakebold]}%
}

% 黑体
\IfFontExistsTF{STHeiti}{%
  \newcommand{\commondoc@setboldfont}{\CJKfontspec{STHeiti}}%
}{%
  \ClassWarning{common-doc}{黑体 STHeiti 未找到，使用 SimHei}%
  \newcommand{\commondoc@setboldfont}{\CJKfontspec{SimHei}}%
}

% 楷体（副标题）
\IfFontExistsTF{STKaiti}{%
  \newcommand{\commondoc@setsubtitlefont}{\fontsize{\commondoc@subtitlefontsize}{\commondoc@lineheight}\selectfont\CJKfontspec{STKaiti}}%
}{%
  \ClassWarning{common-doc}{楷体 STKaiti 未找到，使用 KaiTi}%
  \newcommand{\commondoc@setsubtitlefont}{\fontsize{\commondoc@subtitlefontsize}{\commondoc@lineheight}\selectfont\CJKfontspec{KaiTi}}%
}

% ==================== 字号与行距（严格固定） ====================

% 关键：禁用 LaTeX 行距自动拉伸，实现 Word 式固定行距
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize{\commondoc@fontsize}{\commondoc@lineheight}%
  % \lineskiplimit=100pt % 禁用自动拉伸（>0 即可）
  % \lineskip=0pt        % 拉伸时也不加间距
  \selectfont%
}

% 段落首行缩进
\setlength{\parindent}{\commondoc@indent}
\ClassInfo{common-doc}{段落首行缩进: \commondoc@indent}

% 确保标题后段落缩进
\@afterindenttrue

% ==================== 列表格式 ====================

\setlist[enumerate,1]{%
  wide=\commondoc@indent,
  labelsep=0pt,
  itemsep=0pt,
  parsep=0pt,      % 关键：列表内无额外间距
  topsep=0pt,      % 关键：列表与上下文无额外间距
  partopsep=0pt,
  listparindent=\commondoc@indent
}

% ==================== 行内标题命令 ====================

\let\original@subsection\subsection
\let\original@subsubsection\subsubsection

\renewcommand{\subsection}{\@ifstar{\@subsection@star}{\original@subsection}}
\renewcommand{\subsubsection}{\@ifstar{\@subsubsection@star}{\original@subsubsection}}

\newcommand{\@subsection@star}[2][]{%
  \stepcounter{subsection}%
  {\normalfont\smash{\raisebox{\commondoc@subtitlebaseline}{\commondoc@setsubtitlefont（\chinese{subsection}）#2}}}%
  \ignorespaces
}

\newcommand{\@subsubsection@star}[2][]{%
  \stepcounter{subsubsection}%
  {\normalfont\fontsize{\commondoc@fontsize}{\commondoc@lineheight}\selectfont\arabic{subsubsection}. #2}\space%
  \ignorespaces
}

% ==================== 自定义 paragraph 命令 ====================

\def\theparagraph{（\arabic{paragraph}）}
\renewcommand{\paragraph}{\@ifstar{\@paragraphstar}{\@paragraphnormal}}

\newcommand{\@paragraphnormal}[1]{%
  \refstepcounter{paragraph}%
  \begingroup\normalfont\theparagraph#1\par\endgroup
}

\newcommand{\@paragraphstar}[1]{%
  \stepcounter{paragraph}%
  \begingroup\normalfont\theparagraph#1\endgroup\ignorespaces
}

% ==================== 章节标题格式 ====================

\ctexset{
  section = {
    format = \normalfont\commondoc@setboldfont,
    name = {,、},
    number = \chinese{section},
    aftername = \hspace{0pt},
    beforeskip = 0pt,
    afterskip = 0pt,
    indent = \commondoc@indent
  },
  subsection = {
    format = \normalfont\commondoc@setsubtitlefont,
    name = {（,）},
    number = \chinese{subsection},
    aftername = \hspace{0pt},
    beforeskip = 0pt,
    afterskip = 0pt,
    indent = \commondoc@indent
  },
  subsubsection = {
    format = \normalfont,
    name = {,.\hspace{0.5em}},
    number = \arabic{subsubsection},
    aftername = \hspace{0pt},
    beforeskip = 0pt,
    afterskip = 0pt,
    indent = \commondoc@indent
  },
  paragraph = {
    format = \normalfont,
    name = {（,）},
    number = \arabic{paragraph},
    aftername = \hspace{0pt},
    beforeskip = 0pt,
    afterskip = 0pt,
    indent = \commondoc@indent
  }
}
\setcounter{secnumdepth}{4}

% ==================== 页面与标题 ====================

\pagestyle{plain}

% 标题格式
\let\original@title\title
\renewcommand{\title}[1]{%
  \original@title{%
    \fontsize{\commondoc@maintitlesize}{\commondoc@maintitlesize}%
    \commondoc@settitlefont\selectfont #1%
  }%
}

\let\original@author\author
\renewcommand{\author}[1]{%
  \original@author{%
    \fontsize{\commondoc@fontsize}{\commondoc@lineheight}%
    \selectfont #1%
  }%
}

\let\original@maketitle\maketitle
\renewcommand{\maketitle}{%
  \begingroup
  \centering
  \@title\par
  \vspace{\baselineskip}%
  \endgroup
}

% ==================== 辅助命令 ====================

\newcommand{\showcommondoccfg}{%
  \typeout{=== Common Document v1.1 配置 ===}%
  \typeout{行距: \commondoc@lineheight}%
  \typeout{正文字号: \commondoc@fontsize}%
  \typeout{楷体字号: \commondoc@subtitlefontsize}%
  \typeout{主字体: \commondoc@primaryfont}%
  \typeout{===============================}%
}

\newcommand{\commondocversion}{%
  \ClassInfo{common-doc}{版本: 1.1, 日期: 2025-10-09}%
}

\newcommand{\setcommondoccfg}[2]{%
  \@ifundefined{commondoc@#1}{%
    \ClassWarning{common-doc}{未知配置项: #1}%
  }{%
    \expandafter\def\csname commondoc@#1\endcsname{#2}%
    \ClassInfo{common-doc}{配置 #1 已更新为: #2}%
  }%
}

% hyperref 最后加载
\hypersetup{
  colorlinks=true,
  linkcolor=black,
  filecolor=black,
  urlcolor=black,
  citecolor=black
}

\endinput