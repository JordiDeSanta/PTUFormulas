class Unit {
  Map<String, double> mults = {};
  Unit();
}

class Normal extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Default': 1.0,
      };
}
