import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Pagina2 extends StatefulWidget {
  final String Datos2;
  const Pagina2({super.key, required this.Datos2});

  @override
  State<StatefulWidget> createState() {
    return clase2();
  }
}

class clase2 extends State<Pagina2> {
  final _llave = GlobalKey<FormState>();
  final n1 = TextEditingController();
  final n2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("${widget.Datos2}")),
      body: Center(
        child: Padding(
          padding: EdgeInsetsGeometry.all(15.0),
          child: Card(
            elevation: 18,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(5),
            ),
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(width: double.infinity),
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: n1,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Escribe un numero',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(width: double.infinity),
                    SizedBox(
                      width: double.infinity,
                      child: TextField(
                        controller: n2,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                        ],
                        decoration: InputDecoration(
                          labelText: 'Escribe otro numero',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Aceptar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
