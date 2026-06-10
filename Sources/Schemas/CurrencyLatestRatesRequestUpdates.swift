import Foundation

public enum CurrencyLatestRatesRequestUpdates: String, Codable, Hashable, CaseIterable, Sendable {
    case oneD = "1d"
    case oneH = "1h"
    case tenM = "10m"
    case oneM = "1m"
}