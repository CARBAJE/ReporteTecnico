% A LaTeX template for Thesis submissions to Instituto Politécnico Nacional (IPN)
% José Luis Castro García (https://github.com/JoseLuisC99/IPN-thesis-template)
% Last Revision: September 2023

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{ipn}[2023/09/30 IPN thesis submission class]

\LoadClass[12pt, twoside]{book}
\RequirePackage[utf8]{inputenc}
\RequirePackage{xcolor}
\RequirePackage{geometry}
\RequirePackage[export]{adjustbox}
\RequirePackage{titlesec}
\usepackage{microtype}

\definecolor{ipn_color}{RGB}{108, 29, 69}
\definecolor{escom_color}{RGB}{60,120,224}
\definecolor{black1}{RGB}{17, 17, 14}
\definecolor{gray1}{RGB}{54, 69, 79}
\geometry{
    a4paper,
    left=4cm,
    right=1in,
    top=1in,
    bottom=1in
}

\def\schoolname#1{\def\@schoolname{#1}}
\def\degree#1{\def\@degree{#1}}
\def\advisor#1{\def\@advisor{#1}}
\def\coadvisor#1{\def\@coadvisor{#1}}
\def\academicyear#1{\def\@academicyear{#1}}
\coadvisor{}

\renewcommand{\maketitle}{
\begin{titlepage}
    \centering
    \begin{adjustbox}{max width=1.2\linewidth, right}
        \begin{minipage}[c][0.99\textheight][t]{0.13\textwidth}
            \centering
            \includegraphics[width=\linewidth]{img/logo-ipn.png} \\
            \vspace{5mm}
            \hskip3pt
            {\color{ipn_color} \vrule width1.5pt height0.75\textheight} 
            \hskip5pt
            {\color{black1} \vrule width3pt height0.75\textheight} 
            \hskip3pt
            {\color{ipn_color} \vrule width1.5pt height0.75\textheight} \\
            \vspace{5mm}
            \centerline{\includegraphics[width=1.4\linewidth]{img/EscudoESCOM.png}}
        \end{minipage}
        \begin{minipage}[c][0.99\textheight][t]{0.95\textwidth}
            \centering
            {\fontsize{22}{22}\selectfont\textsc{Instituto Politécnico Nacional\\}}
            \vspace{10pt}
            \begin{minipage}[t]{0.1\textwidth}
            \end{minipage}
            \hfill
            \begin{minipage}[t]{0.9\textwidth}
                {\color{ipn_color} \hrule width\textwidth height2.5pt}
            \end{minipage}
            \begin{minipage}[t]{0.9\textwidth}
                {\color{black1} \hrule width\textwidth height2.5pt}
            \end{minipage}
            \begin{minipage}[t]{0.1\textwidth}
            \end{minipage}
            
            \vspace{20pt}
            {\fontsize{16}{16}\selectfont\textsc{\@schoolname\\}}

            \vspace{60pt}
            {\fontsize{25}{20}\selectfont T R A B A J O \ \ T E R M I N A L\\}
            \vspace{60pt}
            {\fontsize{16}{16}\selectfont\textbf{``\@title''\\}}

            \vspace{60pt}
            {\fontsize{14}{14}\selectfont\textsc{Presentan:\\}}
            \vspace{10pt}
            {\fontsize{14}{14}\selectfont\textbf{\@author\\}}

            \vspace{60pt}
            {\fontsize{14}{14}\selectfont\textsc{Directores:\\}}
            \vspace{10pt}
            {\fontsize{14}{14}\selectfont\textbf{\@advisor}\\}
            \vspace{5pt}
            {\fontsize{14}{14}\selectfont\textbf{\@coadvisor}}

            \vfill
            {\fontsize{12}{12}\selectfont Ciudad de México\\}
            {\fontsize{12}{12}\selectfont \@academicyear\\}
            \vspace{40pt}
        \end{minipage}
    \end{adjustbox}
\end{titlepage}
}

\RequirePackage{ragged2e}
\setlength{\emergencystretch}{3em}
\tolerance=10000
\setlength{\parindent}{0pt}  % Añade esta línea
\raggedright\let\oldraggedright\raggedright
\renewcommand{\raggedright}{\oldraggedright\hspace{0pt}}
\AtBeginDocument{\justifying}

\renewcommand{\@afterheading}{
  \vskip-\parskip
  \everypar{\setlength{\parindent}{0pt}\everypar{}}%
}

\titleformat{\chapter}[display]
{\bfseries\Large}
{
    \filright
    \textsc{\textcolor{ipn_color}{
        \MakeUppercase{\chaptertitlename}
        \Huge
        \thechapter
    }}
}
{1ex}
{\Huge}
[\vspace{1ex}\titlerule]