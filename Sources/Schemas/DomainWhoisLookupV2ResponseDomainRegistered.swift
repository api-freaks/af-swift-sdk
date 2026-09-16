import Foundation

/// Domain registration status; 'restricted' means the registry withholds registration details.
public enum DomainWhoisLookupV2ResponseDomainRegistered: String, Codable, Hashable, CaseIterable, Sendable {
    case yes
    case no
    case restricted
}