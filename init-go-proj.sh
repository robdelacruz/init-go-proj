#!/bin/sh

projname=$1

print_usage() {
    echo 'Usage:
    init_go_proj.sh PROJECT_NAME

    PROJECT_NAME : Name of project directory to be created

    This will create a new project directory with the following
    supporting files:
    - README
    - LICENSE
    - Makefile
    - .gitignore

Example:
    init_go_proj.sh web_curator
'
}

if [ "$projname" = "" ]; then
    print_usage
    exit 1
fi

if [ -d "$projname" ]; then
    echo "Directory '$projname' already exists."
    exit 1
fi

mkdir "$projname" && cd "$projname"

cat << EOF > .gitignore
*.swp
*.db
EOF

cat << EOF > LICENSE
MIT License

Copyright (c) $(date +%Y) $(whoami)

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
EOF

cat << EOF > README
$projname - (summary description here)

Includes:
- (output files here)

Use for:
- (functionality here)

Dependencies:
- (dependencies here)

License:
  MIT

Manual:

Build and Install
-----------------
  $ make
  $ sudo make install

  To uninstall:
  $ sudo make uninstall

(manual here)


Contact:
  (contact info here)
  Source: (link to source code - github, etc.)

EOF

cat << EOF > Makefile
SHAREDIR=/usr/local/share/$projname
BINDIR=/usr/local/bin

all: $projname

dep:
	# Put dependencies here. Ex:
	#go get -u github.com/mattn/go-sqlite3
	:

$projname: main.go
	go build -o $projname main.go

clean:
	rm -rf $projname

install: $projname
	mkdir -p \$(SHAREDIR)
	cp $projname \$(BINDIR)

uninstall:
	rm -rf \$(SHAREDIR)
	rm -rf \$(BINDIR)/$projname
EOF

echo "Created '$projname'."

