# Makefile for deploying aaronbieber.coach.

OPTS=-rovWz
EXCLUDE=--exclude '.git*' --exclude '.*' --exclude '\#*\#' --exclude Makefile
DEST=airborne@aaronbieber.com:/var/www/aaronbieber.coach/htdocs/

build:
	hugo --cleanDestinationDir -e production

deploy: build
	rsync $(OPTS) $(EXCLUDE) ./public/ $(DEST)
