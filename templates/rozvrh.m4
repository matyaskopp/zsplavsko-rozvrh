



\newenvironment{rozvrh}[1]{%
\begin{center}
\topskip0pt
\vspace*{\fill}
{\Huge\bfseries Rozvrh hodin -- #1. ročník}

\vspace*{1cm}

\begin{ganttchart}[
    x unit=0.6mm,
    y unit chart=22mm,
    canvas/.style={draw=none,fill=none}, % remove canvas borders, etc
%   vgrid={*{1}{black!60,dotted},*{14}{transparent},*{1}{black!20,dotted},*{14}{transparent},*{1}{black!40,dotted},*{14}{transparent},*{1}{black!20,dotted},*{14}{transparent}},           % vertical gray lines every unit
    inline,                              % draw bars inline
    group/.style={draw=none,fill=none},  % remove group borders, etc
    bar top shift=0.1,                   % give bar 10% padding top/bottom
    bar height=0.8,                      % bar size 80% of vertical space
    y unit title=0.5cm,                  % crop titles a little smaller
    title/.style={draw=none,fill=none},  % remove title borders, etc
    title label font=\large\bfseries,
    bar label font=\LARGE\bfseries,
    include title in canvas=false,       % no vertical grid in title
    podrouzkova/.style={bar/.style={draw=podrouzkova,fill=podrouzkova!10,rounded corners=1mm,line width=0.5mm}},
    koppova/.style={bar/.style={draw=koppova,fill=koppova!10,rounded corners=1mm,line width=0.5mm}},
    slamova/.style={bar/.style={draw=slamova,fill=slamova!10,rounded corners=1mm,line width=0.5mm}},
    marusakova/.style={bar/.style={draw=marusakova,fill=marusakova!10,rounded corners=1mm,line width=0.5mm}},
    demeterova/.style={bar/.style={draw=demeterova,fill=demeterova!10,rounded corners=1mm,line width=0.5mm}},
    janotova/.style={bar/.style={draw=janotova,fill=janotova!10,rounded corners=1mm,line width=0.5mm}},
    jannova/.style={bar/.style={draw=jannova,fill=jannova!10,rounded corners=1mm,line width=0.5mm}},
    spolecne/.style={bar/.style={draw=spolecne,fill=spolecne!10,rounded corners=2mm,line width=0.5mm}}
  ]{0}{400}
\hodiny

}{
\end{ganttchart}
\vspace*{\fill}
\end{center}
}

\newenvironment{rozvrhcasy}[1]{% %%%%%%%%%%%%%%%%%%%%%%%%%% doplněno o ČASY
\begin{center}
\topskip0pt
\vspace*{\fill}
{\Huge\bfseries Rozvrh hodin -- #1. ročník}

\vspace*{1cm}

\begin{ganttchart}[
    x unit=0.4mm,
    y unit chart=16mm,
    canvas/.style={draw=none,fill=none}, % remove canvas borders, etc
    vgrid={*{1}{black!60,dotted},*{14}{transparent},*{1}{black!20,dotted},*{14}{transparent},*{1}{black!40,dotted},*{14}{transparent},*{1}{black!20,dotted},*{14}{transparent}},           % vertical gray lines every unit
    inline,                              % draw bars inline
    group/.style={draw=none,fill=none},  % remove group borders, etc
    bar top shift=0.1,                   % give bar 10% padding top/bottom
    bar height=0.8,                      % bar size 80% of vertical space
    y unit title=0.5cm,                  % crop titles a little smaller
    title/.style={draw=none,fill=none},  % remove title borders, etc
    title label font=\bfseries,
    bar label font=\large\bfseries,
    include title in canvas=false,       % no vertical grid in title
    podrouzkova/.style={bar/.style={draw=podrouzkova,fill=podrouzkova!10,rounded corners=1mm,line width=0.5mm}},
    koppova/.style={bar/.style={draw=koppova,fill=koppova!10,rounded corners=1mm,line width=0.5mm}},
    slamova/.style={bar/.style={draw=slamova,fill=slamova!10,rounded corners=1mm,line width=0.5mm}},
    marusakova/.style={bar/.style={draw=marusakova,fill=marusakova!10,rounded corners=1mm,line width=0.5mm}},
    demeterova/.style={bar/.style={draw=demeterova,fill=demeterova!10,rounded corners=1mm,line width=0.5mm}},
    janotova/.style={bar/.style={draw=janotova,fill=janotova!10,rounded corners=1mm,line width=0.5mm}},
    jannova/.style={bar/.style={draw=jannova,fill=jannova!10,rounded corners=1mm,line width=0.5mm}},
    spolecne/.style={bar/.style={draw=spolecne,fill=spolecne!10,rounded corners=2mm,line width=0.5mm}}
  ]{0}{601}
\hodiny

}{
\\\tiskniden{6}
\\\tiskniden{7}
\cas
\end{ganttchart}
\vspace*{\fill}
\end{center}
}



% Switch implementation
\makeatletter
\newcommand\addcase[3]{\expandafter\def\csname\string#1@case@#2\endcsname{#3}}
\newcommand\makeswitch[2][]{%
  \newcommand#2[1]{%
    \ifcsname\string#2@case@##1\endcsname\csname\string#2@case@##1\endcsname\else#1\fi%
  }%
}
\makeatother
%%%%%%%%%%%%%

\makeswitch[-100]\ZZ
      \addcase\ZZ{1}{\zA}%
      \addcase\ZZ{2}{\zB}%
      \addcase\ZZ{3}{\zC}%
      \addcase\ZZ{4}{\zD}%
      \addcase\ZZ{5}{\zE}%
      \addcase\ZZ{6}{\zF}%
      \addcase\ZZ{7}{\zG}%


\makeswitch[-50]\KK
      \addcase\KK{1}{\kA}%
      \addcase\KK{2}{\kB}%
      \addcase\KK{3}{\kC}%
      \addcase\KK{4}{\kD}%
      \addcase\KK{5}{\kE}%
      \addcase\KK{6}{\kF}%
      \addcase\KK{7}{\kG}%

\makeswitch[]\DEN
      \addcase\DEN{1}{Pondělí}%
      \addcase\DEN{2}{Úterý}%
      \addcase\DEN{3}{Středa}%
      \addcase\DEN{4}{Čtvrtek}%
      \addcase\DEN{5}{Pátek}%
      \addcase\DEN{6}{Sobota}%
      \addcase\DEN{7}{Neděle}%


\newcommand{\tiskniden}[1]{\ganttgroup[inline=false]{\large{}\DEN{#1}\hspace*{2mm}}{-20}{-5}}


\newcommand{\countKK} [2] {\KK{\the\numexpr #1 + #2 -1 \relax}}

\newcommand{\vyucHodina}[4]{\ganttbar[#3]{#4}{\ZZ{#1}}{\countKK{#1}{#2}}}