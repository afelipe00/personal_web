class PortfolioRouterConfiguration {
  final String path;
  final String? sectionName;
  final bool unknown;

  PortfolioRouterConfiguration.initial({this.path = '/'})
      : sectionName = null,
        unknown = false;

  PortfolioRouterConfiguration.home({required this.path, required this.sectionName}) : unknown = false;

  PortfolioRouterConfiguration.unknown()
      : path = '/not-found',
        unknown = true,
        sectionName = null;

  bool get isUnknown => unknown == true;

  bool get isSimply => sectionName == null;
}
