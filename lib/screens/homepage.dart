import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
ImagePicker picker = ImagePicker();
XFile? xFileimg;
class homapage extends StatefulWidget {
  const homapage({super.key});

  @override
  State<homapage> createState() => _homapagState();
}

class _homapagState extends State<homapage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('home page'),
      ),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {});
                        TextEditingController txtController =
                        TextEditingController();
                        if (Exammodel == txtController) {
                          null;
                        } else {
                          TextEditingController txtname =
                          TextEditingController();
                          TextEditingController txtid =
                          TextEditingController();
                          TextEditingController txtstad =
                          TextEditingController();
                          File? img;
                          Examlist.add(Exammodel(
                            name: txtname,
                            id: txtid,
                            standard: txtstad,
                            img: img,
                          ));
                        }
                      },
                      icon: Container(
                        alignment: Alignment.center,
                        height: 40,
                        width: double.infinity,
                       decoration: BoxDecoration(
                         color: Colors.green,
                         borderRadius: BorderRadius.circular(10)
                       ),
                        child: Text(
                          'add  ',
                          style: TextStyle(fontSize: 20),
                        ),
                      )),

                  ...List.generate(
                    Examlist.length,
                        (index) => Column(
                      children: [
                        Stack(
                          children: [
                            Container(
                              alignment: Alignment.center,
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                  image: (Examlist[index].img != null)
                                      ? DecorationImage(image: FileImage(Examlist[index].img!),fit: BoxFit.cover)
                                      : null,
                                  shape: BoxShape.circle,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 70, left: 10),
                              child: InkWell(
                                  onTap: () async {
                                    xFileimg = await picker.pickImage(
                                        source: ImageSource.camera);
                                    setState(() {

                                      Examlist[index].img= File(xFileimg!.path);

                                    });
                                  },
                                  child: Icon(
                                    Icons.camera,
                                    color: Colors.white,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 70, left: 65),
                              child: InkWell(
                                onTap: () async {
                                  xFileimg = await picker.pickImage(
                                      source: ImageSource.gallery);
                                  setState(() {

                                    Examlist[index].img = File(xFileimg!.path);

                                  });
                                },
                                child: Icon(
                                  Icons.image,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                        ListTile(

                            title: Container(
                              height: 322,
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    width: 2,
                                    color: Colors.black,
                                  )),
                              child: Column(

                                children: [
                                  buildTextFormField(
                                    name: 'name',
                                    controller1: Examlist[index].name,
                                  ),
                                  buildTextFormField(
                                      name: 'id',
                                      controller1: Examlist[index].id,keybord: TextInputType.number),
                                  buildTextFormField(
                                      name: 'standard',
                                      controller1: Examlist[index].standard,keybord: TextInputType.number
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        TextButton(
                                            onPressed: () {
                                              setState(() {
                                                Examlist.removeAt(index);
                                              });
                                            },
                                            child: Text(
                                              'Delete',
                                              style: TextStyle(
                                                  color: Colors.grey, fontSize: 18),
                                            )),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            )),
                      ],
                    ),
                  ),
                ]),
          ),
        ),
      ),
      floatingActionButton: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
            color: Colors.green, borderRadius: BorderRadius.circular(10)),
        child: IconButton(
            onPressed: () {
             Navigator.of(context).pushNamed('/save');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.black26,
                  content: Center(
                    child: Text(
                      'Saved',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ),

              );
            },
            icon: Text('save')),
      ),
    );
  }

  Widget buildTextFormField({
    required String name,
    TextInputType? keybord,
    TextEditingController? controller1,

  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: controller1,
        keyboardType: keybord,
          validator: (value) {
            if(value!.isEmpty){
              'fill must be reruired';
            }
          },
        decoration: InputDecoration(

          focusedBorder: OutlineInputBorder(
            borderRadius:  BorderRadius.circular(10)
          ),

          label: Text(name),
        ),
      ),
    );
  }
}
String? name = '';
String? id = '';
String? standard = '';
File? img;

List<Exammodel> Examlist = [];
class Exammodel {
  TextEditingController? name;
  TextEditingController? id;
  TextEditingController? standard;
  File? img;

  Exammodel(
      {required this.name, required this.id, required this.standard, this.img});
}
