import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Premios.dart';

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
    },
    {
      'nome': 'CATALYST',
      'logo':
          'https://www.dropbox.com/scl/fi/ej0mjt6ulfexoaco2ok1e/377983206-b4240c8c-1020-4dbd-ab28-21f680653a9f.png?rlkey=5pob2ubj4bzxvtijpvpl8ufz4&st=jcn5u2p3&raw=1',
      'url': 'https://www.catalyst.com',
    },
    {
      'nome': 'Androbot',
      'logo':
          'https://www.dropbox.com/scl/fi/gu112rlwjr16c0iza3jyd/377984106-0c10ab93-e689-4360-b93a-14c50e3710bc.jpg?rlkey=1yayhxprn9x880piaxq6enofn&st=x0j1djg0&raw=1',
      'url': 'http://www.theoldrobots.com/bob.html',
    },
    {
      'nome': 'Axlon, Inc. ',
      'logo':
          'https://www.dropbox.com/scl/fi/pvdgragg8n6ie732joq33/377986768-22b78867-0679-4c14-b3fb-4ea57d8478d2.jpg?rlkey=2qgtc9o70inmbsi86rkclecb9&st=rar48463&raw=1',
      'url': 'https://shop.hasbro.com/pt-br',
    },
    {
      'nome': 'Etak, Inc.',
      'logo':
          'https://www.dropbox.com/scl/fi/cdvme0xpf2tn8aw2mo6og/377987766-6b7e206d-a4c3-4e09-82c1-b04556fd4568.jpg?rlkey=tasimpvgh5quxzuhodtqpectg&st=xze0nqz5&raw=1',
      'url': '',
    },
    {
      'nome': 'ByVideo, Inc.',
      'url': '',
    },
    {
      'nome': 'uWink, Inc.',
      'logo':
          'https://www.dropbox.com/scl/fi/xocojxw77qx19p78uksxm/377989211-804b4c00-885c-486a-a9f3-f411246b1229.png?rlkey=vsy4bx1rjl53vco2q4ua3u5zr&st=c3w30ruf&raw=1',
      'url': '',
    },
    {
      'nome': 'BrainRush ',
      'logo':
          'https://www.dropbox.com/scl/fi/mhour31gbnvb880l2q1fz/377993442-4bf69056-5f86-4fdd-9075-ececd3567702.png?rlkey=i3lg00quw449buuav35b5xqu7&st=21pisoun&raw=1',
      'url': '',
    },
    {
      'nome': 'X2 Games',
      'logo':
          'https://www.dropbox.com/scl/fi/mwxbxd48hlrgcyca1u27r/377993863-a7d28c06-19b5-44e3-ae36-ab3a86092931.jpg?rlkey=5ivqay483kthicxw1h2xzffnq&st=dqmrbu5v&raw=1',
      'url': 'https://www.linkedin.com/company/x2-games/about/',
    },
    {
      'nome': 'Modal VR',
      'logo':
          'https://www.dropbox.com/scl/fi/3u9aowcjgcuka97adlnw3/377996013-42c2a20d-43ac-46e7-b3fe-5cf0ea705226.jpg?rlkey=hvuin32f549sn4fy6hbk7da9n&st=soay527t&raw=1',
      'url': 'https://www.linkedin.com/company/modal-vr/',
    },
  ];

  void _launchURL(String url) async {
    if (url.isNotEmpty && await canLaunch(url)) {
      await launch(url);
    } else {
      // URL vazia ou inválida
      print('Não foi possível abrir o link $url');
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PremiosScreen()),
              ); // Navegação para a próxima tela
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
                  final empresa = empresas[empresaIndex];

                  return GestureDetector(
                    onTap: empresa['url'] != null && empresa['url']!.isNotEmpty
                        ? () => _launchURL(empresa['url'])
                        : null,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        empresa['logo'] != null
                            ? Image.network(
                                empresa['logo'],
                                width: 100,
                                height: 80,
                                fit: BoxFit.contain,
                              )
                            : Icon(Icons.image_not_supported, size: 80),
                        Text(empresa['nome'] ?? ''),
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
