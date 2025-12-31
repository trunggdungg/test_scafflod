import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class cardEx extends StatefulWidget {
  const cardEx({super.key});

  @override
  State<cardEx> createState() => _cardExState();
}

class _cardExState extends State<cardEx> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Card Example 2'),
        backgroundColor: Colors.blue,
      ),

      body: Column(
        children: [
          _infoCard('name 1', 'email 1', 'address 1'),
          _infoCard('name', 'email', 'address'),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      'https://placehold.co/400x200/png',
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Text(
                          'Tôi tên là Stack Card',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text('Email: stackcard@gmail.com'),
                        SizedBox(height: 8),
                        Text('Address: 123 Stack Street'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _infoCard(String name, String email, String address) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.network(
                'https://placehold.co/400x200/png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 16),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Tôi tên là $name',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Email: $email'),
                  SizedBox(height: 8),
                  Text('Address: $address'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
