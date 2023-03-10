import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'call_view_model.dart';
import 'components/keypad.dart';
import 'components/round_button.dart';

class CallScreen extends StatelessWidget {
  const CallScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<CallViewModel>.reactive(
        viewModelBuilder: () => CallViewModel(),
        builder: (context, model, _) {
          return Scaffold(
            bottomNavigationBar: SizedBox(
              height: MediaQuery.of(context).size.height*0.25,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: RoundButton(
                            title: "Keypad",
                            icon: Icons.dialpad,
                            onPressed: model.onDialerSelected,
                          )),
                          Expanded(
                              child: RoundButton(
                            title: "Mute",
                            icon: Icons.mic_off,
                            isSelected: model.isMute,
                            onPressed: model.onMute,
                          )),
                          Expanded(
                              child: RoundButton(
                                  title: "Speaker",
                                  icon: Icons.speaker,
                                  isSelected: model.isSpeaker,
                                  onPressed: model.onSpeaker)),
                          Expanded(
                              child: RoundButton(
                                  title: "More",
                                  icon: Icons.more_vert,
                                  onPressed: () {})),
                        ],
                      ),
                      SizedBox(height: 28),
                      RoundButton(
                        icon: Icons.call_end,
                        buttonColor: Colors.red,
                        iconColor: Colors.white,
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
            body: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: Column(
                          children: [
                            const CircleAvatar(
                              radius: 50,
                              backgroundColor: Colors.purple,
                              child: Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "B",
                                  style: TextStyle(
                                    color: Colors.white,
                                      fontSize: 50, fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                                text: const TextSpan(
                                    text: "Calling via ",
                                    style: TextStyle(color: Colors.black),
                                    children: [
                                  TextSpan(
                                      text: "MTN-NG1",
                                      style: TextStyle(color: Colors.blue))
                                ])),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              "Beam",
                              style: TextStyle(fontSize: 28),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            const Text("Custom 08109372879"),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    KeyPad(
                        enteredDigits: model.enteredDigits,
                        width: MediaQuery.of(context).size.width,
                        height: model.dialerSelected ? MediaQuery.of(context).size.height*0.4: 0,
                        isSelected: model.dialerSelected),
                  ],
                ),
              ),
            ),
          );
        });
  }
}










