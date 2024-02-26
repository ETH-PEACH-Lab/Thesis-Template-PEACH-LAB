%%
%% This is the file thesis-peach.cls.
%% It provides a LaTeX class for all thesis reports at the PEACH Lab
%%
%% The correct usage of this template is to use it as a documentclass.
%% The first line of the .tex file should be
%%
%%     \documentclass{thesis-peach}
%%
%% ---- Defining variables ----
\def\@thesisauthor{Set author with \texttt{$\backslash$thesisauthor$\{\}$}}
\def\@thesistitle{Set title with \texttt{$\backslash$thesistitle$\{\}$}}
\def\@thesisyear{Set year with \texttt{$\backslash$thesisyear$\{\}$}}
\def\@thesistype{Set type with \texttt{$\backslash$thesistype$\{\}$}}
\def\@thesissupervisor{Set supervisor(s) with \texttt{$\backslash$thesissupervisor$\{\}$}\\& separated by \texttt{$\backslash$and} }
\def\@phdnumber{Set PhD thesis number with \texttt{$\backslash$phdnumber$\{\}$}}
\def\@phdcitizen{Set PhD citizen with \texttt{$\backslash$phdcitizen$\{\}$}}
\def\@phdbday{Set PhD birthday with \texttt{$\backslash$phdbday$\{\}$}}
\def\@phdedu{Set PhD academic education with \texttt{$\backslash$phdedu$\{\}$}}

\def\thesisauthor#1{\gdef\@thesisauthor{#1}\hypersetup{pdfauthor={\@thesisauthor}}}
\def\thesistitle#1{\gdef\@thesistitle{#1}\hypersetup{pdftitle={\@thesistitle}}}
\def\thesisyear#1{\gdef\@thesisyear{#1}}
\def\thesistype#1{\gdef\@thesistype{#1}\hypersetup{pdfsubject={\@thesistype, Department of Computer Science, ETH Zurich}}}
\def\thesissupervisor#1{\gdef\@thesissupervisor{#1}}
\def\phdnumber#1{\gdef\@phdnumber{#1}}
\def\phdcitizen#1{\gdef\@phdcitizen{#1}}
\def\phdbday#1{\gdef\@phdbday{#1}}
\def\phdedu#1{\gdef\@phdedu{#1}}

\newif\if@Description@present
\@Description@presenttrue

\newcommand\Description[2][]{\global\@Description@presenttrue\ignorespaces}

\newcommand\supvislabel{Supervisor}
\def\and{\gdef\supvislabel{Supervisors}\\}

%% ---- Add required packages ----
\RequirePackage{tikz}

%% ---- Add colors ----
\RequirePackage[prologue]{xcolor}
\definecolor[named]{ACMBlue}{cmyk}{1,0.1,0,0.1}
\definecolor[named]{ACMYellow}{cmyk}{0,0.16,1,0}
\definecolor[named]{ACMOrange}{cmyk}{0,0.42,1,0.01}
\definecolor[named]{ACMRed}{cmyk}{0,0.90,0.86,0}
\definecolor[named]{ACMLightBlue}{cmyk}{0.49,0.01,0,0}
\definecolor[named]{ACMGreen}{cmyk}{0.20,0,1,0.19}
\definecolor[named]{ACMPurple}{cmyk}{0.55,1,0,0.15}
\definecolor[named]{ACMDarkBlue}{cmyk}{1,0.58,0,0.21}

%% ---- Add fonts ACM Libertine ----

\RequirePackage[T1]{fontenc}
% Note that the order in which packages are loaded matters,
% and the correct order depends on the LaTeX engine used.
% See https://github.com/borisveytsman/acmart/issues/402
 % and https://github.com/borisveytsman/acmart/issues/410

\RequirePackage[tt=false, type1=true]{libertine}
\RequirePackage[varqu]{zi4}
\RequirePackage[libertine]{newtxmath}
\RequirePackage{dirtytalk}


%% ---- HEADERS --------------------------------------------------------
% This prevents the compiler from running on old versions of LaTeX.
\NeedsTeXFormat{LaTeX2e}

