# minimal/raw Makefile
# spell-checker:ignore (names) Tauri
default: build
build: install-requirements
	tools/uu mkdir -p bin
	cargo tauri build --bundles app
	tools/uu cp src-tauri/target/release/tauri-app* bin/

build-debug: install-requirements
	tools/uu mkdir -p bin
	cargo tauri build --bundles app --debug
	tools/uu cp src-tauri/target/release/tauri-app* bin/

install-requirements:
	@cargo tauri --version || cargo install tauri-cli
	@npm install --silent
