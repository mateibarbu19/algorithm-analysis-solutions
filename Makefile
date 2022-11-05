ifndef CONFIG
	CONFIG=config_output.yaml
endif

ifndef UTILS
	UTILS=utils
endif

ifndef HEAD
	HEAD=$(UTILS)/head.tex
endif

ifndef MANAGE_RESOURCES
	MANAGE_RESOURCES=$(UTILS)/manage_resources.sh
endif

build: README.pdf

resources:
	./$(MANAGE_RESOURCES) build

README.pdf README.tex: README.md header.yaml $(CONFIG) $(HEAD) resources
	pandoc -d $(CONFIG) \
		-M date="`date "+%d %B %Y"`" \
		--include-in-header $(HEAD) \
		-o $@

README.html: README.md header.yaml $(CONFIG) $(HEAD) resources
	pandoc -d $(CONFIG) \
		-M date="`date "+%d %B %Y"`" \
		-o $@

clean:
	./$(MANAGE_RESOURCES) clean
	rm -f README.pdf README.tex README.html
