import 'package:flutter/material.dart';

import '../constants.dart';
import '../database.dart';
import '../widgets/poster_card.dart';

class showWatchersList extends StatefulWidget {
  final bool isSelectOn;
  const showWatchersList({Key? key, required this.isSelectOn})
      : super(key: key);

  @override
  State<showWatchersList> createState() => _showWatchersListState();
}



class _showWatchersListState extends State<showWatchersList> {
  Map<String, bool> _selectedColloction = {};
  List<String> _collection = [];
  bool _showSelect = false;


  @override
  void initState() {
    _showSelect = widget.isSelectOn;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.isSelectOn == false)
      setState(() {
        _selectedColloction = {};
        _collection = [];
      });
    return myList.isEmpty
        ? Center(
      child: Image.asset('assets/images/emptyList.JPG'),
    )
        : Stack(
      children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 5.0, vertical: 2.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// Filters on top
                choiceChipWidget(category),
                const SizedBox(height: 8.0),

                GridView.builder(
                  itemCount: myList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      child: Stack(
                        alignment: Alignment.center,
                        fit: StackFit.expand,
                        children: [
                          PosterCard(
                            image: myList.elementAt(index)['poster']!,
                            rating: myList.elementAt(index)['rating']!,
                            height: 250,
                            width: 150,
                            borderRadius: 16.0,
                            title: myList.elementAt(index)['title']!,
                          ),
                          Visibility(
                            visible: widget.isSelectOn,
                            child: Positioned(
                              top: 15,
                              right: 15,
                              child: GestureDetector(
                                onTap: () {
                                  if (_selectedColloction[myList
                                      .elementAt(index)['title']] ==
                                      null)
                                    _selectedColloction[myList.elementAt(
                                        index)['title']!] = false;

                                  setState(() {
                                    _selectedColloction[myList
                                        .elementAt(index)['title']!] =
                                    !(_selectedColloction[
                                    myList.elementAt(
                                        index)['title']!]!);
                                  });
                                  _selectedColloction.removeWhere(
                                          (key, value) => value == false);
                                  _collection =
                                      _selectedColloction.keys.toList();
                                  print(_selectedColloction[
                                  myList.elementAt(index)['title']]);
                                  print(
                                      'Selected Movies for collection: ' +
                                          _collection.toString());
                                },
                                child: Container(
                                  padding: EdgeInsets.all(1),
                                  height: 30,
                                  width: 30,
                                  decoration: BoxDecoration(
                                    color: (_selectedColloction[
                                    myList.elementAt(
                                        index)['title']] ??
                                        false)
                                        ? Colors.blue
                                        : Colors.transparent,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                  ),
                                  child: Icon(
                                    Icons.check_rounded,
                                    color: (_selectedColloction[
                                    myList.elementAt(
                                        index)['title']] ??
                                        false)
                                        ? Colors.white
                                        : Colors.transparent,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),

        /// Sheet
        Visibility(
          visible:  _collection.isNotEmpty,
          child: DraggableScrollableSheet(
            initialChildSize: 0.15,
            maxChildSize: 0.15,
            minChildSize: 0.15,
            builder: (BuildContext context,
                ScrollController scrollController) {
              return addoptionSheet(context);
            },
          ),
        ),
      ],
    );
  }
}

Widget addoptionSheet(context) {
  return Container(
    decoration: BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: Colors.black54,
          blurRadius: 5.0,
          spreadRadius: 0.1,
        ),
      ],
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(30.0),
      ),
      color: Colors.white,
    ),
    child: Column(
      children: [
        Divider(
          color: Colors.black45,
          height: 15.0,
          thickness: 1.5,
          indent: MediaQuery.of(context).size.width * 0.42,
          endIndent: MediaQuery.of(context).size.width * 0.42,
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: Color.fromARGB(100, 252, 210, 213),
                  foregroundColor: kPrimaryColor,
                ),
                onPressed: () {},
                child: Text(
                  'Unsave',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.4,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  backgroundColor: kPrimaryColor,
                  foregroundColor: Colors.white,
                ),
                onPressed: () {
                  showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30.0),
                      ),
                    ),
                    context: context,
                    builder: (BuildContext context) {
                      return newCollectionSheet(context);
                    },
                  );
                },
                child: Text(
                  'Add Collection',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}


Widget newCollectionSheet(BuildContext context) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Divider(
        color: Colors.black45,
        height: 15.0,
        thickness: 1.5,
        indent: MediaQuery.of(context).size.width * 0.42,
        endIndent: MediaQuery.of(context).size.width * 0.42,
      ),
      SizedBox(
        height: 10.0,
      ),
      Text(
        'New Collection',
        style: TextStyle(
          fontSize: 24.0,
          fontWeight: FontWeight.w700,
          color: kPrimaryColor,
        ),
      ),

      Divider(),

      SizedBox(
        height: 10.0,
      ),

      /// TODO: Add Image
      Container(
        height: 130,
        width: 110,
        color: kPrimaryColor,
      ),

      Padding(
        padding: EdgeInsets.symmetric(horizontal: 50.0),
        child: TextField(),
      ),

      SizedBox(
        height: 10.0,
      ),


      Divider(),

      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 0,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: Color.fromARGB(100, 252, 210, 213),
                foregroundColor: kPrimaryColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Cancel',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.4,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 1,
                shadowColor: kPrimaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                backgroundColor: kPrimaryColor,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                // TODO: navigate to collection screen
                Navigator.popAndPushNamed(context, '/collection');
              },
              child: Text(
                'Done',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),

      SizedBox(
        height: 10.0,
      ),

    ],
  );
}

class choiceChipWidget extends StatefulWidget {
  final List<String> reportList;

  const choiceChipWidget(this.reportList);

  @override
  _choiceChipWidgetState createState() => new _choiceChipWidgetState();
}

class _choiceChipWidgetState extends State<choiceChipWidget> {
  String selectedChoice = "All";

  _buildChoiceList() {
    List<Widget> choices = [];
    for (var item in widget.reportList) {
      choices.add(Container(
        padding: const EdgeInsets.all(2.0),
        child: ChoiceChip(
          label: Text(item),
          labelStyle: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w600,
            color: item == selectedChoice ? Colors.white : kAppThemeRed,
          ),
          labelPadding:
          const EdgeInsets.symmetric(vertical: 2.0, horizontal: 16.0),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1.5,
              color: kAppThemeRed,
            ),
            borderRadius: BorderRadius.circular(100.0),
          ),
          backgroundColor: Colors.white,
          selectedColor: kAppThemeRed,
          selected: selectedChoice == item,
          onSelected: (selected) {
            setState(() {
              selectedChoice = item;
            });
          },
        ),
      ));
    }
    return choices;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: _buildChoiceList(),
      ),
    );
  }
}
