import 'package:examen_final_redondo/models/coche.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

/*
Provider de la aplicación, conecta con la API 
Obtiene las listas que necesita la aplicación.
*/

class CochesPRovider extends ChangeNotifier {
  final String _baseUrl = 'cae76278bb68b7d925a9.free.beeceptor.com';

  List<CocheModel> cochesPrincipales = [];
  List<String> fotos = [];

  CochesPRovider() {
    setCoches();
    getMealsSugeridos();
  }

// Método para generar la lista principal
  setCoches() async {
    var url =
        Uri.https(_baseUrl, '/api/coches/');

    final result = await http.get(url);

    if (result.statusCode == 200) {
      cochesPrincipales = CocheModel.fromJson(result.body);
      notifyListeners();
    } else {
      print('Error: ${result.statusCode}');
    }
  }

  // Método para acceder a la información completa de una receta. 
  // Recibe un String por parámetro y un bool. En función del bool, buscará el String como id o como nombre en la API.
  Future<CocheModel> getDatosReceta(String dato, bool idNombre) async {
    final Uri url;
    if (idNombre) {
      url = Uri.https(_baseUrl, '/api/json/v1/1/lookup.php', {'i': dato});
    } else {
      url = Uri.https(_baseUrl, '/api/json/v1/1/search.php', {'s': dato});
    }
    final MealReceta recetaDetalle;

    final result = await http.get(url);
    if (result.statusCode == 200) {
      recetaDetalle = MealReceta.fromJson(result.body);
      notifyListeners();
    } else {
      print('Error: ${result.statusCode}');
      recetaDetalle = MealReceta(meals: []);
    }
    return recetaDetalle;
  }

  // Método para generar la lista de urls en función de una lista de ingredientes que recibe por parámetro. 
  List<String> getoFotos(MealReceta receta) {
    List<String> ingredients = [];
    if (receta.meals.isNotEmpty) {
      Map<String, String?> meal = receta.meals.first;
      for (int i = 1; i <= 20; i++) {
        String key = 'strIngredient$i';
        if (meal.containsKey(key) &&
            meal[key] != null &&
            meal[key]!.isNotEmpty) {
          ingredients.add(
              'https://www.themealdb.com/images/ingredients/${meal[key]}!');
        }
      }
    }
    return ingredients;
  }
}
