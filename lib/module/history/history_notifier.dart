import 'package:flutter/material.dart';
import 'package:flutter_restapi_app/models/data_model.dart';
import 'package:flutter_restapi_app/network/network.dart';
import 'package:flutter_restapi_app/repository/auth_repository.dart';

class HistoryNotifier extends ChangeNotifier {
  final BuildContext context;

  HistoryNotifier({required this.context}) {
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
          if (i['status'] != "DIBUAT") {
            list.add(DataModel.fromJson(i));
          }
        }

        notifyListeners();
      } else {
        notifyListeners();
      }
    });
  }

  // hapus data

  hapusData(DataModel model) async {
    AuthRepository.hapusData(NetworkURL.hapusData(), model.id).then((value) {
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
