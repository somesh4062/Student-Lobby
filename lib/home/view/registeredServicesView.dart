import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class RegServicesView extends StatelessWidget {
  const RegServicesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [

            Padding(padding: EdgeInsets.only(top: 20, bottom: 10),
            child: Text("Registered Services"),),
            ListView.builder(
       
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
                itemCount: 3,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Card(
                      elevation: 5,
                      child: ListTile(
                        leading: CachedNetworkImage(
                          height: 100,
                          width: 100,
                          imageUrl: "https://images.pexels.com/photos/13519033/pexels-photo-13519033.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                        title: Text("Service Name : XYZ Mess. etc "),
                        subtitle: Text("Desc :  "),
                        trailing: IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ),
                    ),
                  );
                }),
          ],
        ),
      )),
    );
  }
}
