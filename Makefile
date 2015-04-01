## GENERAL INFOS

IMG_DIR   = ./img/

PDF       = haskell_trans.pdf
PDF_DEPS  = haskell_trans.tex theme.tex $(wildcard img/*)
PDF_CMD   = xelatex
PDF_FLAGS = -interaction nonstopmode

CLEAN = '*~' '\#*' '.\#*' '.DS_Store' '*.log' '*.aux' '*.toc' '*.nav' '*.out' '*.snm' '*.vrb' '*.o' '*.hi'




## OUTPUT

all: $(PDF);

$(PDF): $(PDF_DEPS)



# CLEANING

clean:
	for f in $(CLEAN) ; do find . -name "$$f" | xargs rm -f ; done

distclean: clean
	rm -f $(PDF)



## SPECIFIC

%.pdf: %.tex
	$(PDF_CMD) $(PDF_FLAGS) $*.tex && $(PDF_CMD) $(PDF_FLAGS) $*.tex

%.pdf:
	@echo "Unable to find $*.tex, aborting."
	@exit 2



## SPECIALS

.PRECIOUS: %.pdf ;
