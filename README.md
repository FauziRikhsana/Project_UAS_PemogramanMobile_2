👨‍💻 Developer
Nama: Fauzi Rikhshana 
NPM: 23552011030
Proyek: Tugas Besar UAS Individu Flutter 
Semester: 5

🏙️ Kota Indah Mobile App
Aplikasi pelaporan masyarakat berbasis Flutter yang memungkinkan pengguna melaporkan permasalahan lingkungan seperti jalan rusak, lampu mati, dan sampah menumpuk danlainnya.
Aplikasi ini terintegrasi dengan Firebase dan REST API, serta mendukung Android, PWA (Web), dan siap dikembangkan lebih lanjut.

📌 Deskripsi Proyek

Kota Indah Mobile merupakan aplikasi mobile yang dibuat untuk memenuhi Tugas Besar UAS Individu Mata Kuliah Mobile Programming.
Aplikasi ini bertujuan untuk:

1.Memudahkan masyarakat dalam membuat laporan
2.Memantau status laporan secara real-time
3.emberikan edukasi singkat terkait kepedulian lingkungan

🛠️ Teknologi yang Digunakan

Flutter (Dart)
Firebase
Firebase Authentication
Cloud Firestore
Firebase Storage (Upload Foto)
REST API / Mock API
Material UI
Android SDK

Netlify (untuk PWA/Web)

📱 Fitur Utama
🔐 Autentikasi
Login
Register
Logout

Auth Gate (redirect otomatis berdasarkan status login)

🏠 User Home
Header gambar (branding kota)
Edukasi masyarakat
Daftar laporan milik user
Status laporan (Dikirim, Diproses, Selesai)

📝 Laporan
Tambah laporan baru
Upload foto laporan
Isi deskripsi & kategori
Simpan data ke Firebase Firestore

👤 Akun
Informasi akun pengguna
Logout

🎨 UI/UX
Warna dapat dikustomisasi
Desain modern & responsif
Siap ditambahkan animasi (bonus)

🧭 Struktur Folder
lib/
│
├── models/
│   ├── user_model.dart
│   └── laporan_model.dart
│
├── pages/
│   ├── login_page.dart
│   ├── register_page.dart
│   ├── home_page.dart
│   ├── laporan_page.dart
│   └── akun_page.dart
│
├── user/
│   ├── user_home.dart
│   └── tambah_laporan.dart
│
├── services/
│   ├── auth_service.dart
│   └── api_service.dart
│
└── main.dart

🔄 Alur Aplikasi
User membuka aplikasi
Auth Gate mengecek status login
Jika belum login → halaman Login / Register
Jika sudah login → User Home
User dapat:
Melihat laporan
Menambah laporan
Melihat status laporan
Data tersimpan di Firebase
