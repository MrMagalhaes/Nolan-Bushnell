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
      'imagem':
          'https://www.dropbox.com/scl/fi/pg3k7x272ws5rtcdae5wz/Ulrich_Reimers_IEEE_Masaru_Ibuka_Award_Medaille.jpg?rlkey=l1p52bik9gmym58blvd68vwmk&st=voyp7tug&raw=1',
    },
    {
      'nome': 'British Academy of Film and Television Arts',
      'imagem':
          'https://www.dropbox.com/scl/fi/yq3s99mndgol6bea9uz00/png-transparent-65th-british-academy-film-awards-69th-british-academy-film-awards-mel-brooks-british-academy-of-film-and-television-arts-award-television-stone-carving-head.png?rlkey=dv6i59l5ivyzh900zlt8whvr6&st=nd77utz7&raw=1',
    },
    {
      'nome':
          'Video Game Hall of Fame (International Center for the History of Electronic Games)',
      'imagem':
          'https://www.dropbox.com/scl/fi/zpnbvmyvcofiy202uffjh/2019-Logo.webp?rlkey=e1c4ugniwrw60q7w7ko1k9esb&st=9m1k7wzv&raw=1',
    },
    {
      'nome': 'Golden Joystick Awards - Lifetime Achievement Award ',
      'imagem':
          'https://www.dropbox.com/scl/fi/z7ffvdx5olsrv10jup1yv/goldenjoystick1.jpg?rlkey=avj9rvr0tv18meo7pxn4w6d3a&st=oamiki2z&raw=1',
    },
    {
      'nome': 'AIAS Pioneer Award ',
      'imagem':
          'https://www.dropbox.com/scl/fi/apz7l3e9i5spacml8omxl/PioneerAward.jpg?rlkey=l8rf2hpmzlkhdt01yawinoqbs&st=hp48sr9t&raw=1',
    },
    {
      'nome': 'Academy of Interactive Arts and Sciences (AIAS) Hall of Fame',
      'imagem':
          'https://www.dropbox.com/scl/fi/v6950p0wb41xz22wjm2qq/1282440-aias1.jpg?rlkey=km9hsxhqczczg61ttfenivoux&st=sgopsrig&raw=1',
    },
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
