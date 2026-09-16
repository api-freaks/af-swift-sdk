import Foundation

/// Per-item error, returned in place of a WHOIS result when an individual domain's extension is unsupported or its lookup otherwise fails.
public struct BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemError: Codable, Hashable, Sendable {
    /// Always false for a per-item error.
    public let status: Bool
    /// Domain name that this error applies to.
    public let domainName: String
    /// HTTP-equivalent status code for this item's failure (e.g. 403 for an unsupported extension).
    public let statusCode: Int
    /// Short error category or exception type.
    public let error: String?
    /// Human-readable reason this domain could not be resolved.
    public let message: String
    /// Additional properties that are not explicitly defined in the schema
    public let additionalProperties: [String: JSONValue]

    public init(
        status: Bool,
        domainName: String,
        statusCode: Int,
        error: String? = nil,
        message: String,
        additionalProperties: [String: JSONValue] = .init()
    ) {
        self.status = status
        self.domainName = domainName
        self.statusCode = statusCode
        self.error = error
        self.message = message
        self.additionalProperties = additionalProperties
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.status = try container.decode(Bool.self, forKey: .status)
        self.domainName = try container.decode(String.self, forKey: .domainName)
        self.statusCode = try container.decode(Int.self, forKey: .statusCode)
        self.error = try container.decodeIfPresent(String.self, forKey: .error)
        self.message = try container.decode(String.self, forKey: .message)
        self.additionalProperties = try decoder.decodeAdditionalProperties(using: CodingKeys.self)
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try encoder.encodeAdditionalProperties(self.additionalProperties)
        try container.encode(self.status, forKey: .status)
        try container.encode(self.domainName, forKey: .domainName)
        try container.encode(self.statusCode, forKey: .statusCode)
        try container.encodeIfPresent(self.error, forKey: .error)
        try container.encode(self.message, forKey: .message)
    }

    /// Keys for encoding/decoding struct properties.
    enum CodingKeys: String, CodingKey, CaseIterable {
        case status
        case domainName = "domain_name"
        case statusCode = "status_code"
        case error
        case message
    }
}