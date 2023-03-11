#!/bin/sh
set -e

changelog=$(if [ "$1" = "" ]; then echo "CHANGELOG.md"; else echo "$1"; fi)

get_current_application_version() {
  ruby -r rubygems -e "require_relative 'app/truemail_server/version'; puts TruemailServer::VERSION"
}

latest_changelog_tag() {
  grep -Po "(?<=\#\# \[)[0-9]+\.[0-9]+\.[0-9]+?(?=\])" "$changelog" | head -n 1
}

current_application_version="$(get_current_application_version)"

if [ "$current_application_version" = "$(latest_changelog_tag)" ]
then
  echo "SUCCESS: Current application version ($current_application_version) has been found on the top of project changelog."
else
  echo "FAILURE: Following to \"Keep a Changelog\" convention current application version ($current_application_version) must be mentioned on the top of project changelog."
  exit 1
fi
