import Foundation

extension Requests {
    /// Multipart form-data request body containing the CSV file to render in bulk.
    public struct BulkPdfGenerateFromTemplateRequest {
        /// A CSV file uploaded as form-data where each row is one record. One PDF is generated per row.
        public let file: FormFile

        public init(
            file: FormFile
        ) {
            self.file = file
        }
    }
}

extension Requests.BulkPdfGenerateFromTemplateRequest: MultipartFormDataConvertible {
    var multipartFormFields: [MultipartFormField] {
        [
            .file(file, fieldName: "file")
        ]
    }
}