

import 'package:flutter/material.dart';

class SonucEkrani extends StatefulWidget {
  final bool sonuc;
  const SonucEkrani({super.key, required this.sonuc});

  @override
  State<SonucEkrani> createState() => _SonucEkraniState();
}

class _SonucEkraniState extends State<SonucEkrani> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Sonuç Ekranı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            widget.sonuc ? Image.asset('resimler/mutlu_resim.png') : Image.asset('resimler/uzgun_resim.png'),
            widget.sonuc ? Text('Kazandınız', style: TextStyle(color: Colors.black54, fontSize: 36),) : Text('Kaybettiniz', style: TextStyle(color: Colors.black54, fontSize: 36),),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text('TEKRAR DENE', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () {
                  Navigator.pop(context);
                },

              ),
            ),
          ],
        ),
      ),

    );
  }
}
