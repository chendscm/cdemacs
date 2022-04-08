emacs ?= emacs

BASEDIR := $(shell pwd)

install: pull
	cd $(BASEDIR)
	make run

pull:
	echo "-*- mode: compilation -*-" > etc/log
	git pull 2>&1 | tee -a etc/log
	git submodule update --init --recursive 2>&1 | tee -a etc/log
	git submodule foreach git reset --hard 2>&1 | tee -a etc/log
	git submodule foreach git checkout master 2>&1 | tee -a etc/log

update:
	git submodule foreach git pull --rebase 2>&1 | tee -a etc/log

upgrade: 
	cd $(BASEDIR) && $(emacs) -batch -l packages.el 2>&1 | tee -a etc/log

run:
	$(emacs) -Q -l init.el &

.PHONY: install upgrade run pull
