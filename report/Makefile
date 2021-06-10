LATEX_FLAGS := -pdf -lualatex -cd -silent

.PHONY: all main open clean clean_aux

all: open

open: main split assemble
	@xdg-open build_latex/Thesis.pdf 2>/dev/null 1>/dev/null &

main: clean build_latex/main.pdf build_latex/front_page.pdf

clean: #clean-aux
	rm -r build_latex/*

clean-aux:
	rm $(shell find build_latex/* -not -type d -not -path build_latex/main.pdf)

build_latex/main.pdf: src/main.tex #src/tex/*
	@echo "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=../$(@D) $< $(BASH_POSTPROCESSING)

build_latex/front_page.pdf:
	$(MAKE) -C ./src/cover front_page.pdf

split:
	pdftk build_latex/front_page.pdf burst output build_latex/page_%02d.pdf

assemble:
	pdftk build_latex/page_01.pdf build_latex/main.pdf build_latex/page_02.pdf cat output build_latex/Thesis.pdf

