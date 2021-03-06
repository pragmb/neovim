. "$CI_SCRIPTS/common.sh"

set_environment /opt/neovim-deps/64

sudo pip install cpp-coveralls

export CC=gcc
export SKIP_EXEC=1
$MAKE_CMD CMAKE_EXTRA_FLAGS="-DTRAVIS_CI_BUILD=ON -DUSE_GCOV=ON" unittest

coveralls --encoding iso-8859-1 || echo 'coveralls upload failed.'
