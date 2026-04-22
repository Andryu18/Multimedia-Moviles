import 'package:flutter/material.dart';

class TituloSeccion extends StatelessWidget {
  final String texto;
  final IconData? icono;
  final Color color;
  final VoidCallback? alVerTodo;

  const TituloSeccion({
    super.key,
    required this.texto,
    this.icono,
    this.color = const Color(0xFFFFD700),
    this.alVerTodo,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 10),
      child: Row(
        children: [
          // Línea decorativa de acento
          Container(
            width: 4,
            height: 22,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
              boxShadow: [
                BoxShadow(color: color.withAlpha(179), blurRadius: 8),
              ],
            ),
          ),
          const SizedBox(width: 10),

          // Ícono opcional
          if (icono != null) ...[
            Icon(icono, color: color, size: 20),
            const SizedBox(width: 6),
          ],

          // Texto título
          Text(
            texto.toUpperCase(),
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w900,
              color: Colors.white,
              letterSpacing: 1.5,
              shadows: [
                Shadow(color: color.withAlpha(153), blurRadius: 8),
              ],
            ),
          ),

          const Spacer(),

          // "Ver todo"
          GestureDetector(
            onTap: alVerTodo,
            child: Text(
              "Ver todo",
              style: TextStyle(
                color: color,
                fontSize: 12,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
