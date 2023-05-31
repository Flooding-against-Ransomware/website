SHELL := /bin/bash
BUNDLE := bundle config set --local path 'vendor/bundle' && bundle
JEKYLL := $(BUNDLE) exec jekyll

.PHONY: cd all install update clean build serve push

all : install build

install:
	$(BUNDLE) install --redownload

update:
	$(BUNDLE) update
	
clean:
	$(JEKYLL) clean

build:
	$(JEKYLL) build

serve:
	$(JEKYLL) serve --base ""
