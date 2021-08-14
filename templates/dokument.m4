\documentclass[a4,landscape]{article}
\usepackage[margin=1cm]{geometry}
\usepackage[utf8]{inputenc}
\usepackage[T1]{fontenc}
\usepackage[czech]{babel}

\usepackage[sc]{mathpazo} % URW Palladio font
% http://www.tug.dk/FontCatalogue/allfonts.html
\linespread{1.2}

\usepackage{calc}


\usepackage{pgfgantt}

m4_include(ucitele.m4)

m4_include(hodiny.m4)

m4_include(cas.m4)

m4_include(rozvrh.m4)


\usepackage{csvsimple}
\begin{filecontents*}{_DATA_}
\end{filecontents*}

%den,zacatek,delka,vyucuje,predmet
%1,1,2,podrouzkova,M + Čj
%2,2,2,janotova,Aj
%3,3,2,demeterova, Tv


\newcounter{aktden}


\begin{document}
\pagestyle{empty}

\begin{_SABLONAROZVRHU_}{_ROCNIK_}

%\vyucHodina{ZACATEK}{DELKA}{VYUCUJE}{PREDMET}
\csvreader[head to column names]{_DATA_}{}% use head of csv as column names
{
\ifthenelse{\den = \theaktden}{}{\ifthenelse{\theaktden > 0}{\\}{}\tiskniden{\den}\setcounter{aktden}{\den}}
\vyucHodina{\zacatek}{\delka}{\vyucuje}{\predmet}
}

\end{_SABLONAROZVRHU_}
\begin{center}
\large _VYUCUJE_
\end{center}
\end{document}