% This command gives the name of the class.
\ProvidesClass{thesis-peach}[2011/04/09 Thesis template]

\def\PEACH@fontsize{10pt}%


% This control structure calls the standard LaTeX report.cls class.
\LoadClass[letterpaper,\PEACH@fontsize,oneside]{article}
% \LoadClass[\ACM@fontsize, reqno]{amsart}

%% ---- PACKAGE LOADING ------------------------------------------------
% This class uses the geometry.sty package to set the margins.
% Use a 1-inch margin for all four sides for the report version.
\RequirePackage[margin=1in,footskip=8pt,headsep=0.4cm,%
  headheight=\baselineskip]{geometry}
 % This sets the distance between columns.
 \setlength{\columnsep}{0.3in}
 
% This loads the required math packages.
\let\Bbbk\relax
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{minted}


% This loads the proper graphics package.
\RequirePackage{graphicx}

% This is useful for complex figures.
\RequirePackage{subcaption}

% Compress multiple citations
\RequirePackage{natbib}

% This package allows the ability to create a 'code' environment.
\RequirePackage{verbatim}

% This hopefully tells verbatim to leave my damn quotes alone.
\RequirePackage{upquote}

% This package enables the use of proper single quotes in text.
\RequirePackage{textcomp}

% This package is used to set line spacing.
\RequirePackage{setspace}

% This package allows conditional testing of varibles.
\RequirePackage{ifthen}

% This package is used for silly letter spacing
\RequirePackage{soul}

% This package is used to generate alternate environments.
\RequirePackage{float}

% This package is used for the list of abbreviations
\RequirePackage[nolist,smaller]{acronym}

% This is the package for special headers and footers.
\RequirePackage{fancyhdr}

% This package allows for appendices after the \appendix command
\RequirePackage[title]{appendix}

\RequirePackage{booktabs}

