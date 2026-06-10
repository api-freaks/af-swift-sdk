import Foundation

public enum CommodityLatestRatesRequestUpdates: String, Codable, Hashable, CaseIterable, Sendable {
    case tenM = "10m"
    case oneM = "1m"
}