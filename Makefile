ESLINT = node ./node_modules/.bin/eslint
MOCHA = node ./node_modules/mocha/bin/mocha

TESTS = test/*.js
SRC = $(shell find bin lib test -type f -name "*.js")

REPORTER ?= spec

dev:
	npm install

clean:
	npm prune

lint:
	$(ESLINT) $(SRC)
	$(ESLINT) $(TESTS)

test:
	rm -Rf test/migrations/flokStatus/
	$(MOCHA) --reporter $(REPORTER) $(TESTS)

.PHONY: dev clean lint test
