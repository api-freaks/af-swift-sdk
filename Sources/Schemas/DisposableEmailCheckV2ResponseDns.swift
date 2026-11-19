import Foundation

/// DNS records for the email domain. Omitted entirely when validSyntax is false or the domain does not exist (NXDOMAIN).
public struct DisposableEmailCheckV2ResponseDns: Codable, Hashable, Sendable {
    /// Every MX hostname at the domain's lowest preference (not just one). ["."]  means the domain publishes a null MX and accepts no mail at all. Absent entirely when the domain has no MX record of any kind — check aRecord in that case.
    public let mxRecord: [String]?
    /// Collection of A (Address) records for the domain. Present when the domain has no MX record but does resolve to a web server or other host.
    public let aRecord: [String]?
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        mxRecord: [String]? = nil,
        aRecord: [String]? = nil,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.mxRecord = mxRecord
        self.aRecord = aRecord
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.mxRecord = try container.decodeIfPresent([String].self, forKey: .mxRecord)
        self.aRecord = try container.decodeIfPresent([String].self, forKey: .aRecord)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encodeIfPresent(self.mxRecord, forKey: .mxRecord)
        try container.encodeIfPresent(self.aRecord, forKey: .aRecord)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case mxRecord
        case aRecord
    }
}