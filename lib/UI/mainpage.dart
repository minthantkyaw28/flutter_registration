import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Storage/shared_preferences_manager.dart';

class mainpage extends StatefulWidget {
  const mainpage({super.key, required this.title});

  final String title;

  @override
  State<mainpage> createState() => _mainpageState();
}

// ignore: camel_case_types
class _mainpageState extends State<mainpage> {
  //User data
  SharedPreferencesManager sharedPreferencesManager =
      SharedPreferencesManager();

  String _name = '';
  String _email = '';

  @override
  void initState() {
    super.initState();
    _loadSavedData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        // leading: Icon(Icons.menu),
        actions: [
          Icon(Icons.search),
          SizedBox(width: 16),
          Icon(Icons.notifications),
          SizedBox(width: 16),
          CircleAvatar(
            radius: 16,
            backgroundImage: NetworkImage(
                'https://th.bing.com/th/id/OIP.iwP1Cnwiw_k2PZbpVKbWfgHaFW?pid=ImgDet&rs=1'),
          ),
          SizedBox(width: 16),
        ],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.black,
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage(
                        'https://th.bing.com/th/id/OIP.ptt7w30t5cpo-56f8a2JcQAAAA?pid=ImgDet&w=270&h=270&rs=1',
                      ),
                    ),
                    SizedBox(height: 5),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.person, color: Colors.white),
                title: const Text(
                  'Name',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "$_name",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 0, 0), fontSize: 18),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.email, color: Colors.white),
                title: const Text(
                  'Email',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700),
                ),
                subtitle: Text(
                  "$_email",
                  style: TextStyle(
                      color: Color.fromARGB(255, 255, 0, 0), fontSize: 18),
                ),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.settings, color: Colors.white),
                title: const Text(
                  'Settings',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
              Divider(
                color: Colors.white.withOpacity(0.5),
                thickness: 1,
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  'Log Out',
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Trending Now',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://th.bing.com/th/id/OIP.iwP1Cnwiw_k2PZbpVKbWfgHaFW?pid=ImgDet&rs=1'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 32),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Popular on Netflix',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    width: 120,
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://th.bing.com/th/id/OIP.iwP1Cnwiw_k2PZbpVKbWfgHaFW?pid=ImgDet&rs=1'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // void getUserName() async {
  //   String? name = await sharedPreferencesManager.getData(key: "name");
  //   print(name);
  // }

  // void getUserEmail() async {
  //   String? email = await sharedPreferencesManager.getData(key: "email");
  //   print(email);
  // }

  // String getUserData(String key) async {
  //   String? data = await sharedPreferencesManager.getData(key: key);
  //   return data;
  // }

  // Function to load saved data from Shared Preferences
  void _loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _name = prefs.getString('name') ?? '';
      _email = prefs.getString('email') ?? '';
    });
  }
}
