import Foundation

public enum BulkDomainDnsLookupResponseBulkDnsInfoItemDnsRecordsItemStringsDnsType: String, Codable, Hashable, CaseIterable, Sendable {
    case txt = "TXT"
    case spf = "SPF"
}