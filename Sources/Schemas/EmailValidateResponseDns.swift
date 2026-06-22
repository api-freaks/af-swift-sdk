import Foundation

public struct EmailValidateResponseDns: Codable, Hashable, Sendable {
    public let mxRecords: [String]
    /// Collection of A (Address) records for the domain.
    public let aRecords: [String]
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mxRecords: [String],
        aRecords: [String],
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mxRecords = mxRecords
        self.aRecords = aRecords
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mxRecords = try container.decode([String].self, forKey: .mxRecords)
        self.aRecords = try container.decode([String].self, forKey: .aRecords)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.mxRecords, forKey: .mxRecords)
        try container.encode(self.aRecords, forKey: .aRecords)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mxRecords
        case aRecords
    }
}