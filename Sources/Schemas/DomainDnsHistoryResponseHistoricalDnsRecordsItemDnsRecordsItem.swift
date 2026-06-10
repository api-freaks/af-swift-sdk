import Foundation

public enum DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItem: Codable, Hashable, Sendable {
    case domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAddress(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAddress)
    case domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAdmin(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAdmin)
    case domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemOne(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemOne)
    case domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemPriority(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemPriority)
    case domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemSingleName(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemSingleName)
    case domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemStrings(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemStrings)

    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAddress.self) {
            self = .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAddress(value)
        } else if let value = try? container.decode(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAdmin.self) {
            self = .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAdmin(value)
        } else if let value = try? container.decode(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemOne.self) {
            self = .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemOne(value)
        } else if let value = try? container.decode(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemPriority.self) {
            self = .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemPriority(value)
        } else if let value = try? container.decode(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemSingleName.self) {
            self = .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemSingleName(value)
        } else if let value = try? container.decode(DomainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemStrings.self) {
            self = .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemStrings(value)
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
        case .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAddress(let value):
            try container.encode(value)
        case .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemAdmin(let value):
            try container.encode(value)
        case .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemOne(let value):
            try container.encode(value)
        case .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemPriority(let value):
            try container.encode(value)
        case .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemSingleName(let value):
            try container.encode(value)
        case .domainDnsHistoryResponseHistoricalDnsRecordsItemDnsRecordsItemStrings(let value):
            try container.encode(value)
        }
    }
}