
import 'package:first_flutter_app/api_result.dart';
import 'package:first_flutter_app/detail_page/detail_page.dart';
import 'package:flutter/material.dart';

Widget getMyRow(int index, Success success, BuildContext context) {
    var positiveResult = success.result;
    return Card(
        child: ListTile(
      title: Text(
        positiveResult.elementAt(index).id,
      ),
      subtitle: Text(
          'height: ${positiveResult.elementAt(index).height.toString()}, width: ${positiveResult.elementAt(index).width.toString()}'),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  DetailsPage(catId: positiveResult.elementAt(index).id),
            ));
      },
      tileColor: const Color.fromARGB(255, 167, 220, 245),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(positiveResult.elementAt(index).url),
        radius: 30,
      ),
      trailing: const Icon(
        Icons.pets,
        color: Color.fromARGB(255, 0, 62, 112),
      ),
    ));
  }