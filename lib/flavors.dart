enum Flavor {
  dev,
  prod,
}

class F {
  static Flavor? appFlavor;

  static String get name => appFlavor?.name ?? '';

  static String get title {
    switch (appFlavor) {
      case Flavor.dev:
        return 'ajaaja(dev)';
      case Flavor.prod:
        return 'ajaaja';
      default:
        return 'title';
    }
  }

  static String get endPoint {
    switch (appFlavor) {
      case Flavor.dev:
        return 'http://43.200.119.214/prod';
      case Flavor.prod:
        return 'http://43.200.119.214/prod';
      default:
        return 'http://43.200.119.214/prod';
    }
  }
}
