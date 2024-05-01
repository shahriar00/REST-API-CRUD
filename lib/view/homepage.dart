import 'package:flutter/material.dart';
import 'package:restapi/model/api_model.dart';
import 'package:restapi/services/apis.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<RestApiModel>? post;
  APIs apis = APIs();



  void clickGetData(){
    setState(() {
      post = apis.fetchData();
    });
  }

    void clickDeleteData(){
    setState(() {
      post = apis.deletePost();
    });
  }


   void clickPostData(){
    setState(() {
      post = apis.createPost("Top Data","This is example");
    });
  }


   void clickUpdateData(){
    setState(() {
      post = apis.updatePost("update data","Data is updated.");
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<RestApiModel>(future: post, builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return CircularProgressIndicator();
            }else if(snapshot.connectionState == ConnectionState.none){
              return Container();
            }else{
              if(snapshot.hasData){
                return buildData(context,snapshot);
              }else if(snapshot.hasError){
                return Text('Error: ${snapshot.error}');
              }
              else{
                return Container();
              }
            }
           

          }),

          SizedBox(height: 50,),

          SizedBox(width: 200,
          child: ElevatedButton(onPressed: ()=> clickGetData(), child: const Text("Get")),),
  SizedBox(height: 50,),
          SizedBox(width: 200,
          child: ElevatedButton(onPressed: ()=> clickPostData(), child: const Text("Post")),),
  SizedBox(height: 50,),
          SizedBox(width: 200,
          child: ElevatedButton(onPressed: ()=> clickUpdateData(), child: const Text("update")),),
  SizedBox(height: 50,),
          SizedBox(width: 200,
          child: ElevatedButton(onPressed: ()=> clickDeleteData(), child: const Text("delete")),),


        ],
      ),
    );
  }

  Widget buildData(context,snapshot){
    return Column( 
      children: [ 
        Padding(padding: EdgeInsets.all(20),child:  
        Text(snapshot.data.title),),
           Padding(padding: EdgeInsets.all(20),child:  
        Text(snapshot.data.body),),
      ],
    );
  }
}