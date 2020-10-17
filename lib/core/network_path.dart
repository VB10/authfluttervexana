enum NetworkPath { USER, TOKEN }

extension NetworkPathValue on NetworkPath {
  String get rawValue {
    switch (this) {
      case NetworkPath.USER:
        return "/user";
      case NetworkPath.TOKEN:
        return "/token";

      default:
        throw "Not Found";
    }
  }
}
