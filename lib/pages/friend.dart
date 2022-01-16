import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FriendPage extends StatefulWidget {
  const FriendPage({ Key? key }) : super(key: key);

  @override
  _freindPageState createState() => _freindPageState();
}

class _freindPageState extends State<FriendPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text("My Friends"),
      ),
      body: Container(
        child: ListView.builder(
          
                    padding: const EdgeInsets.only(
                        left: 8, right: 8, top: 25),

                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  itemCount:10,
                  itemBuilder: (BuildContext context, int index){
                    return Container(
                      margin: const EdgeInsets.all(8.0),
                      padding: const EdgeInsets.all(8.0),
                      height: MediaQuery
                          .of(context)
                          .size
                          .height * 0.120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.grey[200],
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(0, 10),
                              blurRadius: 50,
                              color: Color(0xffEEEEEE)),
                        ],
                      ),
                      child: ListTile(
                        title: Text('Title:'),
                        trailing: Row(
                          children: [
                          FlatButton(
          child:  Text("Add"),
          onPressed: () {
            setState(() {
              Text("Delete");
            });
          },
        ),
                          ],
                        ),
                        subtitle: Text('Subject:'),
                        
                        onTap: () {
                         
                        },
                      ),
                    );
                  }
                ),

      ) ,
    );
  }
}