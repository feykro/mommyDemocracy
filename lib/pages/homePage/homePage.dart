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
    /*
    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(color: Colors.blue),
        child: Column(
          children: [
            //  top buttons and title section
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
            // center waifu VS and meter widget
            Expanded(
              flex: 66,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 9,
                    child: Stack(
                      fit: StackFit.passthrough,
                      alignment: AlignmentDirectional.centerStart,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/makima.png'),
                              ),
                              /*Image(
                                image: Image.network(mommies.first.data['pictureUrl']).image,
                                fit: BoxFit.cover,
                              ),*/
                            ),
                            Expanded(
                              flex: 1,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset('assets/images/makima.png'),
                              ),
                              /*Image(
                                image: Image.network(mommies[1].data['pictureUrl']).image,
                                fit: BoxFit.cover,
                              ),*/
                            ),
                          ],
                        ),
                        Container(alignment: Alignment.center, child: const Text("VS")),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: RotatedBox(
                      quarterTurns: -1,
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(0, 8, 8, 25),
                        child: LinearProgressIndicator(
                          value: 0.3,
                          valueColor: AlwaysStoppedAnimation(Colors.orange),
                          backgroundColor: Colors.amberAccent,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //  bottom row
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
     */
  }
}
