export PROJECTNAME=$(shell basename "$(PWD)")

.SILENT: ;               # no need for @

pdf: ## Converts all markdown files in docs/tasks to pdf
	rm -rf docs/tasks/*.pdf && \
	cd docs/tasks && \
	for f in `ls *.md`; do FNAME=`basename $${f} ".md"`; pandoc -s $${FNAME}.md -o $${FNAME}.pdf; done
	
.PHONY: help
.DEFAULT_GOAL := help

help: Makefile
	echo
	echo " Choose a command run in "$(PROJECTNAME)":"
	echo
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	echo