opts := "-rovWz"
exclude := "--exclude '.git*' --exclude '.*' --exclude '\\#*\\#' --exclude Makefile --exclude justfile"
src := "./public/"
dest := "airborne@10.20.10.40:/var/www/aaronbieber.coach/htdocs/"

build:
    hugo --cleanDestinationDir -e production

upload: build
    rsync {{ opts }} {{ exclude }} {{ src }} {{ dest }}

deploy: upload

serve:
    hugo server --noHTTPCache
