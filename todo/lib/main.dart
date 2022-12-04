import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "ToDo Uygulaması",
      home: Iskelet(),
    );
  }
}

class Iskelet extends StatelessWidget {
  const Iskelet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Yapılacaklar Listesi"),
        centerTitle: true,
      ),
      body: AnaEkran(),
    );
  }
}

class AnaEkran extends StatefulWidget {
  const AnaEkran({Key? key}) : super(key: key);

  @override
  State<AnaEkran> createState() => _AnaEkranState();
}

class _AnaEkranState extends State<AnaEkran> {
  List alisverisListesi = [];
  TextEditingController t1 = TextEditingController();

  ekle() {
    setState(() {
      alisverisListesi.add(t1.text);
      t1.clear();
    });
  }

  cikar() {
    setState(() {
      alisverisListesi.remove(t1.text);
      t1.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(30.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Flexible(
            child: ListView.builder(
              itemCount: alisverisListesi.length,
              itemBuilder: (context, indexnumarasi) => ListTile(
                title: Text(alisverisListesi[indexnumarasi]),
                selectedTileColor: Colors.amber,
              ),
            ),
          ),
          TextField(
            controller: t1,
          ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(onPressed: ekle, child: Text("Ekle")),
              ElevatedButton(onPressed: cikar, child: Text("Çıkar")),
            ],
          )
        ],
      ),
    );
  }
}
