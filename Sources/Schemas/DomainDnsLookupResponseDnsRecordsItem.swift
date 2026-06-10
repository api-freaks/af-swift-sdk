import Foundation

public enum DomainDnsLookupResponseDnsRecordsItem: Codable, Hashable, Sendable {
    case domainDnsLookupResponseDnsRecordsItemAddress(DomainDnsLookupResponseDnsRecordsItemAddress)
    case domainDnsLookupResponseDnsRecordsItemAdmin(DomainDnsLookupResponseDnsRecordsItemAdmin)
    case domainDnsLookupResponseDnsRecordsItemOne(DomainDnsLookupResponseDnsRecordsItemOne)
    case domainDnsLookupResponseDnsRecordsItemPriority(DomainDnsLookupResponseDnsRecordsItemPriority)
    case domainDnsLookupResponseDnsRecordsItemSingleName(DomainDnsLookupResponseDnsRecordsItemSingleName)
    case domainDnsLookupResponseDnsRecordsItemStrings(DomainDnsLookupResponseDnsRecordsItemStrings)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DomainDnsLookupResponseDnsRecordsItemAddress.self) {
            self = .domainDnsLookupResponseDnsRecordsItemAddress(value)
        } else if let value = try? container.decode(DomainDnsLookupResponseDnsRecordsItemAdmin.self) {
            self = .domainDnsLookupResponseDnsRecordsItemAdmin(value)
        } else if let value = try? container.decode(DomainDnsLookupResponseDnsRecordsItemOne.self) {
            self = .domainDnsLookupResponseDnsRecordsItemOne(value)
        } else if let value = try? container.decode(DomainDnsLookupResponseDnsRecordsItemPriority.self) {
            self = .domainDnsLookupResponseDnsRecordsItemPriority(value)
        } else if let value = try? container.decode(DomainDnsLookupResponseDnsRecordsItemSingleName.self) {
            self = .domainDnsLookupResponseDnsRecordsItemSingleName(value)
        } else if let value = try? container.decode(DomainDnsLookupResponseDnsRecordsItemStrings.self) {
            self = .domainDnsLookupResponseDnsRecordsItemStrings(value)
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
        case .domainDnsLookupResponseDnsRecordsItemAddress(let value):
            try container.encode(value)
        case .domainDnsLookupResponseDnsRecordsItemAdmin(let value):
            try container.encode(value)
        case .domainDnsLookupResponseDnsRecordsItemOne(let value):
            try container.encode(value)
        case .domainDnsLookupResponseDnsRecordsItemPriority(let value):
            try container.encode(value)
        case .domainDnsLookupResponseDnsRecordsItemSingleName(let value):
            try container.encode(value)
        case .domainDnsLookupResponseDnsRecordsItemStrings(let value):
            try container.encode(value)
        }
    }
}