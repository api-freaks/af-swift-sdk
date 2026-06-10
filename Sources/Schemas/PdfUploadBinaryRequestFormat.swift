import Foundation

public enum PdfUploadBinaryRequestFormat: String, Codable, Hashable, CaseIterable, Sendable {
    case json
    case xml
}