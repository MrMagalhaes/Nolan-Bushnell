import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Empresas.dart';

class PizzaScreen extends StatelessWidget {
  // Função para abrir o link da pizzaria
  void _launchURL() async {
    const url = 'https://www.chuckecheese.com';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Não foi possível abrir o link $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.black),
              onPressed: () {
                Navigator.pop(context); // Navegação para a tela anterior
              },
            ),
            Row(
              children: [
                Text(
                  '1977',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: _launchURL,
                  child: Image.network(
                    'https://www.dropbox.com/scl/fi/k56hhojr3g1j6tk27838y/download-removebg-preview.png?rlkey=eatcge0le9ew5srntitnc2bac&st=ttblygc5&raw=1',
                    width: 80,
                    height: 80,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '1984',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmpresasScreen()),
                ); // Adicione a navegação para a próxima tela aqui
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.grey[100],
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://www.dropbox.com/scl/fi/sqb40din8du88bdq1b5ai/nolan11.webp?rlkey=x1asyj35b0st43gd8prjoumc0&st=6pd5co88&raw=1',
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://www.dropbox.com/scl/fi/rqxjuivt84x39x1453i0w/unnamed.jpg?rlkey=ok2g9x5qyk7j3dl9mfvxxae9a&st=ui4nbs80&raw=1',
                    width: 150,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 10),
              // Caixas de texto após as duas fotos
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Em 1977, a empresa Chuck E. Cheese foi criada para misturar pizza e entretenimento.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Foi a primeira franquia a usar animatrônicos como parte de sua proposta.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    ),
                  ],
                ),
                child: Text(
                  'Bushnell deixou a empresa após ela declarar falência e ser adquirida pela ShowBiz Pizza.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Chuck E. Cheese\'s foi uma das inspirações para o jogo',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10),
              Image.network(
                'https://www.dropbox.com/scl/fi/45x9jr88jdsiwpesuv4bz/263974.jpg?rlkey=pv9q4nddjfgkd78zl24f7ce4q&st=roptxxmx&raw=1',
                width: double.infinity,
                height: 180,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 5),
              Text(
                'Five Nights at Freddy\'s',
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
