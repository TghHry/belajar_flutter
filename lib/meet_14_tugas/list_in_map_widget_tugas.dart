import 'package:flutter/material.dart';
// import 'package:belajar_flutter2/meet_14/map_widget.dart';
// import 'package:belajar_flutter2/meet_14/list_widget.dart';
import 'package:belajar_flutter2/constant/app_style.dart';

class ListInMapWidget extends StatefulWidget {
  const ListInMapWidget({super.key});

  @override
  State<ListInMapWidget> createState() => _ListInMapWidgetState();
}

class _ListInMapWidgetState extends State<ListInMapWidget> {
  final List<Map<String, dynamic>> dataUser = [
    {
      'nama': 'Tiket / Voucher Umum',
      "icon": Icons.confirmation_num,
    },
    {
      'nama': 'Tiket Konser / Musik',
      "icon": Icons.music_note,
    },
    {
      'nama': 'Tiket Bioskop',
      "icon": Icons.movie,
    },
    {
      'nama': 'Tiket Transportasi',
      "icon": Icons.directions_bus,
    },
    {'nama': 'Tiket Pesawat', "icon": Icons.flight},
    {'nama': 'voucher belanja', "icon": Icons.local_offer},
    {
      'nama': 'voucher game',
      "icon": Icons.videogame_asset,
    },
    {
      'nama': 'tiket events',
      "icon": Icons.event,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("List in Map")),
      body: ListView.builder(
        itemCount: dataUser.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: Text(
              "${index + 1}",
              style: AppStyle.fontBold(fontSize: 18),
            ),
            title: Text("${dataUser[index]["nama"]}"),
            // subtitle: Text("Umur : ${dataUser[index]["umur"]}"),
            trailing: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => dataUser[index]["route"],
                  ),
                );
              },
              icon: Icon(dataUser[index]["icon"], color: Colors.red),
            ),
          );
        },
      ),
    );
  }
}
