import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class EmpresasScreen extends StatefulWidget {
  @override
  _EmpresasScreenState createState() => _EmpresasScreenState();
}

class _EmpresasScreenState extends State<EmpresasScreen> {
  int currentIndex = 0;
  final List<Map<String, dynamic>> empresas = [
    {
      'nome': 'AMPEX',
      'logo':
          'https://www.dropbox.com/scl/fi/fo8l7cnr78h22c3lzqogn/377977607-299e19f6-6545-4ce1-97db-25a9f04f5f57-removebg-preview.png?rlkey=jgbsr4kpnlv1jyukrc0l6ybbj&st=dkd2g99s&raw=1',
      'url': 'https://www.ampex.com',
      'descricao':
          'empresa empresa\nempresa empresa\nempresa empresa\nempresa empresa',
    },
    {
      'nome': 'CATALYST',
      'logo': 'https://www.dropbox.com/s/...',
      'url': 'https://www.catalyst.com',
      'descricao':
          'empresa empresa\nempresa empresa\nempresa empresa\nempresa empresa',
    },
    {
      'nome': 'CATALYST',
      'logo': 'https://www.dropbox.com/s/...',
      'url': 'https://www.catalyst.com',
      'descricao':
          'empresa empresa\nempresa empresa\nempresa empresa\nempresa empresa',
    },
  ];

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  void initState() {
    super.initState();
    _startAutoSwitch();
  }

  void _startAutoSwitch() {
    Future.delayed(Duration(seconds: 5), () {
      if (mounted) {
        setState(() {
          currentIndex = (currentIndex + 2) % empresas.length;
        });
        _startAutoSwitch(); // Chama novamente para manter o ciclo
      }
    });
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
            Navigator.pop(context); // Retorna para a tela Pizza
          },
        ),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Empresas',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10),
            Icon(Icons.apartment, color: Colors.black, size: 30),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward, color: Colors.black),
            onPressed: () {
              Navigator.pushNamed(
                  context, '/premios'); // Navegação para a tela Premios
            },
          ),
        ],
      ),
      body: Container(
        color: Colors.brown[200],
        padding: EdgeInsets.all(16),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(2, (index) {
                  int empresaIndex = (currentIndex + index) % empresas.length;
                  return GestureDetector(
                    onTap: () => _launchURL(empresas[empresaIndex]['url']),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.network(
                          empresas[empresaIndex]['logo'],
                          width: 100,
                          height: 80,
                          fit: BoxFit.contain,
                        ),
                        SizedBox(height: 10),
                        Text(
                          empresas[empresaIndex]['descricao'],
                          style: TextStyle(color: Colors.black, fontSize: 14),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Limpeza de qualquer recurso se necessário
  }
}
