// konfigurasi endpoin di api

const url = "http://localhost/workshop_rest_api/webServices";

class NetworkURL {
  static String getData() {
    return "$url/get_data.php";
  }

  static String tambahData() {
    return "$url/tambah_data.php";
  }

  static String updateData() {
    return "$url/ubah_data.php";
  }

  static String ubahHistory() {
    return "$url/ubah_history.php";
  }

  static String hapusData() {
    return "$url/delete_data.php";
  }
}
