import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_test/features/auth_features/presentation/views/Log_in_view.dart';
import 'package:fire_test/features/home_feature/presentation/views/add_category_view.dart';
import 'package:fire_test/features/home_feature/presentation/views/category_view.dart';
import 'package:fire_test/features/home_feature/presentation/views/widgets/custom_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<QueryDocumentSnapshot> categories = [];
  bool isLoading = true;
  getData() async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection("categories").where("id",isEqualTo: FirebaseAuth.instance.currentUser!.uid)
        .get();
    isLoading = false;
    categories.addAll(querySnapshot.docs);

    setState(() {});
  }

  @override
  void initState() {
    getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return AddCategoryView();
              },
            ),
          );
        },
        backgroundColor: Colors.blue,
        child: Icon(Icons.add, color: Colors.white),
      ),
      appBar: AppBar(
        title: Text(
          "Categories",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.blue,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              // GoogleSignIn googleSignIn = GoogleSignIn();
              // googleSignIn.disconnect();
              await FirebaseAuth.instance.signOut();
              Navigator.pushReplacement(
                context,
                (MaterialPageRoute(
                  builder: (context) {
                    return LogInView();
                  },
                )),
              );
            },
            icon: Icon(Icons.exit_to_app, color: Colors.blue),
          ),
        ],
      ),
      body: isLoading == true
          ? Center(child: CircularProgressIndicator())
          : GridView.builder(
              itemCount: categories.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 160,
              ),
              itemBuilder: (context, index) {
                return CustomCard(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CategoryView(
                            onPressed: () {
                              FirebaseFirestore.instance
                                  .collection("categories")
                                  .doc(categories[index].id)
                                  .delete();
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    return HomeView();
                                  },
                                ),
                              );
                              
                            },
                          );
                        },
                      ),
                    );
                  },
                  txt: categories[index]["name"],
                );
              },
            ),
    );
  }
}
