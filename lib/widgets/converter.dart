import 'package:flutter/material.dart';
import 'package:demo_app/constant.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _binary = '';
  String _decimal = '';

  String texto(String palabra) => palabra == '' ? 'Delete' : palabra;// ACTIALIZADO

  void saberNumero(String numero) {// POR MEJORAR ESTE CONDICIONAL
    if (numero != '') {
      _binary = _binary + numero;
      _decimal = int.parse(_binary, radix: 2).toRadixString(10);
    } else {
      _binary = '';
      _decimal = '';
    }
  }

  Container containers(String num) {//Contenedores de los numeros a mostrar (DECIMALES O BINARIO)
    return Container(
      padding: const EdgeInsets.all(8.0),
      alignment: Alignment.centerRight,
      child: Text(
        num,
        textAlign: TextAlign.right,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color(
              int.parse(
                "#FF5722".replaceAll('#', '0xff'),
              ),
            ),
            fontSize: 35),
      ),
    );
  }

  Expanded boton(String numero) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          color: Color(int.parse("#0069C0".replaceAll('#', '0xff'))),
          onPressed: () {
            setState(() {
              saberNumero(numero);
            });
          },
          child: Text(texto(numero), style: kStyleNumber),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              height: 40.0,
              alignment: Alignment.centerLeft,
              child: Center(
                child: Text("Binary -> Decimal"),
              ),
            ),
            containers(_binary),//Muestra el numero binario
            containers(_decimal),//Muestra el numero decimal
            kSizeBox,
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  boton('1'),//Presiona boton 1
                  boton('0'),//Presiona boton 0
                ],
              ),
            ),
            boton(''),//Presiona boton delete
          ]),
    );
  }
}
