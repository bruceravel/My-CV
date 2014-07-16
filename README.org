#+TITLE: Bruce Ravel's CV

[[https://s3.amazonaws.com/BruceRavelCV/cv.pdf][A PDF copy of my CV]]

* Files:

  + ~cv.tex~: the LaTeX source for my CV
  + ~highlights.bib~: bib file with my favorite citations
  + ~allmine.bib~: bib file with all the rest of my citations
  + ~BR_smiling.jpg~: my photo
  + ~moderncv.purple.patch~: a patch to the Modern CV LaTeX class to add a color of my choice
  + ~mydoi.sty~: a patched copy of the standard ~doi.sty~

* Required downloads:

  + The Modern CV class: [[https://launchpad.net/moderncv]] 
     - Unpack the zip file into the current directory (or, I suppose,
       install it system-wide).  Really only need the ~.sty~ and
       ~.cls~ files in the current directory.
     - +Apply the patch: ~patch < moderncv.purple.patch~ to add the purple color theme+ 
       My purple theme has been included since version 0.13, so the patch is no longer necessary.
     - Update moderncv to 1.4!
  + etoolbox: [[http://www.ctan.org/tex-archive/macros/latex/contrib/etoolbox]]
     - Again, only need the ~etoolbox.sty~ file in the current directory.
  + I had to install Ubuntu's +texlive-latex-extra+ to get one of
    Modern CV's dependencies (~xargs.sty~).  This has since moved into
    the ~texlive-latex3~ package.

* The doi/hyperref problem

This happens:

 : Package hyperref Message: Driver (autodetected): hpdftex.
 : 
 : (/usr/share/texlive/texmf-dist/tex/latex/hyperref/hpdftex.def
 : (/usr/share/texlive/texmf-dist/tex/latex/oberdiek/rerunfilecheck.sty)))
 : 
 : ! LaTeX Error: Option clash for package hyperref.
 : 
 : See the LaTeX manual or LaTeX Companion for explanation.
 : Type  H <return>  for immediate help.
 :  ...                                              
 :                                                   
 : l.49 \begin{document}

The solution is to edit the ~doi.sty~ file at line 36 to read

 : \RequirePackage[unicode]{hyperref}

i.e. add the =[unicode]=.

On my desktop at work, ~doi.sty~ is ~/usr/share/texlive/texmf-dist/tex/latex/doi/doi.sty~

The reason this is necessary is that =moderncv= imports the hyperref
package with the =[unicode]= argument.  The warning is about hyperref
being imported differently in the two packages.

Alternately, simply remove line 36, which works because hyperref is
already loaded.

~mydoi.cls~ is a copy of ~doi.sty~ version 2007/07/24 with line 36
commented out


