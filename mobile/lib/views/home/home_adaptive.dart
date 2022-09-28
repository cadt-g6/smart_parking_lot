part of home;

class _HomeAdaptive extends StatelessWidget {
  const _HomeAdaptive(
    this.viewModel, {
    Key? key,
  }) : super(key: key);

  final HomeViewModel viewModel;

  int getlastLot(ParkModel park) {
    List<String> lots = [...park.lots]..sort();
    int lastLot = int.tryParse(lots.last.replaceAll(park.name, "")) ?? 0;

    while (lastLot % 2 != 0) {
      lastLot++;
    }

    return lastLot;
  }

  int getRow(ParkModel park) {
    int lastLot = getlastLot(park);
    int row = lastLot ~/ 2;
    return row;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: M3Color.of(context).background,
        title: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: "AEON 3",
                style: Theme.of(context).appBarTheme.titleTextStyle,
              ),
              const WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Icon(Icons.arrow_drop_down),
              ),
            ],
          ),
        ),
        actions: [
          Center(
            child: IconButton(
              icon: const Icon(Icons.light),
              onPressed: () {
                context.read<ThemeProvider>().toggleThemeMode();
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {},
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.payment),
            label: "Payment",
          ),
        ],
        selectedIndex: 0,
      ),
      body: ValueListenableBuilder<List<ParkModel>?>(
        valueListenable: viewModel.parkNotifier,
        builder: (context, value, child) {
          return buildBody(context, value);
        },
      ),
    );
  }

  Widget buildBody(BuildContext context, List<ParkModel>? data) {
    if (data == null) return const Center(child: CircularProgressIndicator());

    double roadsWidth = (data.length + 1) * kToolbarHeight;
    double margin = (data.length * 2 + 1) * 16;
    double parksSize = (MediaQuery.of(context).size.height - 374.0) * getRow(data.first) / 16;
    double width = roadsWidth + margin + parksSize * data.length - 16;
    double startWidth = 36;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const ClampingScrollPhysics(),
      padding: const EdgeInsets.only(bottom: 16),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            height: kToolbarHeight,
            width: width + startWidth,
            padding: const EdgeInsets.only(right: 28.0),
            decoration: BoxDecoration(
              color: M3Color.of(context).readOnly.surface5,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
              ),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      ConfigConstant.sizedBoxH0,
                      Icon(Icons.pin_drop),
                      Text("Start"),
                    ],
                  );
                } else {
                  return Icon(
                    Icons.remove,
                    color: M3Color.of(context).onSurface.withOpacity(0.25),
                  );
                }
              },
            ),
          ),
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(width: startWidth - 16),
                for (int index = 0; index < data.length; index++) ...[
                  const VerticalRoad(),
                  buildPark(context, data[index]),
                  if (index == data.length - 1) const VerticalRoad(),
                ],
              ],
            ),
          ),
          Container(
            height: kToolbarHeight,
            width: width + startWidth,
            margin: EdgeInsets.only(left: startWidth),
            decoration: BoxDecoration(
              color: M3Color.of(context).readOnly.surface5,
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(16)),
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.only(left: 20.0),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return Transform.rotate(
                    angle: math.pi,
                    child: const Icon(Icons.turn_left),
                  );
                } else {
                  return Icon(
                    Icons.remove,
                    color: M3Color.of(context).onSurface.withOpacity(0.25),
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPark(
    BuildContext context,
    ParkModel park,
  ) {
    int row = getRow(park);
    return Stack(
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          margin: const EdgeInsets.symmetric(vertical: 16),
          child: AspectRatio(
            aspectRatio: row / 16,
            child: LayoutBuilder(builder: (context, contraint) {
              return GridView.builder(
                itemCount: 24,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                  mainAxisExtent: contraint.maxHeight / row - 4,
                ),
                itemBuilder: (localContext, index) {
                  String lotIndex = (index + 1).toString().padLeft(2, '0');
                  String lotId = park.name + lotIndex;
                  if (!park.lots.contains(lotId)) return const SizedBox.shrink();
                  return ValueListenableBuilder<AvailibilityModel?>(
                    valueListenable: viewModel.availibilityNotifier,
                    builder: (context, value, child) {
                      bool parked = value?.notFree.contains(lotId) == true;
                      return Container(
                        padding: const EdgeInsets.all(4.0),
                        decoration: BoxDecoration(
                          color:
                              parked ? M3Color.of(context).tertiary.withOpacity(0.1) : M3Color.of(context).background,
                          border: Border.all(color: M3Color.of(context).outline),
                          borderRadius: ConfigConstant.circlarRadius1,
                        ),
                        alignment: Alignment.center,
                        child: parked
                            ? Transform.rotate(
                                angle: index.isEven ? math.pi : 0,
                                child: SimpleShadow(
                                  opacity: 0.5,
                                  color: Colors.black,
                                  offset: index.isEven ? const Offset(3, 3) : const Offset(-3, -3),
                                  sigma: 3,
                                  child: Image.asset(
                                    index % 5 == 0
                                        ? Assets.lot.car4.path
                                        : (index % 4 == 0
                                            ? Assets.lot.car3.path
                                            : (index % 3 == 0 ? Assets.lot.car2.path : Assets.lot.car.path)),
                                  ),
                                ),
                              )
                            : Text(lotId),
                      );
                    },
                  );
                },
              );
            }),
          ),
        ),
        Positioned(
          right: 0,
          top: 0,
          child: ParkSign(
            name: park.name,
            left: false,
          ),
        ),
        // Positioned(
        //   left: 0,
        //   bottom: 0,
        //   child: ParkSign(
        //     name: park.name,
        //     left: true,
        //   ),
        // )
      ],
    );
  }
}
