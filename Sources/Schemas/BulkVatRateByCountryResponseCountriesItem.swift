import Foundation

public struct BulkVatRateByCountryResponseCountriesItem: Codable, Hashable, Sendable {
    /// Country identifier in Alpha-2 (US), Alpha-3 (USA), or full name (United_States). Case-insensitive and may use underscores.
    public let country: String
    /// Optional state identifier in Alpha-2 (NY) or full name (New_York). Required only for state-level taxation. Case-insensitive and may use underscores.
    public let state: String?
    /// Tax type applied for the country or state. Possible values include vat or none.
    public let type: String?
    /// ISO 4217 currency code.
    public let currency: String?
    /// Standard VAT or sales tax rate. Zero indicates no tax.
    public let standardRate: Float?
    /// Optional reduced VAT rates applicable in the country.
    public let reducedRate: [Float]?
    /// Optional super-reduced VAT rates applicable in specific categories.
    public let superReducedRate: [Float]?
    public let parkingRate: Float?
    /// Optional category-wise VAT rates.
    public let categories: [String: Float]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        country: String,
        state: String? = nil,
        type: String? = nil,
        currency: String? = nil,
        standardRate: Float? = nil,
        reducedRate: [Float]? = nil,
        superReducedRate: [Float]? = nil,
        parkingRate: Float? = nil,
        categories: [String: Float]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.country = country
        self.state = state
        self.type = type
        self.currency = currency
        self.standardRate = standardRate
        self.reducedRate = reducedRate
        self.superReducedRate = superReducedRate
        self.parkingRate = parkingRate
        self.categories = categories
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.country = try container.decode(String.self, forKey: .country)
        self.state = try container.decodeIfPresent(String.self, forKey: .state)
        self.type = try container.decodeIfPresent(String.self, forKey: .type)
        self.currency = try container.decodeIfPresent(String.self, forKey: .currency)
        self.standardRate = try container.decodeIfPresent(Float.self, forKey: .standardRate)
        self.reducedRate = try container.decodeIfPresent([Float].self, forKey: .reducedRate)
        self.superReducedRate = try container.decodeIfPresent([Float].self, forKey: .superReducedRate)
        self.parkingRate = try container.decodeIfPresent(Float.self, forKey: .parkingRate)
        self.categories = try container.decodeIfPresent([String: Float].self, forKey: .categories)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.country, forKey: .country)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encodeIfPresent(self.type, forKey: .type)
        try container.encodeIfPresent(self.currency, forKey: .currency)
        try container.encodeIfPresent(self.standardRate, forKey: .standardRate)
        try container.encodeIfPresent(self.reducedRate, forKey: .reducedRate)
        try container.encodeIfPresent(self.superReducedRate, forKey: .superReducedRate)
        try container.encodeIfPresent(self.parkingRate, forKey: .parkingRate)
        try container.encodeIfPresent(self.categories, forKey: .categories)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case country
        case state
        case type
        case currency
        case standardRate = "standard_rate"
        case reducedRate = "reduced_rate"
        case superReducedRate = "super_reduced_rate"
        case parkingRate = "parking_rate"
        case categories
    }
}