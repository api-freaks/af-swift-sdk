import Foundation

public struct VatRateByCountryResponseItem: Codable, Hashable, Sendable {
    public let country: String
    public let state: String?
    public let type: String
    public let currency: String
    public let standardRate: Float
    public let reducedRate: [Float]
    /// Optional super-reduced VAT rates applicable in specific categories.
    public let superReducedRate: [Float]?
    public let parkingRate: Float?
    public let categories: [String: Float]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        country: String,
        state: String? = nil,
        type: String,
        currency: String,
        standardRate: Float,
        reducedRate: [Float],
        superReducedRate: [Float]? = nil,
        parkingRate: Float? = nil,
        categories: [String: Float],
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
        self.type = try container.decode(String.self, forKey: .type)
        self.currency = try container.decode(String.self, forKey: .currency)
        self.standardRate = try container.decode(Float.self, forKey: .standardRate)
        self.reducedRate = try container.decode([Float].self, forKey: .reducedRate)
        self.superReducedRate = try container.decodeIfPresent([Float].self, forKey: .superReducedRate)
        self.parkingRate = try container.decodeIfPresent(Float.self, forKey: .parkingRate)
        self.categories = try container.decode([String: Float].self, forKey: .categories)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.country, forKey: .country)
        try container.encodeIfPresent(self.state, forKey: .state)
        try container.encode(self.type, forKey: .type)
        try container.encode(self.currency, forKey: .currency)
        try container.encode(self.standardRate, forKey: .standardRate)
        try container.encode(self.reducedRate, forKey: .reducedRate)
        try container.encodeIfPresent(self.superReducedRate, forKey: .superReducedRate)
        try container.encodeIfPresent(self.parkingRate, forKey: .parkingRate)
        try container.encode(self.categories, forKey: .categories)
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