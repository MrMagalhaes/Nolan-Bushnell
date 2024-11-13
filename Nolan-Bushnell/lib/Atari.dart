import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Pizza.dart';

class AtariScreen extends StatelessWidget {
  // Função para abrir um link externo
  void _launchURL() async {
    const url = 'https://www.atari.com'; // Substitua com o link desejado
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
                  '1972',
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
                    'https://www.dropbox.com/scl/fi/oh8ishryv0686czpbysi1/Atari.png?rlkey=tv7s2ddl0tz9qi0sty8ga32zo&st=68oyuckt&raw=1',
                    width: 40,
                    height: 40,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  '1978',
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
                  MaterialPageRoute(builder: (context) => PizzaScreen()),
                );
                // Navegação para a PizzaScreen
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.redAccent,
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Co-fundador e CEO',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Text(
                'Fundada em: 1972',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.network(
                    'https://www.dropbox.com/scl/fi/w6sx2i4vbcjyhrhs7mpkm/Corbis-RR018990.jpg?rlkey=bvqh9gg2ktfjyi99lbhpfshk8&st=yqrtlui5&raw=1',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                  Image.network(
                    'https://www.dropbox.com/scl/fi/4942l2l32ror9ylk5re3d/ted_dabney.jpg?rlkey=38divcg21ubb18zp2kyvsp4le&st=w3wbnwss&raw=1',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                'Bushnell, junto com Ted Dabney, foi cofundador da Atari, pioneira na indústria de videogames, que lançou Pong e se tornou uma das maiores empresas de tecnologia e entretenimento da época.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  Text(
                    '1° Processo de games da história',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.network(
                        'https://www.dropbox.com/scl/fi/btej75jyjt7anld3gnk9t/378001571-42caa4b7-c8f1-4951-8cdc-1618b6e236d8.jpg?rlkey=wrxr9n6wqkphcrubyzacnmbya&st=pz36digj&raw=1',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                      Text(
                        'vs',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Image.network(
                        'https://www.dropbox.com/scl/fi/1h5a4wq6vzvda2h02spwp/378000996-37fb28d2-46c0-487f-8019-2111fc15e94c.jpg?rlkey=s4rfn13kqsqf179cc20tkwzey&st=xqxl9yit&raw=1',
                        width: 150,
                        height: 150,
                        fit: BoxFit.cover,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text(
                'Pong foi lançado oficialmente em novembro de 1972 e fez muito sucesso, levando a muitas versões. A Magnavox processou a Atari, alegando plágio do conceito do tênis de mesa. Foi o primeiro processo judicial envolvendo um videogame na história. Atari concordou em pagar 700 mil dólares à Magnavox e dar-lhes um ano de acesso aos produtos da Atari. Devido a isso, Bushnell atrasou lançamentos de novos jogos e omitiu informações quando a Magnavox visitou a Atari.',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(12),
                margin: EdgeInsets.symmetric(vertical: 20),
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
                  'Em 1976, a Atari foi vendida para a Warner Communications por cerca de 28 milhões de dólares. Bushnell, no entanto, permaneceu brevemente na empresa após a venda, mas conflitos com a administração da Warner o levaram a deixar a Atari em 1978.',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Image.network(
                  'https://www.dropbox.com/scl/fi/auig9s0mxzf3il0lizbcg/atari-ad_480x480.webp?rlkey=o2kliwfyzk5qhgr863zmb45eo&st=j1kw8uvg&raw=1',
                  width: 200,
                  height: 200,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
