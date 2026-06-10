import Foundation

/// Domain registration status.
public enum DomainWhoisHistoryResponseWhoisDomainsHistoricalItemDomainRegistered: String, Codable, Hashable, CaseIterable, Sendable {
    case yes
    case no
    case restricted
}