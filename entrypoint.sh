#!/bin/sh

TARGET=$1

if [ -z "$TARGET" ]; then
    TARGET=/src
fi

cd $TARGET

# Python: autoflake, isort, black
echo "---"
echo "Formatting Python"
autoflake --in-place --remove-all-unused-imports --remove-unused-variables --recursive . && \
    isort . && \
    black .
PYTHONRES=$?

# JSON: jq
echo "---"
echo "Formatting JSON"
find . -type f -name "*.json" | xargs --no-run-if-empty -n1 sh -c 'jq . "$0"' > /dev/null && \
    find . -type f -name "*.json" | xargs --no-run-if-empty -n1 sh -c 'jq . "$0" > "$0".formatted && mv "$0".formatted "$0"'
JSONRES=$?

# Yaml: yamlfix
echo "---"
echo "Formatting YAML"
yamlfix .
YAMLRES=$?

# SQL 
echo "---"
echo "Formatting SQL"
find . -type f -name "*.sql" |xargs --no-run-if-empty sed -Ei 's/[	]/    /g' && \
    find . -type f -name "*.sql" |xargs --no-run-if-empty sed -Ei 's/[	 ]+$//'
SQLRES=$?

# PHP: Pint
echo "---"
echo "Formatting PHP"
/root/.composer/vendor/bin/pint --preset=psr12 .
PHPRES=$?

# JS: js-beautify
echo "---"
echo "Formatting JS"
find . -type f -name "*.js" | xargs --no-run-if-empty sh -c 'js-beautify -jkrn "$0"'
JSRES=$?

# CSS: css-beautify
echo "---"
echo "Formatting CSS"
find . -type f -name "*.css" | xargs --no-run-if-empty sh -c 'css-beautify -nr "$0"'
CSSRES=$?

if [ $PYTHONRES -ne 0 ]; then
    exit $PYTHONRES
fi
if [ $JSONRES -ne 0 ]; then
    exit $JSONRES
fi
if [ $YAMLRES -ne 0 ]; then
    exit $YAMLRES
fi
if [ $SQLRES -ne 0 ]; then
    exit $SQLRES
fi
if [ $PHPRES -ne 0 ]; then
    exit $PHPRES
fi
if [ $JSRES -ne 0 ]; then
    exit $JSRES
fi
if [ $CSSRES -ne 0 ]; then
    exit $CSSRES
fi


