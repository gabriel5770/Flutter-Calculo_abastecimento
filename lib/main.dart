import 'dart:convert';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGasolina =
      TextEditingController();

  var resultado;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cálculo abastecimento'),
        ),
        body: Container(
            margin: EdgeInsets.all(25),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 60),
                    child: Image.asset('images/logo.png'),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Text(
                        'Saiba qual a melhor opção de abastecimento do seu carro',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.w700)),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _textEditingControllerAlcool,
                      decoration: InputDecoration(
                          labelText: 'Preço do álcool, ex: 1.59',
                          labelStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                  TextField(
                    keyboardType: TextInputType.number,
                    controller: _textEditingControllerGasolina,
                    decoration: InputDecoration(
                        labelText: 'Preço da gasolina, ex: 3.15',
                        labelStyle: TextStyle(fontSize: 20)),
                  ),
                  // Text(
                  //   'Preencha todos os campos',
                  //   style: TextStyle(color: Colors.red),
                  // ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {
                          _calculaAbastecimento();
                          showModalBottomSheet<void>(
                            context: context,
                            builder: (BuildContext context) {
                              return SizedBox(
                                height: 100,
                                child: Center(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                          child: Column(
                                            children: [
                                              Text(
                                                '$resultado',
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          ),
                                        )
                                      ]),
                                ),
                              );
                            },
                          );
                        },
                        child: const Text('Calcular'),
                      )),
                ],
              ),
            )));
  }

  _calculaAbastecimento() {
    setState(() {
      double precoAlcool = double.parse(_textEditingControllerAlcool.text);
      double precoGasolina = double.parse(_textEditingControllerGasolina.text);
      if (precoAlcool / precoGasolina >= 0.7) {
        resultado = 'Indicado por gasolina';
      } else {
        resultado = 'Indicado por álcool';
      }
    });
  }
}
