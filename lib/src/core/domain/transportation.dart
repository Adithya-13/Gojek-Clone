class Transportation {
  final String title;
  final double etaStart;
  final double etaEnd;
  final double pricePerMeters;
  final double totalPerson;

  Transportation({
    required this.title,
    required this.etaStart,
    required this.etaEnd,
    required this.pricePerMeters,
    required this.totalPerson,
  });

  double price(double distance) => pricePerMeters * distance;
}
