import 'package:flutter/material.dart';

class EncabezadoApp extends StatelessWidget {
  final VoidCallback? alIniciarSesion;
  final VoidCallback? alRegistrar;

  const EncabezadoApp({
    super.key,
    this.alIniciarSesion,
    this.alRegistrar,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 48, 16, 12),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF0A1520), Color(0xFF0F1A22)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Row(
        children: [
          // Logo con glow
          Container(
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFFFD700), Color(0xFFFF6D00)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFFFFD700).withAlpha(128),
                  blurRadius: 18,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: const Center(
              child: Text(
                'S',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
          ),

          const SizedBox(width: 10),

          // Nombre del app
          const Text(
            'STAKE',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w900,
              color: Color(0xFFFFD700),
              letterSpacing: 4,
            ),
          ),

          const Spacer(),

          // Botón "Iniciar sesión"
          GestureDetector(
            onTap: alIniciarSesion,
            child: const Text(
              'Iniciar sesión',
              style: TextStyle(
                color: Colors.white70,
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

          const SizedBox(width: 12),

          // Botón "Registro"
          GestureDetector(
            onTap: alRegistrar,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFFFFD700), Color(0xFFFF8F00)],
                ),
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFFFFD700).withAlpha(102),
                    blurRadius: 12,
                  ),
                ],
              ),
              child: const Text(
                'Registro',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w900,
                  color: Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
