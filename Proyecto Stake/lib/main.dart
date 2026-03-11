import 'package:flutter/material.dart';
import 'widgets/custom_card.dart';

void main() {
  runApp(const AplicacionStake());
}

class AplicacionStake extends StatelessWidget {
  const AplicacionStake({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Stake",
      theme: ThemeData.dark(),
      home: const PaginaInicio(),
    );
  }
}

class Juego {
  final String titulo;
  final String imagen;

  const Juego(this.titulo, this.imagen);
}

class JuegoPago {
  final String nombre;
  final int precio;

  const JuegoPago(this.nombre, this.precio);
}

class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  final List<Juego> juegos = const [
    Juego(
      "Pepsiman",
      "https://classicgamezone.com/games/covers/ps/pepsiman.webp",
    ),
    Juego(
      "Diep.io",
      "https://shop.shockwave.com/cdn/shop/collections/diep_Collection.jpg?v=1655846453&width=1500",
    ),
    Juego(
      "Hole.io",
      "https://image.api.playstation.com/vulcan/ap/rnd/202311/2316/adb72a3412d9762e29c49700fcbbe28aad6f0170bceb0591.jpg",
    ),
    Juego(
      "Real War",
      "https://www.notebookcheck.org/fileadmin/_processed_/webp/Notebooks/News/_nc5/Real-War-Not-Fake_7-webp-q82-w-h1600.webp",
    ),
    Juego(
      "Slither.io",
      "https://play-lh.googleusercontent.com/tRpviKT0mUi47iAaBne_yhe_xIuFzpW1mCIqoW457tNsKZddZHwiCUR2ga-rU3VXw04",
    ),
    Juego(
      "Agar.io",
      "https://upload.wikimedia.org/wikipedia/commons/d/d7/Agar.io_Logo.png",
    ),
    Juego(
      "Silly Sky",
      "https://img.poki-cdn.com/cdn-cgi/image/q=78,scq=50,width=314,height=314,fit=cover,f=auto/09548c6fe491ccfaf3657b8ef296fe56/silly-sky.png",
    ),
    Juego(
      "Krunker.io",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaMooRfVpLaOFChZZqIrLncHZSCHsRi4iKHQ&s",
    ),
    Juego(
      "Casino Slot",
      "https://cdn-bgp.bluestacks.com/BGP/latam/gametiles_com.playstudios.popslots.jpg",
    ),
    Juego(
      "Blackjack",
      "https://arenacloud.cdn.arkadiumhosted.com/arenaxstorage-blob/arenax-games/BlackJack/0.62/build/resources/assets/thumbs/thumb2x.jpg",
    ),
    Juego(
      "Mines",
      "https://i2.stake.com.co/stake_uploads/97/casino_game/image/13621/image-68x91.webp",
    ),
    Juego(
      "Plinko",
      "https://i2.stake.com.co/stake_uploads/97/casino_game/image/13622/Plinko.jpg.JPEG",
    ),
  ];

  final List<JuegoPago> listaPagos = const [
    JuegoPago("Tiki Fruits Totem Frenzy", 0),
    JuegoPago("Stormforged", 0),
    JuegoPago("John Hunter and the Tomb of the Scarab Queen", 0),
    JuegoPago("Mines", 0),
    JuegoPago("Baccarat", 75000),
    JuegoPago("MONOPOLY Big Baller", 1500),
    JuegoPago("The Dog Mansion Megaways", 0),
    JuegoPago("Flight Mode", 0),
    JuegoPago("John Hunter and the Tomb of the Scarab Queen", 0),
    JuegoPago("5 Lions Gold", 100),
  ];

  Widget encabezado() {
    return Padding(
      padding: const EdgeInsets.only(top: 40, left: 16, right: 16),
      child: Row(
        children: [
          const Text(
            "S",
            style: TextStyle(fontSize: 34, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Text("Iniciar sesión"),
          const SizedBox(width: 10),
          ElevatedButton(onPressed: () {}, child: const Text("Registro")),
          const SizedBox(width: 10),
          const Icon(Icons.person),
        ],
      ),
    );
  }

  Widget tarjetaPromocion() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2B35),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Promoción",
                  style: TextStyle(color: Colors.white54),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Solo en Stake",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 6),
                const Text(
                  "Disfruta juegos exclusivos que solo están disponibles en Stake.",
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text("¡Juega ya!"),
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(16),
            ),
            child: const Center(
              child: Text(
                "S",
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget carrusel(List<Juego> lista) {
    return SizedBox(
      height: 150,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: lista.length,
        itemBuilder: (context, i) {
          return SizedBox(
            width: 120,
            child: TarjetaJuego(
              titulo: lista[i].titulo,
              imagen: lista[i].imagen,
            ),
          );
        },
      ),
    );
  }

  Widget tituloSeccion(String texto) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            texto,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const Text("Mostrar todo", style: TextStyle(color: Colors.blue)),
        ],
      ),
    );
  }

  Widget listaPagosWidget() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF1E2B35),
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    "Juego",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Text("Pagar", style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          const Divider(color: Colors.white24),
          ...listaPagos.map((j) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                children: [
                  Expanded(child: Text(j.nombre)),
                  Row(
                    children: [
                      const Icon(Icons.attach_money, color: Colors.amber),
                      Text(
                        j.precio.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }

  BottomNavigationBar barraInferior() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: "Búsqueda"),
        BottomNavigationBarItem(icon: Icon(Icons.casino), label: "Casino"),
        BottomNavigationBarItem(icon: Icon(Icons.list), label: "Apuestas"),
        BottomNavigationBarItem(icon: Icon(Icons.sports), label: "Deportes"),
        BottomNavigationBarItem(icon: Icon(Icons.headset), label: "Soporte"),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tendencia = juegos.sublist(0, 4);
    final compra = juegos.sublist(4, 8);
    final soloStake = juegos.sublist(8, 12);

    return Scaffold(
      backgroundColor: const Color(0xFF0F1A22),
      bottomNavigationBar: barraInferior(),
      body: ListView(
        children: [
          encabezado(),
          tarjetaPromocion(),
          carrusel(juegos),
          tituloSeccion("Solo en Stake"),
          carrusel(soloStake),
          tituloSeccion("Juegos en tendencia"),
          carrusel(tendencia),
          tituloSeccion("Función de compra"),
          carrusel(compra),
          tituloSeccion("Pagos de juegos"),
          listaPagosWidget(),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
