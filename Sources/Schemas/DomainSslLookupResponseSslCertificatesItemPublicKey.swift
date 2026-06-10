import Foundation

public struct DomainSslLookupResponseSslCertificatesItemPublicKey: Codable, Hashable, Sendable {
    public let keySize: String
    public let keyAlgorithm: String
    public let pemRaw: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        keySize: String,
        keyAlgorithm: String,
        pemRaw: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.keySize = keySize
        self.keyAlgorithm = keyAlgorithm
        self.pemRaw = pemRaw
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.keySize = try container.decode(String.self, forKey: .keySize)
        self.keyAlgorithm = try container.decode(String.self, forKey: .keyAlgorithm)
        self.pemRaw = try container.decode(String.self, forKey: .pemRaw)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.keySize, forKey: .keySize)
        try container.encode(self.keyAlgorithm, forKey: .keyAlgorithm)
        try container.encode(self.pemRaw, forKey: .pemRaw)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case keySize
        case keyAlgorithm
        case pemRaw
    }
}