import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:student_lobby/widgets/widget.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
            Text("Search Services",
                style: GoogleFonts.montserrat(fontSize: 30)),
            textfield("Enter Your City", searchViewController.searchController,
                false,true, null, Icon(Icons.search)),
            regularbtn("Search",null),
            
          ],
        ),
      )),
    );
  }
}
