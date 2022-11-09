import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/my_list_module/showWatchersList.dart';

class MyList extends StatefulWidget {
  const MyList({Key? key}) : super(key: key);

  @override
  State<MyList> createState() => _MyListState();
}

class _MyListState extends State<MyList> {
  bool _isSelectable = false;
  int _tabBarIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,

          /// Logo here
          leading: const Center(
            child: Text(
              'M',
              style: TextStyle(
                fontSize: 24.0,
                color: kAppThemeRed,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          title: const Text(
            'My List',
            style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                color: Colors.black),
          ),
          actions: [
            IconButton(
              onPressed: () {
                // TODO: Perform search action
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (builder) {
                      return selectBottomSheet();
                    });
              },
              icon: const Icon(
                IconlyLight.moreCircle,
                color: Colors.black,
              ),
            )
          ],
          bottom: TabBar(
            overlayColor: MaterialStateProperty.all(Colors.red.shade200),
            labelColor: kAppThemeRed,
            indicatorColor: kAppThemeRed,
            onTap: (value) {
              if (_tabBarIndex != value)
                // setState(() {
                  _isSelectable = false;
                // });
              setState(() {
                _tabBarIndex = value;
              });
              print(value);
            },
            indicatorWeight: 3,
            tabs: [
              Tab(
                child: ListTile(
                  leading: Icon(Icons.play_circle_outline,
                      color: _tabBarIndex == 0 ? kAppThemeRed : Colors.grey),
                  title: Text('Creator',
                      style: TextStyle(
                          color:
                              _tabBarIndex == 0 ? kAppThemeRed : Colors.grey)),
                ),
              ),
              Tab(
                child: ListTile(
                  leading: Icon(Icons.perm_media_outlined,
                      color: _tabBarIndex == 1 ? kAppThemeRed : Colors.grey),
                  title: Text('Watcher',
                      style: TextStyle(
                          color:
                              _tabBarIndex == 1 ? kAppThemeRed : Colors.grey)),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Text('Creator'),
            showWatchersList(isSelectOn: _isSelectable),
          ],
        ),
      ),
    );
  }

  Widget selectBottomSheet() {
    return Container(
      padding: EdgeInsets.all(16),
      color: Colors.transparent,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: kAppThemeRed,
                foregroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50)),
            onPressed: () {
              setState(() {
                _isSelectable = true;
              });
              Navigator.pop(context);
            },
            child: Text('Select'),
          ),
          SizedBox(height: 12),
          TextButton(
            style: TextButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                backgroundColor: Colors.white.withOpacity(0.2),
                foregroundColor: Colors.white,
                fixedSize: Size(MediaQuery.of(context).size.width * 0.9, 50)),
            onPressed: () {
              setState(() {
                _isSelectable = false;
              });
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
        ],
      ),
    );
  }
}
