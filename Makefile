install:
	bundle install

serve: install
	bundle exec jekyll serve --livereload
