%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLASS OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions*
\LoadClass{scrartcl}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage[most]{tcolorbox}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}
\RequirePackage{scrlfile}

\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}

\RequirePackage{xpatch}
\RequirePackage{scrlayer-scrpage}

\RequirePackage[bindingoffset=0cm,nomarginpar,noheadfoot]{geometry}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}

\RequirePackage{silence}
% The page header is deliberately disabled, so the warning by scrlayer-scrpage is invalid. 
\WarningFilter{scrlayer-scrpage}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GEOMETRY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength\sidewidth
\newlength\headerheight
\newlength\marginleft
\newlength\marginright
\newlength\margintop
\newlength\marginbottom
\newlength\marginmiddle
\newlength\mainbarwidth

% default sizes and margins
\setlength\sidewidth{9cm}
\setlength\headerheight{2.5cm}
\setlength\marginleft{0.7cm}
\setlength\marginright{\marginleft}
\setlength\marginmiddle{1.5cm}
\setlength\margintop{1cm}
\setlength\marginbottom{1cm}

\geometry{left=\marginleft,right=\marginright,top=\margintop,bottom=\marginbottom}

% minipage has an annoying af indent that must be removed
\setlength{\parindent}{0pt}
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vskip0.25\baselineskip}
\setlength{\parindent}{0pt}

\newtcbox{\badge}[1][Peru]{
	on line,
	arc=2pt,
	colback=#1!50!black,
	colframe=#1!50!black,
	fontupper=\color{white},
	boxrule=1pt,
	boxsep=0pt,
	left=3pt,
	right=3pt,
	top=2pt,
	bottom=2pt,
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOURS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{Peru}{HTML}{cd975f}
\definecolor{HotPink}{HTML}{e56fb4}
\definecolor{TextColour}{rgb}{0.78,0.81,0.85}
\definecolor{HeadingColour}{rgb}{0.42, 0.64, 0.97}
\definecolor{BackgroundColour}{rgb}{0.05, 0.06, 0.09}

\colorlet{name}{Peru}
\colorlet{tagline}{HeadingColour}
\colorlet{heading}{HeadingColour}
\colorlet{accent}{Peru}
\colorlet{emphasis}{Peru}
\colorlet{body}{TextColour}
\colorlet{location}{HotPink}
\colorlet{ranking}{HotPink}
\colorlet{calendar}{TextColour}
\colorlet{skillsectiontitle}{Peru}
\colorlet{skillrating}{Peru}
\colorlet{coursecode}{TextColour}
\colorlet{coursename}{TextColour}
\colorlet{icon}{TextColour}

\pagecolor{BackgroundColour}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ratingmarker}{\faCircle}

\newcommand{\divider}{\color{body}\hdashrule{\linewidth}{0.6pt}{0.5ex}\smallskip}

\newcommand{\sidedivider}{\color{body}\hdashrule{\linewidth}{0.6pt}{0.5ex}\medskip}

\newcommand{\emailsymbol}{\faAt}
\newcommand{\phonesymbol}{\faPhone}
\newcommand{\homepagesymbol}{\faChain}
\newcommand{\locationsymbol}{\faMapMarker}
\newcommand{\linkedinsymbol}{\faLinkedin}
\newcommand{\twittersymbol}{\faTwitter}
\newcommand{\githubsymbol}{\faGithub}
\newcommand{\orcidsymbol}{\aiOrcid}
\newcommand{\mailsymbol}{\faEnvelope}

