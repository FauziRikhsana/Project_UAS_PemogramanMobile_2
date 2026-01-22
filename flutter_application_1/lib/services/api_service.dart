import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class ApiService {
  final _db = FirebaseFirestore.instance;
  final _storage = FirebaseStorage.instance;

  Future<void> tambahLaporan({
    required String judul,
    required String deskripsi,
    required String lokasi,
    File? foto,
  }) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    String fotoUrl = '';

    // UPLOAD FOTO JIKA ADA
    if (foto != null) {
      final ref = _storage.ref(
        'laporan/${user.uid}/${DateTime.now().millisecondsSinceEpoch}.jpg',
      );

      await ref.putFile(foto);
      fotoUrl = await ref.getDownloadURL();
    }

    await _db.collection('laporan').add({
      'judul': judul,
      'deskripsi': deskripsi,
      'lokasi': lokasi,
      'fotoUrl': fotoUrl,
      'userId': user.uid,
      'status': 'pending',
      'createdAt': Timestamp.now(),
    });
  }
}
