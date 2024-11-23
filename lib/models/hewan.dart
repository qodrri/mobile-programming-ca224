class Hewan {
  final String id; // Unique ID untuk tiap hewan
  String namaSpesies;
  String namaIndonesia;
  String deskripsi;
  String gambar; // URL atau path gambar

  Hewan({
    required this.id,
    required this.namaSpesies,
    required this.namaIndonesia,
    required this.deskripsi,
    required this.gambar,
  });
}
