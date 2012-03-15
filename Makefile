SRC_DIR = ./src
DOC_DIR = ./doc

TEX_FILES = $(wildcard $(SRC_DIR)/*.tex)
DEPEND_FILES = $(wildcard $(SRC_DIR)/**/*.tex)
BASE_FILES = $(notdir $(TEX_FILES:%.tex=%))
DOC_FILES = $(addprefix doc/,$(BASE_FILES:%=%.pdf))

$(DOC_FILES): $(DOC_DIR) $(SRC_DIR) $(TEX_FILES) $(DEPEND_FILES)
	for file in $(BASE_FILES) ; do \
		texi2pdf -c -q -o $(DOC_DIR)/$$file.pdf $(SRC_DIR)/$$file.tex ; \
	done

destroy:
	rm $(DOC_DIR)/*.pdf

$(DOC_DIR):
	mkdir $(DOC_DIR)
