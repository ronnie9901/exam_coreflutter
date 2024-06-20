import 'package:exam_coreflutter/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'details'
        ),
      ),
      body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
          ...List.generate(Examlist.length, (index) => Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 100),
                height: 100,
                width: 100,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  image: (Examlist[index].img!=null)?DecorationImage(image: FileImage(Examlist[index].img!),fit: BoxFit.cover):null,
                ),
              ),
              Text( ' Student Name     :${Examlist[index].name!.text}',style: TextStyle(fontSize: 20,),),
              Text('  Student Grid     :${Examlist[index].id!.text}',style: TextStyle(fontSize: 20,)),
              Text('  Student Grid     :${Examlist[index].standard!.text}',style: TextStyle(fontSize: 20,)),

            ],
          ),
          ),


        ],
      ),
    );
  }
}
