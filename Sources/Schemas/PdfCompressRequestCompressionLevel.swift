import Foundation

public enum PdfCompressRequestCompressionLevel: String, Codable, Hashable, CaseIterable, Sendable {
    case low
    case balanced
    case high
    case extreme
}