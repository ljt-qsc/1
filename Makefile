TEX_FILES := $(wildcard doc/*.tex)
PDF_FILES := $(patsubst doc/%.tex,doc/%.pdf,$(TEX_FILES))

all: $(PDF_FILES)

doc/%.pdf: doc/%.tex
	cd doc && xelatex $(notdir $<)

clean:
	rm -f doc/*.aux doc/*.log doc/*.pdf \
	doc/*.toc doc/*.snm doc/*.nav doc/*.out

.PHONY: all clean
