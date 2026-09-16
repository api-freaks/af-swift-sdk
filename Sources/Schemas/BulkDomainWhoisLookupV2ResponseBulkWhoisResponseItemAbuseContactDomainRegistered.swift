import Foundation

/// Domain registration status; 'restricted' means the registry withholds registration details.
public enum BulkDomainWhoisLookupV2ResponseBulkWhoisResponseItemAbuseContactDomainRegistered: String, Codable, Hashable, CaseIterable, Sendable {
    case yes
    case no
    case restricted
}