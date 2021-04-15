import 'package:flutter/material.dart';
import 'package:ptuformulas/src/providers/_provider.dart';
import 'package:ptuformulas/src/themes/text_theme.dart';
import 'package:ptuformulas/src/widgets/course_tile_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key key}) : super(key: key);

  final styles = TextStyles();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('PTU Fórmulas', style: styles.title),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: Container(
        child: Column(
          children: [
            SizedBox(height: 10.0),
            _createMath(),
            _createPhysics(),
            _createQuimics(),
          ],
        ),
      ),
    );
  }

  Widget _createMath() {
    return CourseTileWidget(
      CourseArguments(
          color: Colors.blue[300],
          img: AssetImage('assets/img/matematica.png'),
          route: 'math',
          title: 'Matemática',
          contents: [
            ContentArguments(
              color: Colors.blue[200],
              img: AssetImage('assets/img/numbers.png'),
              route: 'number',
              title: 'Números',
              formulas: FormulaArguments(
                cardColor: Colors.blue[100],
                formulas: {
                  'Números': [AssetImage('assets/img/formulas/PyT.PNG'), null],
                },
              ),
            ),
          ]),
    );
  }

  Widget _createPhysics() {
    return CourseTileWidget(
      CourseArguments(
        color: Colors.purple[300],
        img: AssetImage('assets/img/fisica.png'),
        route: 'physics',
        title: 'Física',
        contents: [
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/ondas.png'),
            route: 'waves',
            title: 'Ondas',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Periódo y Frecuencia': [
                  AssetImage('assets/img/formulas/PyT.PNG'),
                  AssetImage('assets/img/params/PyT.PNG'),
                ],
                'Longitud de Onda': [
                  AssetImage('assets/img/formulas/LdeOnda.PNG'),
                  AssetImage('assets/img/params/LdeOnda.PNG'),
                ],
                'Velocidad de Propagación': [
                  AssetImage('assets/img/formulas/VeldeProp.PNG'),
                  AssetImage('assets/img/params/VeldeProp.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/mru.png'),
            route: 'mechanics',
            title: 'MRU',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Desplazamiento': [
                  AssetImage('assets/img/formulas/Desplazamiento.PNG'),
                  AssetImage('assets/img/params/Desplazamiento.PNG'),
                ],
                'Rapidez': [
                  AssetImage('assets/img/formulas/RapidezMRU.PNG'),
                  AssetImage('assets/img/params/VeldeProp.PNG'),
                ],
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRU.PNG'),
                  AssetImage('assets/img/params/VelocidadMRU.PNG'),
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMRU.PNG'),
                  AssetImage('assets/img/params/PosicionMRU.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/mruvh.png'),
            route: 'mechanics',
            title: 'MRUV',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Aceleración': [
                  AssetImage('assets/img/formulas/AceleracionMRUV.PNG'),
                  AssetImage('assets/img/params/AceleracionMRUV.PNG'),
                ],
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRUV.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUV.PNG'),
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMRUV.PNG'),
                  AssetImage('assets/img/params/PosicionMRUV.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/mruvv.png'),
            route: 'mechanics',
            title: 'Caida Libre',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadMRUVV.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUVV.PNG'),
                ],
                'Altura': [
                  AssetImage('assets/img/formulas/AlturaMRUVV.PNG'),
                  AssetImage('assets/img/params/AlturaMRUVV.PNG'),
                ],
                'Tiempo': [
                  AssetImage('assets/img/formulas/TiempoMRUVV.PNG'),
                  AssetImage('assets/img/params/TiempoMRUVV.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/vert.png'),
            route: 'mechanics',
            title: 'Tiro Vertical',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Velocidad': [
                  AssetImage('assets/img/formulas/VelocidadUP.PNG'),
                  AssetImage('assets/img/params/VelocidadMRUVV.PNG'),
                ],
                'Altura': [
                  AssetImage('assets/img/formulas/AlturaUP.PNG'),
                  AssetImage('assets/img/params/AlturaMRUVV.PNG'),
                ],
                'Velocidad Inicial': [
                  AssetImage('assets/img/formulas/Velocidad0UP.PNG'),
                  AssetImage('assets/img/params/Velocidad0UP.PNG'),
                ],
                'Altura Máxima': [
                  AssetImage('assets/img/formulas/AlturaMAX.PNG'),
                  AssetImage('assets/img/params/AlturaMAX.PNG'),
                ],
                'Tiempo': [
                  AssetImage('assets/img/formulas/TiempoUP.PNG'),
                  AssetImage('assets/img/params/TiempoUP.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/fuerzas.png'),
            route: 'mechanics',
            title: 'Fuerzas',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Fuerza': [
                  AssetImage('assets/img/formulas/Fuerza.PNG'),
                  AssetImage('assets/img/params/Fuerza.PNG'),
                ],
                'Peso y Normal': [
                  AssetImage('assets/img/formulas/PesoNormal.PNG'),
                  AssetImage('assets/img/params/PesoNormal.PNG'),
                ],
                'Fricción': [
                  AssetImage('assets/img/formulas/Friccion.PNG'),
                  AssetImage('assets/img/params/Friccion.PNG'),
                ],
                'Fuerza Elástica': [
                  AssetImage('assets/img/formulas/Elastica.PNG'),
                  AssetImage('assets/img/params/Elastica.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/planeta.png'),
            route: 'mechanics',
            title: 'Cosmos',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Gravitación Universal': [
                  AssetImage('assets/img/formulas/Gravitacion.PNG'),
                  AssetImage('assets/img/params/Gravitacion.PNG'),
                ],
                'Leyes de Kepler': [
                  AssetImage('assets/img/formulas/Kepler.PNG'),
                  AssetImage('assets/img/params/Kepler.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/mcu.png'),
            route: 'mechanics',
            title: 'MCU',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Periódo y Frecuencia': [
                  AssetImage('assets/img/formulas/PyT.PNG'),
                  AssetImage('assets/img/params/PyT1.PNG'),
                ],
                'Velocidad Angular': [
                  AssetImage('assets/img/formulas/VelocidadAMCU.PNG'),
                  AssetImage('assets/img/params/VelocidadAMCU.PNG'),
                ],
                'Velocidad Tangencial': [
                  AssetImage('assets/img/formulas/VelocidadTMCU.PNG'),
                  AssetImage('assets/img/params/VelocidadTMCU.PNG'),
                ],
                'Aceleración Centrípeta': [
                  AssetImage('assets/img/formulas/AceleracionMCU.PNG'),
                  AssetImage('assets/img/params/AceleracionMCU.PNG'),
                ],
                'Fuerza Centrípeta': [
                  AssetImage('assets/img/formulas/FuerzaMCU.PNG'),
                  AssetImage('assets/img/params/FuerzaMCU.PNG'),
                ],
                'Posición': [
                  AssetImage('assets/img/formulas/PosicionMCU.PNG'),
                  AssetImage('assets/img/params/PosicionMCU.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/dinrot1.png'),
            route: 'mechanics',
            title: 'Rotacional',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Torque': [
                  AssetImage('assets/img/formulas/Torque.PNG'),
                  AssetImage('assets/img/params/Torque.PNG'),
                ],
                'Equilibrio Rotacional': [
                  AssetImage('assets/img/formulas/EqRot.PNG'),
                  AssetImage('assets/img/params/EqRot.PNG'),
                ],
                'Momento Angular': [
                  AssetImage('assets/img/formulas/MomentoAngular.PNG'),
                  AssetImage('assets/img/params/MomentoAngular.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/presion.png'),
            route: 'mechanics',
            title: 'Presión',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Presión': [
                  AssetImage('assets/img/formulas/Presion.PNG'),
                  AssetImage('assets/img/params/Presion.PNG'),
                ],
                'Presión Hidrostática': [
                  AssetImage('assets/img/formulas/Hidrostatica.PNG'),
                  AssetImage('assets/img/params/Hidrostatica.PNG'),
                ],
                'Presión Absoluta': [
                  AssetImage('assets/img/formulas/PresionAbs.PNG'),
                  AssetImage('assets/img/params/PresionAbs.PNG'),
                ],
                'Pascal': [
                  AssetImage('assets/img/formulas/Pascal.PNG'),
                  AssetImage('assets/img/params/Pascal.PNG'),
                ],
                'Arquímedes': [
                  AssetImage('assets/img/formulas/Arquimedes.PNG'),
                  AssetImage('assets/img/params/Arquimedes.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/dinrot.png'),
            route: 'energy',
            title: 'Energías',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Energía Cinética': [
                  AssetImage('assets/img/formulas/Cinetica.PNG'),
                  AssetImage('assets/img/params/cinetica.PNG'),
                ],
                'Energía Potencial': [
                  AssetImage('assets/img/formulas/Potencial.PNG'),
                  AssetImage('assets/img/params/Potencial.PNG'),
                ],
                'Energía Mecánica': [
                  AssetImage('assets/img/formulas/Mecanica.PNG'),
                  AssetImage('assets/img/params/Mecanica.PNG'),
                ],
                'Conservación de Energía': [
                  AssetImage('assets/img/formulas/ConservacionEnergia.PNG'),
                  AssetImage('assets/img/params/ConservacionEnergia.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/trabajo.png'),
            route: 'energy',
            title: 'Trabajo',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Fuerza Disipativa': [
                  AssetImage('assets/img/formulas/Disipativa.PNG'),
                  AssetImage('assets/img/params/Disipativa.PNG'),
                ],
                'Trabajo y Potencia': [
                  AssetImage('assets/img/formulas/TyP.PNG'),
                  AssetImage('assets/img/params/TyP.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/termo.png'),
            route: 'energy',
            title: 'Termodinámica',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Cantidad de Calor': [
                  AssetImage('assets/img/formulas/CantidadCalor.PNG'),
                  AssetImage('assets/img/params/CantidadCalor.PNG'),
                ],
                'Capacidad Térmica': [
                  AssetImage('assets/img/formulas/CapacidadTermica.PNG'),
                  AssetImage('assets/img/params/CapacidadTermica.PNG'),
                ],
                'Calor Específico': [
                  AssetImage('assets/img/formulas/CalorEspecifico.PNG'),
                  AssetImage('assets/img/params/CalorEspecifico.PNG'),
                ],
                'Dilatación Térmica': [
                  AssetImage('assets/img/formulas/Dilatacion.PNG'),
                  AssetImage('assets/img/params/Dilatacion.PNG'),
                ],
                'Equilibrio Térmico': [
                  AssetImage('assets/img/formulas/EqTer.PNG'),
                  AssetImage('assets/img/params/EqTer.PNG'),
                ],
                'Calor Latente': [
                  AssetImage('assets/img/formulas/Latente.PNG'),
                  AssetImage('assets/img/params/Latente.PNG'),
                ],
              },
            ),
          ),
          ContentArguments(
            color: Colors.purple[200],
            img: AssetImage('assets/img/electric.png'),
            route: 'eandm',
            title: 'Electricidad y Magnetismo',
            formulas: FormulaArguments(
              cardColor: Colors.purple[100],
              formulas: {
                'Ley de Coulomb': [
                  AssetImage('assets/img/formulas/Coulomb.PNG'),
                  AssetImage('assets/img/params/Coulomb.PNG'),
                ],
                'Campo Eléctrico': [
                  AssetImage('assets/img/formulas/CampoElectrico.PNG'),
                  AssetImage('assets/img/params/CampoElectrico.PNG'),
                ],
                'Ley de Ohm': [
                  AssetImage('assets/img/formulas/Ohm.PNG'),
                  AssetImage('assets/img/params/Ohm.PNG'),
                ],
                'Circuitos en Serie': [
                  AssetImage('assets/img/formulas/EnSerie.PNG'),
                  AssetImage('assets/img/params/EnSerie.PNG'),
                ],
                'Circuitos en Paralelo': [
                  AssetImage('assets/img/formulas/EnParalelo.PNG'),
                  AssetImage('assets/img/params/EnSerie.PNG'),
                ],
                'Ley de Watt': [
                  AssetImage('assets/img/formulas/Watt.PNG'),
                  AssetImage('assets/img/params/Watt.PNG'),
                ],
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _createQuimics() {
    return CourseTileWidget(
      CourseArguments(
          color: Colors.green[300],
          img: AssetImage('assets/img/quimica.png'),
          route: 'quimics',
          title: 'Química',
          contents: [
            ContentArguments(
              color: Colors.green[200],
              img: AssetImage('assets/img/quimica.png'),
              route: 'test',
              title: 'A CTM',
              formulas: FormulaArguments(
                cardColor: Colors.green[100],
                formulas: {
                  'Periódo y Frecuencia': [
                    AssetImage('assets/img/formulas/PyT.PNG'),
                    AssetImage('assets/img/params/PyT.PNG'),
                  ],
                },
              ),
            ),
          ]),
    );
  }
}
