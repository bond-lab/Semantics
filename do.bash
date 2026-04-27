sdir=slides
#subj=hg2052
pushd .
cd $sdir
for slide in `ls lexi-*.tex`
do
    base=`basename $slide .tex`
    echo Processing ${base}
    latexmk -silent -pdf -xelatex ${base}
    ## clean up
    #rm *.aux *.bbl *.blg *.log *~ *.dvi *.ps *.pdf
done

for slide in `ls sem-*.tex`
do
    base=`basename $slide .tex`
    echo Processing ${base}
    latexmk -silent -pdf -xelatex ${base}
    ## clean up
    #rm *.aux *.bbl *.blg *.log *~ *.dvi *.ps *.pdf
done

for slide in `ls tut-*.tex`
do
    base=`basename $slide .tex`
    echo Processing ${base} --- questions
    echo Processing ${base} --- answers
    ln -sf with.tex answers.tex 
    latexmk -silent -xelatex ${base}
    mv "${base}.pdf" "${base}-answers.pdf"
    ln -sf without.tex answers.tex
    latexmk -silent -xelatex ${base}
    # mv "${base}.pdf" "${base}-questions.pdf"
    ## clean up
    #rm *.aux *.bbl *.blg *.log *~ 
done


popd

### copy changed slides
rsync -av --ignore-times slides/lexi-*.pdf slides/sem-*.pdf docs/pdf
rsync -av --ignore-times --exclude='*answers*' slides/tut*.pdf docs/pdf

#htmldoc  --duplex --color --fontsize 12 --webpage -f /home/bond/papers/Outlines/${subj}-outline.pdf www/index.html


echo
echo Updated all slides: check the index.html is up to date
echo
echo Please commit any changes
echo
echo 
git status
echo
