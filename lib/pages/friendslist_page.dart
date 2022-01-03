import 'dart:async';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'friend.dart';

class FriendsListPage extends StatefulWidget {
  @override
  _FriendsListPageState createState() => new _FriendsListPageState();
}

class _FriendsListPageState extends State<FriendsListPage> {
  List<Friend> _friends = [];

  @override
  void initState() {
    super.initState();
    
  }

 
  Widget _buildFriendListTile(BuildContext context, int index) {
    var friend = _friends[index];

    return new ListTile(
      leading: new Hero(
        tag: index,
        child: new CircleAvatar(
          backgroundImage: new NetworkImage(friend.avatar),
        ),
      ),
      title: new Text(friend.name),
      subtitle: new Text(friend.email),
    );
  }

 
  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_friends.isEmpty) {
      content = new Center(
        child: new CircularProgressIndicator(),
      );
    } else {
      content = new ListView.builder(
        itemCount: _friends.length,
        itemBuilder: _buildFriendListTile,
      );
    }

    return new Scaffold(
      appBar: new AppBar(title: new Text('Friends')),
      body: content,
    );
  }
}