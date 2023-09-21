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
\RequirePackage{scrlayer-scrpage}
\RequirePackage[T1]{fontenc}
\RequirePackage{xpatch}
\RequirePackage[bindingoffset=0cm,nomarginpar,noheadfoot]{geometry}
\RequirePackage{enumitem}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}
\RequirePackage{silence}
% the page header is deliberately disabled, so the warning by scrlayer-scrpage is invalid. 
\WarningFilter{scrlayer-scrpage}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOURS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{Orange}{HTML}{cd975f}
\definecolor{White}{rgb}{0.78,0.81,0.85}
\definecolor{Blue}{rgb}{0.42, 0.64, 0.97}
\definecolor{DarkBlue}{rgb}{0.05, 0.06, 0.09}
\pagecolor{DarkBlue}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% LAYOUT
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareNewPageStyleByLayers{sidebarmain}{
	sidebar.even,
	sidebar.odd,
}

\AtBeginDocument{
	\pagestyle{sidebarmain}
	\color{White}
}

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
\newtcbox{\badge}[1][Blue]{
	on line,
	arc=2pt,
	colback=#1!50!black,
	colframe=#1!50!black,
	fontupper=\color{white},
	boxrule=1pt,
	boxsep=0pt,
	left=3pt,
	right=3pt,
	top=1pt,
	bottom=1pt,
}

% default sizes and margins
\setlength\sidewidth{9.3cm}
\setlength\headerheight{2.5cm}
\setlength\marginleft{0.7cm}
\setlength\marginright{\marginleft}
\setlength\marginmiddle{1.5cm}
\setlength\margintop{1cm}
\setlength\marginbottom{1cm}

% minipage has an annoying af indent that must be removed
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vskip0.25\baselineskip}
\setlength{\parindent}{0pt}

\geometry{left=\marginleft,right=\marginright,top=\margintop,bottom=\marginbottom}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\divider}{\color{White}\hdashrule{\linewidth}{0.6pt}{0.5ex}\smallskip}
\newcommand{\name}[1]{\def\@name{#1}}
\newcommand{\tagline}[1]{\def\@tagline{#1}}
\newcommand{\phone}[1]{\printinfo{\faPhone}{#1}}
\newcommand{\email}[1]{\printinfo{\faAt}{#1}}
\newcommand{\location}[1]{\printinfo{\faMapMarker}{#1}}
\newcommand{\homepage}[1]{\printinfo{\faChain}{#1}}
\newcommand{\linkedin}[1]{\printinfo{\faLinkedin}{#1}}
\newcommand{\github}[1]{\printinfo{\faGithub}{#1}}
\newcommand{\icon}[1]{\color{White}#1\hspace{0.5em}}
\newcommand{\printinfo}[2]{\mbox{\color{White}\normalfont#1\hspace{0.5em}#2\hspace{1em}}}
\newcommand{\personalinfo}[1]{\def\@personalinfo{#1}}

\newcommand{\makecvheader}{
	\begingroup
		{\Huge\bfseries{\color{Blue}\@name}\par}
		\medskip
		{\large\bfseries\color{Orange}\@tagline\par}
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
	{\color{Blue}\LARGE{#2}}\\[-1ex]
	{\color{Blue}\rule{\linewidth}{2pt}\par}\medskip
}

\newcommand{\cvsubsection}[2][]{
	\bigskip
	{\color{Blue}\Large{#2}}\\[-1ex]
	{\color{Blue}\rule{\linewidth}{2pt}\par}\medskip
}

\newcommand{\project}[2]{
	\large\color{White}\textbf{\href{#2}{\icon{\faExternalLink}\color{Orange}#1}}\par
	\smallskip\normalsize
}

\newcommand{\cvevent}[3]{
	{\large\color{White}\textbf{#1}\par}
	\smallskip\normalsize
	\ifstrequal{#2}{}{}{{\color{Orange}#2}\par\smallskip}
	\ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\icon{\faCalendar}\color{White}#3}}}\par
	\smallskip\normalsize
}

\newcommand{\cvskilltitle}[1]{
	{\large\color{Orange}#1\par}
	\medskip\normalsize
}

\newcommand{\hd}[4]{
	\item \color{Orange}\textbf{#1} \ifstrequal{#2}{}{}{\badge{\textbf{#2}}} - \color{White}\textbf{#3} #4
}

\newcommand{\technology}[1]{{\textbf{\color{white}#1}}}

\newcommand{\wam}[1]{
	\begin{tabular}{lr}
		\color{Blue}WAM: \color{Orange}#1 & \color{Blue}Extracurriculars:
	\end{tabular}
	\smallskip
}
