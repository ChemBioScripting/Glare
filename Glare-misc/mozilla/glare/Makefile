ZIP?=zip

# What goes inside the .xpi package
CONTENT:=install.rdf bootstrap.js icon.png \
	$(wildcard menubar/*)

all: dist

# "dist" target builds .xpi extension package.
dist: glarelight.xpi
	
glarelight.xpi: $(CONTENT)
	$(ZIP) $(ZIPFLAGS) $@ $^
	mv glarelight.xpi ..


clean:
	rm -f glarelight.xpi

.PHONY: all dist clean
