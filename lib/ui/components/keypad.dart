import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../call_view_model.dart';
import 'num_button.dart';
class KeyPad extends ViewModelWidget<CallViewModel> {
  final void Function()? onPressed;
  final String enteredDigits;
  final bool isSelected;
  final double width;
  final double height;
  const KeyPad(
      {Key? key,
        this.onPressed,
        this.enteredDigits = "",
        this.isSelected = false,
        required this.width,
        required this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context, viewModel) {
    return AnimatedContainer(
        decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            )),
        curve: Curves.easeInToLinear,
        width: width,
        height: height,
        duration: Duration(milliseconds: 300),
        child: isSelected
            ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(height: 50,child: Center(child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(enteredDigits, style: TextStyle(fontSize: 24),),
                    SizedBox(width: 10,),
                    IconButton(onPressed: viewModel.removeDigit, icon: Icon(Icons.backspace_rounded)),
                  ],
                ))),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        child: Row(
                          children: List.generate(
                              viewModel.firstThree.length,
                                  (index) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: DialNums(
                                      model: viewModel.firstThree[index],
                                      onPressed: () => viewModel
                                          .onDigitPressed(viewModel.firstThree[index]
                                          .num
                                          .toString()),
                                    ),
                                  ))),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: List.generate(
                              viewModel.fourToSix.length,
                                  (index) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child:
                                    DialNums(model: viewModel.fourToSix[index],
                                      onPressed: () => viewModel
                                          .onDigitPressed(viewModel.fourToSix[index]
                                          .num
                                          .toString()),),
                                  ))),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: List.generate(
                              viewModel.sevTo9.length,
                                  (index) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: DialNums(model: viewModel.sevTo9[index],
                                      onPressed: () => viewModel
                                          .onDigitPressed(viewModel.sevTo9[index]
                                          .num
                                          .toString()),
                                    ),
                                  ))),
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: List.generate(
                              viewModel.starHash.length,
                                  (index) => Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: DialNums(model: viewModel.starHash[index],
                                      onPressed: () => viewModel
                                          .onDigitPressed(viewModel.starHash[index]
                                          .num
                                          .toString()),
                                    ),
                                  ))),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
            : SizedBox());
  }
}