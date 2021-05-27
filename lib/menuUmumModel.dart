import 'dart:convert';

// To parse this JSON data, do
//
//     final menuModel = menuModelFromJson(jsonString);
ResponseMenu responMenuFromJson(String str) =>
    ResponseMenu.fromJson(jsonDecode(str));

String responseMenuToJson(ResponseMenu data) => jsonEncode(data.toJson);

class ResponseMenu {
  String pesan;
  bool sukses;
  List<Menu> menu;

  ResponseMenu({this.pesan, this.sukses, this.menu});

  factory ResponseMenu.fromJson(Map<String, dynamic> json) => ResponseMenu(
        pesan: json["pesan"],
        sukses: json["sukses"],
        menu: List<Menu>.from(json["menu"].map((x) => Menu.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "pesan": pesan,
        "sukses": sukses,
        "menu": List<dynamic>.from(menu.map((x) => x.toJson())),
      };
}

class Menu {
  Menu(
      {this.idMenu,
      this.namaMenu,
      this.keteranganMenu,
      this.hargaMenu,
      this.image,
      this.metode});

  String idMenu;
  String namaMenu;
  String keteranganMenu;
  String hargaMenu;
  String image;
  String metode;

  factory Menu.fromJson(Map<String, dynamic> json) => Menu(
      idMenu: json["menu_id"],
      namaMenu: json["menu_nama"],
      hargaMenu: json["menu_harga"],
      keteranganMenu: json["menu_ket"],
      image: json["menu_gambar"]);

  Map<String, dynamic> toJson() => {
        "menu_id": idMenu,
        "menu_nama": namaMenu == null ? null : namaMenu,
        "menu_harga": hargaMenu == null ? null : hargaMenu,
        "menu_ket": keteranganMenu == null ? null : namaMenu,
        "menu_gambar": image == null ? null : image,
      };
}
