% !TeX program = XeLaTeX
% !TeX encoding = UTF-8
%%
%% 通用公文LaTeX文档类 (v1.0)
%% 版本：1.0 - 文档类版本
%% 日期：2024-01-01
%% 
%% 使用方法：
%% \documentclass{common-doc}
%% 或者使用预定义配置：
%% \documentclass[small]{common-doc}  % 小字体配置
%% \documentclass[large]{common-doc}  % 大字体配置
%%

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{common-doc}[2024-01-01 v1.0 通用公文文档类]

% ==================== 参数化配置 ====================

% 定义可配置参数的默认值
\def\commondoc@leftmargin{2.8cm}% 左页边距
\def\commondoc@rightmargin{2.8cm}% 右页边距
\def\commondoc@topmargin{3.7cm}% 上页边距
\def\commondoc@bottommargin{3.5cm}% 下页边距
\def\commondoc@fontsize{16pt}% 正文字号（三号）
\def\commondoc@lineheight{32pt}% 行距（适配三号字）
\def\commondoc@fakebold{3}% 伪粗体强度
\def\commondoc@indent{2em}% 段落首行缩进
\def\commondoc@primaryfont{STFangsong}% 正文字体
\def\commondoc@titlefont{STZhongsong}% 标题字体
\def\commondoc@maintitlesize{22pt}% 主标题字号
\def\commondoc@subtitlefont{STKaiti}% 副标题字体

% 声明类选项
% 统一使用三号字，不再提供small和large选项

