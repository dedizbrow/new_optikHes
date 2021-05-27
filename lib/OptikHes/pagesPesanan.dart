//get(idPesanan), post(metodeBayar,idMenu,jml)

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_optikhes/menuUmumModel.dart';

class PesananOpHes extends StatelessWidget {
  int totalHarga;
  Map<String, dynamic> tempCart = new Map<String, dynamic>();
  PesananOpHes(this.tempCart, this.totalHarga);
  bool newbuild = false;
  List idPesanan = ['x001', 'x002', 'x003'];
  int jmlItem;
  TabController controller;
  List listMetode = ['Cash', 'Potongan Gaji'];
  String metode = 'Cash';
  String status = 'Pesan Sekarang';
  bool warnaButton = false;
  int z = 1;

  Key newkey;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: tempCart.length == 0
            ? null
            : Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Container(
                            color: Colors.white,
                            padding: const EdgeInsets.only(
                                left: 15, top: 12, right: 10),
                            child: Row(
                              children: [
                                Text('Subtotal :',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18)),
                                Expanded(
                                  child: SizedBox(
                                    width: 10,
                                  ),
                                ),
                                Text('Rp $totalHarga',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ))),
                    Row(
                      children: [
                        Expanded(
                          child: RaisedButton(
                            padding: EdgeInsets.all(5),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            color: Colors.orange,
                            onPressed: () {},
                            child: Text(
                              "ORDER",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
        appBar: AppBar(
          title: TextFormField(
              decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            contentPadding: EdgeInsets.all(10),
          )),
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
              onPressed: () {
                newbuild
                    ? _showMyDialog(context)
                    : Navigator.pushNamed(context, '/MenuCat1');
              }),
          actions: <Widget>[
            Positioned(
                child: Column(
              children: [
                Stack(children: [
                  IconButton(
                      icon: Icon(
                        Icons.add_shopping_cart,
                        color: Colors.black,
                        size: 25,
                      ),
                      onPressed: () {}),
                  Positioned(
                    left: 17,
                    top: 7,
                    child: Icon(Icons.brightness_1,
                        size: 15.0, color: Colors.orange),
                  ),
                  Positioned(
                      left: 21,
                      top: 8,
                      child: Center(
                          child: Text(
                        '5',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.0,
                            fontWeight: FontWeight.bold),
                      )))
                ]),
              ],
            )),
          ],
        ),
        body: tempCart.length == 0
            ? buildPesananKosong()
            : ListView.builder(
                itemCount: tempCart.length,
                itemBuilder: (context, int index) {
                  String key = tempCart.keys.elementAt(index);

                  var hrg;
                  hrg = int.parse(tempCart[key]["menu"].hargaMenu);

                  return buildPesananIsi(
                      context,
                      tempCart[key]["menu"].idMenu,
                      tempCart[key]["menu"].namaMenu,
                      tempCart[key]["menu"].keteranganMenu,
                      hrg,
                      tempCart[key]["jumlah"],
                      "lib/assets/gambar1.jpg");
                }));
  }

  Widget buildPesananKosong() {
    return Container(
        padding: EdgeInsets.only(top: 250),
        child: Column(
          children: [
            Center(
                child: Text(
              ' Anda Belum Memiliki Pesanan',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                  fontSize: 20),
            )),
          ],
        ));
  }

  Widget buildPesananIsi(BuildContext context, String _idMenu, _namaMenu, _ket,
      int _harga, int _jmlItem, String gambarMenu) {
    return Column(
      children: [
        SizedBox(
          height: 15,
        ),
        Positioned(
            top: 0,
            bottom: 0,
            child: Container(
              height: 165,
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width - 20,
              margin: EdgeInsets.symmetric(horizontal: 0),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 15,
                        spreadRadius: 5),
                  ]),
              child: Column(
                children: [
                  Padding(padding: const EdgeInsets.only(bottom: 0, top: 0)),
                  Container(
                      child: Row(
                    children: [
                      SizedBox(width: 0),
                    ],
                  )),
                  Divider(
                    color: Colors.black,
                    thickness: 0.2,
                  ),
                  Padding(padding: const EdgeInsets.only(bottom: 5, top: 5)),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(width: 5),
                      FittedBox(
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Image.asset(
                            gambarMenu,
                            fit: BoxFit.fill,
                          ),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey)),
                        ),
                        fit: BoxFit.fill,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Text('$_namaMenu',
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                          Padding(padding: const EdgeInsets.only(bottom: 15)),
                          Row(
                            children: [
                              SizedBox(width: 10),
                              Expanded(
                                child: Text('Rp ${_harga * _jmlItem}'),
                              ),
                            ],
                          ),
                          Padding(padding: const EdgeInsets.only(bottom: 15)),
                          Row(
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Card(
                                child: Container(
                                  height: 25,
                                  width: 25,
                                  color: Colors.orange,
                                  child: IconButton(
                                    icon:
                                        Icon(Icons.exposure_minus_1, size: 12),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              Text(("$_jmlItem")),
                              SizedBox(
                                width: 15,
                              ),
                              Card(
                                  child: Container(
                                      height: 25,
                                      width: 25,
                                      color: Colors.orange,
                                      child: IconButton(
                                        icon: Icon(Icons.plus_one, size: 12),
                                      )))
                            ],
                          )
                        ],
                      ))
                    ],
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Future _showMyDialog(BuildContext context) {
    return showDialog(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Anda Yakin Ingin Membatalkan Pesanan?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/TabBar');
                },
                child: Text('ya')),
            TextButton(
              child: Text('Tidak'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
