import Foundation

extension Requests {
    public struct PdfDecryptRequest {
        /// The PDF file to be processed. If this parameter is not provided, you must specify `file_id` to use a previously uploaded file.
        public let file: FormFile?

        public init(
            file: FormFile? = nil
        ) {
            self.file = file
        }
    }
}

extension Requests.PdfDecryptRequest: MultipartFormDataConvertible {
    var multipartFormFields: [MultipartFormField] {
        file.map { [.file($0, fieldName: "file")] } ?? []
    }
}