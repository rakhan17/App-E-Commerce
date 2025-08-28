// lib/widgets/CartItemSamples.dart

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CartItemSamples extends StatefulWidget {
  const CartItemSamples({super.key});

  @override
  State<CartItemSamples> createState() => _CartItemSamplesState();
}

class _CartItemSamplesState extends State<CartItemSamples> {
  // Daftar untuk melacak visibilitas setiap item
  final List<bool> _itemVisible = List.generate(4, (index) => true);
  // Daftar untuk melacak kuantitas setiap item
  final List<int> _itemQuantity = List.generate(4, (index) => 1);

  @override
  Widget build(BuildContext context) {
    // Data produk (bisa diganti dengan data dinamis)
    final List<Map<String, String>> products = [
      {"name": "Product A", "price": "55", "image": "assets/PS.png"},
      {"name": "Product B", "price": "70", "image": "assets/PS.png"},
      {"name": "Product C", "price": "85", "image": "assets/PS.png"},
      {"name": "Product D", "price": "40", "image": "assets/PS.png"},
    ];

    return Column(
      children: List.generate(products.length, (index) {
        return Visibility(
          visible: _itemVisible[index],
          child: Container(
            height: 110,
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                // Gambar Produk
                Container(
                  height: 70,
                  width: 70,
                  margin: const EdgeInsets.only(right: 15),
                  child: Image.asset(products[index]['image']!),
                ),
                // Informasi Produk
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        products[index]['name']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      ),
                      Text(
                        "\$${products[index]['price']}",
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF4C53A5),
                        ),
                      )
                    ],
                  ),
                ),
                const Spacer(),
                // Tombol Aksi
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Tombol Hapus
                      InkWell(
                        onTap: () {
                          setState(() {
                            _itemVisible[index] = false;
                          });
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Item dihapus (Visual)')),
                          );
                        },
                        child: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                      // Pengatur Kuantitas
                      Row(
                        children: [
                          // Tombol Kurang
                          InkWell(
                            onTap: () {
                              if (_itemQuantity[index] > 1) {
                                setState(() {
                                  _itemQuantity[index]--;
                                });
                              }
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Icon(CupertinoIcons.minus, size: 18),
                            ),
                          ),
                          // Tampilan Kuantitas
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              "${_itemQuantity[index]}",
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF4C53A5),
                              ),
                            ),
                          ),
                          // Tombol Tambah
                          InkWell(
                            onTap: () {
                              setState(() {
                                _itemQuantity[index]++;
                              });
                            },
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                  ),
                                ],
                              ),
                              child: const Icon(CupertinoIcons.plus, size: 18),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
