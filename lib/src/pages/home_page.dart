import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'PTU Fórmulas',
          style: TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 25.0,
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80.0,
        backgroundColor: Colors.black12,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 30.0),
              _createMatTile(
                context,
                'Matemática',
                Colors.blue[300],
                'assets/img/matematica.png',
                route: 'math',
              ),
              _createMatTile(
                context,
                'Física',
                Colors.purple[300],
                'assets/img/fisica.png',
              ),
              _createMatTile(
                context,
                'Química',
                Colors.green[300],
                'assets/img/quimica.png',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createMatTile(
      BuildContext c, String title, Color color, String imageRoute,
      {String route}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
          ),
          backgroundColor: MaterialStateProperty.all(color),
        ),
        child: Row(
          children: [
            Image(
              height: 80.0,
              image: AssetImage(imageRoute),
              fit: BoxFit.cover,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 30.0),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                ),
              ),
            )
          ],
        ),
        onPressed: () {
          Navigator.pushNamed(c, route);
        },
      ),
    );
  }
}
