#!/bin/bash
# ex) ./script.sh prod
case $1 in
  "prod")
    flutter run --flavor prod -t lib/main_prod.dart
    ;;
  "dev")
    flutter run --flavor dev -t lib/main_dev.dart
    ;;
  "theme")
    flutter run --flavor theme -t lib/main_theme.dart
    ;;
  *)
    echo "Invalid flavor: $1"
    echo "Valid flavors are: prod, dev, theme"
    exit 1
    ;;
esac
