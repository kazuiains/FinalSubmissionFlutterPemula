import 'package:flutter/material.dart';

class DeveloperScreen extends StatelessWidget {
  const DeveloperScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.arrow_back,
                      ),
                    ),
                    Text(
                      "Tentang Developer",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                width: double.infinity,
                height: 330,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)),
                      child: Image.asset(
                        "images/background_1.jpg",
                        height: 250,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          "images/profile_1.jpg",
                          height: 120,
                          width: 120,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                "Muhammad Adi Yusuf",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 0, 16),
                child: Text("Jakarta, 4 Agustus 1999"),
              ),
              statusBox(
                  title: "Data Diri",
                  widget: Table(
                    columnWidths: const <int, TableColumnWidth>{
                      0: FixedColumnWidth(80),
                      1: FlexColumnWidth(),
                    },
                    children: [
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          child: Text("Nama"),
                        ),
                        Text("Muhammad Adi Yusuf"),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          child: Text("Pekerjaan"),
                        ),
                        Text("Android Developer"),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          child: Text("Gelar"),
                        ),
                        Text("S.Kom"),
                      ]),
                      TableRow(children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 2, 0, 2),
                          child: Text("No/WA"),
                        ),
                        Text("087812433936"),
                      ]),
                    ],
                  )),
              statusBox(title: "Pengenalan Singkat", body: "Seorang pekerja yang memiliki hobi ngegame, nonton anime dan membaca komik.")
            ],
          ),
        ),
      ),
    );
  }

  Widget statusBox({Widget? widget, String? body, required String title}) {
    return Padding(
      padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(24, 24, 24, 15),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "images/profile_1.jpg",
                      width: 40,
                      height: 40,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Muhammad Adi Yusuf",
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
            if (body != null) ...[
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: Text(body,
                    style: TextStyle(
                      fontSize: 14,
                    )),
              )
            ] else if (widget != null) ...[
              Padding(
                padding: EdgeInsets.fromLTRB(24, 0, 24, 24),
                child: widget,
              )
            ]
          ],
        ),
      ),
    );
  }
}
