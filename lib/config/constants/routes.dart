class AppRoutes {
  static const String root = '/';
  static const String home = '/home';
  static const String aboutMe = '/about-me';
  static const String services = '/services';
  static const String projects = '/projects';
  static const String references = '/references';
  static const String contact = '/contact';
  static const String blog = '/blog';
  static const String notFound = '/not-found';

  static const String simpleMode = '/simple';
  static const String experienceMode = '/experience';

  static const String initial = root;

  static const List<String> routes = [
    home,
    aboutMe,
    services,
    projects,
    references,
    contact,
    blog,
    notFound,
  ];

  static const List<String> sections = [
    aboutMe,
    services,
    projects,
    references,
  ];
}
