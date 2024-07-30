import 'package:flutter/material.dart';
import 'package:flutter_restapi_app/models/data_model.dart';
import 'package:flutter_restapi_app/network/network.dart';
import 'package:flutter_restapi_app/repository/auth_repository.dart';

class HomeNotifier extends ChangeNotifier {
  final BuildContext context;

  HomeNotifier({required this.context}) {
    getData();
  }

  List<DataModel> list = [];

  Future getData() async {
    //agar data yg ditampilkan di ui tidak duplikat
    list.clear();
    //uji program yg sudah dibuat di notifier
    notifyListeners();

    AuthRepository.getData(NetworkURL.getData()).then((value) {
      if (value['value'] == 1) {
        for (Map<String, dynamic> i in value['data']) {
          list.add(DataModel.fromJson(i));
        }

        notifyListeners();
      } else {
        notifyListeners();
      }
    });
  }

  // tambah data

  TextEditingController nama = TextEditingController();
  TextEditingController deskripsi = TextEditingController();

  final keyForm = GlobalKey<FormState>();

  cek() {
    // validasi apakah text editing controller nya sudah terisi atau belum
    if (keyForm.currentState!.validate()) {
      simpan();
    }
  }

  simpan() async {
    AuthRepository.tambahData(
            NetworkURL.tambahData(), nama.text.trim(), deskripsi.text.trim())
        .then((value) {
      if (value['value'] == 1) {
        final snackBar = SnackBar(content: Text(value['message']));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        getData();
        notifyListeners();
      } else {
        final snackBar = SnackBar(content: Text(value['message']));

        ScaffoldMessenger.of(context).showSnackBar(snackBar);

        notifyListeners();
      }
    });
  }

  // ubah History

  ubahHistory(DataModel model) async {
    AuthRepository.ubahDataHistory(NetworkURL.ubahHistory(), model.id)
        .then((value) {
      if (value['value'] == 1) {
        final snackBar = SnackBar(content: Text(value['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        getData();
        notifyListeners();
      } else {
        final snackBar = SnackBar(content: Text(value['message']));
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
        notifyListeners();
      }
    });
  }
}
