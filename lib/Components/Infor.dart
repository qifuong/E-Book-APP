import 'package:flutter/material.dart';
import 'package:e_book/Components/MyDrawer.dart';

class ContactModel {
  final String name;
  final String number;

  ContactModel({required this.name, required this.number});
}

class Infor extends StatelessWidget {
  Infor({super.key});

  final List<ContactModel> contactList = [
    ContactModel(name: "Le Minh Hung", number: "0908512356"),
    ContactModel(name: "Truong Thien Bao", number: "091812356"),
    ContactModel(name: "Le Quy Phuong", number: "0979512356"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông Tin Liên Hệ'),
        backgroundColor: Colors.blue,
      ),
      drawer: const MyDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Danh bạ',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),
            const SizedBox(height: 16),
            for (var contact in contactList)
              GestureDetector(
                onTap: () => _showCallForwardDialog(context),
                child: Card(
                  elevation: 4,
                  margin: const EdgeInsets.only(bottom: 16),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(16),
                    leading: const Icon(
                      Icons.phone,
                      color: Colors.blue,
                      size: 32,
                    ),
                    title: Text(
                      contact.name,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      contact.number,
                      style: const TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _showCallForwardDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return _CountdownDialog();
      },
    );
  }
}

class _CountdownDialog extends StatefulWidget {
  @override
  _CountdownDialogState createState() => _CountdownDialogState();
}

class _CountdownDialogState extends State<_CountdownDialog> {
  int countdown = 5;

  @override
  void initState() {
    super.initState();
    startCountdown();
  }

  void startCountdown() {
    Future.delayed(const Duration(seconds: 1), () {
      if (countdown > 1) {
        setState(() {
          countdown -= 1;
        });
        startCountdown();
      } else {
        Navigator.of(context).pop();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Cuộc gọi sẽ được chuyển tiếp'),
      content: Text('Xin vui lòng chờ. Đếm ngược: $countdown'),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('OK'),
        ),
      ],
    );
  }
}
