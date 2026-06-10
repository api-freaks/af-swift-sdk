import Foundation

public enum BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItem: Codable, Hashable, Sendable {
    case bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAddress(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAddress)
    case bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdmin(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdmin)
    case bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemOne(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemOne)
    case bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemPriority(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemPriority)
    case bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemSingleName(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemSingleName)
    case bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemStrings(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemStrings)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAddress.self) {
            self = .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAddress(value)
        } else if let value = try? container.decode(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdmin.self) {
            self = .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdmin(value)
        } else if let value = try? container.decode(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemOne.self) {
            self = .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemOne(value)
        } else if let value = try? container.decode(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemPriority.self) {
            self = .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemPriority(value)
        } else if let value = try? container.decode(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemSingleName.self) {
            self = .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemSingleName(value)
        } else if let value = try? container.decode(BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemStrings.self) {
            self = .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemStrings(value)
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
        case .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAddress(let value):
            try container.encode(value)
        case .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemAdmin(let value):
            try container.encode(value)
        case .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemOne(let value):
            try container.encode(value)
        case .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemPriority(let value):
            try container.encode(value)
        case .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemSingleName(let value):
            try container.encode(value)
        case .bulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemStrings(let value):
            try container.encode(value)
        }
    }
}