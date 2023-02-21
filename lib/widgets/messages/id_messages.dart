import 'lookupmessages.dart';

/// Indonesia Messages
class IdMessages implements LookupMessages {
  @override
  String back() => 'Kembali';

  @override
  String ohSnap() => 'Oh Snap!';

  @override
  String success() => 'Berhasil';

  @override
  String tryAgain() => 'Coba Lagi';

  @override
  String noData() => 'Tidak ada data yang tersedia';

  @override
  String noResult() => 'Tidak ada hasil yang ditemukan';

  @override
  String searching() => 'Mencari ...';

  @override
  String badRequest() => "Permintaan yang buruk";

  @override
  String conflict() => "409 | Kesalahan karena konflik";
  @override
  String conflictDesc() =>
      "Konflik permintaan dengan status sumber daya target saat ini.";

  @override
  String formatException() => "Terjadi kesalahan tak terduga";

  @override
  String internalServerError() => "500 | Kesalahan Server";
  @override
  String internalServerErrorDesc() =>
      "Terjadi kesalahan internal di server. Ini mungkin karena kesalahan aplikasi atau masalah konfigurasi";

  @override
  String methodNotAllowed() => "Method tidak diperbolehkan";

  @override
  String noInternetConnection() => "Tidak ada koneksi internet";

  @override
  String notAcceptable() => "Tidak dapat diterima";

  @override
  String notFound() => "404 | Tidak ditemukan";
  @override
  String notFoundDesc() => "Sumber daya yang diminta tidak ada";

  @override
  String notImplemented() => "Tidak diimplementasikan";

  @override
  String requestCancelled() => "Permintaan dibatalkan";

  @override
  String requestTimeout() => "408 | Permintaan Batas Waktu";
  @override
  String requestTimeoutDesc() =>
      "Server ingin mematikan koneksi yang tidak digunakan ini. Itu dikirim pada koneksi idle oleh server, bahkan tanpa permintaan sebelumnya oleh klien.";

  @override
  String sendTimeout() => "Kirim batas waktu sehubungan dengan server API";

  @override
  String serviceUnavailable() => "503 | Layanan Tidak Tersedia";
  @override
  String serviceUnavailableDesc() =>
      "Maaf atas ketidaknyamanannya, tetapi kami sedang melakukan pemeliharaan saat ini. Anda selalu dapat menghubungi kami, jika tidak, kami akan segera kembali online";

  @override
  String somethingWhenWrong() => "Terjadi Kesalah";
  @override
  String somethingWhenWrongDesc() =>
      "Silakan coba atau laporkan masalah ke tim suport kami";

  @override
  String unableToProcess() => "Tidak Dapat Memproses Data";
  @override
  String unableToProcessDesc() =>
      "Aplikasi tidak dapat memproses data yang Anda minta";

  @override
  String unauthorisedRequest() => "Unauthorised";
  @override
  String unauthorisedRequestDesc() =>
      "Harap masuk terlebih dahulu untuk melanjutkan";

  @override
  String unexpectedError() => "Terjadi kesalahan tak terduga";
}
