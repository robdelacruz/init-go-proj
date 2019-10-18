SHAREDIR=/usr/local/share/init_go_proj
BINDIR=/usr/local/bin

all: init_go_proj

dep:
	# Put dependencies here. Ex:
	#go get -u github.com/mattn/go-sqlite3
	:

init_go_proj: main.go
	go build -o init_go_proj main.go

clean:
	rm -rf init_go_proj

install: fortune2
	mkdir -p $(SHAREDIR)
	cp init_go_proj $(BINDIR)

uninstall:
	rm -rf $(SHAREDIR)
	rm -rf $(BINDIR)/init_go_proj
