import Foundation

public struct ZipcodeDistanceMatchResponseResultsItem: Codable, Hashable, Sendable {
    /// First ZIP/postal code in the pair
    public let code1: String?
    /// Second ZIP/postal code in the pair
    public let code2: String?
    /// Distance between the ZIP/postal code pair
    public let distance: Float?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        code1: String? = nil,
        code2: String? = nil,
        distance: Float? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.code1 = code1
        self.code2 = code2
        self.distance = distance
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.code1 = try container.decodeIfPresent(String.self, forKey: .code1)
        self.code2 = try container.decodeIfPresent(String.self, forKey: .code2)
        self.distance = try container.decodeIfPresent(Float.self, forKey: .distance)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.code1, forKey: .code1)
        try container.encodeIfPresent(self.code2, forKey: .code2)
        try container.encodeIfPresent(self.distance, forKey: .distance)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case code1 = "code_1"
        case code2 = "code_2"
        case distance
    }
}