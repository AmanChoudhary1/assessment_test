import 'dart:convert';

ReportModal reportModalFromJson(String str) =>
    ReportModal.fromJson(json.decode(str));

String reportModalToJson(ReportModal data) => json.encode(data.toJson());

class ReportModal {
  int sysMmHg;
  int diaMmHg;
  int pulseBpm;
  String description;
  String createdat;
  String updatedat;

  ReportModal({
    required this.sysMmHg,
    required this.diaMmHg,
    required this.pulseBpm,
    required this.description,
    required this.createdat,
    required this.updatedat,
  });

  factory ReportModal.fromJson(Map<String, dynamic> json) => ReportModal(
        sysMmHg: json["sys_mm_hg"],
        diaMmHg: json["dia_mm_hg"],
        pulseBpm: json["pulse_bpm"],
        description: json["description"],
        createdat: json["createdat"],
        updatedat: json["updatedat"],
      );

  Map<String, dynamic> toJson() => {
        "sys_mm_hg": sysMmHg,
        "dia_mm_hg": diaMmHg,
        "pulse_bpm": pulseBpm,
        "description": description,
        "createdat": createdat,
        "updatedat": updatedat,
      };
}
