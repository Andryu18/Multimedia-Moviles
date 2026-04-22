import 'package:flutter/material.dart';

class TarjetaJuego extends StatelessWidget {
  final String titulo;
  final String imagen;
  final String? etiqueta; // ej: "HOT", "NUEVO", "VIP"

  const TarjetaJuego({
    super.key,
    required this.titulo,
    required this.imagen,
    this.etiqueta,
  });

  Color _colorEtiqueta() {
    switch (etiqueta) {
      case 'HOT':
        return const Color(0xFFFF3B30);
      case 'NUEVO':
        return const Color(0xFF00E676);
      case 'VIP':
        return const Color(0xFFFFD700);
      default:
        return const Color(0xFF00B0FF);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFFFFD700).withAlpha(46),
            blurRadius: 14,
            spreadRadius: 1,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          children: [
            // Imagen de fondo
            Positioned.fill(
              child: Image.network(
                imagen,
                fit: BoxFit.cover,
                errorBuilder: (_, _, _) => Container(
                  color: const Color(0xFF1A2530),
                  child: const Icon(Icons.casino, color: Color.fromARGB(255, 213, 72, 103), size: 40),
                ),
              ),
            ),

            // Gradiente inferior
            Positioned.fill(
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      Colors.transparent,
                      Colors.black.withAlpha(217),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                ),
              ),
            ),

            // Título
            Positioned(
              bottom: 8,
              left: 8,
              right: 8,
              child: Text(
                titulo,
                maxLines: 2,
                style: const TextStyle(
                  fontFamily: 'serif',
                  fontWeight: FontWeight.w900,
                  fontSize: 12,
                  color: Colors.white,
                  shadows: [Shadow(color: Colors.black, blurRadius: 4)],
                ),
              ),
            ),

            // Etiqueta (badge)
            if (etiqueta != null)
              Positioned(
                top: 8,
                left: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
                  decoration: BoxDecoration(
                    color: _colorEtiqueta(),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Text(
                    etiqueta!,
                    style: const TextStyle(
                      fontSize: 9,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                      letterSpacing: 0.8,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
