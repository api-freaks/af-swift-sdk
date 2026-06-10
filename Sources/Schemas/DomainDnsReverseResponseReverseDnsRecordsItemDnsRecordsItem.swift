import Foundation

public enum DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItem: Codable, Hashable, Sendable {
    case domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAddress(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAddress)
    case domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAdmin(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAdmin)
    case domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemOne(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemOne)
    case domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemPriority(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemPriority)
    case domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleName(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleName)
    case domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStrings(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStrings)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAddress.self) {
            self = .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAddress(value)
        } else if let value = try? container.decode(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAdmin.self) {
            self = .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAdmin(value)
        } else if let value = try? container.decode(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemOne.self) {
            self = .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemOne(value)
        } else if let value = try? container.decode(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemPriority.self) {
            self = .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemPriority(value)
        } else if let value = try? container.decode(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleName.self) {
            self = .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleName(value)
        } else if let value = try? container.decode(DomainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStrings.self) {
            self = .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStrings(value)
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
        case .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAddress(let value):
            try container.encode(value)
        case .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemAdmin(let value):
            try container.encode(value)
        case .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemOne(let value):
            try container.encode(value)
        case .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemPriority(let value):
            try container.encode(value)
        case .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemSingleName(let value):
            try container.encode(value)
        case .domainDnsReverseResponseReverseDnsRecordsItemDnsRecordsItemStrings(let value):
            try container.encode(value)
        }
    }
}