#! /usr/bin/env bats
@test "usage message" {
  result="$(src/usage.sh)"
  [ "$result" ]
}

@test "argument routing: --help" {
  result="$(DIR="." src/route_arguments.sh --help)"
  [ "$result" ]
}

@test "argument routing: --setup" {
  result="$(DIR="." src/route_arguments.sh --setup)"
  [ "$result" ]
}

@test "setup script produces correct backup.cfg" {
  #
}