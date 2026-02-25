import 'package:flutter/material.dart';

class Customcard extends StatelessWidget{
  final String title;
  final String subtitle;
  final IconData icon;
  //final VoidCallback onTap;

  const Customcard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    //required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        leading: Icon(icon, size: 32),
        title: Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        subtitle: Text(subtitle),
        //onTap: onTap,
      ),
    );
  }
}