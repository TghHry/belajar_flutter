import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TugasLimaFlutter extends StatefulWidget {
  const TugasLimaFlutter({super.key});

  @override
  State<TugasLimaFlutter> createState() => _TugasLimaFlutterState();
}

class _TugasLimaFlutterState extends State<TugasLimaFlutter> {
  String nama = "Steven Oscar";
  bool isNameVisible = true;
  bool isFavorite = false;
  bool isDescOpened = false;
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 50, 62, 70),
      appBar: AppBar(
        title:
            isNameVisible
                ? Padding(
                  padding: const EdgeInsets.only(left: 4),
                  child: Text.rich(
                    TextSpan(
                      text: "Nama saya : \n",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Color(0xff00ADB5),
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        TextSpan(
                          text: nama,
                          style: TextStyle(
                            fontFamily: "Montserrat",
                            color: Color(0xffEEEEEE),
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
                : SizedBox(),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff00ADB5),
              ),
              onPressed: () {
                setState(() {
                  isNameVisible = !isNameVisible;
                });
              },
              child: Text(
                isNameVisible ? "Sembunyikan Nama" : "Tampilkan Nama",
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Color(0xffEEEEEE),
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
        backgroundColor: Color(0XFF303841),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xff00ADB5),
        onPressed: () {
          setState(() {
            counter++;
          });
        },
        child: Icon(Icons.add, color: Color(0xffEEEEEE), size: 30),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Text(
                    "Notes count :",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Color(0xff00ADB5),
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  SizedBox(width: 10),
                  Text(
                    counter.toString(),
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Color(0xffEEEEEE),
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            //
            ListView.builder(
              itemCount: counter,
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: NoteCard(),
                );
              },
            ),
            GestureDetector(
              onTap: () {
                print("Ditekan sekali");
              },
              onDoubleTap: () {
                print("Ditekan dua kali");
              },
              onLongPress: () {
                print("Tahan lama");
              },
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 40),
                padding: EdgeInsets.symmetric(vertical: 12),
                decoration: BoxDecoration(
                  color: Color(0xff00ADB5),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Center(
                  child: Text(
                    "Tekan Aku",
                    style: TextStyle(
                      fontFamily: "Montserrat",
                      color: Color(0xffEEEEEE),
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 128),
          ],
        ),
      ),
    );
  }
}

class NoteCard extends StatefulWidget {
  const NoteCard({super.key});

  @override
  State<NoteCard> createState() => _NoteCardState();
}

class _NoteCardState extends State<NoteCard> {
  bool isFavorite = false;
  bool isDescOpened = false;
  bool isTagVisible = false;
  String currentTime = DateFormat("dd MMMM yyyy  hh:mm").format(DateTime.now()).toString();
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      padding: EdgeInsets.only(left: 20, right: 20, top: 24, bottom: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  "Lorem Ipsum Dolor sit Amet",
                  style: TextStyle(
                    fontFamily: "Montserrat",
                    color: Color(0xff00ADB5),
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              SizedBox(width: 16),
              Text(
                currentTime,
                style: TextStyle(
                  fontFamily: "Montserrat",
                  color: Colors.black,
                  fontWeight: FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          SizedBox(
            child: Text(
              "Neque nihil consequatur est. Consequatur beatae quia voluptate dolor ea minus. Corrupti tenetur et molestiae perferendis officia sed eius.Laboriosam repudiandae quasi exercitationem nulla repellat. Illum nihil velit quaerat et reiciendis et exercitationem. Magnam commodi ut corporis iure. Odit debitis velit voluptate sint maiores vel illo totam et. Deserunt quidem necessitatibus. Tempore unde ducimus consequatur tempora explicabo fuga blanditiis. Impedit ut qui nesciunt quo. Cumque est doloribus ducimus voluptatem porro nobis omnis.",
              style: TextStyle(
                fontFamily: "Montserrat",
                color: Colors.black,
                fontSize: 13,
              ),
              overflow: TextOverflow.ellipsis,
              maxLines: isDescOpened ? 100 : 5,
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.zero,
              child: TextButton(
                style: TextButton.styleFrom(
                  overlayColor: Colors.transparent,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                onPressed: () {
                  setState(() {
                    isDescOpened = !isDescOpened;
                  });
                },
                child: Text(
                  isDescOpened ? "Lihat lebih sedikit" : "Lihat selengkapnya",
                  style: TextStyle(
                    fontFamily: "Montserrat",

                    color: Color(0xff00ADB5),
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ),
          Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
                icon: Icon(
                  isFavorite ? Icons.favorite : Icons.favorite_border_outlined,
                  color: isFavorite ? Colors.red : Colors.black,
                ),
              ),
              Spacer(),
              InkWell(
                radius: 30,
                splashColor: Colors.green,
                onTap: () {
                  setState(() {
                    isTagVisible = !isTagVisible;
                    print("Kotak disentuh");
                  });
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: Color(0xff00ADB5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      isTagVisible ? "Hide Tags" : "Show Tags",
                      style: TextStyle(
                        fontFamily: "Montserrat",
                        color: Color(0xffEEEEEE),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ),
              isTagVisible
                  ? Row(
                    spacing: 4,
                    children: [
                      SizedBox(width: 4),
                      Text(
                        "#Lorem",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "#Cool",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "#wkwkwk",
                        style: TextStyle(
                          fontFamily: "Montserrat",
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  )
                  : SizedBox(),
            ],
          ),
        ],
      ),
    );
  }
}