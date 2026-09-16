import Foundation

/// Current status of the commodity. "inactive" means the symbol is deprecated - latest rates are unavailable, but historical rates remain available up to its deprecationDate.
public enum CommoditySymbolsV2ResponseSymbolsItemStatus: String, Codable, Hashable, CaseIterable, Sendable {
    case active
    case inactive
}