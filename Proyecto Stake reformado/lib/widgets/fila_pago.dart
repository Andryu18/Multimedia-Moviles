import 'package:flutter/material.dart';

class FilaPago extends StatelessWidget {
  final String nombreJuego;
  final int monto;
  final bool esGanancia;

  const FilaPago({
    super.key,
    required this.nombreJuego,
    required this.monto,
    this.esGanancia = false,
  });

  @override
  Widget build(BuildContext context) {
    final colorMonto =
        monto > 0 ? const Color(0xFF00E676) : const Color(0xFF78909C);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xFF1E2F3D), width: 1),
        ),
      ),
      child: Row(
        children: [
          // Ícono de juego
          Container(
            width: 32,
            height: 32,
            decoration: BoxDecoration(
              color: const Color(0xFF0F1E2C),
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: const Color(0xFFFFD700).withAlpha(77),
              ),
            ),
            child: const Icon(Icons.casino, color: Color(0xFFFFD700), size: 16),
          ),

          const SizedBox(width: 12),

          // Nombre del juego
          Expanded(
            child: Text(
              nombreJuego,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 13,
                color: Colors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),

          // Monto
          Row(
            children: [
              Icon(
                monto > 0 ? Icons.arrow_upward : Icons.remove,
                color: colorMonto,
                size: 14,
              ),
              const SizedBox(width: 4),
              Text(
                monto > 0 ? '\$ ${monto.toString()}' : 'Gratis',
                style: TextStyle(
                  color: colorMonto,
                  fontWeight: FontWeight.w800,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