% 处理未知选项
\DeclareOption*{%
  \PassOptionsToClass{\CurrentOption}{ctexart}%
  \PackageWarning{official-doc}{未知选项 '\CurrentOption'，传递给ctexart文档类}%
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
\RequirePackage{datetime}
\RequirePackage{titlesec}  % 添加titlesec宏包用于精确控制标题格式

% ==================== 页面布局设置 ====================

% 使用参数化的页面设置
\geometry{a4paper, left=\commondoc@leftmargin, right=\commondoc@rightmargin, top=\commondoc@topmargin, bottom=\commondoc@bottommargin}
\ClassInfo{official-doc}{页面边距设置为: 左=\commondoc@leftmargin, 右=\commondoc@rightmargin, 上=\commondoc@topmargin, 下=\commondoc@bottommargin}

% ==================== 字体设置与错误处理 ====================

% 简化的字体设置，带错误处理
\IfFontExistsTF{\commondoc@primaryfont}{%
  \ClassInfo{official-doc}{找到主字体: \commondoc@primaryfont}%
  \setCJKmainfont{\commondoc@primaryfont}[
      BoldFont=*,
      BoldFeatures={FakeBold=\commondoc@fakebold},
      ItalicFont=*,
      ItalicFeatures={FakeSlant=0.2}
  ]
}{%
  \ClassWarning{official-doc}{主字体 \commondoc@primaryfont\space 未找到，使用默认字体}%
  \setCJKmainfont{SimSun}[
      BoldFont=*,
      BoldFeatures={FakeBold=\commondoc@fakebold},
      ItalicFont=*,
      ItalicFeatures={FakeSlant=0.2}
  ]
}

% 定义标题字体命令
\IfFontExistsTF{\commondoc@titlefont}{%
  \ClassInfo{official-doc}{找到标题字体: \commondoc@titlefont}%
  \newcommand{\commondoc@settitlefont}{\CJKfontspec{\commondoc@titlefont}[FakeBold=\commondoc@fakebold]}%
}{%
  \ClassWarning{official-doc}{标题字体 \commondoc@titlefont\space 未找到，使用默认字体}%
  \newcommand{\commondoc@settitlefont}{\CJKfontspec{SimSun}[FakeBold=\commondoc@fakebold]}%
}

% 定义黑体字命令
\IfFontExistsTF{STHeiti}{%
  \ClassInfo{official-doc}{找到黑体: STHeiti}%
  \newcommand{\commondoc@setboldfont}{\CJKfontspec{STHeiti}}%
}{%
  \ClassWarning{official-doc}{黑体 STHeiti 未找到，使用默认字体}%
  \newcommand{\commondoc@setboldfont}{\CJKfontspec{SimHei}}%
}

% 定义副标题字体命令（楷体）
\IfFontExistsTF{STKaiti}{%
  \ClassInfo{official-doc}{找到楷体: STKaiti}%
  \newcommand{\commondoc@setsubtitlefont}{\CJKfontspec{STKaiti}}%
}{%
  \ClassWarning{official-doc}{楷体 STKaiti 未找到，使用默认字体}%
  \newcommand{\commondoc@setsubtitlefont}{\CJKfontspec{KaiTi}}%
}

% 定义仿宋体字命令
\IfFontExistsTF{STFangsong}{%
  \ClassInfo{official-doc}{找到仿宋体: STFangsong}%
  \newcommand{\commondoc@setfongsongfont}{\CJKfontspec{STFangsong}}%
}{%
  \ClassWarning{official-doc}{仿宋体 STFangsong 未找到，使用默认字体}%
  \newcommand{\commondoc@setfongsongfont}{\CJKfontspec{STFangsong}}%
}

% ==================== 字体大小和行距设置 ====================

% 重新定义\normalsize命令，使用参数化设置
\renewcommand{\normalsize}{%
  \@setfontsize\normalsize{\commondoc@fontsize}{\commondoc@lineheight}%
  \linespread{1}%
  \selectfont%
}

% 设置段落首行缩进
\setlength{\parindent}{2em}
\ClassInfo{official-doc}{段落首行缩进设置为: 2em}




% 使用titlesec的段落设置，确保首行缩进
\usepackage{indentfirst}

% 设置标题后段落的缩进
\@afterindenttrue



% ==================== 列表格式设置 ====================

% 设置全局有序列表格式，使用参数化缩进
\setlist[enumerate,1]{%
  wide=\commondoc@indent, 
  labelsep=0pt, 
  itemsep=0pt,
  parsep=\parskip,
  topsep=\parskip,
  partopsep=0pt, 
  listparindent=\commondoc@indent%
}



% ==================== 章节标题格式 ====================

% 使用titlesec宏包精确控制标题格式
\titleformat{\section}
  {\fontsize{16pt}{32pt}\selectfont\commondoc@setboldfont}
  {\chinese{section}、}
  {0pt}
  {}
\titlespacing*{\section}
  {2em}
  {0pt}
  {0pt}

\titleformat{\subsection}
  {\fontsize{16pt}{32pt}\selectfont\commondoc@setsubtitlefont}
  {（\chinese{subsection}）}
  {0pt}
  {}
\titlespacing*{\subsection}
  {2em}
  {0pt}
  {0pt}

\titleformat{\subsubsection}
  {\fontsize{16pt}{32pt}\selectfont}
  {\arabic{subsubsection}. }
  {0pt}
  {}
\titlespacing*{\subsubsection}
  {2em}
  {0pt}
  {0pt}

\setcounter{secnumdepth}{4}
\titleformat{\paragraph}
  {\fontsize{16pt}{32pt}\selectfont}
  {（\arabic{paragraph}）}
  {0pt}
  {}
\titlespacing*{\paragraph}
  {2em}
  {0pt}
  {0pt}

% ==================== 页面样式设置 ====================

% 设置页面样式为plain，显示页码在底部居中
\pagestyle{plain}

% ==================== 文档标题格式 ====================

% 重定义\title命令，使其自动应用文档类的字体样式
\makeatletter
\let\original@title\title
\renewcommand{\title}[1]{%
  \original@title{\fontsize{\commondoc@maintitlesize}{\commondoc@maintitlesize}\commondoc@settitlefont\selectfont #1}%
}

% 重定义\author命令，使其自动应用文档类的字体样式
\let\original@author\author
\renewcommand{\author}[1]{%
  \original@author{\fontsize{\commondoc@fontsize}{\commondoc@lineheight}\selectfont #1}%
}

% 重定义\maketitle命令，控制标题与正文间的间距
\let\original@maketitle\maketitle
\renewcommand{\maketitle}{% 简化的标题格式，只显示标题
  \begingroup%
  \centering%
  \@title\par%
  \vspace{\baselineskip}% 添加一行行距
  \endgroup%
}
\makeatother



% ==================== 辅助命令 ====================

% 提供配置查看命令（调试用）
\makeatletter
\newcommand{\showcommondoccfg}{%  
  \typeout{=== Official Document v1 配置信息 ===}%
  \typeout{左页边距: \commondoc@leftmargin}%
  \typeout{右页边距: \commondoc@rightmargin}%
  \typeout{上页边距: \commondoc@topmargin}%
  \typeout{下页边距: \commondoc@bottommargin}%
  \typeout{正文字体大小: \meaning\commondoc@fontsize}%
  \typeout{主标题字体大小: \meaning\commondoc@maintitlesize}%
  \typeout{行距: \commondoc@lineheight}%
  \typeout{段落缩进: \commondoc@indent}%
  \typeout{主字体: \commondoc@primaryfont}%
  \typeout{标题字体: \commondoc@titlefont}%
  \typeout{副标题字体: \commondoc@subtitlefont}%
  \typeout{伪粗体强度: \commondoc@fakebold}%
  \typeout{===============================}%
}
\makeatother

% 版本信息命令
\newcommand{\commondocversion}{%
  \ClassInfo{official-doc}{版本: 1.0, 日期: 2024-01-01}%
}

% 提供运行时配置修改命令
\makeatletter
\newcommand{\setcommondoccfg}[2]{%
  \@ifundefined{commondoc@#1}{%
    \ClassWarning{official-doc}{未知配置项: #1}%
  }{%
    \expandafter\def\csname commondoc@#1\endcsname{#2}%
    \ClassInfo{official-doc}{配置 #1 已更新为: #2}%
  }
}
\makeatother

% ==================== 行内标题命令变体 ====================

% 定义行内subsection命令（使用星号版本）
\makeatletter
\newcommand{\subsection@inline}[1]{%
  {\normalfont\fontsize{16pt}{32pt}\selectfont\commondoc@setsubtitlefont（\chinese{subsection}）#1}\space%
  \refstepcounter{subsection}%
}
\makeatother

% 定义行内subsubsection命令（使用星号版本）
\makeatletter  
\newcommand{\subsubsection@inline}[1]{%
  {\normalfont\fontsize{16pt}{32pt}\selectfont\arabic{subsubsection}. #1}\space%
  \refstepcounter{subsubsection}%
}
\makeatother

% 支持星号命令的简单实现
\makeatletter
\newcommand{\subsection@star}[1]{%
  {\normalfont\fontsize{16pt}{32pt}\selectfont\commondoc@setsubtitlefont（\chinese{subsection}）#1}\space%
  \refstepcounter{subsection}%
}
\makeatother

% 真正的星号命令实现
\makeatletter
\let\original@subsection\subsection
\let\original@subsubsection\subsubsection

% 重定义 subsection 支持星号
\renewcommand{\subsection}{%
  \@ifstar
    {\@subsection@star}
    {\original@subsection}}

% 重定义 subsubsection 支持星号  
\renewcommand{\subsubsection}{%
  \@ifstar
    {\@subsubsection@star}
    {\original@subsubsection}}

% 星号 subsection 实现
\newcommand{\@subsection@star}[2][]{%
  \stepcounter{subsection}%
  {\normalfont\fontsize{16pt}{32pt}\selectfont\commondoc@setsubtitlefont（\chinese{subsection}）#2}\space%
  \ignorespaces}

% 星号 subsubsection 实现
\newcommand{\@subsubsection@star}[2][]{%
  \stepcounter{subsubsection}%
  {\normalfont\fontsize{16pt}{32pt}\selectfont\arabic{subsubsection}. #2}\space%
  \ignorespaces}
\makeatother

% 结束文档类定义
\endinput