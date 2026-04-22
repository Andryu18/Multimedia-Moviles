import 'package:flutter/material.dart';
import 'widgets/tarjeta_juego.dart';
import 'widgets/banner_promocion.dart';
import 'widgets/titulo_seccion.dart';
import 'widgets/fila_pago.dart';
import 'widgets/encabezado_app.dart';
import 'widgets/barra_categoria.dart';
import 'widgets/barra_estadisticas.dart';

void main() {
  runApp(const AplicacionStake());
}

class AplicacionStake extends StatelessWidget {
  const AplicacionStake({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Stake Casino',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF080F18),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFFFD700),
          secondary: Color(0xFFFF6D00),
        ),
      ),
      home: const PaginaInicio(),
    );
  }
}

// ─── Modelos ───────────────────────────────────────────────────────────────────

class Juego {
  final String titulo;
  final String imagen;
  final String? etiqueta;

  const Juego(this.titulo, this.imagen, {this.etiqueta});
}

class JuegoPago {
  final String nombre;
  final int precio;

  const JuegoPago(this.nombre, this.precio);
}

// ─── Página principal ──────────────────────────────────────────────────────────

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  int _paginaActual = 1; // Casino seleccionado por defecto

  final List<Juego> juegos = const [
    Juego('Pepsiman', 'https://classicgamezone.com/games/covers/ps/pepsiman.webp', etiqueta: 'HOT'),
    Juego('Diep.io', 'https://shop.shockwave.com/cdn/shop/collections/diep_Collection.jpg?v=1655846453&width=1500', etiqueta: 'NUEVO'),
    Juego('Hole.io', 'https://image.api.playstation.com/vulcan/ap/rnd/202311/2316/adb72a3412d9762e29c49700fcbbe28aad6f0170bceb0591.jpg'),
    Juego('Real War', 'https://www.notebookcheck.org/fileadmin/_processed_/webp/Notebooks/News/_nc5/Real-War-Not-Fake_7-webp-q82-w-h1600.webp', etiqueta: 'VIP'),
    Juego('Slither.io', 'https://play-lh.googleusercontent.com/tRpviKT0mUi47iAaBne_yhe_xIuFzpW1mCIqoW457tNsKZddZHwiCUR2ga-rU3VXw04', etiqueta: 'HOT'),
    Juego('Agar.io', 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Agar.io_Logo.png'),
    Juego('Silly Sky', 'https://img.poki-cdn.com/cdn-cgi/image/q=78,scq=50,width=314,height=314,fit=cover,f=auto/09548c6fe491ccfaf3657b8ef296fe56/silly-sky.png', etiqueta: 'NUEVO'),
    Juego('Krunker.io', 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaMooRfVpLaOFChZZqIrLncHZSCHsRi4iKHQ&s'),
    Juego('Casino Slot', 'https://cdn-bgp.bluestacks.com/BGP/latam/gametiles_com.playstudios.popslots.jpg', etiqueta: 'VIP'),
    Juego('Blackjack', 'https://arenacloud.cdn.arkadiumhosted.com/arenaxstorage-blob/arenax-games/BlackJack/0.62/build/resources/assets/thumbs/thumb2x.jpg', etiqueta: 'HOT'),
    Juego('Mines', 'https://i2.stake.com.co/stake_uploads/97/casino_game/image/13621/image-68x91.webp'),
    Juego('Plinko', 'https://i2.stake.com.co/stake_uploads/97/casino_game/image/13622/Plinko.jpg.JPEG', etiqueta: 'HOT'),
  ];

  final List<JuegoPago> listaPagos = const [
    JuegoPago('Tiki Fruits Totem Frenzy', 0),
    JuegoPago('Stormforged', 0),
    JuegoPago('John Hunter – Scarab Queen', 0),
    JuegoPago('Mines', 0),
    JuegoPago('Baccarat', 75000),
    JuegoPago('MONOPOLY Big Baller', 1500),
    JuegoPago('The Dog Mansion Megaways', 0),
    JuegoPago('Flight Mode', 0),
    JuegoPago('5 Lions Gold', 100),
  ];

  // Carrusel horizontal de juegos
  Widget _carrusel(List<Juego> lista) {
    return SizedBox(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: lista.length,
        itemBuilder: (ctx, i) => SizedBox(
          width: 115,
          child: TarjetaJuego(
            titulo: lista[i].titulo,
            imagen: lista[i].imagen,
            etiqueta: lista[i].etiqueta,
          ),
        ),
      ),
    );
  }

  // Tabla de pagos
  Widget _tablaPagos() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1A24),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: Color.fromRGBO(255, 215, 0, 0.2),
        ),
      ),
      child: Column(
        children: [
          // Encabezado tabla
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: const [
                Expanded(
                  child: Text(
                    'JUEGO',
                    style: TextStyle(
                      color: Color(0xFFFFD700),
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                Text(
                  'PAGO',
                  style: TextStyle(
                    color: Color(0xFFFFD700),
                    fontSize: 11,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 1.5,
                  ),
                ),
              ],
            ),
          ),
          const Divider(color: Color(0xFF1E2F3D), height: 1),
          ...listaPagos.map((j) => FilaPago(nombreJuego: j.nombre, monto: j.precio)),
        ],
      ),
    );
  }

  // Barra inferior de navegación
  BottomNavigationBar _barraInferior() {
    return BottomNavigationBar(
      currentIndex: _paginaActual,
      onTap: (i) => setState(() => _paginaActual = i),
      backgroundColor: const Color(0xFF060D14),
      selectedItemColor: const Color(0xFFFFD700),
      unselectedItemColor: Colors.white38,
      type: BottomNavigationBarType.fixed,
      selectedLabelStyle: const TextStyle(
        fontWeight: FontWeight.w800,
        fontSize: 10,
      ),
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Buscar'),
        BottomNavigationBarItem(icon: Icon(Icons.casino), label: 'Casino'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Apuestas'),
        BottomNavigationBarItem(icon: Icon(Icons.sports_soccer), label: 'Deportes'),
        BottomNavigationBarItem(icon: Icon(Icons.headset_mic), label: 'Soporte'),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final tendencia = juegos.sublist(0, 4);
    final exclusivos = juegos.sublist(4, 8);
    final populares = juegos.sublist(8, 12);

    return Scaffold(
      backgroundColor: const Color(0xFF080F18),
      bottomNavigationBar: _barraInferior(),
      body: ListView(
        children: [
          // ── Encabezado ──────────────────────────────────
          const EncabezadoApp(),

          // ── Estadísticas en vivo ─────────────────────────
          const BarraEstadisticas(),

          // ── Categorías ──────────────────────────────────
          const SizedBox(height: 4),
          const BarraCategoria(),
          const SizedBox(height: 8),

          // ── Banner bienvenida ────────────────────────────
          BannerPromocion(
            titulo: '¡Bono de Bienvenida!',
            subtitulo: 'Duplica tu primer depósito hasta \$500.000',
            textoBoton: '¡Reclamar ahora!',
            colorPrimario: const Color(0xFFFFD700),
            colorSecundario: const Color(0xFFFF6D00),
            icono: Icons.local_fire_department,
          ),

          // ── Banner VIP ───────────────────────────────────
          BannerPromocion(
            titulo: 'Sala VIP Exclusiva',
            subtitulo: 'Accede a mesas privadas con dealers en vivo',
            textoBoton: 'Entrar al VIP',
            colorPrimario: const Color(0xFF00E676),
            colorSecundario: const Color(0xFF00BCD4),
            icono: Icons.diamond,
          ),

          // ── Sección: Tendencia ───────────────────────────
          TituloSeccion(
            texto: 'En Tendencia',
            icono: Icons.trending_up,
            color: const Color(0xFFFF3B30),
          ),
          _carrusel(tendencia),

          // ── Sección: Solo en Stake ───────────────────────
          TituloSeccion(
            texto: 'Solo en Stake',
            icono: Icons.star,
            color: const Color(0xFFFFD700),
          ),
          _carrusel(exclusivos),

          // ── Sección: Más populares ───────────────────────
          TituloSeccion(
            texto: 'Más Populares',
            icono: Icons.casino,
            color: const Color(0xFF00E676),
          ),
          _carrusel(populares),

          // ── Tabla de pagos ───────────────────────────────
          TituloSeccion(
            texto: 'Últimos Pagos',
            icono: Icons.monetization_on,
            color: const Color(0xFF00B0FF),
          ),
          _tablaPagos(),

          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
