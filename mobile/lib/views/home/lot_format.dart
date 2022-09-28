class LotFormatModel {
  String name = "AEONII";
}

class ParkModel {
  final String name;
  final List<String> lots;

  ParkModel({
    required this.name,
    required this.lots,
  });
}

class LotFormat {
  List<ParkModel> get parks => [
        ParkModel(
          name: "P1",
          lots: [
            "P101",
            "P102",
            "P103",
            "P104",
            "P105",
            "P106",
            "P107",
            "P109",
            "P110",
            "P111",
            "P112",
          ],
        ),
        ParkModel(
          name: "P2",
          lots: [
            "P201",
            "P202",
            "P203",
            "P204",
            "P205",
            "P206",
            "P207",
            "P208",
            "P209",
            "P210",
            "P211",
            "P212",
          ],
        ),
        ParkModel(
          name: "P3",
          lots: [
            "P301",
            "P303",
            "P304",
            "P305",
            "P306",
            "P307",
            "P308",
            "P309",
            "P310",
            "P311",
            "P312",
          ],
        ),
      ];

  Map<String, dynamic> get format {
    return {
      "data": [
        {
          "name": "P1",
          "lots": [
            "P101",
            "P102",
            "P103",
            "P104",
            "P105",
            "P106",
            "P108",
            "P109",
            "P110",
            "P111",
            "P112",
          ],
        },
        {
          "name": "P2",
          "lots": [
            "P201",
            "P202",
            "P203",
            "P204",
            "P205",
            "P206",
            "P207",
            "P208",
            "P209",
            "P210",
            "P211",
            "P212",
          ],
        },
        {
          "name": "P3",
          "lots": [
            "P301",
            "P303",
            "P304",
            "P305",
            "P306",
            "P307",
            "P308",
            "P309",
            "P310",
            "P311",
            "P312",
          ],
        },
      ],
    };
  }
}
