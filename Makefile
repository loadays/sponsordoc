default all: pdf

TMPDIR="/tmp"

pdf: sponsordoc.tex
	@test -d $(TMPDIR) || mkdir $(TMPDIR)
	@echo "Running 2 compiles"
	@pdflatex -output-directory=$(TMPDIR) -interaction=batchmode -file-line-error -shell-escape sponsordoc.tex > /dev/null
	@pdflatex -output-directory=$(TMPDIR) -interaction=batchmode -file-line-error -shell-escape sponsordoc.tex > /dev/null
	@cp $(TMPDIR)/sponsordoc.pdf .
	@echo "sponsordoc Ready"

clean: sponsordoc.pdf
	@rm -f sponsordoc.pdf

show:
	@test -f sponsordoc.pdf | make pdf
	@zathura sponsordoc.pdf
