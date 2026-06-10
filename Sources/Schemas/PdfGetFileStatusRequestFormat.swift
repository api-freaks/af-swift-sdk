import Foundation

public enum PdfGetFileStatusRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}