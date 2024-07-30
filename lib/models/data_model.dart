import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';

import 'index.dart';

@immutable
class DataModel {

  const DataModel({
    required this.id,
    required this.nama,
    required this.deskripsi,
    required this.status,
    required this.tglSekarang,
  });

  final int id;
  final String nama;
  final String deskripsi;
  final String status;
  final String tglSekarang;

  factory DataModel.fromJson(Map<String,dynamic> json) => DataModel(
    id: json['id'] as int,
    nama: json['nama'].toString(),
    deskripsi: json['deskripsi'].toString(),
    status: json['status'].toString(),
    tglSekarang: json['tgl_sekarang'].toString()
  );
  
  Map<String, dynamic> toJson() => {
    'id': id,
    'nama': nama,
    'deskripsi': deskripsi,
    'status': status,
    'tgl_sekarang': tglSekarang
  };

  DataModel clone() => DataModel(
    id: id,
    nama: nama,
    deskripsi: deskripsi,
    status: status,
    tglSekarang: tglSekarang
  );


  DataModel copyWith({
    int? id,
    String? nama,
    String? deskripsi,
    String? status,
    String? tglSekarang
  }) => DataModel(
    id: id ?? this.id,
    nama: nama ?? this.nama,
    deskripsi: deskripsi ?? this.deskripsi,
    status: status ?? this.status,
    tglSekarang: tglSekarang ?? this.tglSekarang,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is DataModel && id == other.id && nama == other.nama && deskripsi == other.deskripsi && status == other.status && tglSekarang == other.tglSekarang;

  @override
  int get hashCode => id.hashCode ^ nama.hashCode ^ deskripsi.hashCode ^ status.hashCode ^ tglSekarang.hashCode;
}
