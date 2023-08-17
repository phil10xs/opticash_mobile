// file directory
const pngDir = "assets/pngs";

final kMore = 'home'.png;
final kAccount = 'account'.png;
final kCard = 'credit-card'.png;
final kSend = 'send'.png;
final kSwap = 'swap'.png;
final kUser = 'user'.png;
final kBell = 'bell'.png;
final kTime = 'time'.png;
final kBoard = 'board'.png;
final kBoard2 = 'board2'.png;
final kDropdown = 'dropdown'.png;
final kCoin = 'coin'.png;
final kEyes = 'eyes'.png;
final kTopUp = 'top-up'.png;
final kSendMoney = 'send-money'.png;
final kAccountDetails = 'account-details'.png;
final kActivity = 'activity'.png;
final kFlag = 'flag'.png;

extension AssetExt on String {
  String get png {
    return "$pngDir/$this.png";
  }
}
