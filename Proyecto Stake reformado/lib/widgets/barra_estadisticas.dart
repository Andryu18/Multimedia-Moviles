import 'package:flutter/material.dart';

class BarraEstadisticas extends StatelessWidget {
  const BarraEstadisticas({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: const EdgeInsets.symmetric(vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFF0F1E2C),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xFFFFD700).withAlpha(51),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _Estadistica(
            valor: '12,430',
            etiqueta: 'Jugando ahora',
            icono: Icons.people,
            color: const Color(0xFF00E676),
          ),
          _Separador(),
          _Estadistica(
            valor: '\$84.2M',
            etiqueta: 'Ganado hoy',
            icono: Icons.monetization_on,
            color: const Color(0xFFFFD700),
          ),
          _Separador(),
          _Estadistica(
            valor: '1,200+',
            etiqueta: 'Juegos',
            icono: Icons.casino,
            color: const Color(0xFF00B0FF),
          ),
        ],
      ),
    );
  }
}

class _Estadistica extends StatelessWidget {
  final String valor;
  final String etiqueta;
  final IconData icono;
  final Color color;

  const _Estadistica({
    required this.valor,
    required this.etiqueta,
    required this.icono,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icono, color: color, size: 20),
        const SizedBox(height: 4),
        Text(
          valor,
          style: TextStyle(
            color: color,
            fontSize: 15,
            fontWeight: FontWeight.w900,
            shadows: [Shadow(color: color.withAlpha(153), blurRadius: 6)],
          ),
        ),
        const SizedBox(height: 2),
        Text(
          etiqueta,
          style: const TextStyle(
            color: Colors.white54,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}

class _Separador extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 40,
      color: Colors.white12,
    );
  }
}
