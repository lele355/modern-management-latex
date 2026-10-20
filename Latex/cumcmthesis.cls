\NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{cumcmthesis}
              [2023/10/27 v3.0 Modified Standard LaTeX Template for General Usage]

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%  文件介绍：
%%  这是一个基于全国大学生数学建模竞赛标准模板 (cumcmthesis v2.6) 修改而来的通用模板类。
%%  
%%  主要修改：
%%  1. 删除了竞赛专用的“承诺书”和“编号页”。
%%  2. 保留了美观的页面布局、字体设置和代码高亮样式。
%%  3. 为各个部分添加了详细注释，方便根据需求开启或关闭特定功能。
%%
%%  使用方法：
%%  在你的 .tex 文件开头使用 \documentclass{cumcmthesis} 即可。
%%  需使用 XeLaTeX 进行编译。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 初始化代码
\newif\if@mcm@bwprint\@mcm@bwprintfalse
% \newif\if@mcm@preface\@mcm@prefacetrue % [修改] 注释掉：不再需要生成前言页（承诺书）的判断变量

% [修改] 注释掉：以下为竞赛专用Token定义（题号、队员信息等），通用模板不需要
%%%% 承诺书信息定义
% \newcommand\mcm@tokens@keywords{}
% \newcommand*\mcm@tokens@tihao{}
% \newcommand*\mcm@tokens@baominghao{}
% \newcommand*\mcm@tokens@schoolname{}
% \newcommand*\mcm@tokens@membera{}
% \newcommand*\mcm@tokens@memberb{}
% \newcommand*\mcm@tokens@memberc{}
% \newcommand*\mcm@tokens@supervisor{}
% \newcommand*\mcm@tokens@yearinput{}
% \newcommand*\mcm@tokens@monthinput{}
% \newcommand*\mcm@tokens@dayinput{}

%% 选项声明
\DeclareOption{colorprint}{\@mcm@bwprintfalse} % 彩色打印选项
\DeclareOption{bwprint}{\@mcm@bwprinttrue}     % 黑白打印选项
% \DeclareOption{withoutpreface}{\@mcm@prefacefalse} % [修改] 注释掉：不再需要此选项
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % 将其他选项传递给 article 类

%% 执行选项
\ExecuteOptions{colorprint}
\ProcessOptions\relax

%% 加载基础文档类
\LoadClass[a4paper,12pt]{article} % 基于 article 类，A4纸，12pt字号

%% 加载宏包及配置

% 检查编译引擎，必须使用 xelatex
\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
\ClassError{mcmthesis}{You must use the `xelatex' driver\MessageBreak Please choose `xelatex'}{%
Just choose `xelatex', no `pdflatex' or `latex' and so on.}
\fi

% [核心] 中文支持宏包
\RequirePackage{ctex}

% 浮动体支持
\RequirePackage{float} 

% [布局] 页面边距设置
\RequirePackage{geometry}

% [数学] 数学公式、符号、黑体数学字体
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}

% [目录] 目录标题控制
\RequirePackage{titletoc}

% [颜色] 颜色支持
\RequirePackage{xcolor}

% [图片] 图形插入支持
\RequirePackage{graphicx}

% [表格] 增强表格功能
\RequirePackage{array}
\RequirePackage{longtable} % 长表格（跨页）
\RequirePackage{booktabs}  % 三线表 (\toprule, \midrule, \bottomrule)
\RequirePackage{multirow}  % 表格跨行
\RequirePackage{bigstrut}  % 表格行间距微调
\RequirePackage{bigdelim}  % 跨行定界符

% [工具] 保护脆弱命令（在标题中使用复杂命令时需要）
\RequirePackage{cprotect}

% [代码] 代码环境设置
\RequirePackage{listings}

% [目录] 目录样式定制
\RequirePackage[titles]{tocloft}
\renewcommand{\cftdot}{$\cdot$}
\renewcommand{\cftsecdotsep}{1.5} 
\setlength{\cftbeforesecskip}{7pt}
\setlength{\cftbeforesubsecskip}{3pt}
\renewcommand{\cftsecfont}{\bfseries\zihao{-4}\heiti} % 目录章节字体：小四号黑体
\renewcommand{\cftsecleader}{\cftdotfill{\cftsecdotsep}}
\renewcommand{\cftsecaftersnumb}{\hskip.4em}

% [代码样式] 定义代码高亮颜色和风格
\definecolor{dkgreen}{rgb}{0,0.6,0}
\definecolor{gray}{rgb}{0.5,0.5,0.5}
\definecolor{mauve}{rgb}{0.58,0,0.82}

