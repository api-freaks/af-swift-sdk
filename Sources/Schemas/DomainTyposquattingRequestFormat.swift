import Foundation

public enum DomainTyposquattingRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}