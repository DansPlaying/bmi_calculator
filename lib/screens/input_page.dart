import 'package:bmi_calculator/components/functions.dart';
import 'package:bmi_calculator/screens/score_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/calculateBrain.dart';
import '../components/constants.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int heightSlider = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 18.0,
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: CardReusable(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kactiveColor
                        : kinactiveColor,
                    height: kprincipalHeight,
                    cardChild: SexSelectorContent(
                        label: 'MALE', icono: FontAwesomeIcons.mars)),
              ),
              Expanded(
                child: CardReusable(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  colour: selectedGender == Gender.female
                      ? kactiveColor
                      : kinactiveColor,
                  height: kprincipalHeight,
                  cardChild: SexSelectorContent(
                      label: 'FEMALE', icono: FontAwesomeIcons.venus),
                ),
              ),
            ],
          ),
          Expanded(
            child: CardReusable(
              colour: kactiveColor,
              height: kprincipalHeight,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'HEIGHT',
                    style: klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        heightSlider.toString(),
                        style: kNumberLabelStyle,
                      ),
                      SizedBox(width: 3.0),
                      Text(
                        'cm',
                        style: klabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Color(0xFF8D8E98),
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                    ),
                    child: Slider(
                      value: heightSlider.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      onChanged: (newHeight) {
                        setState(() {
                          heightSlider = newHeight.toInt();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Row(
            children: [
              Expanded(
                child: CardReusable(
                  colour: kactiveColor,
                  height: kprincipalHeight,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'WEIGHT',
                        style: klabelTextStyle,
                      ),
                      Text(weight.toString()),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              operation: () {
                                setState(() {
                                  if (weight < 250) weight++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              operation: () {
                                setState(() {
                                  if (weight > 3) weight--;
                                });
                              },
                            ),
                          ])
                    ],
                  ),
                ),
              ),
              Expanded(
                child: CardReusable(
                  colour: kactiveColor,
                  height: kprincipalHeight,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: klabelTextStyle,
                      ),
                      Text(age.toString()),
                      SizedBox(
                        height: 10.0,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              operation: () {
                                setState(() {
                                  if (age < 90) age++;
                                });
                              },
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              operation: () {
                                setState(() {
                                  if (age > 18) age--;
                                });
                              },
                            ),
                          ])
                    ],
                  ),
                ),
              )
            ],
          ),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc= CalculatorBrain(height: heightSlider, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    // builder: (context) {
                    //   return ResultPage();
                    // },
                    builder: (context) => ResultPage(bmi: calc.calculateBMI(), interpretation: calc.interpretation(), result: calc.getResult()),
              ),
              );
            },
          ),
        ],
      ),
    );
  }
}

