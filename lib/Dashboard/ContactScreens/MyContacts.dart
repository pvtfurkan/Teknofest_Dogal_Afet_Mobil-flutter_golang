import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_storage/get_storage.dart';

class MyContactsScreen extends StatefulWidget {
  const MyContactsScreen({Key key}) : super(key: key);

  @override
  _MyContactsScreenState createState() => _MyContactsScreenState();
}

class _MyContactsScreenState extends State<MyContactsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFAFCFE),
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            "Acil Durum Kişiler Listesi",
            style: TextStyle(
                fontSize: 26, fontWeight: FontWeight.w900, color: Colors.black),
          ),
          backgroundColor: Colors.transparent,
          leading: IconButton(
            icon: Image.asset("assets/phone_red.png"),
            onPressed: () {},
          )),
      body: FutureBuilder(
          future: checkforContacts(),
          builder: (context, AsyncSnapshot<List<dynamic>> snap) {
            if (snap.hasData && snap.data.isNotEmpty) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                        Text("Kişiyi Listeden Silmek İçin Sola Kaydırınız"),
                        Expanded(
                          child: Divider(
                            indent: 20,
                            endIndent: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: snap.data.length,
                      itemBuilder: (context, index) {
                        return Slidable(
                          actionPane: SlidableDrawerActionPane(),
                          actionExtentRatio: 0.25,
                          child: Container(
                            color: Colors.white,
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.grey[200],
                                backgroundImage: AssetImage("assets/user.png"),
                              ),
                              title: Text(snap.data[index].split("***")[0] ??
                                  "İsim Yok"),
                              subtitle: Text(snap.data[index].split("***")[1] ??
                                  "Kişi Yok"),
                            ),
                          ),
                          secondaryActions: <Widget>[
                            IconSlideAction(
                              caption: 'Sil',
                              color: Colors.red,
                              icon: Icons.delete,
                              onTap: () {
                                print('Delete');
                                setState(() {
                                  Fluttertoast.showToast(
                                      msg:
                                      "${snap.data[index].split("***")[0] ??
                                          "No Name"} Silindi");
                                  snap.data.remove(snap.data[index]);

                                  updateNewContactList(snap.data);
                                });
                              },
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              );
            } else {
              return Center(
                child: Text("Kişi bulunamadı!"),
              );
            }
          }),
    );
  }}

Future<List<dynamic>> checkforContacts() async {
  GetStorage box = GetStorage();
  List<dynamic> contacts =  box.read("numbers");
  print(contacts);
  return contacts;
}

updateNewContactList(List<dynamic> contacts) async {
  GetStorage box = GetStorage();
  await box.write("numbers", contacts);

  print(contacts);
}
