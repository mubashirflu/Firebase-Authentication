import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:drawing_app/functions/auth_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  String? imageURL;

  // Image Picker
  final ImagePicker _imagepicker = ImagePicker();
  Future<void> PickImage() async {
    try {
      XFile? res = await _imagepicker.pickImage(source: ImageSource.gallery);
      if (res != null) {
        await uploadImagetoFirebase(File(res.path));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.red,
        content: Text("Image Loaded Failed"),
      ));
    }
  }

  Future<void> uploadImagetoFirebase(File image) async {
    try {
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().microsecondsSinceEpoch}.png");
      await reference.putFile(image).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text("Image has been loaded Successfully")));
      });
      imageURL = await reference.getDownloadURL();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red, content: Text("Image Loaded Failed")));
    }
  }

  Future<void> uploadImageToFirebase(File image) async {
    try {
      // Create a reference to the location where you want to upload the image
      Reference reference = FirebaseStorage.instance
          .ref()
          .child("images/${DateTime.now().microsecondsSinceEpoch}.png");

      // Upload the image to Firebase Storage
      await reference.putFile(image).whenComplete(() {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text("Image has been loaded successfully"),
        ));
      });

      // Get the download URL of the uploaded image
      imageURL = await reference.getDownloadURL();
    } catch (e) {
      // Handle any errors during image upload
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        backgroundColor: Colors.red,
        content: Text("Image Upload Failed: ${e.toString()}"),
      ));
    }
  }

  bool isSearch = false;
  String searchtext = '';
  void searchchanger(String value) {
    setState(() {
      searchtext = value;
    });
  }

  final TextEditingController searchcontroller = TextEditingController();
  final TextEditingController namecontroller = TextEditingController();
  Future<void> create() async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialogBox(
            name: "Add Data",
            condition: "Add",
            onPressed: () {
              String name = namecontroller!.text;
              additem(name);
              Navigator.pop(context);
            });
      },
    );
  }

  void additem(String name) {
    myItems.add({"name": name});
  }

  Future<void> delete(String productId) async {
    await myItems.doc(productId).delete();
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      duration: Duration(milliseconds: 500),
      content: Text(
        "Data has been delted",
        style: TextStyle(color: Colors.red),
      ),
    ));
  }

  void update(DocumentSnapshot documentsnapshot) async {
    namecontroller.text = documentsnapshot['name'];
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return MyDialogBox(
            name: "Update Data ",
            condition: "Update",
            onPressed: () async {
              String name = namecontroller!.text;
              myItems.doc(documentsnapshot.id).update({'name': name});
              namecontroller.text = '';
              Navigator.pop(context);
            });
      },
    );
  }

  final CollectionReference myItems =
      FirebaseFirestore.instance.collection("crud");

  bool IsSearch = false;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: IsSearch
            ? Container(
                height: 45,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  onChanged: searchchanger,
                  controller: searchcontroller,
                  cursorColor: Colors.amber,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Search...",
                      contentPadding: EdgeInsets.fromLTRB(26, 30, 20, 13),
                      hintStyle: TextStyle(color: Colors.black)),
                ),
              )
            : const Text(
                "CRUD Operation",
                style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                IsSearch = !IsSearch;
              });
            },
            icon: Icon(
              IsSearch ? Icons.close : Icons.search,
              color: Colors.white,
            ),
          ),
          IconButton(
            onPressed: () {
              signOut(context);
            },
            icon: const Icon(
              Icons.logout_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: StreamBuilder(
        stream: myItems.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          if (streamSnapshot.hasData) {
            final List<DocumentSnapshot> myItems = streamSnapshot.data!.docs
                .where((docs) => docs['name']
                    .toLowerCase()
                    .contains(searchtext.toLowerCase()))
                .toList();
            return ListView.builder(
              itemCount: myItems.length,
              itemBuilder: (context, index) {
                final DocumentSnapshot documentSnapshot = myItems[index];
                return Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      width: double.infinity,
                      margin: const EdgeInsets.all(20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Stack(
                            children: [
                              CircleAvatar(
                                  radius: 30,
                                  child: imageURL == null
                                      ? const Icon(
                                          Icons.person,
                                          size: 20,
                                          color: Colors.white,
                                        )
                                      : SizedBox(
                                          height: 60,
                                          width: 100,
                                          child: ClipOval(
                                            child: Image.network(
                                              imageURL!,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        )),
                              Positioned(
                                left: 34,
                                right: 20,
                                top: 30,
                                child: GestureDetector(
                                  onTap: () {
                                    PickImage();
                                  },
                                  child: const Icon(
                                    Icons.camera_alt,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(documentSnapshot['name']),
                          IconButton(
                            onPressed: () => update(documentSnapshot),
                            icon: const Icon(
                              Icons.edit,
                              color: Colors.amber,
                            ),
                          ),
                          IconButton(
                            onPressed: () => delete(documentSnapshot.id),
                            icon: const Icon(Icons.delete, color: Colors.red),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return const Center();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: create,
        backgroundColor: Colors.amber,
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }

  Dialog MyDialogBox(
          {required String name,
          required String condition,
          required VoidCallback onPressed}) =>
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          margin: const EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name,
                      style: const TextStyle(
                          fontSize: 20.0, fontWeight: FontWeight.bold)),
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: const Icon(
                      Icons.close,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Stack(
                children: [
                  CircleAvatar(
                      radius: 30,
                      child: imageURL == null
                          ? const Icon(
                              Icons.person,
                              size: 20,
                              color: Colors.white,
                            )
                          : SizedBox(
                              height: 60,
                              width: 100,
                              child: ClipOval(
                                child: Image.network(
                                  imageURL!,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )),
                  Positioned(
                    left: 34,
                    right: 20,
                    top: 30,
                    child: GestureDetector(
                      onTap: () {
                        PickImage();
                      },
                      child: const Icon(
                        Icons.camera_alt,
                        color: Colors.grey,
                        size: 25,
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 20.0),
              TextFormField(
                cursorColor: Colors.amber,
                controller: namecontroller,
                decoration: const InputDecoration(
                  hintText: "Enter your name",
                  suffixIcon: Icon(Icons.person),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style:
                        ElevatedButton.styleFrom(backgroundColor: Colors.amber),
                    onPressed: onPressed,
                    child: Text(
                      condition,
                      style: const TextStyle(color: Colors.white),
                    )),
              )
            ],
          ),
        ),
      );
}
