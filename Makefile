
all: $(PROJ).pdf $(GENDATA) $(PROJ) $(DATA) $(PROJ)_slide.pdf

$(PROJ): $(PROJ).c
	gcc -o $(PROJ) $(PROJ).c

$(GENDATA): $(GENDATA).c
	gcc -o $(GENDATA) $(GENDATA).c

$(DATA): $(GENDATA)
	./$(GENDATA)

$(IMAGE): $(DATA)
	gnuplot $(PROJ).gp

$(PROJ).pdf: $(PROJ).tex $(IMAGE) $(REF)
	xelatex $(PROJ)
	bibtex $(PROJ)
	xelatex $(PROJ)
	xelatex $(PROJ)

$(PROJ)_slide.pdf: $(PROJ)_slide.tex $(IMAGE)
	xelatex $(PROJ)_slide

clean:
	cd doc
	rm -rf *.aux *.bbl *.blg *.log *.out *.pdf *.toc \
	*.nav *.snm
	cd ..

.PHONY: all clean
