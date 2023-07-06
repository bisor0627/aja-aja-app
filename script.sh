echo "Welcome to gongmap utilities:"
echo
echo "[1] build runner"
echo "[2] build runner --delete-conflicting-outputs"
echo "[3] Run dev flavor"
echo "[4] Run prod flavor"
echo "[5] dart run flutter_flavorizr"
echo "[6] dart run flutter_launcher_icons"
read -p "Run: " selection

case $selection in



    1)
    echo "build_runner"
    dart run build_runner build
    ;;

    2)
    echo "build_runner"
    dart run build_runner build --delete-conflicting-outputs
    ;;

    3)
    echo "Run dev flavor"
    flutter run --flavor dev --target lib/main_dev.dart
    ;;

    4)
    echo "Run prod flavor"
    flutter run --flavor prod --target lib/main_prod.dart
    ;;
    
    5)
    echo "dart run flutter_flavorizr"
    dart run flutter_flavorizr flavorizr.yaml -p google:firebase
    ;;

    6)
    echo "dart run flutter_launcher_icons"
    dart run flutter_launcher_icons flutter_launcher_icons.yaml
    ;;

    *)
    echo "Unknown command!!"
    ;;

esac
