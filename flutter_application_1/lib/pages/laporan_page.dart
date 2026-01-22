import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LaporanPage extends StatefulWidget {
  const LaporanPage({super.key});

  @override
  State<LaporanPage> createState() => _LaporanPageState();
}

class _LaporanPageState extends State<LaporanPage> {
  final judulC = TextEditingController();
  final deskC = TextEditingController();

  Future<void> kirim() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) return;

    await FirebaseFirestore.instance.collection('laporan').add({
      'judul': judulC.text,
      'deskripsi': deskC.text,
      'userId': user.uid,
      'createdAt': Timestamp.now(),
    });

    judulC.clear();
    deskC.clear();

    if (!mounted) return;
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Laporan terkirim')));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buat Laporan')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: judulC,
              decoration: const InputDecoration(
                labelText: 'Judul Laporan',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: deskC,
              maxLines: 4,
              decoration: const InputDecoration(
                labelText: 'Deskripsi',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: kirim,
                icon: const Icon(Icons.send),
                label: const Text('Kirim Laporan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
