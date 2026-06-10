import Foundation

public enum DomainDnsHistoryRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}