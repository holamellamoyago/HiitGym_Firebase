class The5DiasModel {
    String? dia1Titutlo1;
    String? dia1Titulo2;
    String? dia1Ejercicio1;
    String? dia1Ejercicio2;
    String? dia1Ejercicio3;
    String? dia1Ejercicio4;
    String? dia1Ejercicio5;
    String? dia1Ejercicio6;
    String? dia1Ejercicio7;
    String? dia1Ejercicio8;
    String? id;

    The5DiasModel({
        this.dia1Titutlo1,
        this.dia1Titulo2,
        this.dia1Ejercicio1,
        this.dia1Ejercicio2,
        this.dia1Ejercicio3,
        this.dia1Ejercicio4,
        this.dia1Ejercicio5,
        this.dia1Ejercicio6,
        this.dia1Ejercicio7,
        this.dia1Ejercicio8,
        this.id,
    });

    factory The5DiasModel.fromJson(Map<String, dynamic> json) => The5DiasModel(
        dia1Titutlo1: json["Dia1_Titutlo1"],
        dia1Titulo2: json["Dia1_Titulo2"],
        dia1Ejercicio1: json["Dia1_Ejercicio1"],
        dia1Ejercicio2: json["Dia1_Ejercicio2"],
        dia1Ejercicio3: json["Dia1_Ejercicio3"],
        dia1Ejercicio4: json["Dia1_Ejercicio4"],
        dia1Ejercicio5: json["Dia1_Ejercicio5"],
        dia1Ejercicio6: json["Dia1_Ejercicio6"],
        dia1Ejercicio7: json["Dia1_Ejercicio7"],
        dia1Ejercicio8: json["Dia1_Ejercicio8"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "Dia1_Titutlo1": dia1Titutlo1,
        "Dia1_Titulo2": dia1Titulo2,
        "Dia1_Ejercicio1": dia1Ejercicio1,
        "Dia1_Ejercicio2": dia1Ejercicio2,
        "Dia1_Ejercicio3": dia1Ejercicio3,
        "Dia1_Ejercicio4": dia1Ejercicio4,
        "Dia1_Ejercicio5": dia1Ejercicio5,
        "Dia1_Ejercicio6": dia1Ejercicio6,
        "Dia1_Ejercicio7": dia1Ejercicio7,
        "Dia1_Ejercicio8": dia1Ejercicio8,
        "id": id,
    };
}
