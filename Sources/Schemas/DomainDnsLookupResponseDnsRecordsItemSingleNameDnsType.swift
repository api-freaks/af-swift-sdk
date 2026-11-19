import Foundation

public enum DomainDnsLookupResponseDnsRecordsItemSingleNameDnsType: String, Codable, Hashable, CaseIterable, Sendable {
    case ns = "NS"
    case ptr = "PTR"
}