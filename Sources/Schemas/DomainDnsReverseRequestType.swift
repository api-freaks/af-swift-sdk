import Foundation

public enum DomainDnsReverseRequestType: String, Codable, Hashable, CaseIterable, Sendable {
    case a = "A"
    case aaaa = "AAAA"
    case mx = "MX"
    case ns = "NS"
    case soa = "SOA"
    case spf = "SPF"
    case txt = "TXT"
    case cname = "CNAME"
}