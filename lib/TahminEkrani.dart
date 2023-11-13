import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sayitahmin_uygulamasi/SonucEkrani.dart';

class TahminEkrani extends StatefulWidget {
  const TahminEkrani({super.key});

  @override
  State<TahminEkrani> createState() => _TahminEkraniState();
}

class _TahminEkraniState extends State<TahminEkrani> {

  var tfTahim = TextEditingController();
  int rastgeleSayi = 0;
  int kalanHak = 5;
  String yonlendirme = '';

  @override
  void initState() {
    super.initState();
    rastgeleSayi = Random().nextInt(101);
    print('Rastgele sayı : $rastgeleSayi');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Tahmin Ekranı'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Kalan Hak: $kalanHak', style: TextStyle(color: Colors.pink, fontSize: 30),),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: tfTahim,
                keyboardType: TextInputType.number,
                textAlign: TextAlign.center,
                decoration: InputDecoration(
                  labelText: 'Tahmin',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                  child: Text('Yardım: $yonlendirme', style: TextStyle(color: Colors.black54, fontSize: 24),)),
            ),
            SizedBox(
              width: 200,
              height: 50,
              child: ElevatedButton(
                child: Text('TAHMİN ET', style: TextStyle(color: Colors.white), textAlign: TextAlign.center,),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.pink),
                onPressed: () {
                  setState(() {
                    kalanHak = kalanHak - 1;
                  });
                  int tahmin = int.parse(tfTahim.text);
                  if(tahmin == rastgeleSayi) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SonucEkrani(sonuc: true,)));
                    return;
                  }
                   if(tahmin > rastgeleSayi) {
                     setState(() {
                       yonlendirme = 'Tahmini Azalt';
                     });
                   }
                  if(tahmin < rastgeleSayi) {
                    setState(() {
                      yonlendirme = 'Tahmini Arttır';
                    });
                  }
                  if (kalanHak == 0) {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> SonucEkrani(sonuc: false,)));

                  }
                   tfTahim.text = '';
                   },

              ),
            ),
          ],
        ),
      ),

    );
  }
}
