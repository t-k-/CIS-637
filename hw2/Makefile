.PHONY: clean

all: 0.png 1.png
	
%.png: %.dot clean
	dot -Tpng $*.dot -o $@

clean:
	rm -f *.png	
