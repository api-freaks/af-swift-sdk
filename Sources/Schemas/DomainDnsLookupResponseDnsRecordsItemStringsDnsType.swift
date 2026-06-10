import Foundation

public enum DomainDnsLookupResponseDnsRecordsItemStringsDnsType: String, Codable, Hashable, CaseIterable, Sendable {
    case txt = "TXT"
    case spf = "SPF"
}