\lstset{
  frame=tb,              % 代码框风格：上下边框
  aboveskip=3mm,         % 代码块上方间距
  belowskip=3mm,         % 代码块下方间距
  showstringspaces=false,% 不显示字符串中的空格
  columns=flexible,      % 列宽自适应
  framerule=1pt,         % 边框宽度
  rulecolor=\color{gray!35}, % 边框颜色
  backgroundcolor=\color{gray!5}, % 背景颜色：浅灰
  basicstyle={\small\ttfamily},   % 基本字体：小号等宽
  numbers=none,          % 行号：none(不显示), left(左侧)
  numberstyle=\tiny\color{gray}, % 行号样式
  keywordstyle=\color{blue},     % 关键字颜色
  commentstyle=\color{dkgreen},  % 注释颜色
  stringstyle=\color{mauve},     % 字符串颜色
  breaklines=true,       % 自动换行
  breakatwhitespace=true,% 仅在空白处换行
  tabsize=3,             % Tab键宽度
}

% [段落] 首行缩进
\RequirePackage{indentfirst}

% [标题] 图表标题样式
\RequirePackage{caption}

% [列表] 列表环境定制 (itemize, enumerate)
\RequirePackage{enumitem}

% [修饰] 下划线支持 (\uline)
\RequirePackage{ulem}

% [计算] 尺寸计算支持
\RequirePackage{calc}

% [附录] 附录设置
\RequirePackage[titletoc,title]{appendix}

% [补丁] 修复参考文献目录显示问题
\RequirePackage{etoolbox}
\AtBeginEnvironment{thebibliography}{%
    \phantomsection
    \addcontentsline{toc}{section}{\refname} % 将参考文献加入目录
}

% [超链接] PDF超链接设置
\RequirePackage{hyperref}

%% =========================================================
%% 页面与字体详细设置
%% =========================================================

% [页面布局] 上下左右边距均为 25mm
\geometry{top=25mm,bottom=25mm,left=25mm,right=25mm}

% [行距] 基础行距 1.38倍
\renewcommand*{\baselinestretch}{1.38}

% [表格行距] 修改 tabular 环境, 使表格内行距与正文一致
\let\mcm@oldtabular\tabular
\let\mcm@endoldtabular\endtabular
\renewenvironment{tabular}%
	{\bgroup%
	\renewcommand{\arraystretch}{1.38}%
	\mcm@oldtabular}%
	{\mcm@endoldtabular\egroup}

% [缩进] 每段首行缩进两个汉字字符
\setlength\parindent{2em}

% [字体设置] 需要系统安装对应字体
% 英文字体
\setmainfont{Times New Roman}
\setsansfont{Arial}
% \setmonofont{Courier New} % 如果需要等宽字体可取消注释

% 中文字体设置 (依赖 ctex)
% 这里的 AutoFakeBold 允许程序自动加粗字体，即使没有对应的粗体字库
\setCJKfamilyfont{kai}[AutoFakeBold]{simkai.ttf} % 楷体
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}    % 宋体
\newcommand*{\song}{\CJKfamily{song}}

% [字号调整] 重定义 normalsize 以控制公式间距
\renewcommand\normalsize{%
	\@setfontsize\normalsize{12.05}{14.45}%
	\abovedisplayskip 12\p@ \@plus3\p@ \@minus7\p@
	\abovedisplayshortskip \z@ \@plus3\p@
	\belowdisplayshortskip 6.5\p@ \@plus3.5\p@ \@minus3\p@}

% [数学定理环境]
% 如果你不需要某些环境，可以注释掉
\newtheorem{definition}{\mcm@cap@definition} % 定义
\newtheorem{theorem}{\mcm@cap@theorem}       % 定理
\newtheorem{lemma}{\mcm@cap@lemma}           % 引理
\newtheorem{corollary}{\mcm@cap@corollary}   % 推论
\newtheorem{assumption}{\mcm@cap@assumption} % 假设
\newtheorem{conjecture}{\mcm@cap@conjecture} % 猜想
\newtheorem{axiom}{\mcm@cap@axiom}           % 公理
\newtheorem{principle}{\mcm@cap@principle}   % 定律
\newtheorem{problem}{\mcm@cap@problem}       % 问题
\newtheorem{example}{\mcm@cap@example}       % 例
\newtheorem{proof}{\mcm@cap@proof}           % 证明
\newtheorem{solution}{\mcm@cap@solution}     % 解

% [浮动体设置] (控制图片/表格位置)
\renewcommand*{\textfraction}{0.05} % 页面文字最少占 5%
\renewcommand*{\topfraction}{0.9}   % 顶部浮动体最大占 90%
\renewcommand*{\bottomfraction}{0.8}% 底部浮动体最大占 80%
\renewcommand*{\floatpagefraction}{0.85} % 浮动页最小占比

