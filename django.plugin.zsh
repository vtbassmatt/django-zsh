# determine whether to use uv or not
if (( ${+commands[uv]} )); then
  django() {
    local manage
    if manage=$(_dj_findmanage); then
      uv run python "$manage" "$@"
    else
      printf "%s\n" "couldn't find manage.py; are you sure this is a Django project?"
    fi
  }
elif (( ${+commands[python3]} )); then
  django() {
    local manage
    if manage=$(_dj_findmanage); then
      python3 "$manage" "$@"
    else
      printf "%s\n" "couldn't find manage.py; are you sure this is a Django project?"
    fi
  }
else
  django() {
    local manage
    if manage=$(_dj_findmanage); then
      python "$manage" "$@"
    else
      printf "%s\n" "couldn't find manage.py; are you sure this is a Django project?"
    fi
  }
fi

_dj_findmanage() {
  local test_path="${PWD}"

  while [[ $test_path != "/" ]]; do
    if [[ -f "${test_path}/manage.py" ]]; then
      printf "%s" "${test_path}/manage.py"
      return 0
    fi
    test_path="${test_path:a:h}"
  done

  # one last look at the root
  if [[ -f "${test_path}/manage.py" ]]; then
    printf "%s" "${test_path}/manage.py"
    return 0
  fi

  return 1
}