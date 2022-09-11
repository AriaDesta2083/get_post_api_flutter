import 'package:flutter/material.dart';
import 'package:getpostapi/services/servicesapi.dart';
import 'package:getpostapi/users.dart';
import 'package:getpostapi/widgets/card_users.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Users? datauser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Get Post API'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            datauser != null
                ? CardUsers(datausers: datauser!)
                : const Text('no data'),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.blueGrey,
                  ),
                  onPressed: () async {
                    //! GET ID IN var id
                    var id = 2;
                    Users? result = await Services.getUserId(id);
                    if (result != null) {
                      setState(() {
                        datauser = result;
                      });
                    }
                  },
                  child: const Text('GET')),
            ),
            SizedBox(
              width: 100,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                  ),
                  onPressed: () async {
                    //! POST NAME IN var firstname , lastname
                    //! POST EMAIL IN var email
                    var firstname = 'Aria';
                    var lastname = 'Desta';
                    var email = 'aria.desta18@mail.com';
                    Users? result =
                        await Services.postUser(firstname, lastname, email);
                    if (result != null) {
                      setState(() {
                        datauser = result;
                      });
                    }
                  },
                  child: const Text(
                    'POST',
                    style: TextStyle(color: Colors.blueGrey),
                  )),
            )
          ],
        ),
      ),
      // bottomNavigationBar: Column(
      //   children: [
      //     SizedBox(
      //       width: 100,
      //       child: ElevatedButton(
      //           onPressed: () async {
      //             //! GET ID IN var id
      //             var id = 2;
      //             Users? result = await Services.getUserId(id);
      //             if (result != null) {
      //               setState(() {
      //                 datauser = result;
      //               });
      //             }
      //           },
      //           child: const Text('GET')),
      //     ),
      //     SizedBox(
      //       width: 100,
      //       child: ElevatedButton(
      //           onPressed: () async {
      //             //! POST NAME IN var firstname , lastname
      //             //! POST EMAIL IN var email
      //             var firstname = 'Aria';
      //             var lastname = 'Desta';
      //             var email = 'aria.desta18@mail.com';
      //             Users? result =
      //                 await Services.postUser(firstname, lastname, email);
      //             if (result != null) {
      //               setState(() {
      //                 datauser = result;
      //               });
      //             }
      //           },
      //           child: const Text('POST')),
      //     )
      //   ],
      // ),
    );
  }
}
