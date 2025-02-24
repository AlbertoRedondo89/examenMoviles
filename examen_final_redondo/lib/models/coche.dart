import 'dart:convert';

/*
    {
        "id": "0002",
        "nom": "Yaris",
        "descripcio": " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec quis sodales tortor. Ut nec nisl at quam elementum malesuada. Etiam placerat est eu massa mollis elementum non in nibh. Aliquam ac eros varius, auctor felis a, aliquet turpis. Praesent pharetra augue vitae libero hendrerit interdum. Donec eget varius ipsum. Nulla facilisi. In eu turpis eget orci congue molestie. Aliquam eleifend ex ex, vel luctus purus vehicula ac. Donec in aliquet orci. Suspendisse consectetur feugiat ante condimentum laoreet. Aenean eu lacinia erat. Curabitur egestas non tellus et vestibulum. ",
        "foto": "https://cdn-datak.motork.net/configurator-imgs/cars/es/original/TOYOTA/YARIS-HYBRID/44083_HATCHBACK-5-DOORS/toyota-yaris-side-view.jpg",
        "puertas": 5,
        "motor": "gasolina"
    }
*/ 

class CocheModel {
    String id;
    String nom;
    String descripcio;
    int puertas;
    String motor;
    String? foto;

    CocheModel({
        required this.id,
        required this.nom,
        required this.descripcio,
        required this.puertas,
        required this.motor,
        this.foto,
    });

    factory CocheModel.fromJson(String str) => CocheModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory CocheModel.fromMap(Map<String, dynamic> json) => CocheModel(
        id: json["id"],
        nom: json["nom"],
        descripcio: json["descripcio"],
        puertas: json["puertas"],
        motor: json["motor"],
        foto: json["foto"],
    );

    Map<String, dynamic> toMap() => {
        "id": id,
        "nom": nom,
        "descripcio": descripcio,
        "puertas": puertas,
        "motor": motor,
        "foto": foto,
    };
}
