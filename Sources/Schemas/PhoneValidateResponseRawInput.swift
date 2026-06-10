import Foundation

/// The original request data provided by the client.
public struct PhoneValidateResponseRawInput: Codable, Hashable, Sendable {
    /// The phone number as entered by the user.
    public let number: String?
    /// ISO-2 country code if provided in the request.
    public let region: String?
    /// ISO-2 dialing origin country code if provided.
    public let dialerRegion: String?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        number: String? = nil,
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
        self.number = try container.decodeIfPresent(String.self, forKey: .number)
        self.region = try container.decodeIfPresent(String.self, forKey: .region)
        self.dialerRegion = try container.decodeIfPresent(String.self, forKey: .dialerRegion)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.number, forKey: .number)
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