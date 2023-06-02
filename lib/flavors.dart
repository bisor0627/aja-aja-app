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
        return 'Release App';
      case Flavor.dev:
        return 'Develop App';
      case Flavor.theme:
        return 'Theme Test App';
      default:
        return 'title';
    }
  }

}
