import Foundation

public enum DomainAvailabilitySuggestionsRequestSource: String, Codable, Hashable, CaseIterable, Sendable {
    case dns
    case whois
}