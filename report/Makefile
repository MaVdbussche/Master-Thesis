LATEX_FLAGS := -pdf -lualatex -cd -silent

.PHONY: all main open clean clean_aux

all: open

open: main
	@xdg-open build_latex/main.pdf 2>/dev/null 1>/dev/null &

main: clean build_latex/main.pdf

clean: clean-aux
	rm -r build_latex/*

clean-aux:
	rm $(shell find build_latex/* -not -type d -not -path build_latex/main.pdf)

build_latex/main.pdf: src/main.tex #src/tex/*
	@echo "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=../$(@D) $< $(BASH_POSTPROCESSING)

build_latex/cover.pdf: EPL-master-thesis-covers-templates-Word-LaTeX/LaTeX/EPL-master-thesis-covers-template-EN.tex
	@echo "\e[1;7;32m[=]\e[27m Compiling $< to $@ ...\e[0m"
	latexmk $(LATEX_FLAGS) $(LATEX_OPT) -outdir=../../$(@D) $< $(BASH_POSTPROCESSING)