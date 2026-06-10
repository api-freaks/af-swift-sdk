import Foundation

/// The rate at which this commodity's price is updated.
public enum CommoditySymbolsResponseSymbolsItemUpdateInterval: String, Codable, Hashable, CaseIterable, Sendable {
    case perSecond = "PER_SECOND"
    case perMinute = "PER_MINUTE"
}