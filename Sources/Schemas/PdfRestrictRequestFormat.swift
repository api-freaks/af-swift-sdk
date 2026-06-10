import Foundation

public enum PdfRestrictRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}