#!/bin/bash

# Fast fail the script on failures.
set -e

# Verify that the libraries are error free.
dartanalyzer --fatal-warnings \
  lib/md_proc.dart \
  test/library_test.dart \
  tool/build.dart

# Linter
pub run linter:linter `find lib test tool -type f \( -iname "*.dart" ! -iname "*.g.dart" \)`

# TODO Use .analysis_config when Dart 1.12 is released

# Run the tests.
pub run test:test -p "vm,phantomjs"

# If the COVERALLS_TOKEN token is set on travis
# Install dart_coveralls
# Rerun tests with coverage and send to coveralls
if [ "$COVERALLS_TOKEN" ]; then
  pub run dart_coveralls:dart_coveralls report \
    --token $COVERALLS_TOKEN \
    --retry 2 \
    --exclude-test-files \
    test/library_test.dart
fi
