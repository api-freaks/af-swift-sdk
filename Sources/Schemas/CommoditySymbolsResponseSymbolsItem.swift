import Foundation

public struct CommoditySymbolsResponseSymbolsItem: Codable, Hashable, Sendable {
    /// The unique ticker symbol for the commodity (e.g., "XAU", "NG-FUT").
    public let symbol: String
    /// The full name of the commodity (e.g., "Gold", "Natural Gas Futures").
    public let name: String
    /// The category the commodity belongs to (e.g., "Metals", "Energy").
    public let category: String
    /// The current status of the commodity. Possible value: "active".
    public let status: String
    /// The rate at which this commodity's price is updated.
    public let updateInterval: CommoditySymbolsResponseSymbolsItemUpdateInterval
    public let currency: CommoditySymbolsResponseSymbolsItemCurrency
    public let unit: CommoditySymbolsResponseSymbolsItemUnit
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        symbol: String,
        name: String,
        category: String,
        status: String,
        updateInterval: CommoditySymbolsResponseSymbolsItemUpdateInterval,
        currency: CommoditySymbolsResponseSymbolsItemCurrency,
        unit: CommoditySymbolsResponseSymbolsItemUnit,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.symbol = symbol
        self.name = name
        self.category = category
        self.status = status
        self.updateInterval = updateInterval
        self.currency = currency
        self.unit = unit
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.name = try container.decode(String.self, forKey: .name)
        self.category = try container.decode(String.self, forKey: .category)
        self.status = try container.decode(String.self, forKey: .status)
        self.updateInterval = try container.decode(CommoditySymbolsResponseSymbolsItemUpdateInterval.self, forKey: .updateInterval)
        self.currency = try container.decode(CommoditySymbolsResponseSymbolsItemCurrency.self, forKey: .currency)
        self.unit = try container.decode(CommoditySymbolsResponseSymbolsItemUnit.self, forKey: .unit)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.symbol, forKey: .symbol)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updateInterval, forKey: .updateInterval)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.unit, forKey: .unit)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case symbol
        case name
        case category
        case status
        case updateInterval
        case currency
        case unit
    }
}