% [图片格式] 默认搜索后缀
\DeclareGraphicsExtensions{.pdf,.eps,.jpg,.png}
% [图片路径] 图片文件夹名称，可以是 figures, pics 等
\graphicspath{{figures/}{figure/}{pictures/}%
  {picture/}{pic/}{pics/}{image/}{images/}}

% [图表标题样式]
\DeclareCaptionFont{song}{\songti}
\DeclareCaptionFont{minusfour}{\zihao{-4}} % 小四号
\captionsetup[figure]{%
	format=hang,   % 悬挂缩进
	labelsep=quad, % 分隔符为空格
	font={song,minusfour,bf}, % 宋体, 小四, 加粗
	position=bottom
}
\captionsetup[table]{%
	format=hang,
	labelsep=quad,
	font={song,minusfour,bf},
	position=top
}

% [列表环境间距]
\setlist{%
	topsep=0.3em,
	partopsep=0pt,
	itemsep=0ex plus 0.1ex,
	parsep=0pt,
	leftmargin=1.5em,
	rightmargin=0em,
	labelsep=0.5em,
	labelwidth=2em
}

% [超链接设置]
\hypersetup{%
    xetex,
    pdfstartview=FitH,
    CJKbookmarks=true,
    bookmarksnumbered=true,
    bookmarksopen=true,
    colorlinks, % 彩色链接
    pdfborder=001,
    allcolors=black, % 默认所有链接黑色，如需彩色可改为 blue 等
    breaklinks=true
}

