class LaporanModel {
  final String id;
  final String judul;
  final String deskripsi;
  final String lokasi;
  final String userId;
  final String status;

  LaporanModel({
    required this.id,
    required this.judul,
    required this.deskripsi,
    required this.lokasi,
    required this.userId,
    required this.status,
  });

  factory LaporanModel.fromMap(Map<String, dynamic> map, String id) {
    return LaporanModel(
      id: id,
      judul: map['judul'],
      deskripsi: map['deskripsi'],
      lokasi: map['lokasi'],
      userId: map['userId'],
      status: map['status'],
    );
  }
}
