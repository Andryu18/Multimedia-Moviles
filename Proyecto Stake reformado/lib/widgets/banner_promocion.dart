import 'package:flutter/material.dart';

class BannerPromocion extends StatelessWidget {
  final String titulo;
  final String subtitulo;
  final String textoBoton;
  final Color colorPrimario;
  final Color colorSecundario;
  final IconData icono;
  final VoidCallback? alPresionar;

  const BannerPromocion({
    super.key,
    required this.titulo,
    required this.subtitulo,
    required this.textoBoton,
    this.colorPrimario = const Color(0xFFFFD700),
    this.colorSecundario = const Color(0xFFFF6D00),
    this.icono = Icons.local_fire_department,
    this.alPresionar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          colors: [
            colorPrimario.withAlpha(64),
            colorSecundario.withAlpha(38),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        border: Border.all(color: colorPrimario.withAlpha(128), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: colorPrimario.withAlpha(51),
            blurRadius: 20,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            // Ícono decorativo grande
            Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [colorPrimario, colorSecundario],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                boxShadow: [
                  BoxShadow(
                    color: colorPrimario.withAlpha(128),
                    blurRadius: 16,
                  ),
                ],
              ),
              child: Icon(icono, color: Colors.black, size: 36),
            ),

            const SizedBox(width: 16),

            // Texto y botón
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    titulo,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: colorPrimario,
                      letterSpacing: 0.5,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitulo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.white70,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: alPresionar,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [colorPrimario, colorSecundario],
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Text(
                        textoBoton,
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
