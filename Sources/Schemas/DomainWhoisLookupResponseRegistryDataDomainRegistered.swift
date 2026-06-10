import Foundation

public enum DomainWhoisLookupResponseRegistryDataDomainRegistered: String, Codable, Hashable, CaseIterable, Sendable {
    case yes
    case no
    case restricted
}