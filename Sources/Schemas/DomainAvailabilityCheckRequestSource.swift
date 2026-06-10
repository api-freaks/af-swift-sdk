import Foundation

public enum DomainAvailabilityCheckRequestSource: String, Codable, Hashable, CaseIterable, Sendable {
    case dns
    case whois
}