import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/button_gradient.dart';
import 'package:kulina/components/atoms/text.dart';
import 'package:kulina/components/atoms/text_field.dart';
import 'package:kulina/components/molecules/custom_card.dart';
import 'package:kulina/components/molecules/two_button.dart';
import 'package:kulina/components/organisms/card_rincian_pembayaran.dart';

class PageTwo extends StatefulWidget {
  final VoidCallback voidCallback;
  final VoidCallback editProfile;
  final VoidCallback editAlamat;

  var jumlah = 1;
  int harga = 25000;
  var waktu = 10;
  bool isEditProfile = true;
  bool isEditAlamat = true;

  String nama = "Ahmad Taufiq",
      alamat =
          "Jalan Tulodong Atas, RT.6, Senayan, South Jakarta City, Jakarta, Indonesia",
      email = "ataufiq665@gmail.com",
      nomer = "6289634067877";

  PageTwo(
      {this.voidCallback,
      this.jumlah = 1,
      this.harga = 25000,
      this.waktu = 10,
      this.isEditAlamat = true,
      this.isEditProfile = true,
      this.editAlamat,
      this.editProfile});
  @override
  PageTwoState createState() {
    return new PageTwoState();
  }
}

class PageTwoState extends State<PageTwo> {
  TextEditingController nama = TextEditingController(text: "Ahmad Taufiq");
  TextEditingController email =
      TextEditingController(text: "ataufiq665@gmail.com");
  TextEditingController nomer = TextEditingController(text: "6289634067877");
  TextEditingController alamat = TextEditingController(
      text:
          "Jalan Tulodong Atas, RT.6, Senayan, South Jakarta City, Jakarta, Indonesia");
  TextEditingController catatan = TextEditingController(text: "6289634067877");
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: CustomCard("Profil Kamu",
                onPressed: widget.editProfile,
                isEditable: !widget.isEditProfile,
                widget: _buildContentProfile()),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: CustomCard("Alamat Pengiriman",
                onPressed: widget.editAlamat,
                isEditable: !widget.isEditAlamat,
                widget: _buildContentAlamat()),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: CardRincianPembayaran(
              harga: widget.harga,
              waktu: widget.waktu,
              jumlah: widget.jumlah,
            ),
          ),
          _buildButton()
        ],
      ),
    );
  }

  _buildText(String text) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CustomText.medium(
        text: text,
      ),
    );
  }

  // Card Profile
  _buildContentProfile() {
    return widget.isEditProfile ? _editProfile() : _contentProfile();
  }

  _editProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: CustomText.title_medium(text: "Nama"),
        ),
        TextFieldText(
          controller: nama,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: CustomText.title_medium(text: "Email"),
        ),
        TextFieldEmail(
          controller: email,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: CustomText.title_medium(text: "No. Handphone"),
        ),
        TextFieldNumber(
          controller: nomer,
        ),
        TwoButton(
          onPressedOk: widget.editProfile,
          onPressedCancel: widget.editProfile,
        )
      ],
    );
  }

  _contentProfile() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomText.title(
          text: widget.nama,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Text(
            widget.email,
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text(widget.nomer, style: TextStyle(color: Colors.grey)),
      ],
    );
  }

  //Card Alamat Pengiriman
  _buildContentAlamat() {
    return widget.isEditAlamat ? _editAlamat() : _contentAlamat();
  }

  _editAlamat() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(bottom: 6.0),
          child: CustomText.medium(text: "Cari nama tempat dari Google Map"),
        ),
        TextFieldText(
          controller: alamat,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: CustomText.title(text: "Catatan Kurir (opsional)"),
        ),
        TextFieldEmail(),
        TwoButton(
          onPressedOk: widget.editAlamat,
          onPressedCancel: widget.editAlamat,
        )
      ],
    );
  }

  _contentAlamat() {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(5.0)),
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text("Kulina"),
              GestureDetector(onTap: widget.editAlamat, child: Text("edit"))
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 4.0),
            child: Text(widget.alamat),
          )
        ],
      ),
    );
  }

  _buildButton() {
    print("Alamat ${widget.isEditAlamat}");
    print("Profile ${widget.isEditProfile}");
    return widget.isEditAlamat == false && widget.isEditProfile == false
        ? Container(
            margin: const EdgeInsets.all(14.0),
            child: ButtonGradient.large(
              text: "Selanjutnya",
              onPressed: widget.voidCallback,
            ),
          )
        : Container();
  }
}
