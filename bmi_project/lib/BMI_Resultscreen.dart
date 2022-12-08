import 'package:flutter/material.dart';
import 'package:awesome_dialog/awesome_dialog.dart';

class BMIResultscreen extends StatelessWidget {
  int? result;
  int? age;
  bool? ismale;
  String? temp = " ";
  DialogType x = DialogType.success;
  DialogType y = DialogType.warning;
  BMIResultscreen(
      {@required this.age, @required this.result, @required this.ismale});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BMI RESULT"),
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.keyboard_arrow_left)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
              'Gender : ${ismale! ? 'male' : 'female'}',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            Text(
              "Result : ${result}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            Text(
              "Age : ${age}",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 50,
            ),
            AnimatedButton(
                width: 200,
                text: 'show more info',
                color: Colors.green,
                pressEvent: () {
                  if (result! <= 18.5) {
                    temp = 'Underweight';
                  } else if (result! > 18.5 && result! <= 25) {
                    temp = 'Normal';
                  } else if (result! > 25) {
                    temp = 'Overweight';
                  }
                  if (temp == 'Normal') {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      headerAnimationLoop: false,
                      dialogType: x,
                      showCloseIcon: true,
                      desc: 'you are ${temp}',
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDismissCallback: (type) {
                        debugPrint('Dialog Dissmiss from callback $type');
                      },
                    ).show();
                  } else {
                    AwesomeDialog(
                      context: context,
                      animType: AnimType.leftSlide,
                      headerAnimationLoop: false,
                      dialogType: y,
                      showCloseIcon: true,
                      desc: 'you are ${temp}',
                      btnOkOnPress: () {
                        debugPrint('OnClcik');
                      },
                      btnOkIcon: Icons.check_circle,
                      onDismissCallback: (type) {
                        debugPrint('Dialog Dissmiss from callback $type');
                      },
                    ).show();
                  }
                }),
          ],
        ),
      ),
    );
  }
}
