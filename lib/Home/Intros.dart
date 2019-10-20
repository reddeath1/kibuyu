import 'package:flutter/material.dart';

class Intro extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return IntroState();
  }
  
}

class IntroState extends State<Intro> with SingleTickerProviderStateMixin {

  int item = 3,
      _curPage = 0;
  PageController _controller;

  pageChanged(int page) {
    setState(() {
      print(page);
      _curPage = page;
    });
  }

  bool notNull(Object o) => o != null;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = PageController(initialPage: _curPage);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(25),
        child: PageView.builder(itemBuilder: (context, index) {
//          print(index);
          return index == _curPage ? _buildPage(index) : Container();
        },
          onPageChanged: pageChanged,
          itemCount: item,
          controller: _controller,
        ),
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height + 70,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                stops: [
                  0.1,
                  1
                ],
                colors: [
                  Color(0xffFF5A5F),
                  Color(0xffFC9272)
                ])),
      ),
      backgroundColor: Color.fromRGBO(255, 90, 95, 1),
      bottomNavigationBar: BottomAppBar(
        color: Color(0xffFC9272),
        elevation: 0,
        child: Container(
          height: 70,
          width: MediaQuery
              .of(context)
              .size
              .width,
          padding: EdgeInsets.all(25),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    .2,
                    1,
                    .8
                  ],
                  colors: [
                    Color.fromRGBO(255, 90, 95, .3),
                    Color.fromRGBO(252, 146, 114, .3),
                    Color.fromRGBO(255, 90, 95, .3)
                  ])),
          child: Center(
            child: _curPage != item ?
            ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.all(0.0),
              itemBuilder: (context, index) {
                return Container(
                  height: 12,
                  width: 12,
                  margin: const EdgeInsets.only(bottom: 0.0, left: 10.0),
                  decoration: new BoxDecoration(
                    color: (_curPage == index)
                        ? Color.fromRGBO(255, 255, 255, 1) : Color.fromRGBO(244, 244, 244, .4),
                    shape: BoxShape.circle,
                    boxShadow: [
                      new BoxShadow(
                          color: Color.fromRGBO(100, 0, 0, .1),
                          blurRadius: 5.0,
                          offset: Offset(5.0, 5.0)
                      )
                    ],
                  ),
                );
              },
              itemCount: item,
            ) : Container(),
          ),
        ),
      ),
    );
  }

  _buildPage(int page) {
    if (page == 0) {
      return pages("Discover Properties",
        "Through our advanced search algorithms,  you can find suitable courses easily.",
          './assets/img/intro.png');
    }else if(page == 1){

      return pages("Book an inspection",
          "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
          './assets/img/inspector.png');
    } else {
      return page3();
    }
  }
  
  page3(){
    return Stack(
      overflow: Overflow.clip,
      alignment: Alignment.bottomCenter,
      children: <Widget>[
//        Container(
//          width: MediaQuery.of(context).size.width,
//          height: MediaQuery.of(context).size.height,
//          decoration: BoxDecoration(
//            image: DecorationImage(
//                image: AssetImage('./assets/img/building.jpg',),
//              fit: BoxFit.cover
//            ),
//            color: Colors.transparent
//          ),
//        )
      
      Container(
        alignment: Alignment.center,
        child: Image(image: AssetImage("./assets/img/logo.png"),
        width: 100,height: 100,),
      ),
      
      Container(
        alignment: Alignment.bottomCenter,
        margin: EdgeInsets.only(bottom: 100),
        child: Text("All the best properties are here.",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),),
      ),
        InkWell(
          child: Container(
            alignment: Alignment.bottomCenter,
            width: MediaQuery.of(context).size.width / 1.4,
            height: 55,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(25)),
            ),
            padding: EdgeInsets.all(15),
            child: Center(
              child: Text("GET STARTED",style: TextStyle(
                color: Color(0xffFF5A5F),
                fontWeight: FontWeight.bold
              ),),
            ),
          ),
        ),
        
      ],
    );
  }

  pages(String title,String desc, String image){
    return Center(
      child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 30),
                width: MediaQuery.of(context).size.width / 1.8,
                height: MediaQuery.of(context).size.height / 2.7,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(image)
                    )
                ),
              ),

              Padding(
                padding: EdgeInsets.only(top: 60,bottom: 8),
                child: Title(
                  child: Text(title,
                    style: TextStyle(fontSize: 22,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  color: Colors.white,
                ),
              ),

              Container(
                padding: EdgeInsets.only(left: 25,right: 25),
                child: Text(desc,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white
                  ),),
              )
            ],
          )
      ),
    );
  }
}