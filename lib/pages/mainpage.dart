import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:navigation_drawer/dafaults/defaults.dart';
import 'package:navigation_drawer/models/user.dart';
import 'package:navigation_drawer/pages/stories.dart';
import 'package:provider/provider.dart';

var indexclicked = 1;

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = const [
    Stories(),
    Center(child: Text('Starred')),
    Center(child: Text('Sent')),
    Center(child: Text('Drafts')),
    Center(child: Text('Trash')),
    Center(child: Text('Spam')),
  ];

  void Function() upstate(int index) {
    return () {
      setState(() {
        indexclicked = index;
      });
      Navigator.pop(context);
    };
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CBS Stories'),
      ),
      body: pages[indexclicked],
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/drawer.jpg'),
                      fit: BoxFit.fill)),
              //  SizedBox(height: 10,)
              child: Container(
                padding: EdgeInsets.all(0),
                child: Column(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('assets/images/profile.jpg'),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Consumer<UserData>(
                      builder: (context, value, child) {
                        return Text(
                          '${value.username}',
                          style: GoogleFonts.robotoMono(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        );
                      },
                    ),
                    Consumer<UserData>(
                      builder: (context, value, child) {
                        return Text(
                          '${value.email}',
                          style: GoogleFonts.robotoMono(
                              fontSize: 15,
                              color: Colors.white,
                              fontWeight: FontWeight.w400),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  MylistTile(
                      index: 0,
                      ontap: () {
                        setState(() {
                          indexclicked = 0;
                        });
                        Navigator.pop(context);
                      }),
                  MylistTile(
                      index: 1,
                      ontap: () {
                        setState(() {
                          indexclicked = 1;
                        });
                        Navigator.pop(context);
                      }),
                  MylistTile(
                      index: 2,
                      ontap: () {
                        setState(() {
                          indexclicked = 2;
                        });
                        Navigator.pop(context);
                      }),
                  MylistTile(
                      index: 3,
                      ontap: () {
                        setState(() {
                          indexclicked = 3;
                        });
                        Navigator.pop(context);
                      }),
                  MylistTile(index: 4, ontap: upstate(4)),
                  MylistTile(index: 5, ontap: upstate(5)),
                  Divider(
                    height: 1,
                    thickness: 1,
                    color: Defaults.drawerItemColor,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MylistTile extends StatelessWidget {
  final void Function() ontap;
  final int index;
  const MylistTile({
    Key? key,
    required this.index,
    required this.ontap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // // onTap: () {
      // //   setState(() {
      // //     indexclicked = 1;
      // //   });
      // },
      onTap: ontap,
      selected: indexclicked == index,
      selectedTileColor: Colors.blue[100],
      //  leading:
      leading: Icon(Defaults.drawerItemIcon[index],
          color: indexclicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor),
      title: Text(
        Defaults.drawerItemText[index],
        style: TextStyle(
            fontSize: 20,
            color: indexclicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColor),
      ),
    );
  }
}
