import 'package:flutter/material.dart';
import 'biography.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LoadingScreen(),
    );
  }
}

// Dados dinâmicos para a tela de carregamento
class LoadingContent {
  final String title;
  final String subtitle;
  final String imageUrl;
  final String atariLogoUrl;
  final String chuckECheeseLogoUrl;

  LoadingContent({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
    required this.atariLogoUrl,
    required this.chuckECheeseLogoUrl,
  });
}

// Conteúdo da tela de carregamento
final loadingContent = LoadingContent(
  title: 'Nolan Bushnell',
  subtitle: 'Fundador da Atari\ne do Chuck E. Cheese\'s',
  imageUrl:
      'https://www.dropbox.com/scl/fi/fmbh51en93buq179mmdbk/9287038539_d59388c3d6_b-removebg-preview.png?rlkey=l1q5ct0xdwr0iqz16xhs6spg0&st=nl6efltz&raw=1', // Substitua pela URL correta
  atariLogoUrl:
      'https://www.dropbox.com/scl/fi/oh8ishryv0686czpbysi1/Atari.png?rlkey=tv7s2ddl0tz9qi0sty8ga32zo&st=68oyuckt&raw=1', // Substitua pela URL correta da logo da Atari
  chuckECheeseLogoUrl:
      'https://www.dropbox.com/scl/fi/k56hhojr3g1j6tk27838y/download-removebg-preview.png?rlkey=eatcge0le9ew5srntitnc2bac&st=ttblygc5&raw=1', // Substitua pela URL correta da logo do Chuck E. Cheese
);

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);

    _controller.forward();

    Future.delayed(Duration(seconds: 3), () {
      _controller.reverse().then((_) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => BiographyScreen()),
        );
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.grey.shade300,
              Colors.grey.shade500,
            ],
          ),
        ),
        child: FadeTransition(
          opacity: _animation,
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  loadingContent.title,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.black87,
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.network(
                      loadingContent.atariLogoUrl,
                      width: 70,
                      height: 70,
                    ),
                    SizedBox(width: 30),
                    Image.network(
                      loadingContent.chuckECheeseLogoUrl,
                      width: 70,
                      height: 70,
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  loadingContent.subtitle,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 18,
                    fontWeight: FontWeight.normal,
                    color: Colors.black54,
                    letterSpacing: 1.0,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 20),
                Image.network(
                  loadingContent.imageUrl,
                  width: 220,
                  height: 220,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
