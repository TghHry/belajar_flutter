import 'package:flutter/material.dart';
import 'package:belajar_flutter2/constant/app_image.dart';
// import 'package:belajar_flutter2/meet_14/model/product_model.dart';
import 'package:belajar_flutter2/meet_14_tugas/model_tugas/product_model_tugas.dart';

class ModelWidget extends StatefulWidget {
  const ModelWidget({super.key});

  @override
  State<ModelWidget> createState() => _ModelWidgetState();
}

class _ModelWidgetState extends State<ModelWidget> {
  final List<ProductModel> dataProduct = [
    ProductModel(
      id: "1",
      productName: "Tiket Bioskop",
      productPrice: "50000 - 100000",
      productImage: AppImage.bioskop,
    ),
    ProductModel(
      id: "2",
      productName: "Tiket Konser & Musik",
      productPrice: "25000 - 200000",
      productImage: AppImage.musik,
    ),
    ProductModel(
      id: "3",
      productName: "Tiket Wisata / Tempat Rekreasi",
      productPrice: "15000 - 200000",
      productImage: AppImage.wisata,
    ),
    ProductModel(
      id: "4",
      productName: "Tiket Event / Festival Lokal",
      productPrice: "150000 - 2000000",
      productImage: AppImage.event,
    ),
    ProductModel(
      id: "5",
      productName: "Voucher Restoran / Cafe",
      productPrice: "150000 - 150000",
      productImage: AppImage.restoran,
    ),
    ProductModel(
      id: "6",
      productName: "Voucher Belanja Supermarket",
      productPrice: "15000 - 100000",
      productImage: AppImage.belanja,
    ),
    ProductModel(
      id: "7",
      productName: "Voucher Marketplace (Tokopedia, Shopee, dll)",
      productPrice: "15000 - 50000",
      productImage: AppImage.marketplace,
    ),
    ProductModel(
      id: "8",
      productName: "Tiket Transportasi (Bus, Kereta)",
      productPrice: "150000 - 2000000",
      productImage: AppImage.transportasi,
    ),
    ProductModel(
      id: "9",
      productName: "Tiket Pesawat / Penerbangan",
      productPrice: "1500000 - 5000000",
      productImage: AppImage.pesawat,
    ),
    ProductModel(
      id: "10",
      productName: "Tiket Hotel & Akomodasi",
      productPrice: "1500000 - 2000000",
      productImage: AppImage.hotel,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kategori Voucher dan Tiket")),
      body: ListView.builder(
        itemCount: dataProduct.length,
        itemBuilder: (BuildContext context, int index) {
          final product = dataProduct[index];
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white24,
                border: Border(
                    bottom:
                        BorderSide(color: Colors.black))),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(product.productImage ?? ""),
              ),
              title: Text(product.productName ?? ""),
              subtitle: Text("Rp. ${product.productPrice ?? '0'} "),
              trailing: Icon(Icons.shopping_cart),
            ),
          );
        },
      ),
    );
  }
}
