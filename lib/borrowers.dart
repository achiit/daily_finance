import 'package:flutter/material.dart';

class Borrower extends StatefulWidget {
  const Borrower({Key? key}) : super(key: key);

  @override
  State<Borrower> createState() => _BorrowerState();
}

class _BorrowerState extends State<Borrower> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text('Borrowers'),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.more_vert),
            ),
          ],
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: Image.asset(
                                "assets/6325251.jpg",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Text('  Sree',
                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.card_membership_sharp))
                      ],
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: Image.asset(
                                "assets/6325251.jpg",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Text('  Sree',
                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_right))
                      ],
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: Image.asset(
                                "assets/6325251.jpg",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Text('  Sree',
                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_right))
                      ],
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              radius: 40,
                              child: Image.asset(
                                "assets/6325251.jpg",
                                height: 50,
                                width: 50,
                              ),
                            ),
                            const Text('  Sree',
                                style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.keyboard_arrow_right))
                      ],
                    ),
                    const Divider(
                      height: 5,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors.grey[200],
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
              
              
              IconButton(
                icon: Icon(Icons.people),
                onPressed: () {
                  Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  Borrower()));
                },
              ),
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.bar_chart),
                onPressed: () {},
              ),
              
              IconButton(
                icon: Icon(Icons.logout_outlined),
                onPressed: () {},
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add the functionality you want for the FloatingActionButton
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
      );
    
  }
}