% [自定义代码环境] tcode
\lstnewenvironment{tcode}
  {
    \lstset{basicstyle = \small\ttfamily,
        language=TeX,
        tabsize = 4,
        frame = single,
        escapechar = `,
        breaklines = true,
        breakatwhitespace = true,
        frameround = tttt,
    }
  }
  {}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 标题页设置 (Document Markup)
%% 修改了 \maketitle 命令，删除了竞赛特有的承诺书和编号页逻辑
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% 重定义 \maketitle
\renewcommand{\maketitle}{\par
	\begingroup
      \newpage
      \global\@topnum\z@   % 防止图片出现在标题页顶部
      \@maketitle          % 调用下方的实际标题生成逻辑
    \endgroup
  % 清除相关宏定义以节省内存
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@maketitle\relax
  \global\let\@thanks\@empty
  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% 定义实际标题页生成逻辑
\def\@maketitle{%
  \newpage
  % [修改] 原有的 \if@mcm@preface 判断和承诺书生成逻辑已被移除/注释
  % 如果你需要恢复竞赛承诺书，请找回原始文件，或者取消下面的注释（注意需要配合恢复前面的Token定义）

  %%% --- 被移除的承诺书逻辑开始 ---
  % \if@mcm@preface
  %   \null
  %   % (此处原有承诺书代码)
  % \else
  % \fi
  %%% --- 被移除的承诺书逻辑结束 ---
  
  \makeothertitle % 调用生成标准论文标题的命令
}

% 定义论文标题和摘要页 (\makeothertitle)
\def\makeothertitle{%
  % [修改] 删除了“编号专用页”的逻辑，直接生成标题和正文
  \par
  \newpage
  \null
  \setcounter{page}{1} % 页码重置为1
  {\centering \zihao{3}\bfseries \@title\par} % 居中打印标题，三号粗体
  \vskip1ex
  
  % 如果需要显示作者，可以取消下面几行的注释
  % {\centering \zihao{4} \@author \par}
  % \vskip1ex
  % {\centering \zihao{4} \@date \par}
  % \vskip1ex
}

% [中文标题名称映射]
\renewcommand\contentsname{\mcm@cap@contentsname}
\renewcommand\listfigurename{\mcm@cap@listfigurename}
\renewcommand\listtablename{\mcm@cap@listtablename}
\renewcommand\refname{\mcm@cap@refname}
\renewcommand\indexname{\mcm@cap@indexname}
\renewcommand\figurename{\mcm@cap@figurename}
\renewcommand\tablename{\mcm@cap@tablename}
\renewcommand\appendixname{\mcm@cap@appendixname}
\renewcommand\abstractname{\mcm@cap@abstractname}

% [章节编号与格式设置]
\setcounter{secnumdepth}{3} % 目录深度

% 节标题格式 (中文习惯：一、二、...)
\def\@seccntformat#1{\csname the#1\endcsname\ }
\renewcommand\thesection{\chinese{section}、}
\renewcommand\thesubsection{\arabic{section}\thinspace.\thinspace\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection\thinspace.\thinspace\arabic{subsubsection}}

% 章节标题样式微调
\renewcommand\section{\@startsection{section}{1}{\z@}%
 	{-3.5ex \@plus -1ex \@minus -.2ex}% 上间距
	{2.3ex \@plus.2ex}% 下间距
	{\centering\normalfont\Large\bfseries}} % 居中，大号粗体
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	 {3.25ex \@plus1ex \@minus .2ex}%
	 {-1em}%
	 {\normalfont\normalsize\bfseries}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 摘要与关键词环境
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%% 摘要环境定义
\renewenvironment{abstract}{%
\if@twocolumn
		\section*{\abstractname}%
	\else
	 \begin{center}%
	{\zihao{4}\bfseries \abstractname\vspace{-.5em}\vspace{\z@}}% 摘要标题字号：4号
	 \end{center}%
 	 \quotation
	\fi}
	{\if@twocolumn\else\endquotation\newpage\null\fi}
\renewenvironment{quotation}
	{\list{}{\listparindent 2em%
	 \itemindent \listparindent
	 \rightmargin\z@
	 \leftmargin\z@
	 \parsep \z@ \@plus\p@}%
	\item\relax}
	{\endlist}

% 关键词命令
\newcommand\keywords[1]{%
	\renewcommand{\mcm@tokens@keywords}{#1}
	\par
	\vskip1ex
	{\noindent\zihao{-4}\heiti\mcm@cap@keywordsname：}~{\mcm@tokens@keywords}
	}

% [修改] 参考文献环境重定义 (保持原样)
\renewenvironment{thebibliography}[1]
     {\section*{\refname}%
      \@mkboth{\MakeUppercase\refname}{\MakeUppercase\refname}%
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}	

%% [修改] 注释掉：原竞赛信息填写命令（通用模板不需要）
% \newcommand*\tihao[1]{%
% 	\renewcommand{\mcm@tokens@tihao}{#1}}
% \newcommand*\baominghao[1]{%
% 	\renewcommand{\mcm@tokens@baominghao}{#1}}
% \newcommand*\schoolname[1]{%
% 	\renewcommand{\mcm@tokens@schoolname}{#1}}
% \newcommand*\membera[1]{%
% 	\renewcommand{\mcm@tokens@membera}{#1}}
% \newcommand*\memberb[1]{%
% 	\renewcommand{\mcm@tokens@memberb}{#1}}
% \newcommand*\memberc[1]{%
% 	\renewcommand{\mcm@tokens@memberc}{#1}}
% \newcommand*\supervisor[1]{%
% 	\renewcommand{\mcm@tokens@supervisor}{#1}}
% \newcommand*\yearinput[1]{%
% 	\renewcommand{\mcm@tokens@yearinput}{#1}}
% \newcommand*\monthinput[1]{%
% 	\renewcommand{\mcm@tokens@monthinput}{#1}}
% \newcommand*\dayinput[1]{%
% 	\renewcommand{\mcm@tokens@dayinput}{#1}}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% 初始化常量 (中文名称)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 %%% 数学定理名称
\newcommand*{\mcm@cap@definition}{定义}
\newcommand*{\mcm@cap@theorem}{定理}
\newcommand*{\mcm@cap@lemma}{引理}
\newcommand*{\mcm@cap@corollary}{推论}
\newcommand*{\mcm@cap@assumption}{假设}
\newcommand*{\mcm@cap@conjecture}{猜想}
\newcommand*{\mcm@cap@axiom}{公理}
\newcommand*{\mcm@cap@principle}{定律}
\newcommand*{\mcm@cap@problem}{问题}
\newcommand*{\mcm@cap@example}{例}
\newcommand*{\mcm@cap@proof}{证明}
\newcommand*{\mcm@cap@solution}{解}

 %%% 常用文档部件名称
\newcommand*{\mcm@cap@contentsname}{目录}
\newcommand*{\mcm@cap@listfigurename}{插图清单}
\newcommand*{\mcm@cap@listtablename}{附表清单}
\newcommand*{\mcm@cap@refname}{参考文献}
\newcommand*{\mcm@cap@indexname}{索引}
\newcommand*{\mcm@cap@figurename}{图}
\newcommand*{\mcm@cap@tablename}{表}
\newcommand*{\mcm@cap@appendixname}{附录}
\newcommand*{\mcm@cap@abstractname}{摘要}
 %%% 关键字
\newcommand*{\mcm@cap@keywordsname}{关键字}

%%% [修改] 注释掉：承诺书和编号页的具体文本内容
%%% 如果你需要保留这些文本作为参考，请查看原始文件
% \newcommand*\mcm@commit@string@headname{赛区评阅编号...}
% ... (大量文本定义被省略以简化文件) ...

\endinput