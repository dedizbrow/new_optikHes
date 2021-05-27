import 'package:test_optikhes/menuUmumModel.dart';
import 'pagesPesanan.dart';
import 'package:flutter/material.dart';

class MenuOpHes extends StatefulWidget {
  @override
  _MenuCat1State createState() => _MenuCat1State();
}

class _MenuCat1State extends State<MenuOpHes> {
  List<Menu> dataMenuPesanan = [];
  bool _buatPesanan = false;
  bool loading;
  List jmlCart = [];
  int dataLength = 0;
  Map<String, dynamic> tempCart = new Map<String, dynamic>();
  int totalHarga = 0;

  @override
  void initState() {
    super.initState();
    loading = true;

    setState(() {
      loading = false;
    });
  }

  bool popUP = true;
  int _cart = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
              onPressed: () {}),
          title: TextFormField(
              decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              borderSide: BorderSide(color: Colors.grey),
            ),
            contentPadding: EdgeInsets.all(10),
          )),
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
                      onPressed: () {
                        for (int i = 0; i < dataMenuPesanan.length; i++) {
                          String _key = dataMenuPesanan[i].idMenu;
                          Menu menu = dataMenuPesanan[i];
                          if (!tempCart.containsKey(_key)) {
                            tempCart[_key] = {"menu": menu, "jumlah": 0};
                          }
                          tempCart[_key]["jumlah"]++;
                          totalHarga += int.tryParse(menu.hargaMenu);
                        }
                        setState(() {
                          dataLength = tempCart.length;
                        });
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) =>
                                PesananOpHes(tempCart, totalHarga)));
                      }),
                  Positioned(
                    left: 17,
                    top: 7,
                    child: Icon(Icons.brightness_1,
                        size: 15.0, color: Colors.yellow),
                  ),
                  Positioned(
                      left: 21,
                      top: 8,
                      child: Center(
                          child: Text(
                        '$_cart',
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
        body: ListView(
          children: [
            buildMenu("01", "Hamburger Enak", "20000",
                "Dapatkan Dengan Harga Terbaik", "lib/assets/gambar1.jpg"),
            buildMenu("01", "Hamburger Enak 2", "20000",
                "Dapatkan Dengan Harga Terbaik", "lib/assets/gambar2.jpg"),
            buildMenu("01", "Minuman Enak", "20000",
                "Dapatkan Dengan Harga Terbaik", "lib/assets/gambar3.jpg")
          ],
        ));
  }

  Widget buildMenu(
      String b_idMenu, b_namaMenu, b_harga, b_keterangan, gambarMenu) {
    return GestureDetector(
        onTap: () {
          return showDialog<void>(
            context: context,
            barrierDismissible: false, // user must tap button!
            builder: (BuildContext context) {
              return AlertDialog(
                  contentPadding: EdgeInsets.all(5),
                  content: new Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.all(5),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              popUpMenu(b_namaMenu, b_harga, b_keterangan,
                                  gambarMenu),
                            ],
                          )),
                      Row(
                        children: [
                          Expanded(
                            child: RaisedButton(
                                padding: EdgeInsets.all(10),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                color: Colors.yellow,
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  _add(b_idMenu, b_namaMenu, b_keterangan,
                                      b_harga, gambarMenu);
                                },
                                child: Text(
                                  'Add To Cart',
                                  style: TextStyle(color: Colors.white),
                                )),
                          )
                        ],
                      )
                    ],
                  ));
            },
          );
        },
        child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(
                    child: Container(
                      width: 175,
                      height: 150,
                      child: Image.asset(
                        gambarMenu,
                        fit: BoxFit.fill,
                      ),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                    ),
                    fit: BoxFit.fill,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(b_namaMenu,
                            style: TextStyle(
                                fontSize: 15, fontWeight: FontWeight.bold)),
                        SizedBox(height: 10),
                        Text(" ", style: TextStyle(fontSize: 12)),
                        SizedBox(
                          height: 45,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [],
                        ),
                        Text('Rp. $b_harga',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold)),
                      ],
                    ),
                  )
                ],
              ),
            )));
  }

  Widget popUpMenu(
      String namaMenu, String harga, String keterangan, gambarMenu) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          FittedBox(
            child: Container(
              width: 300,
              height: 200,
              child: Image.asset(
                gambarMenu,
                fit: BoxFit.fill,
              ),
              decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
            ),
            fit: BoxFit.fill,
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Expanded(
                  child: Text(
                namaMenu,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )),
            ],
          ),
          SizedBox(height: 10),
          Text(keterangan, style: TextStyle(fontSize: 15)),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                'Rp $harga',
                style: TextStyle(fontSize: 18),
              ),
            ],
          )
        ],
      ),
    );
  }

  void _add(String idMenu, namaMenu, ketMenu, hrg, image) {
    Menu menu = Menu(
        idMenu: idMenu,
        namaMenu: namaMenu,
        keteranganMenu: ketMenu,
        hargaMenu: hrg,
        image: image);
    dataMenuPesanan.add(menu);

    setState(() {
      _buatPesanan = true;
      _cart++;
    });
  }
}
