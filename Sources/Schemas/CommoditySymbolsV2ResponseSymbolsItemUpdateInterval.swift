import Foundation

/// The rate at which this commodity's price is updated.
public enum CommoditySymbolsV2ResponseSymbolsItemUpdateInterval: String, Codable, Hashable, CaseIterable, Sendable {
    case perSecond = "PER_SECOND"
    case perMinute = "PER_MINUTE"
    case per10Minutes = "PER_10_MINUTES"
    case perHour = "PER_HOUR"
    case perDay = "PER_DAY"
    case perWeek = "PER_WEEK"
    case perMonth = "PER_MONTH"
}