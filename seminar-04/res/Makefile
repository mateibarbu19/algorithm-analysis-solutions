build: ex14_tree.svg

%.pdf: %.tex
	pdflatex $<

%.svg: %.pdf
	pdftocairo  $< -svg

clean:
	rm *.pdf *.log *.aux