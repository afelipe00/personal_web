class Experience {
  final String title;
  final String body;
  final DateTime checkIn;
  final DateTime? checkOut;

  const Experience({
    required this.title,
    required this.body,
    required this.checkIn,
    this.checkOut,
  });

  bool get isCurrent => checkOut == null;
}
