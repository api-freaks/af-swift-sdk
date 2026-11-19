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
    /// The rate at which this commodity's price is updated. New values may be added over time.
    public let updateInterval: CommoditySymbolsResponseSymbolsItemUpdateInterval
    public let currency: CommoditySymbolsResponseSymbolsItemCurrency
    public let unit: CommoditySymbolsResponseSymbolsItemUnit
    /// Short description of the commodity. May be an empty string for some symbols.
    public let description: String?
    /// Data source for the symbol (e.g., World Bank). Present only for some symbols.
    public let exchange: String?
    /// Present only when status is "inactive". Date the symbol was deprecated (YYYY-MM-DD).
    public let deprecationDate: CalendarDate?
    /// Optional. Present only for dated futures contracts (for example `WTIOIL-FUT-DEC26`). Contract type, currently always `futures`.
    public let contract: String?
    /// Optional. Present only for dated futures contracts. Delivery month of the contract (YYYY-MM), for example `2026-12`.
    public let deliveryMonth: String?
    /// Optional. Present for most dated futures contracts. Last trading date of the contract (YYYY-MM-DD), for example `2026-11-20`.
    public let expiresAt: CalendarDate?
    /// Optional. Present only for dated futures contracts. Symbol of the continuous futures series this contract belongs to (for example `WTIOIL-FUT`).
    public let underlying: String?
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
        description: String? = nil,
        exchange: String? = nil,
        deprecationDate: CalendarDate? = nil,
        contract: String? = nil,
        deliveryMonth: String? = nil,
        expiresAt: CalendarDate? = nil,
        underlying: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.symbol = symbol
        self.name = name
        self.category = category
        self.status = status
        self.updateInterval = updateInterval
        self.currency = currency
        self.unit = unit
        self.description = description
        self.exchange = exchange
        self.deprecationDate = deprecationDate
        self.contract = contract
        self.deliveryMonth = deliveryMonth
        self.expiresAt = expiresAt
        self.underlying = underlying
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
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.exchange = try container.decodeIfPresent(String.self, forKey: .exchange)
        self.deprecationDate = try container.decodeIfPresent(CalendarDate.self, forKey: .deprecationDate)
        self.contract = try container.decodeIfPresent(String.self, forKey: .contract)
        self.deliveryMonth = try container.decodeIfPresent(String.self, forKey: .deliveryMonth)
        self.expiresAt = try container.decodeIfPresent(CalendarDate.self, forKey: .expiresAt)
        self.underlying = try container.decodeIfPresent(String.self, forKey: .underlying)
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
        try container.encodeIfPresent(self.description, forKey: .description)
        try container.encodeIfPresent(self.exchange, forKey: .exchange)
        try container.encodeIfPresent(self.deprecationDate, forKey: .deprecationDate)
        try container.encodeIfPresent(self.contract, forKey: .contract)
        try container.encodeIfPresent(self.deliveryMonth, forKey: .deliveryMonth)
        try container.encodeIfPresent(self.expiresAt, forKey: .expiresAt)
        try container.encodeIfPresent(self.underlying, forKey: .underlying)
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
        case description
        case exchange
        case deprecationDate
        case contract
        case deliveryMonth
        case expiresAt
        case underlying
    }
}