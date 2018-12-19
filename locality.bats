#!/usr/bin/env bats
source ./locality

@test "When run with file and parameter modifies file path" {
  run locality /path/myfile.txt loc1
  [ "$status" -eq 0 ]
  [ "$output" = "/path/loc1.myfile.txt" ]
} 

@test "Modify file name replaces file" {
  run modify_file_name /path/myfile.txt loc1
  [ "$status" -eq 0 ]
  [ "$output" = "/path/loc1.myfile.txt" ]
} 

@test "Modify hidden file path returns hidden file path" {
  run locality "/path/.myfile.txt" "loc1"
  [ "$status" -eq 0 ]
  [ "$output" = "/path/.loc1.myfile.txt" ]
} 

@test "Modify simple file replaces single file" {
  run locality "myfile" "loc1"
  [ "$status" -eq 0 ]
  [ "$output" = "loc1.myfile" ]
} 
