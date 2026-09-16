import Foundation

public enum BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItem: Codable, Hashable, Sendable {
    /// Current WHOIS registration record for one successfully resolved domain.
    case bulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContact(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContact)
    /// Per-item error, returned in place of a WHOIS result when an individual domain's extension is unsupported or its lookup otherwise fails.
    case bulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemError(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemError)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContact.self) {
            self = .bulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContact(value)
        } else if let value = try? container.decode(BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemError.self) {
            self = .bulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemError(value)
        } else {
            throw DecodingError.dataCorruptedError(
                in: container,
                debugDescription: "Unexpected value."
            )
        }
    }

    public func encode(to encoder: Encoder) throws -> Void {
        var container = encoder.singleValueContainer()
        switch self {
        case .bulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContact(let value):
            try container.encode(value)
        case .bulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemError(let value):
            try container.encode(value)
        }
    }
}