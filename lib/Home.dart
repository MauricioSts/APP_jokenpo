import 'package:flutter/material.dart';
import 'dart:math';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var _imageApp = AssetImage("images/padrao.png");
  var _mensagem = "Escolha uma opção abaixo";

  void _opcaoSelecionada(String escolhaUsuario) {
    var opcoes = ["pedra", "papel", "tesoura"];

    var numero = Random().nextInt(3);
    var escolhaApp = opcoes[numero];

    print("miha escolha:" + "$escolhaUsuario");
    print("escolha app:" + escolhaApp);

    switch (escolhaApp) {
      case "pedra":
        setState(() {
          this._imageApp = AssetImage("images/pedra.png");
        });
        break;

      case "papel":
        setState(() {
          this._imageApp = AssetImage("images/papel.png");
        });
        break;
      case "tesoura":
        setState(() {
          this._imageApp = AssetImage("images/tesoura.png");
        });
        break;
    }

    if ((escolhaUsuario == "pedra" && escolhaApp == "tesoura") ||
        (escolhaUsuario == "tesoura" && escolhaApp == "papel") ||
        (escolhaUsuario == "papel" && escolhaApp == "pedra")) {
      setState(() {
        this._mensagem = "Ganheiiii";
      });
    } else if ((escolhaApp == "pedra" && escolhaUsuario == "tesoura") ||
        (escolhaApp == "tesoura" && escolhaUsuario == "papel") ||
        (escolhaApp == "papel" && escolhaUsuario == "pedra")) {
      this._mensagem = "Voce perdeu!!!";
    } else {
      this._mensagem = "Empateeeeeeee";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JokenPo", style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(20),
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              "Escolha do App:",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image(image: this._imageApp),
            SizedBox(height: 20),
            Text(
              _mensagem,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    _opcaoSelecionada("pedra");
                  },
                  child: Image.asset("images/pedra.png", width: 100),
                ),
                GestureDetector(
                  onTap: () {
                    _opcaoSelecionada("papel");
                  },
                  child: Image.asset("images/papel.png", width: 100),
                ),
                GestureDetector(
                  onTap: () {
                    _opcaoSelecionada("tesoura");
                  },
                  child: Image.asset("images/tesoura.png", width: 100),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