\newcommand{\printinfo}[2]{\mbox{\color{icon}{\normalfont #1}\hspace{0.5em}\color{body}{#2}\hspace{1em}}}

\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\email}[1]{\printinfo{\emailsymbol}{#1}}
\newcommand{\phone}[1]{\printinfo{\phonesymbol}{#1}}
\newcommand{\homepage}[1]{\printinfo{\homepagesymbol}{#1}}
\newcommand{\linkedin}[1]{\printinfo{\linkedinsymbol}{#1}}
\newcommand{\github}[1]{\printinfo{\githubsymbol}{#1}}
\newcommand{\location}[1]{\printinfo{\locationsymbol}{#1}}
\newcommand{\outlink}[1]{\color{emphasis}{\faChain\hspace{0.5em}#1}}
\newcommand{\icon}[1]{\color{icon}{#1\hspace{0.5em}}}

\newcommand{\personalinfo}[1]{\def\@personalinfo{#1}}

\newcommand{\makecvheader}{
	\begingroup
		{\Huge\bfseries{\color{name}\@name}\par}
		\medskip
		{\large\bfseries\color{tagline}\@tagline\par}
		\medskip
		{\footnotesize\bfseries\@personalinfo\par}
	\endgroup\medskip
}

\newcommand{\sidebar}[1]{
	\def\@sidebar{\begin{minipage}[t]{\dimexpr \sidewidth-\marginleft-\marginright}#1\end{minipage}}
}

\newcommand{\mainbar}[1]{
	\def\@mainbar{\begin{minipage}[t]{\dimexpr \textwidth-\sidewidth}#1\end{minipage}}
}

\newcommand{\makebody}{
	\begingroup
		\@sidebar\hspace{\dimexpr \marginmiddle}\@mainbar
	\endgroup
}

\newcommand{\cvsection}[2][]{
	\bigskip
	{\color{heading}\LARGE{#2}}\\[-1ex]
	{\color{heading}\rule{\linewidth}{2pt}\par}\medskip
}

\newcommand{\cvsubsection}[1]{
	\smallskip
	{\color{emphasis}\large\bfseries{#1}\par}\medskip
}

\newcommand{\project}[2]{
	\large\color{TextColour}\textbf{\href{#2}{\icon{\faExternalLink}\color{Peru}#1}}\par
	\smallskip\normalsize
}

\newcommand{\cvevent}[3]{
	{\large\color{TextColour}\textbf{#1}\par}
	\smallskip\normalsize
	\ifstrequal{#2}{}{}{{\color{emphasis}#2}\par\smallskip}
	\ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\icon{\faCalendar}\color{calendar}#3}}}\par
	\smallskip\normalsize
}

\newcommand{\cvachievement}[3]{
	\begin{tabularx}{\linewidth}{@{}p{2em} @{\hspace{1ex}} >{\raggedright\arraybackslash}X@{}}
	\multirow{2}{*}{\Large\color{accent}#1} & \bfseries\color{emphasis}{#2}\\
	& #3
	\end{tabularx}%
	\smallskip
}

\newcommand{\cvskill}[2]{
	\color{skillname}{\textbf{#1}}\hspace{0.5em}
	\foreach \x in {1,...,5}{
		\space{\ifnumgreater{\x}{#2}{\color{body}}{\color{skillrating}}\ratingmarker}}\par
}

\newcommand{\cvskilltitle}[1]{
	{\large\color{skillsectiontitle}#1\par}
	\medskip\normalsize
}

\newcommand{\cvskills}[4]{
	\color{emphasis}{\textbf{#1}}
	\foreach \x in {1,...,5}{
		\space{\ifnumgreater{\x}{#2}{\color{body}}{\color{accent}}\ratingmarker}}\hfill
	\color{emphasis}{\textbf{#3}}
	\foreach \x in {1,...,5}{
		\space{\ifnumgreater{\x}{#4}{\color{body}}{\color{accent}}\ratingmarker}}
}

\newcommand{\cvskilltext}[1]{
	\color{emphasis}{\textbf{#1}}
}

\newcommand{\cvskillrating}[1]{
	\foreach \x in {1,...,5}{
		\space{\ifnumgreater{\x}{#1}{\color{body}}{\color{accent}}\ratingmarker}}
}

\newcommand{\notablesubject}[4]{
	\item \color{emphasis}{\textbf{#1}} \ifstrequal{#2}{}{}{\badge{#2}} - \color{coursecode}\textbf{#3} \\ \color{coursename}{#4}
}

\newcommand{\technology}[1]{{\textbf{\color{white}#1}}}

\newcommand{\wam}[1]{
	\begin{tabular}{lr}
		\color{HeadingColour}{WAM:} \color{emphasis}{#1} & \color{HeadingColour}{Extracurriculars:}
	\end{tabular}
	\smallskip
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareNewPageStyleByLayers{sidebarmain}{
	sidebar.even,
	sidebar.odd,
}

\AtBeginDocument{
	\pagestyle{sidebarmain}
	\color{body}
}