%% ---- FORMATTING -----------------------------------------------------
% Set the page style to fancy.
\pagestyle{fancy}
% This command runs at the beginning of each section.
% It puts the number and name of the section into the 'rightmark' param.
\renewcommand{\sectionmark}[1]{\markright{\thesection\ #1}}

% Clear the current header and footer.
\fancyhf{}

% This sets the headers and footers for less-marked pages.
% Example: beginning of each chapter.
\fancypagestyle{plain}{%
% Get rid of the headers on plain pages.
 \fancyhead{} %
 % And also any line.
 \renewcommand{\headrulewidth}{0pt}
 \fancyfoot[C]{\thepage}
}

%% ---- Citation Style ----
\setcitestyle{%
    numbers,sort&compress,%
    open={[},close={]},citesep={,},%
    notesep={, }}

%% ---- PAGE STYLES ----------------------------------------------------
% This \ttlpg is the same as \titlepage in report.sty.
% It is used here to set the low-level style of front pages.
\newcommand*{\ttlpg}{ %
 \newpage %
 % No headers or footers on titlepage
 \thispagestyle{empty}
 % This sets the page counter.
 \c@page \z@ %
}

% Same idea as \ttlpg above but with page numbers
\newcommand*{\frntpg}{ %
 % Set one-column switch temporarily to false.
 \@restonecolfalse %
 % Check the number of columns.
 \if@twocolumn %
  \@restonecoltrue\onecolumn %
 \else %
  \newpage %
 \fi
 % Regular headers and footers
 \thispagestyle{plain}
}

% This redefines the title page to automatically have all of the
% features and properties that it should according to the guidelines.
\renewcommand*{\titlepage}{
 % Insert the titlepage formatting.
 \ttlpg %
 \begin{singlespace}
\newgeometry{left=2.5cm,right=2.5cm,top=1.5cm,bottom=1.5cm}
    \begin{minipage}{6cm}%
        \hspace*{-5mm}%
        \definecolor{c231f20}{RGB}{35,31,32}%
        \begin{tikzpicture}[y=0.80pt, x=0.80pt, yscale=-1.000000, xscale=1.000000, inner sep=0pt, outer sep=0pt]
          \begin{scope}[cm={{1.25,0.0,0.0,-1.25,(0.0,86.25)}}]
            \path[fill=c231f20,nonzero rule] (109.1800,28.7270) .. controls
              (108.3700,24.7100) and (105.2670,24.5060) .. (104.6520,24.5060) .. controls
              (102.9000,24.5060) and (101.8550,25.5180) .. (101.8550,27.2100) .. controls
              (101.8550,27.5970) and (101.9120,28.1220) .. (102.0100,28.6490) --
              (103.9290,38.2110) -- (103.9380,38.2470) -- (101.6700,38.2470) --
              (99.7150,28.4430) -- (99.6890,28.3030) .. controls (99.6050,27.8600) and
              (99.5260,27.4400) .. (99.5260,26.8950) .. controls (99.5260,24.2610) and
              (101.2560,22.4930) .. (103.8350,22.4930) .. controls (105.7210,22.4930) and
              (107.2360,23.1120) .. (108.3420,24.3340) -- (108.0480,22.7190) --
              (108.0410,22.6810) -- (110.2760,22.6810) -- (113.3640,38.2110) --
              (113.3710,38.2470) -- (111.0710,38.2470) -- (109.1800,28.7270);
            \path[fill=c231f20,nonzero rule] (124.6350,38.4360) .. controls
              (122.8830,38.4360) and (121.3310,37.7200) .. (120.3540,36.4630) --
              (120.7050,38.2110) -- (120.7110,38.2470) -- (118.4760,38.2470) --
              (115.3870,22.7190) -- (115.3800,22.6810) -- (117.6490,22.6810) --
              (119.5400,32.2050) .. controls (120.0230,34.6500) and (121.9000,36.4230) ..
              (124.0050,36.4230) .. controls (124.9090,36.4230) and (125.6210,36.0660) ..
              (126.1810,35.3350) -- (126.2020,35.3070) -- (128.0430,36.9560) --
              (128.0240,36.9790) .. controls (127.1740,37.9620) and (126.0640,38.4360) ..
              (124.6350,38.4360);
            \path[fill=c231f20,nonzero rule] (87.1490,36.2730) -- (87.1430,36.2340) --
              (94.8780,36.2340) -- (84.5790,24.5900) -- (84.5740,24.5840) --
              (84.1860,22.6810) -- (95.1640,22.6810) -- (95.5540,24.6950) --
              (87.3480,24.6950) -- (97.6790,36.3400) -- (97.6840,36.3470) --
              (98.0710,38.2470) -- (87.5340,38.2470) -- (87.1490,36.2730);
            \path[fill=c231f20,nonzero rule] (128.3320,22.7190) -- (128.3240,22.6810) --
              (130.5910,22.6810) -- (133.6840,38.2470) -- (131.4550,38.2470) --
              (128.3320,22.7190);
            \path[fill=c231f20,nonzero rule] (159.0720,38.4350) .. controls
              (157.2070,38.4350) and (155.7510,37.8640) .. (154.6320,36.6860) --
              (156.3910,45.3540) -- (154.1230,45.3540) -- (149.5670,22.6790) --
              (151.8350,22.6790) -- (153.7260,32.2040) .. controls (154.5360,36.2190) and
              (157.6670,36.4220) .. (158.2850,36.4220) .. controls (160.0190,36.4220) and
              (161.0540,35.4110) .. (161.0540,33.7180) .. controls (161.0540,33.3340) and
              (160.9950,32.8100) .. (160.8960,32.2780) -- (158.9720,22.6790) --
              (161.2370,22.6790) -- (163.2260,32.4870) .. controls (163.3210,33.0090) and
              (163.3850,33.4490) .. (163.3850,34.0340) .. controls (163.3850,36.6670) and
              (161.6490,38.4350) .. (159.0720,38.4350);
            \path[fill=c231f20,nonzero rule] (144.0410,38.4360) .. controls
              (139.9280,38.4360) and (137.0410,35.5390) .. (136.1180,30.4870) .. controls
              (135.9520,29.6410) and (135.8950,28.6950) .. (135.8950,28.0900) .. controls
              (135.8950,24.6380) and (137.9900,22.4930) .. (141.3660,22.4930) .. controls
              (143.3290,22.4930) and (145.1210,23.2460) .. (146.5470,24.6700) --
              (146.5670,24.6920) -- (145.2600,26.2870) -- (145.2360,26.3150) --
              (145.2120,26.2880) .. controls (144.0090,25.0230) and (142.9310,24.5060) ..
              (141.4910,24.5060) .. controls (139.8820,24.5060) and (138.1610,25.4640) ..
              (138.1610,28.1540) .. controls (138.1610,28.9960) and (138.2610,29.6910) ..
              (138.4100,30.4760) .. controls (138.6530,31.7950) and (139.2000,33.6400) ..
              (140.4150,34.9220) .. controls (141.3810,35.9180) and (142.5260,36.4230) ..
              (143.8210,36.4230) .. controls (145.1730,36.4230) and (146.0190,35.9420) ..
              (146.8430,34.7080) -- (146.8620,34.6770) -- (148.5260,36.0830) --
              (148.5500,36.1030) -- (148.5320,36.1280) .. controls (147.3960,37.7250) and
              (146.0100,38.4360) .. (144.0410,38.4360);
            \path[fill=c231f20,nonzero rule] (132.2960,42.5200) -- (134.5680,42.5200) --
              (135.1330,45.3540) -- (132.8690,45.3540) -- (132.2960,42.5200);
            \path[fill=c231f20,nonzero rule] (110.2490,42.5200) -- (112.5220,42.5200) --
              (113.0840,45.3540) -- (110.8230,45.3540) -- (110.2490,42.5200);
            \path[fill=c231f20,nonzero rule] (104.2030,42.5200) -- (106.4750,42.5200) --
              (107.0390,45.3540) -- (104.7770,45.3540) -- (104.2030,42.5200);
            \path[fill=c231f20,nonzero rule] (73.9100,36.5680) -- (68.8090,36.5680) --
              (70.6000,45.3540) -- (27.2350,45.3540) -- (22.6810,22.6790) --
              (39.9710,22.6790) -- (41.1040,28.3470) -- (30.8950,28.3470) --
              (31.5140,31.4650) -- (41.7190,31.4650) -- (42.7470,36.5680) --
              (32.5390,36.5680) -- (33.1570,39.6860) -- (49.3370,39.6860) --
              (45.9210,22.6790) -- (53.0080,22.6790) -- (56.4240,39.6860) --
              (62.3740,39.6860) -- (58.9580,22.6790) -- (66.0460,22.6790) --
              (67.7950,31.4650) -- (72.8960,31.4650) -- (71.1460,22.6790) --
              (78.2330,22.6790) -- (82.7890,45.3540) -- (75.7020,45.3540) --
              (73.9100,36.5680);
          \end{scope}
        \end{tikzpicture}
      \end{minipage}%
      \hfill%
      \begin{minipage}{6cm}%
        \sffamily%
        \raggedleft%
        Department of Computer Science\par%
        Programming, Education, and Computer-Human Interaction%
      \end{minipage}\par%
      \vspace{4cm}%
      \centering%
      \bfseries%
      \Huge 
      \parbox{0.8\textwidth}{\centering\@thesistitle}\par%
      \vspace{1.5cm}%
      \LARGE%
      \@thesisauthor\par%
      \vspace{2cm}%
      \Large%
      \@thesistype\par%
      \vspace{2cm}%
      \@thesisyear\par%
      \vspace{4cm}%
      \large\normalfont%
      \begin{tikzpicture}[]%
        \node[anchor=north west,align=left] at (3.25,0) {\@thesissupervisor};%
        \node[anchor=north west] at (0,0) {\textbf{\supvislabel :}};%
      \end{tikzpicture}%
 \end{singlespace}
}




%% ---- ABSTRACT -------------------------------------------------------
% Command to hold the text of the abstract.
\newcommand{\@abstract}{}
\newcommand{\@acknowledgment}{}


% Command to set it.
\renewcommand{\abstract}[1]{
 % Set the abstract text.
 \renewcommand{\@abstract}{#1}}

 % Command to set it.
\renewcommand{\acknowledgment}[1]{
 % Set the abstract text.
 \renewcommand{\@acknowledgment}{#1}}

% Command to insert it.
\newcommand{\insertabstract}{\@abstract}
\newcommand{\insertacknowledgment}{\@acknowledgment}

% Format the abstract page.
\newcommand{\abstractpage}{ %
 % Set the page formatting.
 \frntpg %
  % Extra vertical space
 \begin{minipage}{0.8\textwidth} \vspace{1in} \end{minipage} \\ %
 % Center the title area.
 \begin{center} %
  % Formatting
  \large \bfseries
  % Add the heading.
  ABSTRACT \\[2ex] %
 \end{center} %
 % Insert the abstract text.
 \onehalfspacing %
 % Insert the text.
 \insertabstract %

  \vspace{5cm}
  \begin{center} %
  % Formatting
  \large \bfseries
  % Add the heading.
  ACKNOWLEDGMENT \\[2ex] %
 \end{center} %
 \insertacknowledgment
 % Vertical rubber space
 \vspace*{\stretch{1}} %
}


%% ---- CODE ENVIRONMENT -----------------------------------------------
% This generates a 'code' environment that allows inline citations
% of small snippets of code.
\newenvironment{code} %
 {\quote\small\verbatim} %
 {\endverbatim\endquote}

% Formatting commands
% This command is used for names of files
\newcommand{\tfile}[1]{{\footnotesize\textsf{#1}}}
% This command puts a box around text that is meant for menu entries.
\newcommand{\tmenu}[1]{\framebox[\width]{\ {\tiny\textsf{#1}}\ }}
% This command is intended for names of variables within programs.
\newcommand{\tvar}[1]{{\footnotesize\texttt{#1}}}
% This command is used to display the contents of strings.
% It automatically adds the correct, upright quotes around the argument.
\newcommand{\tstring}[1]{ %
 {\footnotesize\texttt{\textquotesingle#1\textquotesingle}}}
% This command gives a bold version of the variable names.
\newcommand{\tfunction}[1]{{\footnotesize\texttt{\textbf{#1}}}}

%% ---- SPACING --------------------------------------------------------
% This fixes the spacing below captions, which by default can be small.
\setlength\belowcaptionskip{7pt plus 4pt minus 1pt}

%% ---- Bib ----
\let\@tex@bibliography\bibliography
\renewcommand*{\bibliography}[1]{ %
    %Move to new page
    \clearpage
    \@tex@bibliography{#1}
}

%% ---- Appendix ----
\renewcommand{\appendixname}{Appendix}
\let\@tex@appendix\appendix
\renewcommand*{\appendix}{ %
    %Move to new page
    \clearpage
    \@tex@appendix
}

%% ---- LINKS ----------------------------------------------------------
% This loads a package that allows extra colors for links.
% Custom color for references.
\definecolor{DarkGreen}{rgb}{0,0.6,0}

% This will make labels and references hyperlinks.
% Use references in the bibliography.
\RequirePackage[pagebackref=false]{hyperref}

% This controls some settings that affect the appearance of links.
\hypersetup{ %
  colorlinks=true, %
  pdfstartview={FitH}, %
  citecolor=ACMPurple, %
  linkcolor=ACMPurple, %
  urlcolor=ACMDarkBlue %
}

%% ---- INITIALIZATION -------------------------------------------------
% Commands to be placed after \begin{document}
\AtBeginDocument{ %
 % Insert a title page.
 \titlepage %
 % Change the PDF title.
 \hypersetup{pdftitle=\inserttitle} %
 \abstractpage
  \newpage %
 % Restart page numbers for the chapters.
 \setcounter{page}{1} %
 % Page numbers at the bottom
 \pagestyle{plain} %
 % Use Arabic numerals.
 \renewcommand{\thepage}{\arabic{page}} %
}

