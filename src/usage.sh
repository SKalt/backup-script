#! /usr/bin/env bash
# prints usage, then exits.

program_name=$0
function usage {
cat <<help_message
Usage: $program_name [[-s|--setup][-h|--help][-l|--logging]]

a backup script

Options:
  -s|--setup      generate a config file and exit.
  -h|--help       Show this message and exit.
  -l|--logging    enable logging to stdout.
help_message
}
usage
exit