import 'package:flutter/material.dart';
import 'package:mommy_democracy/pages/homePage/VsScreenViewModel.dart';
import 'package:mommy_democracy/pages/homePage/VsWidget.dart';
import 'package:stacked/stacked.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<VsScreenViewModel>.reactive(
        viewModelBuilder: () => VsScreenViewModel(),
        onModelReady: (viewModel) {
          viewModel.initMommies(); // Fetch waifus
          viewModel.initCurrentBattle(); // Fetch battle
        },
        builder: (context, viewModel, child) {
          return Scaffold(
            body: SafeArea(
              child: Column(
                children: [
                  //  Top part
                  Expanded(
                    flex: 10,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: const [
                        Icon(Icons.account_circle_rounded),
                        Text(
                          "Waifu war",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Icon(Icons.settings)
                      ],
                    ),
                  ),
                  //  VS widget
                  const Expanded(flex: 66, child: VsWidget()),
                  //  bottom part
                  Expanded(
                    flex: 15,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: const [
                      Icon(Icons.account_tree_rounded),
                      Text("Insert ad"),
                    ]),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
