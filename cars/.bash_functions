# Pull down and log changes, optionally specifying the branch
function pull {
  local branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"
  if [ -d ./.git ]; then
    echo "git pull origin $branch"
    git pull origin "$branch"
    if [ "$(git rev-list --count ORIG_HEAD..HEAD)" -gt 0 ]; then
      echo "git log ORIG_HEAD..HEAD"
      git log ORIG_HEAD..HEAD --oneline
    fi
  else
    echo "Not a git directory"
  fi
}
# Push up changes, optionally specifying the branch or `f` for force pushing
function push {
  local branch="${1:-$(git rev-parse --abbrev-ref HEAD)}"
  if [[ -d ./.git ]]; then
    if [[ "$1" == "f" ]]; then
        branch=$(git rev-parse --abbrev-ref HEAD)
        echo "git push origin ${branch}:${branch} --force-with-lease"
        git push origin "${branch}:${branch}" --force-with-lease
    else
      echo "git push origin ${branch}:${branch}"
      git push origin "${branch}:${branch}"
    fi
  else
    echo "Not a git directory"
  fi
}

# Usage:
# - with args, `judge mix test`; runs `yay` or `boom`
#   depending on exit status of given command
# - without args, `mix test; judge`; runs `yay` or `boom`
#   depending on exit status of previous command
function judge() {
  last_exit_status=$?
  number_of_args=$#
  if [ $number_of_args -gt 0 ]
  then
    # - treat the args as a command to run
    # - $@ is all the args given
    # - `"$@"` makes sure that quoting is preserved;
    #     eg, if the command was `judge echo one "two three"`,
    #     `echo` will get two args, not three
    # - Once the expansion is done, the shell sees a bare
    #   command and runs it.
    "$@" && yay || boom
  else
    # No args given means no command to run, so check the exit
    # status of the last command and notify accordingly
    [ $last_exit_status -eq 0 ] && yay || boom
  fi
}

function yay() {
  say -v Veena "Command completed!"
}

function boom() {
  say -v Fred "Command failed!"
}

flaker () {
if [ "$#" -ne 2 ]
then
  NEWLINE=$'\n'
  echo "$(tput setaf 4)$(tput setab 2)\
  Usage: Two arguments must be supplied.\
  ${NEWLINE}The first argument is an integer indicating the number of test runs.\
  ${NEWLINE}The second argument is the path to the test file.\
  ${NEWLINE}Example: $ flaker 10 test/engine/dealers/dealer_test.exs
  $(tput sgr0)"
  (exit 33) && true
fi
for (( i=1; i<$1; i++ ));
do
    echo "$(tput setaf 4)$(tput setab 2)test run number: $i$(tput sgr0)";
    mix test $2 || break;
done
}
