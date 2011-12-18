MATHTEX=~/bin/mathtex.cgi
PANDOC=~/.cabal/bin/pandoc
BASENAME=Reise4

all: html txt

html:
	$(PANDOC) -f markdown $(BASENAME).md -s --toc -o $(BASENAME)-untidy.html
	-for i in html-patches/* ; do patch -p0 <$$i ; done
	-tidy -utf8 $(BASENAME)-untidy.html >$(BASENAME).html
	tidy -utf8 -e $(BASENAME).html

epub:
	$(PANDOC) -f markdown $(BASENAME).md --toc --epub-metadata=dc.xml --epub-cover-image=images/cover.png -o $(BASENAME).epub
	
txt:
	$(PANDOC) -f markdown -t plain -s $(BASENAME).md -o t.txt
	sed -f txtconv.sed <t.txt >$(BASENAME)-utf8.txt
	-for i in txt-patches/* ; do patch -p0 <$$i ; done

zip:
	rm -f $(BASENAME).zip
	zip -r $(BASENAME) $(BASENAME)-utf8.txt $(BASENAME).html images

