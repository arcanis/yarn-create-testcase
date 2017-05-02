#!/usr/bin/env

# This file has been automatically generated, but feel free to edit it as you please!
# When you're done, send it on Github as an attachment to your issue, and voila!

# A few variables and functions are automatically made available:
#
# - $TEMP: A temporary folder - you can do whatever you want inside
# - make_pkg: Create a package.json file inside $TEMP/<package-name>
# - add_pkg_dep: Add a dependency inside a package created via make_pkg

# Create a new dummy package
make_pkg main 1.0.0

# Create a few extra dummy packages that we will use as dependencies
make_pkg foo 1.0.0
make_pkg bar 1.0.0

# Add these packages as dependencies to our main package
add_pkg_dep main file://"$TEMP"/foo
add_pkg_dep main file://"$TEMP"/bar

# Try to install everything
cd "$TEMP"/main
yarn install

# Check that both directories exist
test -f "$TEMP"/main/node_modules/foo/package.json
test -f "$TEMP"/main/node_modules/bar/package.json
