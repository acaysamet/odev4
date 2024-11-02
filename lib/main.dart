import 'package:flutter/material.dart';

void main() {
  runApp(BenimUygulamam());
}

class BenimUygulamam extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UrunListesiEkrani(),
    );
  }
}

class UrunListesiEkrani extends StatefulWidget {
  @override
  _UrunListesiEkraniDurumu createState() => _UrunListesiEkraniDurumu();
}

class _UrunListesiEkraniDurumu extends State<UrunListesiEkrani> {
  int _seciliUrunIndeksi = -1;

  final List<Map<String, String>> _urunler = [
    {'isim': 'Ürün 1', 'fiyat': '₺100'},
    {'isim': 'Ürün 2', 'fiyat': '₺200'},
    {'isim': 'Ürün 3', 'fiyat': '₺300'},
    {'isim': 'Ürün 4', 'fiyat': '₺400'},
  ];

  void _urunSec(int indeks) {
    setState(() {
      _seciliUrunIndeksi = indeks;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ürün Listesi'),
      ),
      body: Column(
        children: [
          Container(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _urunler.length,
              itemBuilder: (context, indeks) {
                return GestureDetector(
                  onTap: () => _urunSec(indeks),
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(_urunler[indeks]['isim']!),
                          Text(_urunler[indeks]['fiyat']!),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 2,
              ),
              itemCount: _urunler.length,
              itemBuilder: (context, indeks) {
                return Card(
                  color: _seciliUrunIndeksi == indeks
                      ? Colors.amber[100]
                      : Colors.white,
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(_urunler[indeks]['isim']!),
                        Text(_urunler[indeks]['fiyat']!),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
