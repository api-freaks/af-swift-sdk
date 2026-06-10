import Foundation

public enum DomainDnsLookupResponseDnsRecordsItemAddressDnsType: String, Codable, Hashable, CaseIterable, Sendable {
    case a = "A"
    case aaaa = "AAAA"
}