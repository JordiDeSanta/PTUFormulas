import 'dart:math';

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
        'Unidad Astronómica': 1.5e+11,
      };
}

class VelocityU extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'km / h': (5 / 18),
        'mi / h': (1 / 2.237),
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
        'Masa Terrestre': 5.972e+24,
      };
}

class Force extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Newtons': 1,
      };
}

class Density extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'g / L o Kg / m\u00B3': 1.0,
        'g / ml': 1e+3,
      };
}

class Angle extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Grado Centesimal': pi / 200,
        'Grado Sexagesimal': pi / 180,
        'Radianes': 1,
        'Revolución': 2 * pi,
      };
}

class AngleVelocity extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        '° / s': pi / 180,
        'RPM': pi / 30,
        'rad / s': 1,
      };
}

class Area extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Centímetros\u00B2': 1e-4,
        'Metros\u00B2': 1,
        'Hectárea': 1e+3,
        'Kilómetros\u00B2': 1e+6,
      };
}

class Pressure extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Pascales': 1,
        'Asmósferas': 101325,
      };
}

class Volumen extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Mililitros': 1e-6,
        'Litros': 1e-3,
        'Metros\u00B3': 1,
      };
}

class Energy extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Joule': 1,
        'Cal * g': 4.184,
        'Kilocaloría': 4184,
        'W * h': 3600,
        'kW * h': 3.6e+6,
      };
}

class Temperature extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Fahrenheit': 3,
        'Grados Celsius': 2,
        'Kelvins': 1,
      };
}

class Resistence extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Ohms': 1,
      };
}

class EPotential extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Volts': 1,
      };
}

class EIntensity extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Amperes': 1,
      };
}

class Power extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Watts': 1,
        'Kilowatts': 1e+3,
        'Megawatts': 1e+6,
      };
}

class Charge extends Unit {
  @override
  Map<String, double> get mults => <String, double>{
        'Picocoulombs': 1e-12,
        'Nanocoulombs': 1e-9,
        'Microcoulombs': 1e-6,
        'Milicoulombs': 1e-3,
        'Coulombs': 1,
      };
}
