import 'package:examen_final_redondo/models/coche.dart';
import 'package:flutter/material.dart';

class CocheDetailScreen extends StatelessWidget {
  final CocheModel coche;
  
  CocheDetailScreen({required this.coche});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(coche.nom!)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text("Modelo: ${coche.nom}"),
            Text("Info: ${coche.descripcio}"),
            Text("numero de puertas: ${coche.puertas}"),
          ],
        ),
      ),
    );
  }
}