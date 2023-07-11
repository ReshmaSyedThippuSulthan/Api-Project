import 'dart:convert';

import 'package:enteries_apitask/provider/entries_provider.dart';
import 'package:enteries_apitask/service/api_function.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart"as http;
import 'package:provider/provider.dart';

import 'model/entries_api/entries_api.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>EntriesProvider()),
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'API Details',
          home: Enteries()),
    );
  }
}

class Enteries extends StatefulWidget {
  const Enteries({super.key});

  @override
  State<Enteries> createState() => _EnteriesState();
}

class _EnteriesState extends State<Enteries> {
 EntriesApi? store;
  
  @override
  void initState() {
    getdata();
    

    // TODO: implement initState
    super.initState();
  }
  getdata()async{
   store=await ApiService.getEnteries();
   setState(() {
     
   });
  }
@override
  //https://api.publicapis.org/entries
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entries"),
        actions:  [Center(child: Text(store==null?"0":store!.count!.toString()))],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: FutureBuilder(
            future: ApiService.getEnteries(),
            builder: (context,snapshot) {
              if(snapshot.hasData){
               return Column(
                children: [
                 
              ListView.builder(
                physics:const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data!.entries!.length,
                itemBuilder: (BuildContext context, int index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Name"),
                              Text(snapshot.data!.entries![index].api??""),
                            ],
                          ),
              //             SizedBox(
              //   width: 120.0,
              //   child: Text(
              //     "Enter Long Text",
              //     maxLines: 1,
              //     overflow: TextOverflow.ellipsis,
              //     softWrap: false,
              //     style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20.0),
              //   ),
              // ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Link"),
                              SizedBox(
                                width: 120,
                                child: Text(snapshot.data!.entries![index].link??"",maxLines: 1,overflow:TextOverflow.fade,softWrap: false,)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Categories"),
                              Text(snapshot.data!.entries![index].category??""),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
                ],
              );
            }
            else if(snapshot.hasError){
              return const Text("SOME ERROR");
            }
            else{
              return const CircularProgressIndicator();
            }
            }
          ),
        ),
      ),
    );
  }
}
