import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Bienvenido a mi app de películas';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: Stack(
          children: [
            // Imagen como fondo
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                    'https://images.pexels.com/photos/3709369/pexels-photo-3709369.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
                  ),
                  fit: BoxFit.cover, // Ajusta la imagen al tamaño de la pantalla
                ),
              ),
            ),
            // Contenido superpuesto
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(height: 32), // Espaciado inicial
                  const TitleSection(
                    name: 'Bienvenido al catálogo de películas',
                    location: 'Animadas',
                  ),
                  const TitleSection(
                    name: 'Descripción',
                    location:
                        'En esta aplicación podrás ver una lista de películas animadas.',
                  ),
                  const ButtonSection(), // Botones integrados
                  const SizedBox(height: 16),                 ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({super.key, required this.name, required this.location});

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center, // Centrado horizontal
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                name,
                textAlign: TextAlign.center, // Centrar el texto
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.white, // Ajusta el color para que contraste
                ),
              ),
            ),
            Text(
              location,
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey[300]), // Color claro
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Distribuye botones uniformemente
        children: [
          _buildButtonColumn(color, Icons.arrow_forward, 'Entrar'),
        ],
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}
