// To parse this JSON data, do
//
//     final listdatamodel = listdatamodelFromJson(jsonString);

import 'dart:convert';

Listdatamodel listdatamodelFromJson(String str) =>
    Listdatamodel.fromJson(json.decode(str));

String listdatamodelToJson(Listdatamodel data) => json.encode(data.toJson());

class Listdatamodel {
  final String success;
  final List<Datum> data;

  Listdatamodel({
    required this.success,
    required this.data,
  });

  factory Listdatamodel.fromJson(Map<String, dynamic> json) => Listdatamodel(
        success: json["success"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "success": success,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Datum {
  final int id;
  final int subjectId;
  final String question;
  final String answer;
  final dynamic createdAt;
  final DateTime? updatedAt;

  Datum({
    required this.id,
    required this.subjectId,
    required this.question,
    required this.answer,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        subjectId: json["subject_id"],
        question: json["question"],
        answer: json["answer"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"] == null
            ? null
            : DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "subject_id": subjectId,
        "question": question,
        "answer": answer,
        "created_at": createdAt,
        "updated_at": updatedAt?.toIso8601String(),
      };
}
