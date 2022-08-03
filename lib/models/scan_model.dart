import 'dart:convert';
import 'package:meta/meta.dart';

class ScanModel {
  ScanModel({
    this.id,
    required this.tipo,
    required this.valor,
  }) {
    if (this.tipo.contains('http')) {
      this.tipo = 'http';
    } else {
      this.tipo = 'geo';
    }
  }

  int? id;
  String tipo;
  String valor;

  factory ScanModel.fromJson(Map<String, dynamic> json) => ScanModel(
        id: json["id"],
        tipo: json["tipo"],
        valor: json["valor"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "tipo": tipo,
        "valor": valor,
      };
}
