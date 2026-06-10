import Foundation

public enum PdfConvertToTiffRequestProfile: String, Codable, Hashable, CaseIterable, Sendable {
    case bw
    case gray
    case rgb
    case rgba
    case cmyk
}