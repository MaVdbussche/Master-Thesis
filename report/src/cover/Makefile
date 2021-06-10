all: clean front_page.pdf

clean: #clean_aux
	rm -r ../../build_latex/*

clean_aux:
	rm $(shell find ../../build_latex/* -not -type d -not -path ../../build_latex/front_page.pdf)

front_page.pdf: front_page.tex
	pdflatex -file-line-error -interaction=nonstopmode -synctex=1 -output-format=pdf -output-directory=../../build_latex/ front_page.tex