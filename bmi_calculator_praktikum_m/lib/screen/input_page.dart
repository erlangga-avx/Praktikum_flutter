import 'package:bmi_calculator_praktikum_m/components/round_button_icon.dart';
import 'package:bmi_calculator_praktikum_m/constant.dart';
import 'package:bmi_calculator_praktikum_m/screen/calculator_brain.dart';
import 'package:bmi_calculator_praktikum_m/screen/result_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/reusable_card.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 100;
  int weight = 30;
  int age = 10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // jenis kelamin
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      selectedGender = Gender.male;
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.mars,
                      label: 'MALE',
                    ),
                    colour: selectedGender == Gender.male
                        ? kactiveCard
                        : kInactiveColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      selectedGender = Gender.female;
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? kactiveCard
                        : kInactiveColor,
                  ),
                ),
              ],
            ),
          ),
//never gonna give you up, never gonna let you down
          //tinggi
          Expanded(
            child: ReusableCard(
              colour: kactiveCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'TINGGI',
                    style: kLabelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          activeTickMarkColor: Colors.white,
                          inactiveTickMarkColor: Color(0xFF8D8E98),
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderThumbShape(enabledThumbRadius: 30.0)),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double newValue) {
                            setState(() {
                              height:
                              newValue.round();
                            });
                          }))
                ],
              ),
            ),
          ),

          //berat dan umur
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'UMUR',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (age > 1) age--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButtonIcon(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kactiveCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'BERAT',
                          style: kLabelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButtonIcon(
                                icon: FontAwesomeIcons.minus,
                                onPressed: () {
                                  setState(() {
                                    if (weight > 30) weight--;
                                  });
                                }),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundButtonIcon(
                                icon: FontAwesomeIcons.plus,
                                onPressed: () {
                                  setState(() {
                                    weight++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
              buttonText: "HITUNG",
              onTap: () {
                CalculatorBrain hitung =
                    CalculatorBrain(height: height, weight: weight);
                Navigator.pushNamed(
                  context,
                  resultPage.routeName,
                  arguments: resultPage(
                    bmiResult: hitung.calculateBMI(),
                    resultText: hitung.getResult(),
                    interpretation: hitung.getInterpretation(),
                  ),
                );
              })
        ],
      ),
    );

    //tombol calculate
  }
}
