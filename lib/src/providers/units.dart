class Unit {
  Map<String, double> mults = {};
  Unit();
}

class Time extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Nanosegundos ': 1e-9,
        'Microsegundos': 1e-6,
        'Milisegundos': 1e-3,
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

class Length extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Nanómetro': 1e-9,
        'Micrómetro': 1e-6,
        'Milímetro': 1e-3,
        'Centímetro': 1e-2,
        'Decímetro': 1e-1,
        'Metro': 1,
        'Kilómetro': 1e+3,
        'Milla': 1609.34,
      };
}

class VelocityU extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'km / h': 1 / 3.6,
        'mi / h': 1 / 2.237,
        'm / s': 1,
      };
}

class Frecuency extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Hercio': 1,
        'Kilohercio': 1e+3,
        'Megahercio': 1e+6,
        'Gigahercio': 1e+9,
      };
}

class Aceleration extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'km / h\u00B2': 1 / 12960,
        'mi / h\u00B2': 1 / 8053,
        'm / s\u00B2': 1,
      };
}
