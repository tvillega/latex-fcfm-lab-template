%Copyright 2018-2021, Samuel Mardones
%
%Copying and distribution of this file, with or without modification, are permitted in any medium without royalty, provided the copyright notice and this notice are preserved. This file is offered as-is, without any warranty.
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fcfm}[2021/09/01 Clase para documentos fcfm]

% Hereda opciones de 'article'
\LoadClass{article}

% [Paquetes]
% Para encapsular figuras
\RequirePackage{wrapfig}    
% Para importar imágenes
\RequirePackage{graphicx}   
% Para editar márgenes de página
\RequirePackage{geometry}
% Para utilizar colores
\RequirePackage{color}
% Para editar foot/head y formato
\RequirePackage{fancyhdr}
% Para traducir LaTeX
\RequirePackage[spanish]{babel}
% Para establecer decimal
\decimalpoint
% Para bloques matemáticas
\RequirePackage{amsmath}    
\RequirePackage{mathtools}

% Para mayores ajustes
\AtEndOfClass{\IfFileExists{fcfm.sty}{\usepackage{fcfm}}{\relax}}

% [Opciones]
\DeclareOption{nina}{\@latex@warning{Nina is set. \MessageBreak}}
\DeclareOption{10pt}{\input{size10.clo}}
\DeclareOption{11pt}{\input{size11.clo}}
\DeclareOption{12pt}{\input{size12.clo}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ExecuteOptions{11pt}
\ProcessOptions

% Chequea funcionamiento de 10pt,11pt,12pt
\newcommand\thefontsize[1]{{#1 The current font size is: \f@size pt\par}}

% [Colores]
\definecolor{red}{rgb}{1,0,0}
\definecolor{gray}{rgb}{.5, .5, .5}

% [Párrafos]
\setlength{\parindent}{0.4cm} % Largo de indentación
\setlength{\parskip}{0.2cm}   % Separación entre párrafos

% [Interlineado]
\linespread{1.0}   % Sencillo
% \linespread{1.3} % 1.5
% \linespread{1.6} % Doble

% [Márgenes](geometry)
\geometry{
headheight=2cm,  % Tamaño cabeza
headsep=0.5cm,   % Margen cabeza-cuerpo
lmargin=2cm,     % Margen izquierdo
rmargin=2cm,     % Margen derecho
bmargin=2cm,     % Margen abajo
}

% [Pie y cabeza de página](fancyhdr)
\fancypagestyle{fcfm}{

% Grosor regla
\renewcommand{\headrulewidth}{0.4pt} % Cabeza
\renewcommand{\footrulewidth}{0.4pt} % Pie

% Cabeza márgenes
\fancyheadoffset[R]{0cm}
\fancyheadoffset[L]{0cm}

% Cabeza texto
\rhead{\includegraphics[trim=0 90 0 0,clip,width=2.5cm]{fcfm.png}}
% \chead{Text}
\lhead{Universidad de Chile\\ Facultad de Ciencias Físicas y Matemáticas}

% Pie márgenes
\fancyfootoffset[R]{-7cm}
\fancyfootoffset[L]{-7cm}

% Pie texto
% \rfoot{Text} 
\cfoot{\thepage}
% \lfoot{Text}
}

% Define estilo del documento
\pagestyle{fcfm}

% [Editor de portada]

% Departamento
\DeclareRobustCommand\dpto[1]{\gdef\@dpto{#1}}
\def\@dpto{\phantom{XXXXXXX}\@latex@error{No \noexpand\dpto given. Mandatory field}\@ehc}

\def\@setdpto{
\noindent{\fontsize{11}{11}\color{red}\textsc\@dpto}\newline
}

% Curso y código
\DeclareRobustCommand\curso[1]{\gdef\@curso{#1}}
\def\@curso{\phantom{XXXXXXX}\@latex@error{No \noexpand\curso given. Mandatory field}\@ehc}

\DeclareRobustCommand\codigo[1]{\gdef\@codigo{#1}}
\def\@codigo{\phantom{XXXX}\@latex@error{No \noexpand\codigo given Mandatory field}\@ehc}

\def\@setcodigoycurso{
\noindent{\fontsize{11}{11}\color{gray}\textsc{{\@codigo} {\@curso}}}\newline
}

% Supertítulo
\DeclareRobustCommand\suptitulo[1]{\gdef\@suptitulo{#1}}
\def\@suptitulo{\phantom{XXXXXXX}\@latex@error{No \noexpand\suptitulo given}\@ehc}

% Título
\DeclareRobustCommand\titulo[1]{\gdef\@titulo{#1}}
\def\@titulo{\phantom{XXXXXXX}\phantom{XXXXXXX}\@latex@error{No \noexpand\titulo given. Mandatory field}\@ehc}

% Subtítulo
\DeclareRobustCommand\subtitulo[1]{\gdef\@subtitulo{#1}}
\def\@subtitulo{\phantom{XXXXXXX}\@latex@error{No \noexpand\subtitulo given. Mandatory field}\@ehc}

% Profesores
\DeclareRobustCommand\profesores[1]{\gdef\@profesores{#1}}
\def\@profesores{\phantom{X}\@latex@warning{No \noexpand\profesores given. Set \noexpand\noprofesores to hide the field. \MessageBreak}}

\DeclareRobustCommand\noprofesores{\gdef\@setprofesores{}\gdef\@profesores{}}

\def\@setprofesores{
\textsc{Profesores:}\newline
\@profesores\newline
\rule{2cm}{0cm}
}

% Auxiliares
\DeclareRobustCommand\auxiliares[1]{\gdef\@auxiliares{#1}}
\def\@auxiliares{\phantom{X}\@latex@warning{No \noexpand\auxiliares given. Set \noexpand\noauxiliares to hide the field. \MessageBreak}}

\DeclareRobustCommand\noauxiliares{\gdef\@setauxiliares{}\gdef\@auxiliares{}}

\def\@setauxiliares{
\textsc{Auxiliares:}\newline
\@auxiliares\newline
\rule{2cm}{0cm}
}

% Ayudantes
\DeclareRobustCommand\ayudantes[1]{\gdef\@ayudantes{#1}}
\def\@ayudantes{\phantom{X}\@latex@warning{No \noexpand\ayudantes given. Set \noexpand\noayudantes to hide the field. \MessageBreak}}

\DeclareRobustCommand\noayudantes{\gdef\@setayudantes{}\gdef\@ayudantes{}}

\def\@setayudantes{
\textsc{Ayudantes:}\newline
\@ayudantes\newline
\rule{2cm}{0cm}
}

% Integrantes
\DeclareRobustCommand\integrantes[1]{\gdef\@integrantes{#1}}
\def\@integrantes{\phantom{X}\@latex@warning{No \noexpand\integrantes given. Set \noexpand\nointegrantes to hide the field. \MessageBreak}}

\DeclareRobustCommand\nointegrantes{\gdef\@setintegrantes{}\gdef\@integrantes{}}

\def\@setintegrantes{
\textsc{Integrantes:}\newline
\@integrantes\newline
\rule{2cm}{0cm}
}

% Fecha
\DeclareRobustCommand\fecha[1]{\gdef\@fecha{#1}}
\def\@fecha{\today}

% [Generador de portada]
\def\@portada{

% Empieza nueva página
\pagebreak

% Sin cabeza ni pie
\thispagestyle{empty}

% Modifica márgenes
\newgeometry{
nohead,          % Sin cabeza
tmargin=2cm,     % Margen arriba
lmargin=2cm,     % Margen izquierdo
rmargin=2cm,     % Margen derecho
bmargin=2cm,     % Margen abajo
}

% Logo universidad
\begin{wrapfigure}{l}{4.7cm}
\vspace{-4mm}\includegraphics[trim=0 90 0 0,clip,width=4.7cm]{fcfm.png}
\end{wrapfigure}

% Información curso
\rule{5cm}{0cm}\newline
\@setdpto
\noindent{\fontsize{11}{11}\color{gray}\textsc{Facultad de Ciencias Físicas y Matemáticas}}\newline
\noindent{\fontsize{11}{11}\color{gray}\textsc{Universidad de Chile}}\newline
\@setcodigoycurso
\rule{5cm}{0cm}\par

% Título
\vspace*{0.20\textheight}
\begin{center}
{\textsc {\@suptitulo}}\\
\rule{\textwidth}{.2mm}\\[0.7cm]
{\Huge \@titulo }\\[0.5cm]
{\Large \@subtitulo }\\
\rule{\textwidth}{.2mm}\\
\end{center}
\vspace*{\fill}

% Integrantes
\hfill
\begin{minipage}[r]{0.25\textwidth}

\@setprofesores

\@setauxiliares

\@setayudantes

\@setintegrantes

\end{minipage}
\vspace*{\fill}

% Fecha y cierre portada
\centerline\@fecha
\newpage

% Reestablece márgenes
\newgeometry{
headheight=2cm,  % Tamaño cabeza
headsep=0.5cm,   % Margen cabeza-cuerpo
lmargin=2cm,     % Margen izquierdo
rmargin=2cm,     % Margen derecho
bmargin=2cm,     % Margen abajo
}

}

% Redefine portada
\renewcommand{\maketitle}{\@portada}
