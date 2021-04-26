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
        'Nanómetros': 1e-9,
        'Micrómetros': 1e-6,
        'Milímetros': 1e-3,
        'Centímetros': 1e-2,
        'Decímetros': 1e-1,
        'Metros': 1,
        'Kilómetros': 1e+3,
        'Millas': 1609.34,
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
        'Hercios': 1,
        'Kilohercios': 1e+3,
        'Megahercios': 1e+6,
        'Gigahercios': 1e+9,
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

class Mass extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Miligramos': 1e-6,
        'Gramos': 1e-3,
        'Kilogramos': 1,
        'Toneladas': 1e+3,
      };
}
