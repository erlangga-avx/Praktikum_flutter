import 'package:bmi_calculator_praktikum_m/components/reusable_card.dart';
import 'package:bmi_calculator_praktikum_m/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class resultPage extends StatelessWidget {
  static const routeName = "/result";
  const resultPage(
      {Key key, this.bmiResult, this.resultText, this.interpretation})
      : super(key: key);

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    final resultPage = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('HASIL HITUNG'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.all(15.0),
              child: Text(
                'Hasil Hitung',
                style: kTitleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kactiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        resultPage,
                        style: kResultTextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        resultPage.bmiResult,
                        style: kBMITextStyle,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        resultPage.interpretation,
                        style: kBodyTextStyle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          BottomButton(
              ButtonText: "HITUNG ULANG",
              onTap: () {
                Navigator.pushNamed(context, '/');
              }),
        ],
      ),
    );
  }
}
