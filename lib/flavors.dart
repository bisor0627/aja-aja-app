enum Flavor {
  prod,
  dev,
  theme,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.prod:
        return 'AjaAja';
      case Flavor.dev:
        return 'AjaAja(DEV)';
      case Flavor.theme:
        return 'AjaAja(Theme)';
      default:
        return 'title';
    }
  }

}
