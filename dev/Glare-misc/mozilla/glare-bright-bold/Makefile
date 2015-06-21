ZIP?=zip

# What goes inside the .xpi package
CONTENT:=install.rdf bootstrap.js icon.png \
	$(wildcard menubar/*)

all: dist

# "dist" target builds .xpi extension package.
dist: glarebold.xpi
	
glarebold.xpi: $(CONTENT)
	$(ZIP) $(ZIPFLAGS) $@ $^
	mv glarebold.xpi ..

clean:
	rm -f ../glarebold.xpi

.PHONY: all dist clean
