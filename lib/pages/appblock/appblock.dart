import 'package:flutter/material.dart';
import 'package:flutter_login_ui/pages/appblock/showapp.dart';
import 'ContactModel.dart';

class appblock extends StatefulWidget {
  @override
  _BlockPageState createState() => _BlockPageState();
}

class _BlockPageState extends State<appblock> {
  List<ContactModel> contacts = [
    ContactModel("facebook", "to be blocked", false),
    ContactModel("messenger", "to be blocked", false),
    ContactModel("Instagram", "to be blocked", false),
    ContactModel("Snapchat", "to be blocked", false),
    
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
                child: SizedBox(
                  width: double.infinity,
                  child: RaisedButton(
                    color: Colors.lightBlue,
                    child: Text(
                      "Block (${selectedContacts.length})",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    onPressed: () {
                      print("Block List Lenght: ${selectedContacts.length}");
                      Navigator.pushReplacement(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Appblock()));
                    },
                  ),
                ),
              ): Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(
      String appname, String blockstatus, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.phone_android,
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
      onTap: () {
        setState(() {
          contacts[index].isSelected = !contacts[index].isSelected;
          if (contacts[index].isSelected == true) {
            selectedContacts.add(ContactModel(appname, blockstatus, true));
          } else if (contacts[index].isSelected == false) {
            selectedContacts
                .removeWhere((element) => element.appname == contacts[index].appname);
          }
        });
      },
    );
  }
}