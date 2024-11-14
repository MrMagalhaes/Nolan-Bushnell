import 'package:flutter/material.dart';
import 'Atari.dart';

class BiographyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        elevation: 0,
        title: Text(
          'Biografia',
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding:
                const EdgeInsets.only(right: 8.0), // Aproxima a seta da borda
            child: IconButton(
              icon: Icon(Icons.arrow_forward_ios, color: Colors.black),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AtariScreen()),
                );
              },
            ),
          ),
        ],
      ),
      body: Container(
        color: Colors.grey[300],
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildBiographySection(
                context,
                imageUrl:
                    'https://www.dropbox.com/scl/fi/a4k6h001cieim8kg3pi4p/521622156-nolan-bushnell.webp?rlkey=guj1u1nhdf21bc2i8kn9qw60x&st=i6yvor5g&raw=1',
                text:
                    'Nolan Kay Bushnell nasceu em Clearfield, Utah, Estados Unidos em 1943. Ele sempre teve um fascínio por tecnologia e eletrônica, o que o levou a estudar engenharia elétrica na Universidade de Utah. Durante seu tempo como estudante universitário, Bushnell começou a desenvolver um interesse por jogos de arcade e computadores, tendo sido exposto aos primeiros conceitos de computação gráfica e jogos eletrônicos em um ambiente acadêmico.',
              ),
              SizedBox(height: 20),
              _buildBiographySection(
                context,
                imageUrl:
                    'https://www.dropbox.com/scl/fi/8p0wtdp161gdufmyd7xh5/nolan2.webp?rlkey=orw7yrdo77v1xcduuxmd84fku&st=kowluezb&raw=1',
                text:
                    'Após a formatura, Bushnell mudou-se de Utah para a Califórnia na esperança de ser contratado pela Disney, mas a empresa não tinha o hábito de contratar recém-formados. Em vez disso, Bushnell trabalhou como engenheiro elétrico na Ampex. Na Ampex, ele conheceu o colega Ted Dabney e descobriu que eles tinham um interesse comum. Bushnell compartilhou sua ideia de uma pizzaria com videogames com Dabney, e levou Dabney ao laboratório de informática do Laboratório de Inteligência Artificial de Stanford para mostrar-lhe o Spacewar.',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBiographySection(BuildContext context,
      {required String imageUrl, required String text}) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.network(
              imageUrl,
              width: double.infinity,
              height: 200,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              text,
              style: TextStyle(fontSize: 16, color: Colors.black87),
              textAlign: TextAlign.justify,
            ),
          ),
        ],
      ),
    );
  }
}
