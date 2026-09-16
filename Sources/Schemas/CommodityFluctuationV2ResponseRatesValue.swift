import Foundation

public struct CommodityFluctuationV2ResponseRatesValue: Codable, Hashable, Sendable {
    /// Price of the commodity on the start date.
    public let startRate: Float
    /// Price of the commodity on the end date.
    public let endRate: Float
    /// Absolute price difference between end and start dates. May be negative.
    public let change: Float
    /// Percentage price change from start to end date. May be negative.
    public let changePercent: Float
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        startRate: Float,
        endRate: Float,
        change: Float,
        changePercent: Float,
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
        self.startRate = try container.decode(Float.self, forKey: .startRate)
        self.endRate = try container.decode(Float.self, forKey: .endRate)
        self.change = try container.decode(Float.self, forKey: .change)
        self.changePercent = try container.decode(Float.self, forKey: .changePercent)
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