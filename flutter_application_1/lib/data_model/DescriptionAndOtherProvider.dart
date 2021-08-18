import 'package:flutter/cupertino.dart';

class DescriptionProvider extends ChangeNotifier {
  List<DestinationDescriptions> _desctDesc = <DestinationDescriptions>[];

  List<DestinationDescriptions> get getDescriptions {
    return _desctDesc;
  }

  void addDescription(String descriptionAboutPlace, String destination) {
    DestinationDescriptions destDesc =
        new DestinationDescriptions(descriptionAboutPlace, destination);
    _desctDesc.add(destDesc);
    notifyListeners();
  }
}

class DestinationDescriptions {
  String descriptionAboutPlace, destination;
  DestinationDescriptions(this.descriptionAboutPlace, this.destination);
}
