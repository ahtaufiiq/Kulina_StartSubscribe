import 'package:flutter/material.dart';
import 'package:kulina/components/atoms/button_gradient.dart';
import 'package:kulina/components/atoms/text.dart';
import 'package:kulina/components/atoms/text_field.dart';
import 'package:kulina/components/custom_card.dart';

class PageTwo extends StatefulWidget {
  final VoidCallback voidCallback;
  final VoidCallback editProfile;
  final VoidCallback editAlamat;

  var jumlah = 1;
  int harga = 25000;
  var waktu = 10;
  bool isEditProfile = true;
  bool isEditAlamat = true;

  PageTwo(
      {this.voidCallback,
      this.jumlah = 1,
      this.harga = 25000,
      this.waktu = 10,
      this.isEditAlamat=true,
      this.isEditProfile=true,
      this.editAlamat,
      this.editProfile});
  @override
  PageTwoState createState() {
    return new PageTwoState();
  }
}

class PageTwoState extends State<PageTwo> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          CustomCard("Profil Kamu", onPressed:widget.editProfile, 
          isEditable: !widget.isEditProfile, 
          widget: _buildContentProfile()),
          CustomCard("Alamat Pengiriman", 
              onPressed:widget.editAlamat, 
          isEditable: !widget.isEditAlamat,
          widget: _buildContentAlamat()),
          Card(
            margin: const EdgeInsets.all(16.0),
            child: _buildRincian(),
          ),
          _buildButton()
        ],
      ),
    );
  }

  _buildRincian() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 4.0, top: 8.0),
            child: CustomText.title(
              text: "Rincian Langganan",
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildText("Harga per box"),
                _buildText("Rp ${widget.harga}")
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 0.2,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildText("Jumlah Box"),
                _buildText("${widget.jumlah} Box"),
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 0.3,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                _buildText("Lama Langganan"),
                _buildText("${widget.waktu} Hari")
              ],
            ),
          ),
          Container(
            color: Colors.grey,
            width: double.infinity,
            height: 0.3,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(
                    top: 8.0, left: 8.0, right: 8.0, bottom: 14.0),
                child: CustomText.title(text: "Total "),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:
                    CustomText.title(text: "Rp ${widget.harga*widget.jumlah}"),
              )
            ],
          )
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
        TextFieldText(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: CustomText.title_medium(text: "Email"),
        ),
        TextFieldEmail(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: CustomText.title_medium(text: "No. Handphone"),
        ),
        TextFieldNumber(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("Batal"),
              ),
            ),
            ButtonGradient.small(
              text: "Simpan",
              onPressed: widget.editProfile,
            )
          ],
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
          text: "Ahmad Taufiq",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0, bottom: 4.0),
          child: Text(
            "ataufiq665@gmail.com",
            style: TextStyle(color: Colors.grey),
          ),
        ),
        Text("628978787", style: TextStyle(color: Colors.grey)),
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
        TextFieldText(),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 6.0),
          child: CustomText.title(text: "Catatan Kurir (opsional)"),
        ),
        TextFieldEmail(),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            GestureDetector(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text("Batal"),
              ),
            ),
            ButtonGradient.small(
              text: "Simpan",
              onPressed: widget.editAlamat,
            )
          ],
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
            children: <Widget>[Text("Kulina"), GestureDetector(onTap: widget.editAlamat,child: Text("edit"))],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 4.0, right: 4.0),
            child: Text(
                "Jalan Tulodong Atas, RT.6, Senayan, South Jakarta City, Jakarta, Indonesia"),
          )
        ],
      ),
    );
  }
}
