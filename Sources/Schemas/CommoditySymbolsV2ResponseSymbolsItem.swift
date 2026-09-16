import Foundation

public struct CommoditySymbolsV2ResponseSymbolsItem: Codable, Hashable, Sendable {
    /// Unique identifier/ticker symbol for the commodity (e.g., XAU, NG-FUT). Use this value in the symbols parameter of the rate endpoints.
    public let symbol: String
    /// Full name of the commodity (e.g., Gold, Natural Gas Futures).
    public let name: String
    /// Short description of the commodity. May be an empty string for some symbols.
    public let description: String?
    /// Category the commodity belongs to (e.g., Metals, Energy, Agriculture, Industrial, Raw Materials, Oils and Meals, Textiles, Meats, Poultry, Livestock).
    public let category: String
    /// Current status of the commodity. "inactive" means the symbol is deprecated - latest rates are unavailable, but historical rates remain available up to its deprecationDate.
    public let status: CommoditySymbolsV2ResponseSymbolsItemStatus
    /// The rate at which this commodity's price is updated.
    public let updateInterval: CommoditySymbolsV2ResponseSymbolsItemUpdateInterval
    /// Data source for the symbol (e.g., World Bank). Present only for some symbols.
    public let exchange: String?
    /// Present only when status is "inactive". Date the symbol was deprecated (YYYY-MM-DD).
    public let deprecationDate: CalendarDate?
    public let currency: CommoditySymbolsV2ResponseSymbolsItemCurrency
    public let unit: CommoditySymbolsV2ResponseSymbolsItemUnit
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        symbol: String,
        name: String,
        description: String? = nil,
        category: String,
        status: CommoditySymbolsV2ResponseSymbolsItemStatus,
        updateInterval: CommoditySymbolsV2ResponseSymbolsItemUpdateInterval,
        exchange: String? = nil,
        deprecationDate: CalendarDate? = nil,
        currency: CommoditySymbolsV2ResponseSymbolsItemCurrency,
        unit: CommoditySymbolsV2ResponseSymbolsItemUnit,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.symbol = symbol
        self.name = name
        self.description = description
        self.category = category
        self.status = status
        self.updateInterval = updateInterval
        self.exchange = exchange
        self.deprecationDate = deprecationDate
        self.currency = currency
        self.unit = unit
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.symbol = try container.decode(String.self, forKey: .symbol)
        self.name = try container.decode(String.self, forKey: .name)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.category = try container.decode(String.self, forKey: .category)
        self.status = try container.decode(CommoditySymbolsV2ResponseSymbolsItemStatus.self, forKey: .status)
        self.updateInterval = try container.decode(CommoditySymbolsV2ResponseSymbolsItemUpdateInterval.self, forKey: .updateInterval)
        self.exchange = try container.decodeIfPresent(String.self, forKey: .exchange)
        self.deprecationDate = try container.decodeIfPresent(CalendarDate.self, forKey: .deprecationDate)
        self.currency = try container.decode(CommoditySymbolsV2ResponseSymbolsItemCurrency.self, forKey: .currency)
        self.unit = try container.decode(CommoditySymbolsV2ResponseSymbolsItemUnit.self, forKey: .unit)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.symbol, forKey: .symbol)
        try container.encode(self.name, forKey: .name)
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encode(self.category, forKey: .category)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.updateInterval, forKey: .updateInterval)
        try container.encodeIfPresent(self.exchange, forKey: .exchange)
        try container.encodeIfPresent(self.deprecationDate, forKey: .deprecationDate)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.unit, forKey: .unit)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case symbol
        case name
        case description
        case category
        case status
        case updateInterval
        case exchange
        case deprecationDate
        case currency
        case unit
    }
}