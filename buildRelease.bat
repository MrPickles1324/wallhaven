@echo off
call flutter clean
call flutter pub get

call flutter build apk --release --split-per-abi
call flutter build windows --release