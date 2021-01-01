## http://researchlibrary.bnl.gov/ --> Web of Knowledge --> Web of Science
## there search for Journal of Synchrotron Radiation and sort result
## by most citations

## the expgui article from APS News, May 2010
## http://www.aps.anl.gov/News/APS_News/Content/APS_NEWS_20100528.php
## at Web of Science, search for "expgui" in Journal of Applied
## Crystallography

set term qt 0 enhanced font 'Droid sans, 12'
#set term postscript color enhanced landscape solid font 'Arial,14'
#set out 'citations.ps'

set style line 1 linecolor rgb "blue" pointsize 1 pointtype 7
set style line 2 linecolor rgb "red"  pointsize 1 pointtype 9


count=system("head -1 analyze.txt | cut -d ' ' -f 7")
date=system("ls -l analyze.txt | cut -f 6,7 -d ' '")
#date=system("ls -l analyze.txt | cut -f 6,8 -d ' '")

ttl="citations of Athena/Artemis paper from JSR\n" . count . ' total citations'

set title ttl
set xlabel 'year'
set ylabel 'number of citations'
set xrange [2004.5:2020.5]
set yrange [:1100]
set boxwidth 0.2
set style fill solid
set key left top samplen 0.3

plot 'analyze.txt' using 1:2

plot 'analyze.txt' using 1:($1>2019 ? 1/0 : $2) with boxes ls 1 title 'yearly totals',\
     '' using 1:($2+25):2 with labels title '',\
     '' using 1:($1<2020 ? 1/0 : $2) with boxes ls 2 title 'as of '.date
