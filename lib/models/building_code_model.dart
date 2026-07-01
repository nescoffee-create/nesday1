import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class BuildingCodeModel {
  final String AssignCode;
  final String ProvName;
  final String DistName;
  final String SubDistName;
  final String AreaName;
  final String EA_NO;
  final String PSU_NO;
  final String BuildingRepKe;
  final String iden_ea;
  final String BuildingCode;
  BuildingCodeModel({
    required this.AssignCode,
    required this.ProvName,
    required this.DistName,
    required this.SubDistName,
    required this.AreaName,
    required this.EA_NO,
    required this.PSU_NO,
    required this.BuildingRepKe,
    required this.iden_ea,
    required this.BuildingCode,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'AssignCode': AssignCode,
      'ProvName': ProvName,
      'DistName': DistName,
      'SubDistName': SubDistName,
      'AreaName': AreaName,
      'EA_NO': EA_NO,
      'PSU_NO': PSU_NO,
      'BuildingRepKe': BuildingRepKe,
      'iden_ea': iden_ea,
      'BuildingCode': BuildingCode,
    };
  }

  factory BuildingCodeModel.fromMap(Map<String, dynamic> map) {
    return BuildingCodeModel(
      AssignCode: (map['AssignCode'] ?? '') as String,
      ProvName: (map['ProvName'] ?? '') as String,
      DistName: (map['DistName'] ?? '') as String,
      SubDistName: (map['SubDistName'] ?? '') as String,
      AreaName: (map['AreaName'] ?? '') as String,
      EA_NO: (map['EA_NO'] ?? '') as String,
      PSU_NO: (map['PSU_NO'] ?? '') as String,
      BuildingRepKe: (map['BuildingRepKe'] ?? '') as String,
      iden_ea: (map['iden_ea'] ?? '') as String,
      BuildingCode: (map['BuildingCode'] ?? '') as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory BuildingCodeModel.fromJson(String source) => BuildingCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
