import 'package:flutter/material.dart';
import 'package:flutter_application_15/widget/pagina2.dart';

class pagina1 extends StatefulWidget {
  const pagina1({super.key});

  @override
  State<StatefulWidget> createState() {
    return Clase();
  }
}

class Clase extends State<pagina1> {
  final _llave = GlobalKey<FormState>();
  final numero = TextEditingController();
  final sexo = TextEditingController();
  final nombre = TextEditingController();
  void validar() {
    String n = numero.text;
    String s = sexo.text;
    String no = nombre.text;
    String datos = numero.text + " _ " + sexo.text + " _ " + nombre.text;
    if (_llave.currentState?.validate() ?? false) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Pagina2(Datos2: datos)),
      );
      if (n.isEmpty && s.isEmpty && no.isEmpty) {
        print(datos);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Error datos mal')));
      }
    }
  }

  String? _vNumero(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe un numero';
    }
    final exp = RegExp(r'^[0-9]+$'); // Solo números
    if (!exp.hasMatch(value)) {
      return 'Solo se permiten números';
    }
    if (value.length < 5 || value.length > 10) {
      return 'Solo se pueden 10 dígitos';
    }
    return null;
  }

  String? _vSexo(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe un sexo';
    }

    final exp = RegExp(r'^[M,m,F,f]$'); // Solo permite M o F (una sola letra)
    if (!exp.hasMatch(value)) {
      return 'Solo se permite una letra: M y m o F y f';
    }

    return null;
  }

  String? _vNombre(String? value) {
    if (value == null || value.isEmpty) {
      return 'Escribe el nombre';
    }
    String letra = value[0];
    if (letra == value[0].toUpperCase()) {
      final nom = RegExp(r'^[A-Z]+$');
      String letras = value.substring(1, value.length);
      print(letras);
      if (!nom.hasMatch(letras)) {
        return 'Error solo mayusculas';
      }
    } else {
      return 'solo son mayusculas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Examen p2 segunda parte'),
        backgroundColor: Colors.amber,
      ),
      body: Form(
        key: _llave,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 237, 240, 245),
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    TextFormField(
                      controller: numero,
                      decoration: const InputDecoration(
                        labelText: 'Escribe un numero',
                        border: OutlineInputBorder(),
                      ),
                      validator: _vNumero,
                    ),
                    TextFormField(
                      controller: sexo,
                      decoration: const InputDecoration(
                        labelText: 'Escribe un sexo',
                        border: OutlineInputBorder(),
                      ),
                      validator: _vSexo,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 237, 240, 245),
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    TextField(),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Concatenar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                color: const Color.fromARGB(255, 237, 240, 245),
                padding: EdgeInsets.all(25),
                child: Column(
                  children: [
                    TextFormField(
                      controller: nombre,
                      decoration: const InputDecoration(
                        labelText: 'Escribe un Nombre',
                        border: OutlineInputBorder(),
                      ),
                      validator: _vNombre,
                    ),
                    SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: validar,
                        child: Text('Aceptar'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
