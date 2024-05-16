
import 'package:flutter/material.dart';
import 'package:ibm/bmiscreens/result.dart';


import 'bmi_service.dart';
class Calculatescreen extends StatefulWidget {
  const Calculatescreen({super.key});

  @override
  State<Calculatescreen> createState() => _CalculatescreenState();
}

class _CalculatescreenState extends State<Calculatescreen> {
  double _sliderValue = 181;
  int _weight = 60;
  int _age = 25;
  void incrementAge() {
    setState(() {
      _age++;
    });
  }

  void decrementAge() {
    setState(() {
      if (_age > 0) {
        _age--;
      }
    });
  }


  void incrementWeight() {
    setState(() {
      _weight++;
    });
  }

  void decrementWeight() {
    setState(() {
      if (_weight > 0) {
        _weight--;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white12,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'BMI CALCULATOR',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GenderSelector(icon: Icons.male, label: 'Male'),
                SizedBox(width: 20),
                GenderSelector(icon: Icons.female, label: 'Female'),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.black45,
              ),
              child: Column(
                children: [
                  const Text(
                    'HEIGHT',
                    style: TextStyle(color: Colors.white30),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        _sliderValue.round().toString(),
                        style: const TextStyle(
                            fontSize: 35,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 5),
                      const Text(
                        'cm',
                        style: TextStyle(fontSize: 20, color: Colors.white30),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 300, // Set the desired width of the slider
                    child: Slider(
                      value: _sliderValue,
                      min: 100,
                      max: 250,
                      divisions: 150,
                      label: _sliderValue.round().toString(),
                      onChanged: (double value) {
                        setState(() {
                          _sliderValue = value;
                        });
                      },
                      activeColor: Colors.red[900],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  height: 200,
                  width: 180,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'WEIGHT',
                        style: TextStyle(color: Colors.white60),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _weight.toString(),
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white54),
                            child: IconButton(
                                onPressed: decrementWeight,
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white54),
                            child: IconButton(
                              onPressed: incrementWeight,
                              icon: const Icon(
                                Icons.add,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Container(
                  height: 200,
                  width: 180,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: Colors.black45,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      const Text(
                        'AGE',
                        style: TextStyle(color: Colors.white60),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _age.toString(),
                        style: const TextStyle(
                            fontSize: 50,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          const SizedBox(width: 20),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white54),
                            child: IconButton(
                                onPressed: decrementAge,
                                icon: const Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                  size: 30,
                                )),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.white54),
                            child: IconButton(
                              onPressed: incrementAge,
                              icon: const Icon(
                                Icons.add,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.red[900],
        child: TextButton(
          style: TextButton.styleFrom(backgroundColor: Colors.transparent),
          onPressed: () {
            double result = bmiCalculation(
                weight: _weight, height: _sliderValue.round());
             String status = healthState(result: result);
            String out = healthText(result: result);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      Result(bmi: result,healthState: status,healthText: out,
                         ),
                         ),);
          },
          child: const Text(
            'CALCULATE',
            style: TextStyle(
              backgroundColor: Colors.transparent,
              color: Colors.white,
              fontSize: 25,
            ),
          ),
        ),
      ),
    );
  }
}

class GenderSelector extends StatelessWidget {
  final IconData icon;
  final String label;

  const GenderSelector({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 180,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.black45,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 15,
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              icon,
              size: 80,
              color: Colors.white,
            ),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 18, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
