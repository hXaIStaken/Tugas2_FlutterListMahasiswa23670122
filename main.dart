import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Mahasiswa',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: MahasiswaListPage(),
    );
  }
}

class Mahasiswa {
  final String nama;
  final String nim;
  final String prodi;
  final int semester;
  final String avatar;

  Mahasiswa({
    required this.nama,
    required this.nim,
    required this.prodi,
    required this.semester,
    required this.avatar,
  });
}

class MahasiswaListPage extends StatelessWidget {
  MahasiswaListPage({super.key});

  final List<Mahasiswa> mahasiswaList = [
    Mahasiswa(
      nama: 'Rizqi Dian Saputra',
      nim: '23670122',
      prodi: 'Teknik Informatika',
      semester: 5,
      avatar: '👨‍🎓',
    ),
    Mahasiswa(
      nama: 'Siti Aminah',
      nim: '23670123',
      prodi: 'Sistem Informasi',
      semester: 4,
      avatar: '👩‍🎓',
    ),
    Mahasiswa(
      nama: 'Budi Santoso',
      nim: '23670124',
      prodi: 'Teknik Informatika',
      semester: 5,
      avatar: '🧑‍💻',
    ),
    Mahasiswa(
      nama: 'Dewi Anggraini',
      nim: '23670125',
      prodi: 'Teknik Komputer',
      semester: 3,
      avatar: '👩‍💻',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Mahasiswa'), centerTitle: true),
      body: ListView.builder(
        itemCount: mahasiswaList.length,
        itemBuilder: (context, index) {
          final mhs = mahasiswaList[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 28,
                backgroundColor: Colors.blue.shade50,
                child: Text(mhs.avatar, style: const TextStyle(fontSize: 28)),
              ),
              title: Text(
                mhs.nama,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'NIM: ${mhs.nim}\n${mhs.prodi} - Semester ${mhs.semester}',
              ),
              isThreeLine: true,
              trailing: const Icon(Icons.arrow_forward_ios, size: 18),
              onTap: () {
                // contoh interaksi
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Detail: ${mhs.nama}')));
              },
            ),
          );
        },
      ),
    );
  }
}
