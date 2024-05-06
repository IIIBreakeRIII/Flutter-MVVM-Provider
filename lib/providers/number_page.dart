// According to Stackoverflow,
// A ChangeNotifierProvider wraps the process of listening to a ChangeNotifier into a "ProviderListener" protocol,
// which knows how to make the widget watching the provider rebuild when events occur, and how to disconnect itself when the widget is disposed
// So, ProviderListener protocol works if some of widget is subscribing particular widget, it detect that provider's changes and
// update automatically if it has changes.
// ChangeNotifierProvider is detect like these ChangeNotifier using ProviderListener protocol and if some of event occur, rebuild the widget.
// Also, if widget get disposed, ProviderListener disconnect the connection automatically to save the memory.

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mvvm_provider/viewmodels/number_viewmodel.dart';
import 'package:mvvm_provider/views/number_view.dart';

class NumberPage extends StatelessWidget {
  const NumberPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<NumberViewModel>(
          create: (_) => NumberViewModel(),
        ),
      ],
      child: NumberView(),
    );
  }
}