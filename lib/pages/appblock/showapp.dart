import 'package:flutter/material.dart';
import 'ContactModel.dart';

class Appblock extends StatefulWidget {
  @override
  _AppBlockPageState createState() => _AppBlockPageState();
}

class _AppBlockPageState extends State<Appblock> {
  List<ContactModel> contacts = [
    ContactModel("facebook", " blocked", false),
    ContactModel("messenger", "blocked", false),
    ContactModel("Instagram", " blocked", false),
    ContactModel("Snapchat", " blocked", false),
    
  ];

  // ignore: deprecated_member_use
  List<ContactModel> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Blocked Apps"),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                    itemCount: contacts.length,
                    itemBuilder: (BuildContext context, int index) {
                      // return item
                      return ContactItem(
                        contacts[index].appname,
                        contacts[index].blockstatus,
                        contacts[index].isSelected,
                        index,
                      );
                    }),
              ),
              selectedContacts.length > 0 ? Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 25,
                  vertical: 10,
                ),
              
              ): Container(),
            ],
          ),
        ),
      ),
    );
  }}
  Widget ContactItem(
      String appname, String blockstatus, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.red,
        child: Icon(
          Icons.phonelink_erase,
          color: Colors.white,
        ),
      ),
      title: Text(
        appname,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(blockstatus),
      trailing: isSelected
          ? Icon(
              Icons.check_circle,
              color: Colors.lightBlue,
            )
          : Icon(
              Icons.check_circle_outline,
              color: Colors.grey,
            ),
            );
  }