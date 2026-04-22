import 'package:flutter/material.dart';

class BarraCategoria extends StatefulWidget {
  const BarraCategoria({super.key});

  @override
  State<BarraCategoria> createState() => _BarraCategoriaState();
}

class _BarraCategoriaState extends State<BarraCategoria> {
  int _seleccionado = 0;

  final List<Map<String, dynamic>> _categorias = [
    {'texto': 'Todos', 'icono': Icons.apps},
    {'texto': 'Slots', 'icono': Icons.casino},
    {'texto': 'En vivo', 'icono': Icons.live_tv},
    {'texto': 'Mesas', 'icono': Icons.table_bar},
    {'texto': 'Deportes', 'icono': Icons.sports_soccer},
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: _categorias.length,
        itemBuilder: (context, i) {
          final selec = i == _seleccionado;
          return GestureDetector(
            onTap: () => setState(() => _seleccionado = i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: selec
                    ? const LinearGradient(
                        colors: [Color(0xFFFFD700), Color(0xFFFF6D00)],
                      )
                    : null,
                color: selec ? null : const Color(0xFF1A2530),
                borderRadius: BorderRadius.circular(30),
                border: selec
                    ? null
                    : Border.all(
                        color: const Color(0xFFFFD700).withAlpha(64),
                      ),
                boxShadow: selec
                    ? [
                        BoxShadow(
                          color: const Color(0xFFFFD700).withAlpha(102),
                          blurRadius: 12,
                        ),
                      ]
                    : null,
              ),
              child: Row(
                children: [
                  Icon(
                    _categorias[i]['icono'] as IconData,
                    size: 14,
                    color: selec ? Colors.black : Colors.white60,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    _categorias[i]['texto'] as String,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: selec ? Colors.black : Colors.white60,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
