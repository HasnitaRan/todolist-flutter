import 'package:flutter/material.dart';
import 'package:flutter_restapi_app/module/history/history_notifier.dart';
import 'package:provider/provider.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => HistoryNotifier(context: context),
      child: Consumer<HistoryNotifier>(
        builder: (context, value, child) => Scaffold(
          body: Column(
            // stretch = ditarik kesamping/ di full kan
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                padding: EdgeInsets.all(8),
                height: 60,
                color: Colors.blueGrey,
                child: Row(
                  children: [
                    SizedBox(width: 12),
                    InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "History List",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: RefreshIndicator(
                  onRefresh: () => value.getData(),
                  child: ListView(children: [
                    Container(
                      padding: EdgeInsets.all(22),
                      child: ListView.builder(
                        itemCount: value.list.length,
                        shrinkWrap: true,
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          final data = value.list[index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Container(
                                padding: EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(5, 5),
                                          blurRadius: 5,
                                          color: Colors.grey[200] ??
                                              Colors.transparent)
                                    ]),
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${data.nama}",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                        Text(
                                          "${data.deskripsi}",
                                          style: TextStyle(fontSize: 16),
                                        ),
                                      ],
                                    ),
                                    // jarak antara kanan dan kiri
                                    Spacer(),
                                    InkWell(
                                        onTap: () {
                                          value.hapusData(data);
                                        },
                                        child: Text(
                                          "Hapus Data",
                                          style: TextStyle(color: Colors.blue),
                                        )),
                                  ],
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    ),
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
