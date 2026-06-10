import Foundation

public struct ZipcodeDistanceResponseResultsItem: Codable, Hashable, Sendable {
    /// ZIP/postal code
    public let code: String?
    /// Distance from the base ZIP/postal code
    public let distance: Float?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code: String? = nil,
        distance: Float? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code = code
        self.distance = distance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code = try container.decodeIfPresent(String.self, forKey: .code)
        self.distance = try container.decodeIfPresent(Float.self, forKey: .distance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.code, forKey: .code)
        try container.encodeIfPresent(self.distance, forKey: .distance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code
        case distance
    }
}