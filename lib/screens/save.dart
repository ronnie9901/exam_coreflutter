import 'package:exam_coreflutter/screens/homepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class savepage extends StatefulWidget {
  const savepage({super.key});

  @override
  State<savepage> createState() => _savepageState();
}

class _savepageState extends State<savepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('save page'),),

           body:Padding(
             padding: const EdgeInsets.all(8.0),
             child: ListView.builder(
               itemCount: Examlist.length,
               itemBuilder: (context, index) => Card(
                 color: Colors.green.shade50,
                 child: InkWell(onTap: () {
                   Navigator.of(context).pushNamed('/details');
                 },
                   child: ListTile(
                     title: Row(
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Container(

                           height: 80,
                           width: 80,
                           decoration: BoxDecoration(
                               image: (Examlist[index].img!=null)?DecorationImage(image: FileImage(Examlist[index].img!),fit: BoxFit.cover):null,
                               color: Colors.white, shape: BoxShape.circle),

                         ),
                         Column(
                           children: [

                             Text('   ${Examlist[index].name!.text}'),
                             Text('   ${Examlist[index].id!.text}'),
                             Text('   ${Examlist[index].standard!.text}'),
                           ],
                         ),
                         IconButton(onPressed: () {
                           setState(() {
                           });
                           Examlist.removeAt(index);
                         }, icon: Icon(Icons.delete))
                       ],
                     ),
                   ),
                 ),
               ),
             ),
           ),
    );
  }
}
