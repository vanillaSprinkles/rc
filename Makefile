

all:    grawity-code-utfvis
clean:  grawity-code-utfvis-clean


.PHONY:  all  clean  grawity-code-utfvis  grawity-code-utfvis-checkout  grawity-code-utfvis


bscript-forks-dir = HOME/.bscripts/_forks



####




#### grawity/code/utfvis

grawity-code-dir = $(bscript-forks-dir)/grawity__code
grawity-code-utfvis-cache-dir = $(bscript-forks-dir)/grawity__code__cache


$(grawity-code-dir)/.git/config:
	git  clone  --depth  1  --no-checkout  --branch  main  https://github.com/grawity/code.git  ./$(grawity-code-dir)


grawity-code-utfvis-checkout:  $(grawity-code-dir)/.git/config
	cd  ./$(grawity-code-dir)    &&    git  config  core.sparseCheckout true    &&    git  sparse-checkout  set  /utfvis    &&    git  checkout


grawity-code-utfvis:  grawity-code-utfvis-checkout
	mkdir  -p  ./$(grawity-code-utfvis-cache-dir)
	cp  -a  ./$(grawity-code-dir)/utfvis  ./$(grawity-code-utfvis-cache-dir)/.


grawity-code-utfvis-clean:
	rm  -rf  ./$(grawity-code-dir)
	git restore -- ./$(grawity-code-dir)
