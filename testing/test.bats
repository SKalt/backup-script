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
  result="$(DIR="./testing/fixtures/without_cfg" src/route_arguments.sh --setup )"
  [ "$result" == "setup called" ]
}

@test "check_config loads backup.cfg" {
  result="$(DIR="./testing/fixtures"; source src/check_config.sh; echo $bdrive )"
  [ "$result" ]
  [ "$result" == ./testing/output/test-drive ]
}


# this could be improved... just checks that  src/check_config fails if setup
# doesn't create a cfg file
@test "check_config calls setup if backup.cfg not found " {
  result="$(DIR="./testing/fixtures/without_cfg"; source src/check_config.sh)" || result="true"
  [ "$result" == "true" ]
}
