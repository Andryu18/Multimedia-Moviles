import 'package:flutter/material.dart';
import 'package:appbarclass/widgets/customcard.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(onPressed: () {}, icon: const Icon(Icons.menu)),
          title: const Text('Andres Demo APP'),
          actions: <Widget>[
            IconButton(onPressed: () {}, icon: Icon(Icons.drag_handle)),
            IconButton(
              icon: const Icon(Icons.panorama_fish_eye_outlined),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.panorama_fish_eye_outlined),
              onPressed: () {},
            ),
          ],
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Header
                Container(
                  height: MediaQuery.sizeOf(context).height / 4,
                  decoration: const BoxDecoration(),
                  clipBehavior: Clip.hardEdge,
                  child: Image.network(
                    'https://imagenes2.eltiempo.com/files/og_thumbnail/uploads/2023/03/09/640a8dc891f38.jpeg',
                    fit: BoxFit.cover,
                    width: double.infinity,
                  ),
                ),

                const SizedBox(height: 12),

                // Centro el titulo con Padding
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Explora las categorias',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),

                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Customcard(
                            title: "Peliculas",
                            subtitle: "Sumergete en el mundo del cine",
                            icon: Icons.local_movies,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Customcard(
                            title: 'Series',
                            subtitle:
                                'Descubre las mejores series de la temporada',
                            icon: Icons.movie_creation_outlined,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6.0),
                          child: Customcard(
                            title: 'Nuestras ganadoras',
                            subtitle:
                                'Dale un vistazo a las ganadoras de los premios',
                            icon: Icons.play_circle_fill,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
              icon: Icon(Icons.open_in_new_rounded),
              label: 'Open dialog',
            ),
          ],
        ),
      ),
    );
  }
}
