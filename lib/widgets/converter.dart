import 'package:flutter/material.dart';
import 'package:demo_app/constant.dart';

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  String _binary = '';
  String _decimal = '';
  int binaryDec = 0;
  String calculatorText="Binary -> Decimal";

  String texto(String palabra) =>
      palabra == '' ? 'Delete' : palabra; // ACTIALIZADO

  void saberNumero(String numero) {
    // POR MEJORAR ESTE CONDICIONAL
    if (binaryDec == 0) {
      calculatorText="Binary -> Decimal";
      if (numero != '') {
        _binary = _binary + numero;
        _decimal = int.parse(_binary, radix: 2).toRadixString(10);
      } else {
        _binary = '';
        _decimal = '';
      }
    } else if (binaryDec == 1) {
      calculatorText="Decimal -> Binary";
      if (numero != '') {
        _decimal = _decimal + numero;
        _binary = int.parse(_decimal, radix: 10).toRadixString(2);
      } else {
        _binary = '';
        _decimal = '';
      }
    }
  }

  Container containers(String num) {
    //Contenedores de los numeros a mostrar (DECIMALES O BINARIO)
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

  Expanded botonesDB(int binarioDecimal) {
    if (binarioDecimal == 0) {
      return Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            boton('1'), //Presiona boton 1
            boton('0'),
          ],
        ),
      );
    } else {
      return Expanded(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            Column(
              children: <Widget>[
                boton('1'), //Presiona boton 1
                boton('2'),
                boton('3'),
                SizedBox(
                  height: 55.0,
                )
              ],
            ),
            Column(
              children: <Widget>[
                boton('4'),
                boton('5'),
                boton('6'),
                SizedBox(
                  height: 55.0,
                )
              ],
            ),
            Column(
              children: <Widget>[
                boton('7'),
                boton('8'),
                boton('9'),
                boton('0'),
              ],
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MaterialButton(
              onPressed: () {
                setState(() {
                  binaryDec == 0 ? binaryDec = 1 : binaryDec = 0;
                  _binary = '';
                  _decimal = '';
                });
              },
              child: Container(
                height: 40.0,
                alignment: Alignment.centerLeft,
                child: Center(
                  child: Text(calculatorText),
                ),
              ),
            ),
            containers(_binary), //Muestra el numero binario
            containers(_decimal), //Muestra el numero decimal
            kSizeBox,
            botonesDB(binaryDec),

            boton(''), //Presiona boton delete
          ]),
    );
  }
}
