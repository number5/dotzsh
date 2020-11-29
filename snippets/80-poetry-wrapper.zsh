# This helps run a globally installed poetry with specific versions of python.
# When run from inside a poetry project the correct version is automatically 
# picked up from pyproject.toml.

# Outside of a project (e.g. `poetry new`) a specific version can be chosen by
# setting a `PYTHON` env variable.
# e.g.:
#
#     PYTHON=3.7 poetry new someproject

poetry() {
    if [[ -f pyproject.toml ]]; then
        PYVER=$(grep -E '^python =' pyproject.toml | sed -E 's/^python = "\^([0-9].[0-9])"/\1/')
        python${PYVER} $(whence -p poetry) "$@"
    else
        if [[ -v PYTHON ]]; then
            python${PYTHON} $(whence -p poetry) "$@"
        else
            $(whence -p poetry) "$@"
        fi
    fi
}