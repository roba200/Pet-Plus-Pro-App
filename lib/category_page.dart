import 'package:flutter/material.dart';
import 'package:pet_plus_pro/homepage.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController weightController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Weight : ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                        width: 75,
                        child: TextField(
                          controller: weightController,
                          keyboardType: TextInputType.number,
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )),
                    Text(
                      "lbs",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    if (weightController.text.trim().isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                  category: 'small',
                                  weight:
                                      double.parse(weightController.text))));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Input valid Weight")));
                    }
                  },
                  child: Container(
                    height: 200,
                    child: Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Small Dog",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/small_dog.jpg"),
                            fit: BoxFit.cover,
                            opacity: 0.8),
                        color: Colors.amber,
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    if (weightController.text.trim().isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                  category: 'medium',
                                  weight:
                                      double.parse(weightController.text))));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Input valid Weight")));
                    }
                  },
                  child: Container(
                    height: 200,
                    child: Align(
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          "Medium Dog",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        ),
                      ),
                      alignment: Alignment.bottomLeft,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.amber,
                        image: DecorationImage(
                            image: AssetImage("assets/medium_dog.jpg"),
                            fit: BoxFit.cover,
                            opacity: 0.8),
                        borderRadius: BorderRadius.circular(20)),
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                child: GestureDetector(
                  onTap: () {
                    if (weightController.text.trim().isNotEmpty) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePage(
                                  category: 'large',
                                  weight:
                                      double.parse(weightController.text))));
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Please Input valid Weight")));
                    }
                  },
                  child: Container(
                      height: 200,
                      child: Align(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "Large Dog",
                            style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.w600,
                                color: Colors.black54),
                          ),
                        ),
                        alignment: Alignment.bottomLeft,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.amber,
                          image: DecorationImage(
                              image: AssetImage("assets/large_dog.jpg"),
                              fit: BoxFit.cover,
                              opacity: 0.8),
                          borderRadius: BorderRadius.circular(20))),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
