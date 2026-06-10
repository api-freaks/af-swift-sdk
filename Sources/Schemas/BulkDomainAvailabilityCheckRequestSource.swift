import Foundation

public enum BulkDomainAvailabilityCheckRequestSource: String, Codable, Hashable, CaseIterable, Sendable {
    case dns
    case whois
}