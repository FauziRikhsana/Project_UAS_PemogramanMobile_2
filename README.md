<h1 align="center">🏙️ Kota Indah Mobile App</h1>

<p align="center">
  <b>Aplikasi Pelaporan Masyarakat Berbasis Flutter</b><br>
  Tugas Besar UAS Individu – Mobile Programming
</p>

<hr>

<h2>👨‍💻 Developer</h2>
<ul>
  <li><b>Nama</b> : Fauzi Rikhshana</li>
  <li><b>NPM</b> : 23552011030</li>
  <li><b>Semester</b> : 5</li>
  <li><b>Proyek</b> : Tugas Besar UAS Individu Flutter</li>
</ul>

<hr>

<h2>📱 Tentang Aplikasi</h2>
<p>
<b>Kota Indah Mobile</b> adalah aplikasi pelaporan masyarakat berbasis <b>Flutter</b> 
yang memungkinkan pengguna melaporkan permasalahan lingkungan seperti:
</p>

<ul>
  <li>Jalan rusak</li>
  <li>Lampu jalan mati</li>
  <li>Sampah menumpuk</li>
  <li>Dan permasalahan lingkungan lainnya</li>
</ul>

<p>
Aplikasi ini terintegrasi dengan <b>Firebase</b> dan <b>REST API</b>, serta mendukung 
<b>Android</b> dan <b>PWA (Web)</b>.
</p>

<hr>

<h2>🎯 Tujuan Proyek</h2>
<ul>
  <li>Memudahkan masyarakat dalam membuat laporan</li>
  <li>Memantau status laporan secara real-time</li>
  <li>Memberikan edukasi singkat terkait kepedulian lingkungan</li>
</ul>

<hr>

<h2>🛠️ Teknologi yang Digunakan</h2>
<ul>
  <li>Flutter (Dart)</li>
  <li>Firebase Authentication</li>
  <li>Cloud Firestore</li>
  <li>Firebase Storage (Upload Foto)</li>
  <li>REST API / Mock API</li>
  <li>Material UI</li>
  <li>Android SDK</li>
  <li>Netlify (PWA / Web)</li>
</ul>

<hr>

<h2>✨ Fitur Utama</h2>

<h3>🔐 Autentikasi</h3>
<ul>
  <li>Login</li>
  <li>Register</li>
  <li>Logout</li>
  <li>Auth Gate (redirect otomatis berdasarkan status login)</li>
</ul>

<h3>🏠 User Home</h3>
<ul>
  <li>Header gambar (branding kota)</li>
  <li>Edukasi masyarakat</li>
  <li>Daftar laporan milik user</li>
  <li>Status laporan:
    <ul>
      <li>Dikirim</li>
      <li>Diproses</li>
      <li>Selesai</li>
    </ul>
  </li>
</ul>

<h3>📝 Laporan</h3>
<ul>
  <li>Tambah laporan baru</li>
  <li>Upload foto laporan</li>
  <li>Isi deskripsi dan kategori</li>
  <li>Simpan data ke Firebase Firestore</li>
</ul>

<h3>👤 Akun</h3>
<ul>
  <li>Informasi akun pengguna</li>
  <li>Logout</li>
</ul>

<hr>

<h2>🎨 UI / UX</h2>
<ul>
  <li>Warna dapat dikustomisasi</li>
  <li>Desain modern dan responsif</li>
  <li>Siap dikembangkan dengan animasi (bonus)</li>
</ul>

<hr>

<h2>🧭 Struktur Folder</h2>

<pre>
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
│   ├── akun_page.dart
|   ├── auth_page.dart
|   ├── main_page.dart
|   └── gate.dart
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
</pre>

<hr>

<h2>🔄 Alur Aplikasi</h2>
<ol>
  <li>User membuka aplikasi</li>
  <li>Auth Gate mengecek status login</li>
  <li>Jika belum login → Halaman Login / Register</li>
  <li>Jika sudah login → User Home</li>
  <li>User dapat:
    <ul>
      <li>Melihat laporan</li>
      <li>Menambah laporan</li>
      <li>Melihat status laporan</li>
    </ul>
  </li>
  <li>Data tersimpan di Firebase</li>
</ol>

<hr>

<p align="center">
  <b>📌 Kota Indah Mobile App</b><br>
  Tugas Besar UAS Individu – Mobile Programming
</p>
