enum Flavor { dev, qa, prod }

class FlavorValues {
  const FlavorValues({
    required this.apiEndpoint,
  });

  final String apiEndpoint;
}

class FlavorConfig {
  final Flavor flavor;
  final String name;
  final FlavorValues values;
  static FlavorConfig? _instance;

  static Map<String, dynamic> _config = {};

  static void setFlavor(Flavor flavor) {
    switch (flavor) {
      case Flavor.dev:
        _config = _Config.devConstants;
        break;
      case Flavor.qa:
        _config = _Config.qaConstants;
        break;
      case Flavor.prod:
        _config = _Config.prodConstants;
        break;
    }

    FlavorConfig(
      flavor: flavor,
      values: FlavorValues(apiEndpoint: FlavorConfig.baseUrl),
    );
  }

  static void setupDevFlavor() {
    setFlavor(Flavor.dev);
  }

  static void setupQaFlavor() {
    setFlavor(Flavor.qa);
  }

  static void setupProdFlavor() {
    setFlavor(Flavor.prod);
  }

  factory FlavorConfig({
    required Flavor flavor,
    required FlavorValues values,
  }) {
    _instance ??= FlavorConfig._internal(
      flavor,
      flavor.name,
      values,
    );
    return _instance!;
  }

  FlavorConfig._internal(this.flavor, this.name, this.values);

  static FlavorConfig get instance {
    return _instance!;
  }

  static bool isProduction() => _instance!.flavor == Flavor.prod;

  static bool isDevelopment() => _instance!.flavor == Flavor.dev;

  static bool isQA() => _instance!.flavor == Flavor.qa;

  static String get baseUrl {
    return _config[_Config.baseUrl];
  }

  static String get apiBaseUrl {
    return _config[_Config.apiBaseUrl];
  }

  static get whereAmI {
    return _config[_Config.whereAmI];
  }
}

class _Config {
  static const baseUrl = "BASE_URL";
  static const apiBaseUrl = "API_BASE_URL";
  static const whereAmI = "WHERE_AM_I";

  static const _devBaseUrl = "https://apiv3.mmteacherplatform.net/";
  static const _stagingBaseUrl = "https://apiv3.mmteacherplatform.net/";
  static const _productionBaseUrl = "https://api.mmteacherplatform.net/";
  static const _apiBasePath = "api/v1";

  static Map<String, dynamic> devConstants = {
    baseUrl: _devBaseUrl,
    apiBaseUrl: _devBaseUrl + _apiBasePath,
    whereAmI: "dev",
  };

  static Map<String, dynamic> qaConstants = {
    baseUrl: _stagingBaseUrl,
    apiBaseUrl: _stagingBaseUrl + _apiBasePath,
    whereAmI: "qa",
  };

  static Map<String, dynamic> prodConstants = {
    baseUrl: _productionBaseUrl,
    apiBaseUrl: _productionBaseUrl + _apiBasePath,
    whereAmI: "prod",
  };
}
