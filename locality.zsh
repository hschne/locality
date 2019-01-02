
# Get zsh plugin directory, see here: https://gist.github.com/elentok/5546958
script_directory=$(dirname ${BASH_SOURCE[0]-$0})
script_directory=$(cd $script_directory && pwd)

export PATH=${script_directory}:$PATH

function locality-load() {
  local filepath=$1

  if locality_output=$(locality "$filepath"); then 
    [[ ! -f $locality_output ]] && { [[ LOCALITY_VERBOSE -eq 1 ]] && echo "Locality could not load file '$locality_output'"; return 1; }

    source $locality_output
  else 
    echo "Locality: Locality exited with code $?. $locality_output"
    return 1
  fi
}
