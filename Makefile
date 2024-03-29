ZALOHA = $(shell date '+backup-%Y-%m-%d')
#ODDELOVAC=' a '
ODDELOVAC=

all:  build



svg/%.svg: pdf/%.pdf
	pdf2svg $^ svg/$(*F).svg 1
	inkscape --verb=FitCanvasToDrawing --verb=FileSave --verb=FileQuit svg/$(*F).svg

png/%.png: svg/%.svg
	convert -density 200 $^ $@

pdf/%.pdf: data/%.csv
	set -e ;\
	ROCNIK=$$(echo $(*F) |sed "s/.csv//"| cut -d'_' -f 2) ;\
	VYUCUJE=$$(tail  -n +2 $^ |cut -d, -f4|grep -v spolecne|sort|uniq -c| sort -nr|sed "s/^ *//"|cut -d" " -f2|tr "\n" " "|sed "s/ $$//;s/^/\\\/;s/ /$(ODDELOVAC)\\\/g" ) ;\
	m4 -P -I templates -D _DATA_=../$^ -D _ROCNIK_=$$ROCNIK -D _SABLONAROZVRHU_="rozvrh" -D _VYUCUJE_="$$VYUCUJE" templates/dokument.m4 | pdflatex  --output-directory pdf --jobname $(*F) -- ;\
	m4 -P -I templates -D _DATA_=../$^ -D _ROCNIK_=$$ROCNIK -D _SABLONAROZVRHU_="rozvrhcasy" -D _VYUCUJE_="$$VYUCUJE" templates/dokument.m4 | pdflatex  --output-directory pdf --jobname $(*F)c -- 
	pdfjam --nup 1x2 pdf/$*.pdf '1,1' --outfile pdf/$*_1x2.pdf


build-and-backup-current-version: | build backup

backup: | $(ZALOHA)
	cp -r data $(ZALOHA)
	mv pdf $(ZALOHA)
	mv png $(ZALOHA)
	mv svg $(ZALOHA)

build: dirs
	make `find data -name "*.csv"|sed "s/csv/png/g;s/data/png/g;"` `find data -name "*.csv"|sed "s/csv/pdf/g;s/data/pdf/g;"`
	rm -f pdf/*.log
	rm -f pdf/*.aux

$(ZALOHA):
	mkdir $@

dirs:
	mkdir -p pdf png svg

publish: build
	for file in pdf/*.pdf; do cp $$file `echo $$file|sed "s@pdf\/[^_]*_@docs\/@"` ;done
	for file in png/*.png; do cp $$file `echo $$file|sed "s@png\/[^_]*_@docs\/@"` ;done
	git add docs/*.p*
	git commit docs -m $(shell date '+"publishing %Y-%m-%d"')
	git push

clean:
	rm -rf pdf
	rm -rf png
	rm -rf svg
