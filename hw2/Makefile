.PHONY: clean

all: $(addsuffix .svg, 0 1 2 3)
	
%.svg: %.dot clean
	dot -Tsvg $*.dot -o $@

clean:
	rm -f *.svg
