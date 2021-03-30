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
              _createMatTile('Matemática', Colors.blue[300]),
              _createMatTile('Física', Colors.purple[300]),
              _createMatTile('Química', Colors.green[300]),
            ],
          ),
        ),
      ),
    );
  }

  Widget _createMatTile(String title, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
      child: ElevatedButton(
        onPressed: () {},
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
            //Icon(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 40.0),
              child: Text(
                'Física',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w100,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
