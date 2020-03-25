import 'package:flutter/material.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _binary = '';
  String _decimal =
      ''; // _decimal = int.parse(_binary, radix: 2).toRadixString(10);

  String texto(String palabra) {
    if (palabra == '') {
      return 'Delete';
    } else {
      return palabra;
    }
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
              if (numero != '') {
                _binary = _binary + numero;
                _decimal = int.parse(_binary, radix: 2).toRadixString(10);
              } else {
                _binary = '';
                _decimal = '';
              }
            });
          },
          child: Text(
            texto(numero),
            style: new TextStyle(
              fontSize: 30.0,
              color: Colors.white,
            ),
          ),
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
                child: Center(child: Text("Binary -> Decimal"))),
            Container(
              padding: const EdgeInsets.all(8.0),
              alignment: Alignment.centerRight,
              child: Text(
                '$_binary',
                textAlign: TextAlign.right,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color(int.parse("#FF5722".replaceAll('#', '0xff'))),
                    fontSize: 35),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(children: <Widget>[
              Text(_binary),
              SizedBox(
                child: Padding(padding: EdgeInsets.all(8),child: Text('=>'),),
              ),
              Text(_decimal),
            ]),
            SizedBox(
              height: 20.0,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  boton('1'),
                  boton('0'),
                ],
              ),
            ),
            boton(''),
          ]),
    );
  }
}
