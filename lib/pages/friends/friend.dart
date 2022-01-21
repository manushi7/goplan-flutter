import 'package:flutter/material.dart';
import 'ContactModel2.dart';

class FriendPage extends StatefulWidget {
  @override
  _FriendPageState createState() => _FriendPageState();
}

class _FriendPageState extends State<FriendPage> {
  List<ContactModel> contacts = [
    ContactModel("Salon paudel", "friend", false),
    ContactModel("Dipika Ranabhat", "mutual contact ", false),
    ContactModel("Neelam Sapkota", "friend", false),
    ContactModel("Aniket Shah", "friend", false),
  ];

  // ignore: deprecated_member_use
  List<ContactModel> selectedContacts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        contacts[index].friendname,
                        contacts[index].friendstatus,
                        contacts[index].isSelected,
                        index,
                      );
                    }),
              ),
              selectedContacts.length > 0
                  ? Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        child: RaisedButton(
                          color: Colors.lightBlue,
                          child: Text(
                            "Add Friend (${selectedContacts.length})",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                            ),
                          ),
                          onPressed: () {
                            print(
                                "Add List Lenght: ${selectedContacts.length}");
                          },
                        ),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  Widget ContactItem(
      String friendname, String friendstatus, bool isSelected, int index) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: Colors.lightBlue,
        child: Icon(
          Icons.person_outline_outlined,
          color: Colors.white,
        ),
      ),
      title: Text(
        friendname,
        style: TextStyle(
          fontWeight: FontWeight.w500,
        ),
      ),
      subtitle: Text(friendstatus),
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
            selectedContacts.add(ContactModel(friendname, friendstatus, true));
          } else if (contacts[index].isSelected == false) {
            selectedContacts.removeWhere(
                (element) => element.friendname == contacts[index].friendname);
          }
        });
      },
    );
  }
}
