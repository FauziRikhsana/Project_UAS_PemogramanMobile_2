import 'package:flutter/material.dart';

// ================= EDUKASI COLOR CONFIG =================
const Color edukasiBgColor = Color(0xFFE3F2FD);
const Color edukasiTitleColor = Color(0xFF1565C0);
const Color edukasiTextColor = Color(0xFF37474F);
const Color edukasiBorderColor = Color(0xFF90CAF9);

class UserHome extends StatelessWidget {
  const UserHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ================= HEADER IMAGE =================
              Container(
                height: 200,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/kota.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // ================= EDUKASI =================
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  decoration: BoxDecoration(
                    color: edukasiBgColor,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(color: edukasiBorderColor, width: 1),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // ICON
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: edukasiTitleColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(
                            Icons.info_outline,
                            color: Colors.white,
                            size: 24,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // TEXT
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Edukasi Masyarakat',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: edukasiTitleColor,
                                ),
                              ),
                              const SizedBox(height: 6),
                              Text(
                                'Laporkan permasalahan lingkungan seperti jalan rusak, '
                                'sampah menumpuk, atau fasilitas umum rusak agar segera '
                                'ditindaklanjuti oleh petugas terkait.',
                                style: TextStyle(
                                  fontSize: 14,
                                  color: edukasiTextColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // ================= JUDUL LAPORAN =================
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  'Laporan Saya',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),

              const SizedBox(height: 12),

              // ================= LIST LAPORAN =================
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 6,
                    ),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: const Icon(Icons.report, color: Colors.orange),
                        title: Text(
                          index == 0
                              ? 'Jalan Rusak'
                              : index == 1
                              ? 'Lampu Jalan Mati'
                              : 'Sampah Menumpuk',
                          style: const TextStyle(fontWeight: FontWeight.w600),
                        ),
                        subtitle: Text(
                          index == 0
                              ? 'Status: Diproses'
                              : index == 1
                              ? 'Status: Dikirim'
                              : 'Status: Selesai',
                        ),
                        trailing: Chip(
                          label: Text(
                            index == 2 ? 'Selesai' : 'Proses',
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: index == 2
                              ? Colors.green
                              : Colors.orange,
                        ),
                      ),
                    ),
                  );
                },
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
