import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/database.dart';

class Download_Card extends StatefulWidget {
  const Download_Card({Key? key}) : super(key: key);

  @override
  State<Download_Card> createState() => _Download_CardState();
}

class _Download_CardState extends State<Download_Card> {

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            ...movies.indexedMap(
              (element, index) => Container(
                margin: EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            movies[index]['poster']!,
                            width: width * 0.34,
                            height: height * 0.14,
                            fit: BoxFit.fill,
                          ),
                        ),
                        Align(
                          heightFactor: 2.0,
                          widthFactor: 2.5,
                          alignment: Alignment.center,
                          child: IconButton(
                              onPressed: (){},
                              icon: Icon(
                                IconlyBold.play,
                                color: Colors.grey[350],
                              ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 12.0,),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 9.0),
                            child: Text(
                                movies[index]['title'] ?? 'Movie',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18.0,
                              ),
                              softWrap: false,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          SizedBox(height: height*0.014,),
                          Container(
                            // margin: EdgeInsets.only(top: 15.0, left: 2.0),
                            child: Text(
                              movies[index]['runtime']!,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          SizedBox(height: height*0.01,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                                decoration: BoxDecoration(
                                  color: kPrimaryColorLight,
                                  borderRadius: BorderRadius.circular(7.0),
                                ),
                                  child: Text(
                                      movies[index]['size'] ?? '1.0 GB',
                                    style: TextStyle(
                                      color: kPrimaryColor,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 11.0,
                                    ),
                                  ),
                              ),
                              IconButton(
                                onPressed: () {
                                  showModalBottomSheet<void>(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.vertical(top: Radius.circular(30))),
                                    context: context,
                                    builder: (BuildContext context) {
                                      return _showBottomSheetfunc(index,height,width);
                                    },
                                  );
                                },
                                icon: Icon(
                                  IconlyLight.delete,
                                  size: 18,
                                  color: kPrimaryColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Container _showBottomSheetfunc(int index,double height,double width) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24),
      height: 450,
      child: Stack(children: [
        Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 165,vertical: 12),
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey.shade500,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              Text(
                'Delete',
                style: TextStyle(fontSize: 24,fontWeight: FontWeight.w500,color: kPrimaryColor),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 1.5,
                height: 50,
              ),
              Text(
                'Are you sure you want to delete this movie download?',
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),
              ),
              SizedBox(height: 20.0),
              Container(
                margin: EdgeInsets.symmetric(vertical: 5.0,horizontal: 45),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              movies[index]['poster']!,
                              width: width * 0.34,
                              height: height * 0.14,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            heightFactor: 2.0,
                            widthFactor: 2.5,
                            alignment: Alignment.center,
                            child: IconButton(
                              onPressed: (){},
                              icon: Icon(
                                IconlyBold.play,
                                color: Colors.grey[350],
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 18.0,),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 9.0,right: 10),
                              child: Text(
                                movies[index]['title'] ?? 'Movie',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                ),
                                softWrap: false,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                            SizedBox(height: height*0.014,),
                            Container(
                              // margin: EdgeInsets.only(top: 15.0, left: 2.0),
                              child: Text(
                                movies[index]['runtime']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0,
                                ),
                              ),
                            ),
                            SizedBox(height: height*0.01,),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                              decoration: BoxDecoration(
                                color: kPrimaryColorLight,
                                borderRadius: BorderRadius.circular(7.0),
                              ),
                              child: Text(
                                movies[index]['size'] ?? '1.0 GB',
                                style: TextStyle(
                                  color: kPrimaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 11.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                thickness: 1.5,
                height: 50,
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 20,
          right: 0,
          left: 0,
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width*0.40,60),
                      elevation: 0,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Color.fromARGB(100, 252, 210, 213),
                      foregroundColor: kPrimaryColor,
                    ),
                    onPressed: (){},
                    child: Text('Cancel',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                Container(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width*0.40,60),
                      elevation: 6,
                      shadowColor: kPrimaryColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      foregroundColor: Colors.white,
                      backgroundColor: kPrimaryColor,
                    ),
                    onPressed: (){
                      print(index);
                      print(movies.elementAt(index));
                      setState(() {
                        movies.removeAt(index);
                      });
                      Navigator.pop(context);
                    },
                    child: Text('Yes,  Delete',style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                )
              ],
            ),
          ),
        )
      ]),
    );
  }
}

extension IndexedIterable<E> on Iterable<E> {
  Iterable<T> indexedMap<T>(T Function(E element, int index) f) {
    var index = 0;
    return map((e) => f(e, index++));
  }
}
