import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'This is a Flutter App';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(title: const Text(appTitle)),
        body: const Center(
          child: Column(
            spacing: 20.0,
            children: [
              Image(
                fit: BoxFit.cover,
                image: NetworkImage(
                  "https://www.wradio.com.co/resizer/v2/KGTBGTRDOFGQRDXRXLFG6F2BZU.jpg?auth=539b14ecf1908551f6c755689c2c4a18f214d7abb0efb9d5332d5da4b05d915f&width=650&height=488&quality=70&smart=true",
                ),
              ),
              //ROW 1 DE LAYOUT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Bogota Colombia - Localidad de Suba",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color: Color.fromARGB(255, 218, 9, 9),
                    size: 40,
                  ),
                  Text("41", style: TextStyle(fontSize: 20)),
                ],
              ),
              //ROW 2 DE LAYOUT
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.phone,
                    color: Color.fromARGB(255, 34, 0, 255),
                    size: 40,
                  ),
                  Icon(
                    Icons.navigation,
                    color: Color.fromARGB(255, 34, 0, 255),
                    size: 40,
                  ),
                  Icon(
                    Icons.share,
                    color: Color.fromARGB(255, 34, 0, 255),
                    size: 40,
                  ),
                ],
              ),
              Text(
                "Suba es una localidad de Bogotá, Colombia, ubicada en la zona noroccidental de la ciudad. Es una de las localidades más grandes y pobladas de Bogotá, con una población diversa y una mezcla de áreas residenciales, comerciales e industriales. Suba cuenta con una variedad de servicios, parques, centros comerciales y opciones de transporte público, lo que la convierte en un lugar importante dentro de la ciudad.",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
