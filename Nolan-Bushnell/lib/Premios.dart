import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PremiosScreen extends StatefulWidget {
  @override
  _PremiosScreenState createState() => _PremiosScreenState();
}

class _PremiosScreenState extends State<PremiosScreen> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> premios = [
    {
      'nome': 'IEEE Masaru Ibuka Award',
      'imagem': 'https://www.dropbox.com/scl/fi/sampleaward1.png?raw=1',
      'descricao': 'prêmios prêmios\nprêmios prêmios',
    },
    {
      'nome': 'Exemplo de Prêmio 2',
      'imagem': 'https://www.dropbox.com/scl/fi/sampleaward2.png?raw=1',
      'descricao': 'prêmios prêmios\nprêmios prêmios',
    },
    // Adicione mais prêmios aqui
  ];

  @override
  void initState() {
    super.initState();
    _startAutoSwitch();
  }

  void _startAutoSwitch() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          currentIndex = (currentIndex + 2) % premios.length;
        });
        _startAutoSwitch();
      }
    });
  }

  void _restartApp() {
    Navigator.of(context).pushNamedAndRemoveUntil('/', (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context); // Volta para a tela anterior
          },
        ),
        title: Text(
          'Prêmios e Reconhecimentos',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.restart_alt, color: Colors.black),
            onPressed: _restartApp,
          ),
        ],
      ),
      body: Container(
        color: Colors.brown[800],
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (index) {
                  int premioIndex = (currentIndex + index) % premios.length;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Image.network(
                        premios[premioIndex]['imagem'],
                        width: 100,
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 10),
                      Text(
                        premios[premioIndex]['descricao'],
                        style: TextStyle(color: Colors.white, fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
