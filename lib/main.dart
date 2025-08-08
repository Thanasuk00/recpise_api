import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'เมนูอาหาร',
      home: const FoodMenuPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class FoodMenuPage extends StatelessWidget {
  const FoodMenuPage({super.key});

  final List<Map<String, dynamic>> foodItems = const [
    {
      'image':
          'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_640.jpg',
      'name': 'สปาเกตตีคาโบนาร่า',
      'restaurant': 'Pasta House',
      'desc': 'ครีมซอสเข้มข้น เบคอนกรอบ',
      'price': 8.99,
      'rating': 4.3,
      'left': 45,
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2016/11/06/23/31/breakfast-1804457_640.jpg',
      'name': 'ต้มยำกุ้ง',
      'restaurant': 'อาหารไทย',
      'desc': 'เผ็ดแซ่บ กุ้งสดๆ สมุนไพรไทย',
      'price': 6.99,
      'rating': 4.7,
      'left': 20,
    },

    {
      'image':
          'https://cdn.pixabay.com/photo/2017/10/15/11/41/sushi-2853382_640.jpg',
      'name': 'ซูชิเซต',
      'restaurant': 'ซูชิซากุระ',
      'desc': 'รวมซูชิหลากหลาย สดใหม่',
      'price': 12.99,
      'rating': 4.8,
      'left': 15,
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2017/12/09/08/18/pizza-3007395_640.jpg',
      'name': 'พิซซ่ามาร์การิต้า',
      'restaurant': 'Pizza Corner',
      'desc': 'พิซซ่าชีสมอสซาเรลล่า โหระพาสด',
      'price': 9.99,
      'rating': 4.4,
      'left': 30,
    },
    {
      'image':
          'https://cdn.pixabay.com/photo/2018/04/09/18/26/asparagus-3304997_640.jpg',
      'name': 'ผัดไทย',
      'restaurant': 'อาหารไทยแท้',
      'desc': 'หวานมันเปรี้ยว กุ้งสด ถั่วงอก',
      'price': 4.99,
      'rating': 4.6,
      'left': 25,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade200,
        centerTitle: true,
        title: const Text(
          'เมนูอาหาร',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: foodItems.length,
        itemBuilder: (context, index) {
          final item = foodItems[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      item['image'],
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        width: 90,
                        height: 90,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Icon(
                          Icons.restaurant,
                          size: 40,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          item['name'],
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          item['restaurant'],
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(item['desc']),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            Text(
                              '\$${item['price']}',
                              style: const TextStyle(fontSize: 14),
                            ),
                            const SizedBox(width: 12),
                            const Icon(
                              Icons.star,
                              color: Colors.orange,
                              size: 16,
                            ),
                            Text('${item['rating']}'),
                            const Spacer(),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.green.shade100,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text('เหลือ ${item['left']}'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
