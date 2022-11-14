%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CLASS OPTIONS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\ProcessOptions*
\LoadClass{scrartcl}

\RequirePackage{silence}
% The page header is deliberately disabled, so the warning by scrlayer-scrpage is invalid. 
\WarningFilter{scrlayer-scrpage}{}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% PACKAGES
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{fontawesome}
\RequirePackage{scrlfile}

\RequirePackage[T1]{fontenc}
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\RequirePackage{fontawesome}

\RequirePackage{xpatch}
\RequirePackage{scrlayer-scrpage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% GEOMETRY
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newlength\highlightwidth
\newlength\headerheight
\newlength\marginleft
\newlength\marginright
\newlength\margintop
\newlength\marginbottom
\newlength\marginmiddle
\newlength\mainbarwidth

% default sizes and margins
\setlength\highlightwidth{9cm}
\setlength\headerheight{2.5cm}
\setlength\marginleft{0.7cm}
\setlength\marginright{\marginleft}
\setlength\marginmiddle{1.5cm}
\setlength\margintop{1cm}
\setlength\marginbottom{1cm}

\RequirePackage[bindingoffset=0cm,nomarginpar,noheadfoot]{geometry}
\geometry{left=\marginleft,right=\marginright,top=\margintop,bottom=\marginbottom}

% minipage has an annoying af indent that must be removed
\setlength{\parindent}{0pt}

\RequirePackage{xcolor}

\RequirePackage{enumitem}
\setlist{leftmargin=*,labelsep=0.5em,nosep,itemsep=0.25\baselineskip,after=\vskip0.25\baselineskip}
\RequirePackage{graphicx}
\RequirePackage{etoolbox}
\RequirePackage{dashrule}
\RequirePackage{multirow,tabularx}
\RequirePackage{changepage}

\setlength{\parindent}{0pt}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COLOURS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\definecolor{SeaGreen}{HTML}{46c86a}
\definecolor{HotPink}{HTML}{e56fb4}
\definecolor{Peru}{HTML}{cd975f}
\definecolor{TextColour}{rgb}{0.78,0.81,0.85}
\definecolor{HeadingColour}{rgb}{0.42, 0.64, 0.97}
\definecolor{BackgroundColour}{rgb}{0.05, 0.06, 0.09}

\colorlet{name}{SeaGreen}
\colorlet{tagline}{Peru}
\colorlet{heading}{HeadingColour}
\colorlet{accent}{Peru}
\colorlet{emphasis}{SeaGreen}
\colorlet{body}{TextColour}
\colorlet{location}{HotPink}
\colorlet{ranking}{HotPink}
\colorlet{calendar}{TextColour}
\colorlet{skillsectiontitle}{SeaGreen}
\colorlet{skillrating}{SeaGreen}
\colorlet{coursecode}{Peru}
\colorlet{coursename}{TextColour}
\colorlet{link}{Peru}
\colorlet{icon}{HotPink}

\pagecolor{BackgroundColour}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% COMMANDS
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\newcommand{\ratingmarker}{\faCircle}

\newcommand{\divider}{\color{body}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\smallskip}

\newcommand{\sidedivider}{\color{body}{\hdashrule{\linewidth}{0.6pt}{0.5ex}}\medskip}

\newenvironment{fullwidth}{
	\begin{adjustwidth}{}{\dimexpr-\marginparwidth-\marginparsep\relax}}
	{\end{adjustwidth}}

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
\newcommand{\outlink}[1]{\color{link}{\faChain\hspace{0.5em}#1}}
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

% declare new page style using layers
\DeclareNewPageStyleByLayers{headerhighlightmain}{
	sidebar.even,
	sidebar.odd,
	header.bg
}
\DeclareNewPageStyleByLayers{highlightmain}{
	sidebar.even,
	sidebar.odd,
}
\DeclareNewPageStyleByLayers{headermain}{
	header.bg
}

\newcommand{\sidebar}[1]{
	\def\@sidebar{\begin{minipage}[t]{\dimexpr \highlightwidth-\marginleft-\marginright}#1\end{minipage}}
}

\newcommand{\mainbar}[1]{
	\def\@mainbar{\begin{minipage}[t]{\dimexpr \textwidth-\highlightwidth}#1\end{minipage}}
}

\newcommand{\makebody}{
	\begingroup
		\@sidebar\hspace{\dimexpr \marginmiddle}\@mainbar
	\endgroup
}

\newcommand{\cvsection}[2][]{
	\bigskip
	{\color{heading}\LARGE\bfseries{#2}}\\[-1ex]
	{\color{heading}\rule{\linewidth}{2pt}\par}\medskip
}

\newcommand{\cvsubsection}[1]{
	\smallskip
	{\color{emphasis}\large\bfseries{#1}\par}\medskip
}

\newcommand{\cvevent}[6]{
	{\large\color{emphasis}#1\par}
	\smallskip\normalsize
	\ifstrequal{#2}{}{}{
	\textbf{\color{accent}#2}\par
	\smallskip}
	\ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\icon{\faCalendar}\hspace{0.5em}\color{calendar}#3}}}
	\ifstrequal{#4}{}{}{{\small\makebox[0.5\linewidth][l]{\icon{\faMapMarker}\hspace{0.5em}\color{location}#4}}}\par
	\smallskip
	\ifstrequal{#5}{}{}{{\small\makebox[0.5\linewidth][l]{\outlink{#5}}}}\par
	\smallskip
	\ifstrequal{#6}{}{}{{\small\makebox[0.5\linewidth][l]{\outlink{#6}}}}\par
	\smallskip\normalsize
}

\newcommand{\cvsideevent}[3]{
	{\large\color{emphasis}#1\par}
	\smallskip\normalsize
	\ifstrequal{#2}{}{}{{\color{accent}#2}\par\smallskip}
	\ifstrequal{#3}{}{}{{\small\makebox[0.5\linewidth][l]{\icon{\faCalendar}\hspace{0.5em}\color{calendar}#3}}}\par
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
	\item \color{emphasis}{\textbf{#1}} \color{ranking}{#2} - \color{coursecode}{#3} \\ \color{coursename}{#4}
}

\newcommand{\technology}[1]{{\textbf{\color{white}#1}}}

\newcommand{\wam}[1]{
	\begin{tabular}{lr}
		\color{HeadingColour}{WAM:} \color{emphasis}{#1} & \color{HeadingColour}{Extracurricular:}
	\end{tabular}
	\smallskip
}

\AtBeginDocument{
	\pagestyle{highlightmain}
	\color{body}
}
