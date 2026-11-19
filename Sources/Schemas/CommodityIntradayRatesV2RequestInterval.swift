import Foundation

public enum CommodityIntradayRatesV2RequestInterval: String, Codable, Hashable, CaseIterable, Sendable {
    case oneM = "1m"
    case fiveM = "5m"
    case tenM = "10m"
    case fifteenM = "15m"
    case thirtyM = "30m"
    case fortyFiveM = "45m"
    case oneH = "1h"
    case twoH = "2h"
    case fourH = "4h"
    case eightH = "8h"
    case twelveH = "12h"
    case oneD = "1d"
}