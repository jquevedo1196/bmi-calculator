import 'package:bmi_calculator/components/bottom_buttom.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum Genders { masculino, femenino }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Genders selectedGender;
  int _height = 170;
  int _weight = 70;
  int _age = 30;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'CALCULADORA DE MC',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment:
            CrossAxisAlignment.stretch, //horizontalmente llena el espacio
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.masculino;
                      });
                    },
                    color: selectedGender == Genders.masculino
                        ? kActiveColorCard
                        : kInactiveColorCard,
                    cardChild: IconContent(
                      iconType: FontAwesomeIcons.mars,
                      texto: "Masculino",
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Genders.femenino;
                      });
                    },
                    color: selectedGender == Genders.femenino
                        ? kActiveColorCard
                        : kInactiveColorCard,
                    cardChild: IconContent(
                      iconType: FontAwesomeIcons.venus,
                      texto: "Femenino",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveColorCard,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    "Altura",
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        _height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "cm",
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: Color(0xFFB1555),
                      thumbShape: RoundSliderThumbShape(
                        enabledThumbRadius: 10,
                      ),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 25,
                      ),
                    ),
                    child: Slider(
                      value: _height.toDouble(),
                      min: 40,
                      max: 250,
                      activeColor: Color(0xFFEB1555),
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double newValue) {
                        setState(() {
                          _height = newValue.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveColorCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Peso (Kg)',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: FloatingActionButton(
                                  heroTag: "menosPeso",
                                  onPressed: () {
                                    setState(() {
                                      _weight > 10 ? _weight-- : _weight;
                                    });
                                  },
                                  backgroundColor: kBottomMoreLessColor,
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: FloatingActionButton(
                                  heroTag: "masPeso",
                                  onPressed: () {
                                    setState(() {
                                      _weight < 100 ? _weight++ : _weight;
                                    });
                                  },
                                  backgroundColor: kBottomMoreLessColor,
                                  child: Icon(FontAwesomeIcons.plus),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveColorCard,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Edad',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          _age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Expanded(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: FloatingActionButton(
                                  heroTag: "menosEdad",
                                  onPressed: () {
                                    setState(() {
                                      _age > 10 ? _age-- : _age;
                                    });
                                  },
                                  backgroundColor: kBottomMoreLessColor,
                                  child: Icon(FontAwesomeIcons.minus),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                child: FloatingActionButton(
                                  heroTag: "masEdad",
                                  onPressed: () {
                                    setState(() {
                                      _age < 100 ? _age++ : _age;
                                    });
                                  },
                                  backgroundColor: kBottomMoreLessColor,
                                  child: Icon(FontAwesomeIcons.plus),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButtom(
            buttonTitle: "CALCULAR",
            onTap: () {
              Navigator.pushNamed(context, '/second');
            },
          ),
        ],
      ),
    );
  }
}
