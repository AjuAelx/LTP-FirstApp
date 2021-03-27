import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Data_Model/TimeProvider.dart';
import 'package:provider/provider.dart';

class TimerScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("timerview"),
        centerTitle: true,
      ),
      body: HomeTimer(),
      //  Consumer<TimeProvider>(
      //   builder: (context, data, child) {
      //     return Text(
      //       "${data.time.hour} ${data.time.minute} ${data.time.second} ${data.time.millisecond}"
      //           .toString(),
      //     );
      //   },
      // ),
    );
  }
}

class HomeTimer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var providerTime = Provider.of<TimeProvider>(context, listen: true);
    // Timer.periodic(Duration(milliseconds: 1), (timer) {
    //   Provider.of<TimeProvider>(context, listen: false).updateDateTime();
    // });
    print('this');
    return Container(
      child: ListView(
        padding: EdgeInsets.all(0),
        children: [
          Card(
            elevation: 8,
            child: Column(
              children: [
                Image(
                  image: NetworkImage('https://bit.ly/3seGSQA'),
                  fit: BoxFit.contain,
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "${providerTime.time.hour}:${providerTime.time.minute}:${providerTime.time.second}",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      // child: Text(
      //   "${providerTime.time.hour} https://bit.ly/3seGSQA : ${providerTime.time.minute} : ${providerTime.time.second}"
      //       .toString(),
      // ),
    );
  }
}

// class HomeTimer extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     var providerTime = Provider.of<TimeProvider>(context, listen: true);
//     Timer.periodic(Duration(milliseconds: 1), (timer) {
//       Provider.of<TimeProvider>(context, listen: false).updateDateTime();
//     });
//     // void initState() {
//     //   Timer.periodic(Duration(milliseconds: 1), (timer) {
//     //     Provider.of<TimeProvider>(context, listen: false).updateDateTime();
//     //   });
//     // }

//     return Container(
//       child: Text(
//         "${providerTime.time.hour} ${providerTime.time.minute} ${providerTime.time.second} ${providerTime.time.millisecond}"
//             .toString(),
//       ),
//     );
//   }
// }

// void initState(){
//   Timer.periodic(Duration(milliseconds: 1), (timer)){
//     Provider.of<TimeProvider>(context, listen:false).updateDateTime();
//   }
//   super.initState();
// }
