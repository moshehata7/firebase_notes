import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_test/core/utils/functions/messages.dart';
import 'package:fire_test/core/utils/functions/validation.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_button.dart';
import 'package:fire_test/features/auth_features/presentation/views/widgets/custom_field.dart';
import 'package:fire_test/features/home_feature/presentation/views/home_view.dart';
import 'package:flutter/material.dart';

class AddCategoryView extends StatefulWidget {
  const AddCategoryView({super.key});

  @override
  State<AddCategoryView> createState() => _AddCategoryViewState();
}

class _AddCategoryViewState extends State<AddCategoryView> {
  GlobalKey<FormState> key = GlobalKey();
  TextEditingController nameController = TextEditingController();
  CollectionReference categories = FirebaseFirestore.instance.collection(
    'categories',
  );

  Future<void> addCategory() async {
    if (key.currentState!.validate()) {
      try {
        DocumentReference response = await categories.add({
          'name': nameController.text,
          
        });
        print('✅ Document added!');
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeView();
            },
          ),
        );
      } catch (e) {
        print(e.toString()) ;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.blue),
        title: Text("Add New Category", style: TextStyle(color: Colors.blue)),
      ),
      body: Form(
        key: key,
        child: Column(
          children: [
            SizedBox(height: 20),
            CustomTextField(
              controller: nameController,
              validator: Validation.validateName,
              hintTxt: "Enter Category Name",
              hintStyle: TextStyle(color: Colors.blue),
            ),
            SizedBox(height: 20),
            CustomButton(
              onTap: () {
                addCategory();
              },
              color: Colors.blue,
              height: 50,
              width: 100,
              buttonContent: Text("Add", style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
