import Foundation

public enum DomainWhoisLookupResponseDomainRegistered: String, Codable, Hashable, CaseIterable, Sendable {
    case yes
    case no
    case restricted
}