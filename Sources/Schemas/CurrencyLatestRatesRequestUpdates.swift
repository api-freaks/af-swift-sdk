import Foundation

public enum CurrencyLatestRatesRequestUpdates: String, Codable, Hashable, CaseIterable, Sendable {
    case oneM = "1m"
    case tenM = "10m"
    case oneH = "1h"
    case oneD = "1d"
}