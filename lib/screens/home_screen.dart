import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.asset(
            'images/macam_pempek.jpg',
            width: double.infinity,
            fit: BoxFit.fitWidth,
          ),
          //
          const SizedBox(height: 8.0),
          //
          const Text(
            'Pempek Candy',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30.0,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Pempek Candy adalah warung pempek yang menyajikan hidangan khas Palembang dengan sentuhan kelezatan dan keunikan yang membuatnya berbeda. Di setiap cabang Pempek Candy, Anda akan menemukan beragam varian pempek, mulai dari Pempek Kapal Selam yang gurih hingga Pempek Lenjer yang lembut. Kombinasi rahasia bumbu dan teknik tradisional Palembang menciptakan cita rasa autentik yang menggoda selera. Selain pempek, menu-menu spesial lainnya seperti Tekwan dan Mie Celor turut menggoda selera Anda. Nikmati pengalaman kuliner yang istimewa di atmosfer yang nyaman dan ramah di setiap cabang Pempek Candy. Kami mengundang Anda untuk merasakan kelezatan Palembang yang otentik melalui setiap hidangan yang kami sajikan. Selamat menikmati',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.grey.shade700,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
