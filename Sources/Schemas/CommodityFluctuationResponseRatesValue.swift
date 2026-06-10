import Foundation

public struct CommodityFluctuationResponseRatesValue: Codable, Hashable, Sendable {
    /// The price of the commodity on the start date of the interval.
    public let startRate: Double
    /// The price of the commodity on the end date of the interval.
    public let endRate: Double
    /// The absolute price difference between the end and start date. May be positive or negative.
    public let change: Double
    /// The percentage change in price from start to end date. May be positive or negative.
    public let changePercent: Double
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        startRate: Double,
        endRate: Double,
        change: Double,
        changePercent: Double,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.startRate = startRate
        self.endRate = endRate
        self.change = change
        self.changePercent = changePercent
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.startRate = try container.decode(Double.self, forKey: .startRate)
        self.endRate = try container.decode(Double.self, forKey: .endRate)
        self.change = try container.decode(Double.self, forKey: .change)
        self.changePercent = try container.decode(Double.self, forKey: .changePercent)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.startRate, forKey: .startRate)
        try container.encode(self.endRate, forKey: .endRate)
        try container.encode(self.change, forKey: .change)
        try container.encode(self.changePercent, forKey: .changePercent)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case startRate
        case endRate
        case change
        case changePercent
    }
}