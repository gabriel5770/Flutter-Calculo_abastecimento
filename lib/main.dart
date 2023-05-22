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
                      decoration: InputDecoration(
                          labelText: 'Preço do álcool, ex: 1.59',
                          labelStyle: TextStyle(fontSize: 20)),
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        labelText: 'Preço da gasolina, ex: 3.15',
                        labelStyle: TextStyle(fontSize: 20)),
                  ),
                  Padding(
                      padding: EdgeInsets.only(top: 10),
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('Calcular'),
                      )),
                ],
              ),
            )));
  }
}
