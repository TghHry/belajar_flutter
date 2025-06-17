import 'package:flutter/material.dart';



class TugasTiga extends StatelessWidget {
  const TugasTiga({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffEAE4D5),
      appBar: AppBar(
        backgroundColor: Color(0xffB6B09F),
        title: Center(
          child: Text(
            "Formulir & Galeri Warna",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffEAE4D5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Center(
                        child: Text(
                          'Formulir',
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 10,
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Nama',
                          prefixIcon: Icon(Icons.person),
                          hintText: "Masukkan Nama",
                          filled: true,
                          fillColor: Color(0xffF2F2F2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(
                              color: Color(0xffB6B09F),
                              width: 3,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 10,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          hintText: "Masukkan Email",
                          filled: true,
                          fillColor: Color(0xffF2F2F2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xffB6B09F),
                              width: 3,
                            ),
                          ),
                          prefixIcon: Icon(Icons.email),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 10,
                      ),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'No. HP',
                          hintText: "Masukkan Nomor HP",
                          filled: true,
                          fillColor: Color(0xffF2F2F2),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xffB6B09F),
                              width: 3,
                            ),
                          ),
                          prefixIcon: Icon(Icons.phone),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 8,
                        right: 8,
                        bottom: 15,
                      ),
                      child: TextField(
                        maxLength: 50,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          labelText: 'Deskripsi',
                          hintText: "Masukkan Deskripsi",
                          fillColor: Color(0xffF2F2F2),
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide(
                              color: Color(0xffB6B09F),
                              width: 3,
                            ),
                          ),
                          prefixIcon: Icon(Icons.notes),
                        ),
                      ),
                    ),
                    Divider(),
                    Center(
                      child: Text(
                        'Galeri Warna',
                        style: TextStyle(
                          fontSize: 24,
                          color: Colors.black87,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    GridView.count(
                      padding: EdgeInsets.all(15),
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                      crossAxisCount: 2,
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: <Widget>[
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff5B913B),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Warna 1',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff77B254),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Warna 2',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFE8B6),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Warna 3',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffFFE8B6),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Warna 4',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xff6E8E59),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Warna 5',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Stack(
                          alignment: Alignment.center,
                          children: [
                            Container(
                              height: 300,
                              width: 300,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color(0xffEAFAEA),
                              ),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Container(
                                  height: 27,
                                  width: 75,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(3),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Warna 6',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
