import 'package:flutter/material.dart';
import 'package:getpostapi/users.dart';

class CardUsers extends StatelessWidget {
  final Users datausers;
  const CardUsers({Key? key, required this.datausers}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15),
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.blueGrey.withOpacity(0.5),
      ),
      child: Column(
        children: [
          (datausers.urlphoto != null)
              ? ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image.network(datausers.urlphoto.toString(),
                      filterQuality: FilterQuality.high, loadingBuilder:
                          (BuildContext context, Widget child,
                              ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Center(
                        child: CircularProgressIndicator(
                      value: loadingProgress.expectedTotalBytes != null
                          ? loadingProgress.cumulativeBytesLoaded /
                              loadingProgress.expectedTotalBytes!
                          : null,
                      color: Colors.white,
                    ));
                  }),
                )
              : Container(),
          SizedBox(
            height: 10,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
                child: Text('ID',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(width: 220, child: Text(': ${datausers.id}'))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
                child: Text('Name',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(width: 220, child: Text(': ${datausers.name}'))
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                width: 50,
                child: Text('Email',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              SizedBox(width: 220, child: Text(': ${datausers.email}'))
            ],
          )
        ],
      ),
    );
  }
}
