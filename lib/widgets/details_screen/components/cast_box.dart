import 'package:flutter/material.dart';

import '../../../database.dart';

class CastBox extends StatefulWidget {
  const CastBox({Key? key}) : super(key: key);

  @override
  State<CastBox> createState() => _CastBoxState();
}

class _CastBoxState extends State<CastBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 108,
      padding: const EdgeInsets.only(right: 6.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Circle Avatar
          CircleAvatar(
            radius: 24.0,
            backgroundImage: NetworkImage(cast.first['profile']!),
          ),
          const SizedBox(width: 8.0),

          /// Name and Role
          Flexible(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// First Name
                Text(
                  cast.first['name']!.split(' ').first,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                /// Last Name
                Text(
                  cast.first['name']!.split(' ').elementAt(1),
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: const TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),

                /// Role
                Text(
                  cast.first['role']!,
                  maxLines: 1,
                  overflow: TextOverflow.fade,
                  style: TextStyle(
                    fontSize: 10.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
