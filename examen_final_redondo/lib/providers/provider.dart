import 'package:examen_final_redondo/models/coche.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
Provider de la aplicación, conecta con la API 
Obtiene las listas que necesita la aplicación.
*/

class CochesProvider extends ChangeNotifier {
  final String _baseUrl = 'cae76278bb68b7d925a9.free.beeceptor.com';

  List<CocheModel> cochesPrincipales = [];
  List<String> fotos = [];

  CochesProvider() {
    setCoches();
  }

// Método para generar la lista principal
  setCoches() async {
    var url = Uri.https(_baseUrl, '/api/coches/');

    final result = await http.get(url);

    if (result.statusCode == 200) {
      cochesPrincipales = CocheModel.fromJson(result.body) as List<CocheModel>;
      notifyListeners();
    } else {
      print('Error: ${result.statusCode}');
    }
  }

  // añadir coche
  addCoche(String id, String nom, String descripcio, String foto, int pueras,
      String motor) async {
    var url = Uri.https(_baseUrl, '/api/coches/');
    final result = await http.post(url, body: {
      'id': id,
      'nom': nom,
      'descripcio': descripcio,
      'foto': foto,
      'puertas': pueras,
      'motor': motor,
    });
  }

  deleteCoche(String id) async {
    var url = Uri.https(_baseUrl, '/api/coches/$id');
    final result = await http.delete(url);
  }

  updateCoche(String id, String nom, String descripcio, String foto, int pueras,
      String motor) async {
    var url = Uri.https(_baseUrl, '/api/coches/$id');
    final result = await http.put(url, body: {
      'id': id,
      'nom': nom,
      'descripcio': descripcio,
      'foto': foto,
      'puertas': pueras,
      'motor': motor,
    });
  }
}

/*
"id": "0002",
        "nom": "Yaris",
        "descripcio": " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis sodales tortor. Ut nec nisl at quam elementum malesuada. Etiam placerat est eu massa mollis elementum non in nibh. Aliquam ac eros varius, auctor felis a, aliquet turpis. Praesent pharetra augue vitae libero hendrerit interdum. Donec eget varius ipsum. Nulla facilisi. In eu turpis eget orci congue molestie. Aliquam eleifend ex ex, vel luctus purus vehicula ac. Donec in aliquet orci. Suspendisse consectetur feugiat ante condimentum laoreet. Aenean eu lacinia erat. Curabitur egestas non tellus et vestibulum. ",
        "foto": "https://cdn-datak.motork.net/configurator-imgs/cars/es/original/TOYOTA/YARIS-HYBRID/44083_HATCHBACK-5-DOORS/toyota-yaris-side-view.jpg",
        "puertas": 5,
        "motor": "gasolina"*/
