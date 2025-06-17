import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TugasLima(),
    );
  }
}

class TugasLima extends StatefulWidget {
  const TugasLima({super.key});

  @override
  State<TugasLima> createState() => _TugasLimaState();
}

class _TugasLimaState extends State<TugasLima> {
  bool showName = false;
  bool isFavorite = false;
  bool showMore = false;
  int counter = 0;
  bool showBoxText = false;
  bool tampilLoading = false;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Tugas Lima"),
        backgroundColor: Colors.blue,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: Center(
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    showName = !showName;
                  });
                },
                child: Text(showName ? "Sembunyikan Nama" : "Tampilkan Nama"),
              ),
            ),
          ),
          if (showName)
            Text(
              "Nama Saya : Teguh Hariyanto",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          SizedBox(height: 18),

          //icon button
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: isFavorite ? Colors.red : Colors.green,
                ),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
              if (isFavorite)
                Text(
                  "Disukai",
                  style: TextStyle(fontSize: 18, color: Colors.red),
                ),
            ],
          ),
          SizedBox(height: 18),
          //text button
          TextButton(
            onPressed: () {
              setState(() {
                showMore = !showMore;
              });
            },
            child: Text(showMore ? "Sembunyikan" : "Lihat Selengkapnya"),
          ),
          if (showMore)
            Text(
              "Saya seorang pembelajar flutter pemula yang ingin membuat aplikasi "
              "bermanfaat di era digital, baik untuk diri sendiri maupun masyarakat. ",
              style: TextStyle(fontSize: 16),
            ),
          SizedBox(height: 16),
          Text(
            "Nilai : $counter",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 16),
          Ink.image(
            image: AssetImage("assets/images/download.jpg"),
            height: 200,
            width: 200,
            fit: BoxFit.cover,
            child: InkWell(
              splashColor: Colors.blue,
              onTap: () {
                print("gambar di klik");
                setState(() {
                  showBoxText = !showBoxText;
                });
              },
              child: Center(
                child: Container(
                  color: const Color.fromARGB(255, 235, 229, 229),
                  padding: EdgeInsets.all(8),
                  child: Text(
                    showBoxText ? "Gambar Disentuh" : "klik gambar ini",
                    style: TextStyle(
                        fontSize: 15,
                        color: const Color.fromARGB(255, 122, 139, 153)),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: () => debugPrint("Ditekan sekali"),
            onDoubleTap: () => debugPrint("Ditekan dua kali"),
            onLongPress: () => debugPrint("Tahan lama"),
            child: Container(
              padding: const EdgeInsets.all(12),
              color: Colors.blue[100],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.touch_app, size: 24, color: Colors.blue),
                  SizedBox(width: 18),
                  Text(
                    "Tekan Disini",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
