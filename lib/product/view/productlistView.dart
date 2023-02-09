import 'package:flutter/material.dart';

class ProductListView extends StatelessWidget {
  ProductListView({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
          itemCount: 5,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                trailing: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_right
                )),
                // visualDensity: VisualDensity(vertical: 5),
                // minVerticalPadding: double.nan,
                //horizontalTitleGap: double.negativeInfinity,
                contentPadding: EdgeInsets.all(0),
                title: Text("Anirudh Hostel"),
                isThreeLine: true,
                subtitle: Column(
                  children: [
                    Text("Contact Number : 81464546522"),
                    Text("Email : abanhimanege@ice.com"),
                    Text("Address : Opak City"),
                    Text("Area : VijayNagar"),
                  ],
                ),
                leading: SizedBox(
                  child: Image.network(
                    "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.UY0vt0ARKbq0EsA_-C4nVQHaE7%26pid%3DApi&f=1&ipt=f09a282b4a93aa83d743340b02074ea066a23920ab070767301bde447ccadad1&ipo=images",
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            );
          }),
    );
  }
}
