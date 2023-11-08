import 'package:flutter/material.dart';
import 'package:e_book/Components/MyDrawer.dart';

class ContacModel {
  final String name;
  final String number;

  ContacModel({required this.name, required this.number});
}

class Infor extends StatelessWidget {
  Infor({Key? key}) : super(key: key);

  final List<ContacModel> contaclist = [
    ContacModel(name: "Le Minh Hung", number: "0908512356"),
    ContacModel(name: "Truong Thien Bao", number: "091812356"),
    ContacModel(name: "Le Quy Phuong", number: "0979512356"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gọi Điện Phản Ánh Về Ứng Dụng'),
        backgroundColor: Colors.blue,
      ),
      drawer: MyDrawer(),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Liên Hệ',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(height: 16),
            for (var contact in contaclist)
              InkWell(
                onTap: () => _showCallForwardDialog(context),
                child: Card(
                  elevation: 4,
                  margin: EdgeInsets.symmetric(vertical: 12),
                  child: ListTile(
                    contentPadding: EdgeInsets.all(16),
                    title: Row(
                      children: [
                        Icon(Icons.phone, color: Colors.blue), // Phone icon
                        SizedBox(width: 10),
                        Text(
                          contact.name,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    subtitle: Text(
                      contact.number,
                      style: TextStyle(fontSize: 18),
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
    Future.delayed(Duration(seconds: 1), () {
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
          child: Text('OK'),
        ),
      ],
    );
  }
}
