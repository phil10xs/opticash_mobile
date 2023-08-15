// file directory
const pngDir = "assets/pngs";
const svgDir = "assets/svgs";
const animDir = "assets/anim";
final kTransferBoldIcon = 'ic_transfer'.svg;
final kBillsIcon = 'ic_bills'.svg;
final kCartIcon = 'ic_cart'.svg;
final kAirtimeIcon = 'ic_airtime'.svg;
final kFlightIcon = 'ic_flight'.svg;
final kMore = 'ic_more'.svg;

extension AssetExt on String {
  String get png {
    return "$pngDir/$this.png";
  }

  String get svg {
    return "$svgDir/$this.svg";
  }

  get gif {
    return "$animDir/$this.gif";
  }
}
