import Foundation

public struct BulkPhoneValidateRequestNumbersItem: Codable, Hashable, Sendable {
    /// Phone number to validate.
    public let number: String
    /// Two-letter ISO country code. Required for local format numbers. Cannot be used together with dialer_region.
    public let region: String?
    /// Two-letter ISO country code of the dialing origin. Required for IDD format numbers. Cannot be used together with region.
    public let dialerRegion: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        number: String,
        region: String? = nil,
        dialerRegion: String? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.number = number
        self.region = region
        self.dialerRegion = dialerRegion
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.number = try container.decode(String.self, forKey: .number)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.dialerRegion = try container.decodeIfPresent(String.self, forKey: .dialerRegion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.number, forKey: .number)
        try container.encodeIfPresent(self.region, forKey: .region)
        try container.encodeIfPresent(self.dialerRegion, forKey: .dialerRegion)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case number
        case region
        case dialerRegion = "dialer_region"
    }
}