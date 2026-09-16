import Foundation

public struct EmailValidateResponseDns: Codable, Hashable, Sendable {
    public let mxRecord: [String]
    /// Collection of A (Address) records for the domain.
    public let aRecord: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mxRecord: [String],
        aRecord: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mxRecord = mxRecord
        self.aRecord = aRecord
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mxRecord = try container.decode([String].self, forKey: .mxRecord)
        self.aRecord = try container.decodeIfPresent([String].self, forKey: .aRecord)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.mxRecord, forKey: .mxRecord)
        try container.encodeIfPresent(self.aRecord, forKey: .aRecord)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mxRecord
        case aRecord
    }
}