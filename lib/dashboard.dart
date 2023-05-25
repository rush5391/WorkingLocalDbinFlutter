import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatefulWidget {
  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.transparent,
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange),
        backgroundColor: Colors.white,
        title: Row(
          children:  <Widget>[
            Text("Test Synkrama",style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w600,fontSize: 17,letterSpacing: 1.5),),
            ],
        ),
        actions: <Widget>[
          IconButton(
            icon:const Icon(
              Icons.shopping_cart,
              color: Colors.deepOrange,
            ),
            onPressed: () {

            },
          )
        ],
      ),
      drawer: Container(
        width: 250,
        child: SafeArea(
          child: Drawer(
            child: Column(
              children: <Widget>[
                SizedBox(height: 10,),
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text('Home'),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: Icon(Icons.person),
                  title: Text('My Account'),
                  onTap: (){
                  },
                ),
                ListTile(
                  leading: Icon(Icons.history),
                  title: Text('Order History'),
                  onTap: (){
                  },
                ),

                Divider(),
                ListTile(
                  leading:  Icon(Icons.input,color: Colors.grey,size: 24,),
                  title: Text('Logout'),
                  onTap: (){

                  },
                ),
                Divider(),
                ListTile(
                  title: Text('About Us'),
                  onTap: (){
                  },
                ),
                ListTile(
                  title: Text('Contact Us'),
                  onTap: (){
                  },
                ),
                ListTile(
                  title: Text('Terms & Conditions'),
                  onTap: (){
                  },
                ),
                ListTile(
                  title: Text('Privacy Policy'),
                  onTap: (){
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body:Container(
        margin: EdgeInsets.only(left: 4,right: 4),
        child: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
            return <Widget>[
              SliverAppBar(
                backgroundColor: Colors.transparent,
                leading: Container(),
                expandedHeight: 180.0,
                pinned: false,
                floating: true,
                snap: true,
                flexibleSpace: FlexibleSpaceBar(
                  background:  CarouselSlider(
                    options: CarouselOptions(
                      //height: 100.0,
                      autoPlay: true,
                    ),
                    items: imgList.map((i) {
                      return Builder(
                        builder: (BuildContext context){
                          return
                          Container(
                            width: MediaQuery.of(context).size.width,
                            // margin: EdgeInsets.symmetric(horizontal: 5.0),
                            margin: EdgeInsets.only(bottom: 30),
                            decoration: BoxDecoration(
                                color: Colors.white
                            ),
                            child: Card(
                              child: Image.network(
                                i,width: double.infinity,
                                fit: BoxFit.fill,//height: 120,
                              ),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                ),excludeHeaderSemantics: true,
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(48),
                  child: Material(color: Colors.deepOrange,
                    child: Container(),
                  ),
                ),
              ),
            ];
          },
          body:Container(),
        ),
      ),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.home_outlined,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.print,
                  color: Colors.white,
                  size: 35,
                ),
              ),
              IconButton(
                enableFeedback: false,
                onPressed: () {},
                icon: const Icon(
                  Icons.person,
                  color: Colors.white,
                  size: 35,
                ),
              ),
            ],
          ),
        ),);
  }
}
