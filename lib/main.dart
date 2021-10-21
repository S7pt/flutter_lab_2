import 'package:flutter/material.dart';
import 'chat_data.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Telegram",
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xff517DA2),
          foregroundColor: Colors.white,
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: TelegramHome(),
    );
  }
}

class TelegramHome extends StatefulWidget {
  @override
  _TelegramHomeState createState() => _TelegramHomeState();
}

class _TelegramHomeState extends State<TelegramHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
        ),
        title: Text('Telegram'),
        actions: [
          Container(
              margin: EdgeInsets.only(right: 20),
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ))
        ],
      ),
      body: Messages(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.create),
        backgroundColor: Color(0xff66AADB),
      ),
    );
  }
}

class Messages extends StatefulWidget {
  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    data.sort((a, b) => b.date.compareTo(a.date));
    return ListView.builder(
      padding: EdgeInsets.only(top: 5),
      itemCount: data.length,
      itemBuilder: (context, i) => Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(data[i].imageUrl),
            ),
            contentPadding: EdgeInsets.only(left: 5, right: 10),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(data[i].nickname,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(data[i].date,
                    style: const TextStyle(color: Colors.grey, fontSize: 14)),
              ],
            ),
            subtitle: Container(
                padding: const EdgeInsets.only(
                  top: 7,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              data[i].message,
                              style: const TextStyle(
                                  color: Colors.grey, fontSize: 15),
                            ),
                            Container(
                              alignment: Alignment.center,
                              width: 22,
                              height: 22,
                              decoration: const BoxDecoration(
                                color: Color(0xff4DCE5A),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                data[i].newMessages.toString(),
                                style: const TextStyle(
                                    color: Colors.white, fontSize: 10),
                              ),
                            )
                          ]),
                      const Divider(
                        height: 16,
                        thickness: 0,
                      )
                    ])),
          ),
        ],
      ),
    );
  }
}
