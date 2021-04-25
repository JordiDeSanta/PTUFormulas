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
        'Nanosegundos': 1 / 1e+9,
        'Microsegundos': 1 / 1e+6,
        'Milisegundos': 1 / 1000,
        'Segundos': 1,
        'Minutos': 60,
        'Horas': 3600,
        'Días': 86400,
        'Semanas': 604800,
        'Meses': 2.628e+6,
        'Años': 3.154e+7,
        'Décadas': 3.154e+8,
        'Siglos': 3.154e+9,
      };
}
