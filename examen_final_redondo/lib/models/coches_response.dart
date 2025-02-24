import 'dart:convert';

import 'package:examen_final_redondo/models/coche.dart';

class CochesResponse {
  List<CocheModel> coches;

  CochesResponse({required this.coches});

  factory CochesResponse.fromJson(List<dynamic> json) {
    return CochesResponse(
      coches: json.map((e) => CocheModel.fromJson(e)).toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory CochesResponse.fromMap(Map<String, dynamic> json) => CochesResponse(
        coches: List<CocheModel>.from(json["coches"].map((x) => CocheModel.fromMap(x))),
      );
     
     Map<String, dynamic> toMap() => {
        "coches": List<dynamic>.from(coches.map((x) => x.toMap())),
      };
}
