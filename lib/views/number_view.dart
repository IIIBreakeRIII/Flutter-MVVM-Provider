// Define View

// _numberViewModel = Provider.of<NumberViewModel>(context, listen: false);
// This codes mean this widget must not be the listener of NumberViewModel.
// Generally, if we call the Provider.of, according widget will be rebuild by data changes.
// But, if we want the change of particular widget, we use consumer widget to change the state.
// In below code, it has only changes of number by button action.
// So, we make whole view has no changes except the number by using "listen: false" and "consumer"

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_provider/viewmodels/number_viewmodel.dart';

class NumberView extends StatelessWidget {
  NumberView({Key? key}) : super(key: key);

  late NumberViewModel _numberViewModel;

  @override
  Widget build(BuildContext context) {
    _numberViewModel = Provider.of<NumberViewModel>(context, listen: false);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const Spacer(),
              Consumer<NumberViewModel>(
                builder: (_, NumberViewModel viewModel, __) {
                  return Text(viewModel.num.toString());
                }
              ),
              ElevatedButton(
                onPressed: () {
                  _numberViewModel.incrementNum();
                },
                child: const Text("증가"),
              ),
              ElevatedButton(
                onPressed: () {
                  _numberViewModel.decrementNum();
                },
                child: const Text("감소"),
              ),
              const Spacer(),
            ]
          )
        )
      )
    );
  }
}