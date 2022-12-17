import 'package:flutter/material.dart';
import 'package:mommy_democracy/pages/homePage/VsScreenViewModel.dart';
import 'package:stacked/stacked.dart';

class VsWidget extends ViewModelWidget<VsScreenViewModel> {
  const VsWidget({super.key});

  @override
  Widget build(BuildContext context, VsScreenViewModel viewModel) {
    return vsWidgetBody(context, viewModel);
  }

  Widget vsWidgetBody(BuildContext context, VsScreenViewModel model) {
    return Expanded(
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
                        child: model.mommies == null
                            ? Image.asset('assets/images/makima.png')
                            : Image(
                                image: Image.network(model.mommies!.first.data['pictureUrl']).image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: model.mommies == null
                            ? Image.asset('assets/images/makima.png')
                            : Image(
                                image: Image.network(model.mommies![1].data['pictureUrl']).image,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
                ),
                FractionallySizedBox(
                    alignment: Alignment.center, widthFactor: 0.45, child: Image.asset('assets/images/VS_image.png')),
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
    );
  }
}
