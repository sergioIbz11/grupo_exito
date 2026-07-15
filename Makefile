.PHONY: init pub-get gen generate-watch clean-gen icons splash

init: pub-get gen icons splash

pub-get:
	flutter pub get

gen:
	dart run build_runner build --delete-conflicting-outputs

generate-watch:
	dart run build_runner watch --delete-conflicting-outputs

clean-gen:
	dart run build_runner clean

icons:
	dart run flutter_launcher_icons

splash:
	dart run flutter_native_splash:create
