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

class Time extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Segundos': 1.0,
        'Minutos': 60.0,
        'Horas': 3600.0,
      };
}
