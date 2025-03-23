sdir=slides
#subj=hg2052
pushd .
cd $sdir
#for slide in `ls hg8011-*.tex`
# do
#     base=`basename $slide .tex`
#     echo Processing ${base}
#     #latexmk -pdf -xelatex ${base}
#     ## clean up
#     #rm *.aux *.bbl *.blg *.log *~ *.dvi *.ps *.pdf
# done

for slide in `ls tut-*.tex`
do
    base=`basename $slide .tex`
    echo Processing ${base}
    ln -sf without.tex answers.tex
    latexmk -silent -xelatex ${base}
    mv "${base}.pdf" "${base}-questions.pdf"
    echo Processing ${base} with answers
    ln -sf with.tex answers.tex 
    latexmk -silent -xelatex ${base}
    mv "${base}.pdf" "${base}-answers.pdf"
    ## clean up
    #rm *.aux *.bbl *.blg *.log *~ 
done


popd

### copy changed slides
#rsync -av --ignore-times slides/*.pdf docs/pdf

#htmldoc  --duplex --color --fontsize 12 --webpage -f /home/bond/papers/Outlines/${subj}-outline.pdf www/index.html


echo
echo Updated all slides: check the index.html is up to date
echo
echo Please commit any changes
echo
echo 
git status
echo
