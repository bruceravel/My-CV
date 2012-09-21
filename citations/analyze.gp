## http://researchlibrary.bnl.gov/ --> Web of Knowledge --> Web of Science
## there search for Journal of Synchrotron Radiation and sort result
## by most citations

## the expgui article from APS News, May 2010
## http://www.aps.anl.gov/News/APS_News/Content/APS_NEWS_20100528.php
## at Web of Science, search for "expgui" in Journal of Applied
## Crystallography

set term wxt 0 enhanced font 'Droid sans, 12'

count=system("head -1 analyze.txt | cut -f 3 | cut -d ' ' -f 3")
date=system("ls -l analyze.txt | cut -f 6,7 -d ' '")

ttl="citations of Athena/Artemis paper from JSR\n" . count . ' total citations'

set title ttl
set xlabel 'year'
set ylabel 'number of citations'
set xrange [2004.5:2012.5]
set yrange [:400]
set boxwidth 0.2
set style fill solid
set key left top samplen 0.3

plot 'analyze.txt' using 1:($1>2011 ? 1/0 : $2) with boxes lt 3 title 'yearly totals',\
     '' using 1:($2+10):2 with labels title '',\
     '' using 1:($1<2012 ? 1/0 : $2) with boxes lt 8 title 'as of '.date
