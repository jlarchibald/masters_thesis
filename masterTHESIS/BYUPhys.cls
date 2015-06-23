 \NeedsTeXFormat{LaTeX2e}
 \ProvidesClass{BYUPhys}[2010/07/15 BYU Theses and Dissertations]

% The BYUPhys class is for producing theses and dissertations
% that meet the BYU requirements.
% Revision: July 2010
% Revision History
%   07-15-2010 : Cleaned up page definitions
%   12-09-2009 : Updated to new BYU style, without signature pages.
%

% Declare some variables to hold the text fields for the preliminary pages

    \newcommand{\Title}[1]{\gdef\BYUField@Title{#1}}
    \newcommand{\Author}[1]{\gdef\BYUField@Author{#1}}
    \newcommand{\docname}[1]{\gdef\BYUField@DocName{#1}}
    \newcommand{\degree}[1]{\gdef\BYUField@Degree{#1}}
    \newcommand{\Advisor}[1]{\gdef\BYUField@Advisor{#1}}
    \newcommand{\AdvisorTitle}[1]{\gdef\BYUField@AdvisorTitle{#1}}
    \newcommand{\MemberA}[1]{\gdef\BYUField@MemberA{#1}}
    \newcommand{\MemberB}[1]{\gdef\BYUField@MemberB{#1}}
    \newcommand{\MemberC}[1]{\gdef\BYUField@MemberC{#1}}
    \newcommand{\MemberD}[1]{\gdef\BYUField@MemberD{#1}}
    \newcommand{\Month}[1]{\gdef\BYUField@Month{#1}}
    \newcommand{\Year}[1]{\gdef\BYUField@Year{#1}}
    \newcommand{\Abstract}[1]{\gdef\BYUField@Abstract{#1}}
    \newcommand{\Keywords}[1]{\gdef\BYUField@Keywords{#1}}
    \newcommand{\Acknowledgments}[1]{\gdef\BYUField@Acknowledgments{#1}}
    \newcommand{\HonorsRepresentative}[1]{\gdef\BYUField@HonorsRep{#1}}

% Initialize the variables to their default values

    \Title{[Title: Titles Must Be in Mixed Case and May Not Exceed Six Inches on One Line\\
           and Must Be in the Inverted Pyramid Format When\\
           Additional Lines Are Needed]}
    \Author{[Student Name]}
    \docname{Master's Thesis}
    \degree{Master of Science}
    \Advisor{[Advisor]}
    \AdvisorTitle{Advisor}
    \MemberA{}
    \MemberB{}
    \MemberC{}
    \MemberD{}
    \Month{[Graduation Month]}
    \Year{[Year]}
    \Abstract{[The abstract is a summary of the thesis/dissertation with emphasis on the findings
              of the study. The abstract must not exceed 350 words in length and fit on one page,
              single spaced.]}
    \Keywords{[A comma-separated list of descriptive words for search purposes]}
    \Acknowledgments{[Acknowledgements should be simple, in good taste, and fit on one page]}
    \HonorsRepresentative{[Honors Representative]}

% Define the preliminary page layouts using the variables

    \newcommand{\BYUtitlepage}{
        \thispagestyle{empty}
        {\centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}
        \parbox[t]{6in}{
            \renewcommand{\baselinestretch}{2} \small\normalsize
            \centering\BYUField@Title\par
            \renewcommand{\baselinestretch}{1} \small\normalsize
            }\\[\baselineskip]\par
        \vfill
        \BYUField@Author\\[\baselineskip]
        \vfill
        A \BYUField@DocName~submitted to the faculty of\\
        Brigham Young University\\
        in partial fulfillment of the requirements for the degree of\\[\baselineskip]
        \BYUField@Degree \\
        \vfill
        \BYUField@Advisor, \BYUField@AdvisorTitle\\
        \mbox{\BYUField@MemberA}\\
        \mbox{\BYUField@MemberB}\\
        \mbox{\BYUField@MemberC}\\
        \mbox{\BYUField@MemberD}
        \vfill
        Department of Physics and Astronomy\\[\baselineskip]
        Brigham Young University\\[\baselineskip]
        \mbox{\BYUField@Month~\BYUField@Year} \\[\baselineskip]
        \vfill
        Copyright \copyright\ \BYUField@Year~\BYUField@Author\\[\baselineskip]
        All Rights Reserved\par
        }
        \clearemptydoublepage
      }

    \newcommand{\abstractpage}{
        \thispagestyle{empty}
        {\centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}
        ABSTRACT\\[2\baselineskip]\par
        \renewcommand{\baselinestretch}{2} \small\normalsize
        \parbox{\textwidth}{\centering\BYUField@Title}\\[1\baselineskip]\par
        \mbox{\BYUField@Author}\\
        Department of Physics and Astronomy\\
        \mbox{\BYUField@Degree}\\[0.5\baselineskip]\par
        }

        \addtolength{\parskip}{\baselineskip}
        \BYUField@Abstract\par

        \vfill
        \addtolength{\parskip}{-\baselineskip}
        \noindent Keywords:~\BYUField@Keywords

        \clearemptydoublepage
    }

    \newcommand{\acknowledgmentspage}{
        \singlespace
        \thispagestyle{empty}
        {\centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Acknowledgments}{bm:Acknowledge}
        ACKNOWLEDGMENTS\\[3\baselineskip]
        \par}\par
        \renewcommand{\baselinestretch}{1.66} \small\normalsize%
        \BYUField@Acknowledgments
        \par\renewcommand{\baselinestretch}{1} \small\normalsize%
        \clearemptydoublepage
        }

% Allow opt-out on acknowledgments
    \DeclareOption{noacknowlegments}{
      \renewcommand{\acknowledgmentspage}{}
    }



% Define the macro for making preliminary pages
    \newcommand{\makepreliminarypages}{
        \changepage{0.5in}{}{}{}{}{}{-0.2in}{-0.3in}{}
        \BYUtitlepage
        \abstractpage
        \acknowledgmentspage
        \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
        \changepage{-0.5in}{}{}{}{}{}{0.2in}{0.3in}{}
    }


% Define the following class options to specify thesis type
%
%   senior  : Produces the senior thesis preliminary pages (default)
%   masters : Produces the masters thesis preliminary pages
%   phd     : Produces the PhD dissertation preliminary pages
%   honors  : Produces the honors thesis preliminary pages

    \DeclareOption{senior}{
        % Don't need anything here because default values
        % were set when we initialized variables
    }

    \DeclareOption{masters}{
      \degree{Master of Science}
      \docname{thesis}
      \AdvisorTitle{Chair}
    }

    \DeclareOption{phd}{
      \degree{Doctor of Philosophy}
      \docname{dissertation}
      \AdvisorTitle{Chair}
    }

% Honors does their own thing...

    \DeclareOption{honors}{
      \renewcommand{\makepreliminarypages}{
        \changepage{0.5in}{-0.5in}{}{0.5in}{}{}{-0.2in}{-0.3in}{}
        \honorstitlepage
        \honorsabstractpage
        \acknowledgmentspage
        \renewcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}
        \changepage{-0.5in}{}{}{}{}{}{0.2in}{0.3in}{}
      }
    }

    \newcommand{\honorstitlepage}{
        \thispagestyle{empty}
        \begin{center}
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Title Page}{bm:Title}
        \vspace*{0.375in}
        \parbox[t]{5in}{
            \renewcommand{\baselinestretch}{2} \small\normalsize
            \centering\BYUField@Title\par
            \renewcommand{\baselinestretch}{1} \small\normalsize
            }
        \vfill
        by\\[\baselineskip]
        \BYUField@Author
        \vfill
        Submitted to Brigham Young University in partial fulfillment\\[\baselineskip]
        of graduation requirements for University Honors
        \vfill
        Department of Physics and Astronomy\\[\baselineskip]
        Brigham Young University\\[\baselineskip]
        \BYUField@Month~\BYUField@Year
        \vfill
        \end{center}
        \parbox[b]{2.9in}{
            Advisor: \BYUField@Advisor \\[.5\baselineskip]
            Signature: \hrulefill}
        \hfill
        \parbox[b]{2.9in}{
            Honors Representative: \BYUField@HonorsRep \\[.5\baselineskip]
            Signature: \hrulefill}
        \clearemptydoublepage
      }

    \newcommand{\honorsabstractpage}{
        \thispagestyle{empty}
        {\centering
        \providecommand\pdfbookmark[3][]{} \pdfbookmark[0]{Abstract}{bm:Abstract}
        ABSTRACT\\[2\baselineskip]\par
        \renewcommand{\baselinestretch}{1} \small\normalsize
        \parbox{5in}{\centering\BYUField@Title}\\[1\baselineskip]\par
        \renewcommand{\baselinestretch}{2} \small\normalsize
        \mbox{\BYUField@Author}\\
        Department of Physics and Astronomy\\
        \mbox{\BYUField@Degree}\\[0.5\baselineskip]\par
        }

        \renewcommand{\baselinestretch}{1.66} \small\normalsize
        \BYUField@Abstract

        \clearemptydoublepage
    }


% A couple of useful macros for students

    % The \singlespace macro switches to single spaced lines
    \newcommand{\singlespace}{\par\renewcommand{\baselinestretch}{1}\small\normalsize\par}

    % The \doublespace macro switches to double spaced lines
    \newcommand{\doublespace}{\par\renewcommand{\baselinestretch}{1.66}\small\normalsize\par}



% A command to handle single sided preliminary pages in a double sided environment

    % Define the '\clearemptydoublepage' command to clear pages but not number any blank pages inserted.
    \let\cle@rdoublep@ge\cleardoublepage
    \newcommand{\cle@remptydoublep@ge}{
      \clearpage
      \if@twoside
      \ifodd\c@page\else
      \fi\fi
      {\pagestyle{empty}\cle@rdoublep@ge}}
    \newcommand{\clearemptydoublepage}{\cle@remptydoublep@ge}

\DeclareOption{etd}{
    \renewcommand{\clearemptydoublepage}{\clearpage}
    }


% Load the class and needed packages

    \DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}
    \ProcessOptions
    \relax
    \LoadClass[letterpaper,12pt]{book}

    \RequirePackage{changepage}


% Set the margins to BYU specifications

    \setlength{\marginparwidth}{0pt}
    \setlength{\marginparsep}{0pt}
    \setlength{\oddsidemargin}{0in}
    \setlength{\evensidemargin}{0in}
    \setlength{\textwidth}{6.5in}
    \setlength{\topmargin}{0in}
    \setlength{\headheight}{0.2in}
    \setlength{\headsep}{0.3in}
    \setlength{\textheight}{8.4in}
    \setlength{\footskip}{0.25in}
    \raggedbottom


% Redefine the Table of Contents to deal with some blank page
% and bookmarking issues relating to ETD submission
    \let\TEMPtableofcontents\tableofcontents
    \renewcommand{\tableofcontents}{
      \clearemptydoublepage
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Table of Contents}
      \TEMPtableofcontents
    }

% Redefine the List of Figures to deal with some blank page
% and bookmarking issues
    \let\TEMPlistoffigures\listoffigures
    \renewcommand{\listoffigures}{
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{List of Figures}
      \TEMPlistoffigures
    }

% Redefine the Bibliography to deal with a bookmarking issues
    \let\TEMPbibliography\bibliography
    \renewcommand{\bibliography}{
      \providecommand\phantomsection{} \phantomsection
      \addcontentsline{toc}{chapter}{Bibliography}
      \TEMPbibliography
    }
