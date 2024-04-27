import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  // ignore: unused_field
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Categories Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Deal Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Cart Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page',
        style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.menu,
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.notification_add,
                color: Colors.black,
              ),
              tooltip: 'Setting Icon',
              onPressed: () {},
            ), //IconButton
          ], //<
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 600,
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (BuildContext context, int index) {
                      return SizedBox(
                        width: 400,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          color: Colors.white,
                          borderOnForeground: true,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const SizedBox(
                                width: 190,
                                child: Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "Redmi Pro 13",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text("data"),
                                      Text("data"),
                                      Text("data"),
                                    ],
                                  ),
                                ),
                              ),
                              Image.asset(
                                'assets/timepass.png',
                                width: 200,
                                height: 200,
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 150,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.blue,
                    borderOnForeground: true,
                    child: const SizedBox(
                      width: 300,
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Redmi Pro 13",
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "You need to provide the required",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Documents for your account activation",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "Click",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.phone_android,
                            color: Colors.white,
                            size: 54,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(), //<-- SEE HERE
                              padding: const EdgeInsets.all(5),
                              backgroundColor: Colors.purple),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.computer,
                            color: Colors.white,
                            size: 54,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(), //<-- SEE HERE
                              padding: const EdgeInsets.all(5),
                              backgroundColor: Colors.lightGreen),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.camera_alt_sharp,
                            color: Colors.white,
                            size: 54,
                          ),
                          style: ElevatedButton.styleFrom(
                              shape: const CircleBorder(), //<-- SEE HERE
                              padding: const EdgeInsets.all(5),
                              backgroundColor: Colors.pink),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          child: const Icon(
                            Icons.light,
                            color: Colors.white,
                            size: 54,
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(), //<-- SEE HERE
                            padding: const EdgeInsets.all(5),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 400,
                    margin: const EdgeInsets.only(top: 10, left: 2),
                    color: Colors.cyan,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'EXCLUSIVE FOR YOU',
                                style: TextStyle(
                                    fontSize: 25,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_right_alt_outlined,
                                size: 40,
                                color: Colors.white,
                              )
                            ],
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              height: 300,
                              width: 200,
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Colors.white,
                                borderOnForeground: true,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      // margin: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width: 150,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Image.asset(
                                              'assets/timepass.png',
                                              width: 200,
                                              height: 200,
                                            ),
                                            Text(
                                                "Redmi 13 Pro(128Gb & 8GB ram)"),
                                            Text("\$100")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 300,
                              width: 200,
                              margin: const EdgeInsets.only(top: 10, left: 10),
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                color: Colors.white,
                                borderOnForeground: true,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.only(left: 10),
                                      child: SizedBox(
                                        width: 150,
                                        child: Column(
                                          children: [
                                            Image.asset(
                                              'assets/timepass.png',
                                              width: 200,
                                              height: 200,
                                            ),
                                            Text(
                                                "Redmi 13 Pro(128Gb & 8GB ram)"),
                                            Text("\$100")
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // Container(
                //   height: 300,
                //   width: 300,
                //   child: Stack(
                //     children: [
                //       Positioned(
                //         bottom: 100.0,
                //         // left: 16.0,
                //         child: FloatingActionButton.extended(
                //           onPressed: () {},
                //           icon: const Icon(Icons.message),
                //           label: const Text('chats'),
                //           backgroundColor: Colors.red,
                //         ),
                //       ),
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag),
              label: 'Deals',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.grey,
          iconSize: 40,
          onTap: _onItemTapped,
        ));
  }
}
