import 'package:examen_final_redondo/providers/provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<CochesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de coches"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: authProvider.cochesPrincipales.length,  // Usar la lista de usuarios desde el provider
          itemBuilder: (context, index) {
            final coche = authProvider.cochesPrincipales[index];
            
            return ListTile(
              leading: Icon(Icons.person),
              title: Text(coche.nom),
              onTap: () {
                Navigator.of(context).pushNamed('details', arguments: coche);
              },
            );
          },
        ),
      ),
    );
  }
}
