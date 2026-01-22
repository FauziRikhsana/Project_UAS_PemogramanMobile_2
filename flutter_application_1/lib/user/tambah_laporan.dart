import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class TambahLaporan extends StatefulWidget {
  const TambahLaporan({super.key});

  @override
  State<TambahLaporan> createState() => _TambahLaporanState();
}

class _TambahLaporanState extends State<TambahLaporan> {
  final TextEditingController _judulController = TextEditingController();
  final TextEditingController _deskripsiController = TextEditingController();

  File? _image;
  bool _loading = false;

  // ================= PICK IMAGE =================
  Future<void> pilihFoto() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });
    }
  }

  // ================= UPLOAD IMAGE =================
  Future<String?> uploadFoto() async {
    if (_image == null) return null;

    final fileName = DateTime.now().millisecondsSinceEpoch.toString();
    final ref = FirebaseStorage.instance
        .ref()
        .child('laporan')
        .child('$fileName.jpg');

    await ref.putFile(_image!);
    return await ref.getDownloadURL();
  }

  // ================= SIMPAN LAPORAN =================
  Future<void> simpanLaporan() async {
    if (_judulController.text.isEmpty || _deskripsiController.text.isEmpty) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Lengkapi semua data')));
      return;
    }

    setState(() => _loading = true);

    final user = FirebaseAuth.instance.currentUser;
    final fotoUrl = await uploadFoto();

    await FirebaseFirestore.instance.collection('laporan').add({
      'judul': _judulController.text,
      'deskripsi': _deskripsiController.text,
      'status': 'Dikirim',
      'tanggal': Timestamp.now(),
      'userId': user!.uid,
      'fotoUrl': fotoUrl,
    });

    setState(() => _loading = false);

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text('Tambah Laporan'),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= FOTO =================
            GestureDetector(
              onTap: pilihFoto,
              child: Container(
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(14),
                ),
                child: _image == null
                    ? const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.camera_alt, size: 40),
                            SizedBox(height: 8),
                            Text('Upload Foto'),
                          ],
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.file(
                          _image!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                      ),
              ),
            ),

            const SizedBox(height: 20),

            // ================= JUDUL =================
            TextField(
              controller: _judulController,
              decoration: InputDecoration(
                labelText: 'Judul Laporan',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ================= DESKRIPSI =================
            TextField(
              controller: _deskripsiController,
              maxLines: 4,
              decoration: InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ================= BUTTON =================
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _loading ? null : simpanLaporan,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: _loading
                    ? const CircularProgressIndicator(color: Colors.white)
                    : const Text(
                        'Kirim Laporan',
                        style: TextStyle(fontSize: 16),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
