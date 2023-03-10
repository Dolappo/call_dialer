import 'package:stacked/stacked.dart';

import 'call_screen.dart';
import 'components/button_model.dart';

class CallViewModel extends BaseViewModel {
  String enteredDigits = "";
  bool dialerSelected = false;
  bool isMute = false;
  bool isSpeaker = false;


  void onDigitPressed(String digit) {
    enteredDigits += digit;
    notifyListeners();
  }

  void removeDigit(){
    if(enteredDigits.isNotEmpty){
      enteredDigits = enteredDigits.substring(0, enteredDigits.length - 1);
      notifyListeners();
    }
  }

  void onMute(){
    isMute = !isMute;
    isSpeaker = false;
  notifyListeners();
  }

  void onSpeaker(){
    isSpeaker = !isSpeaker;
    isMute = false;
  notifyListeners();
  }

  void onDialerSelected() {
    dialerSelected = !dialerSelected;
    notifyListeners();
  }

  List<DialNumModel> firstThree = [
    DialNumModel(num: "1", letters: ".,?"),
    DialNumModel(num: "2", letters: "abc"),
    DialNumModel(num: "3", letters: "def")
  ];
  List<DialNumModel> fourToSix = [
    DialNumModel(num: "4", letters: "ghi"),
    DialNumModel(num: "5", letters: "jkl"),
    DialNumModel(num: "6", letters: "mno")
  ];
  List<DialNumModel> sevTo9 = [
    DialNumModel(num: "7", letters: "pqrs"),
    DialNumModel(num: "8", letters: "tuv"),
    DialNumModel(num: "9", letters: "wxyz")
  ];
  List<DialNumModel> starHash = [
    DialNumModel(num: "*", letters: ""),
    DialNumModel(num: "0", letters: "..."),
    DialNumModel(num: "#", letters: "...")
  ];
}
