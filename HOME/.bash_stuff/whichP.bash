#!/usr/bin/env bash
whichP() {
  printf '#   declare -f | which --read-functions %s\n'  "$@"
  declare -f | /usr/bin/which --read-functions $@
}
export -f whichP
