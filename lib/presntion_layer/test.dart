import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  String name;
  String id ;
  String image;
  String  categoriname;
   Test({super.key, required this.name , required this.id, required this.image,required this.categoriname});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green,title: Text("${widget.categoriname}"),),
      body: SizedBox(
        child: Center(
          child: Column(
            children: [
              Image.network("${widget.image}",width: 250,height: 150,),
              Text("${widget.name}".toString()),
            ],
          ),
        ),
      ),
    );
  }
}
