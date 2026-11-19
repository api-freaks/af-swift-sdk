import Foundation

/// Use this class to access the different functions within the SDK. You can instantiate any number of clients with different configuration that will propagate to these functions.
public final class APIFreaks: Sendable {
    private let httpClient: HTTPClient

    /// Initialize the client with the specified configuration.
    ///
    /// - Parameter baseURL: The base URL to use for requests from the client. If not provided, the default base URL will be used.
    /// - Parameter headers: Additional headers to send with each request.
    /// - Parameter timeout: Request timeout in seconds. Defaults to 60 seconds. Ignored if a custom `urlSession` is provided.
    /// - Parameter maxRetries: Maximum number of retries for failed requests. Defaults to 2.
    /// - Parameter urlSession: Custom `URLSession` to use for requests. If not provided, a default session will be created with the specified timeout.
    public convenience init(
        baseURL: String = APIFreaksEnvironment.default.rawValue,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        self.init(
            baseURL: baseURL,
            headerAuth: nil,
            bearerAuth: nil,
            basicAuth: nil,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
    }

    init(
        baseURL: String,
        headerAuth: ClientConfig.HeaderAuth? = nil,
        bearerAuth: ClientConfig.BearerAuth? = nil,
        basicAuth: ClientConfig.BasicAuth? = nil,
        headers: [String: String]? = nil,
        timeout: Int? = nil,
        maxRetries: Int? = nil,
        urlSession: Networking.URLSession? = nil
    ) {
        let config = ClientConfig(
            baseURL: baseURL,
            headerAuth: headerAuth,
            bearerAuth: bearerAuth,
            basicAuth: basicAuth,
            headers: headers,
            timeout: timeout,
            maxRetries: maxRetries,
            urlSession: urlSession
        )
        self.httpClient = HTTPClient(config: config)
    }

    /// Get detailed geolocation data for an IP address including country, city, timezone, currency, and optional security and user-agent information
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.geolocationLookup(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter ip: IPv4, IPv6, or hostname for geolocation lookup
    /// - Parameter lang: Response language for location fields
    /// - Parameter fields: Comma separated list of fields to include in response
    /// - Parameter excludes: Comma separated list of fields to exclude from response
    /// - Parameter include: Additional data to include (location, network, security, currency, time_zone, user_agent, country_metadata , hostname, liveHostname, hostnameFallbackLivet)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func geolocationLookup(apiKey: String, format: GeolocationLookupRequestFormat? = nil, ip: String? = nil, lang: GeolocationLookupRequestLang? = nil, fields: String? = nil, excludes: String? = nil, include: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GeolocationLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geolocation/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": ip.map { .string($0) }, 
                "lang": lang.map { .string($0.rawValue) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }, 
                "include": include.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GeolocationLookupResponse.self
        )
    }

    /// Retrieve detailed geolocation data for multiple IP addresses in a single request.
    /// Supports up to `50,000` IP-addresses/host-names per request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkGeolocationLookup(
    ///         apiKey: "apiKey",
    ///         request: .init(ips: [
    ///             "ips"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter lang: Language of the response.
    /// - Parameter fields: Comma-separated list of fields to include in the response. Can include "geo".
    /// - Parameter excludes: Comma-separated list of fields to exclude from the response (except "ip").
    /// - Parameter include: Comma-separated list of additional information to include in the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkGeolocationLookup(apiKey: String, format: BulkGeolocationLookupRequestFormat? = nil, lang: String? = nil, fields: String? = nil, excludes: String? = nil, include: String? = nil, request: Requests.BulkGeolocationLookupRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkGeolocationLookupResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/geolocation/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "lang": lang.map { .string($0) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }, 
                "include": include.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkGeolocationLookupResponseItem].self
        )
    }

    /// Get comprehensive security information for a given IP address. Detects VPNs, proxies, Tor nodes, and other security threats.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.ipSecurityLookup(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter ip: A valid IPv4 or IPv6 address to look up. If omitted, the API uses the public IP of the requesting client.
    /// - Parameter fields: Comma-separated list of fields to return. Supports dot notation (e.g. security.threat_score).
    /// - Parameter excludes: Comma-separated list of fields to remove from the response. Supports dot notation (e.g. security.is_tor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func ipSecurityLookup(apiKey: String, format: IpSecurityLookupRequestFormat? = nil, ip: String? = nil, fields: String? = nil, excludes: String? = nil, requestOptions: RequestOptions? = nil) async throws -> IpSecurityLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/ip/security",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": ip.map { .string($0) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: IpSecurityLookupResponse.self
        )
    }

    /// The Bulk IP Security Lookup API allows you to retrieve security details for up to `50,000` IP-addresses in a single request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkIpSecurityLookup(
    ///         apiKey: "apiKey",
    ///         request: .init(ips: [
    ///             "ips"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter fields: Comma-separated list of fields to return. Supports dot notation (e.g. security.threat_score).
    /// - Parameter excludes: Comma-separated list of fields to remove from the response. Supports dot notation (e.g. security.is_tor).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkIpSecurityLookup(apiKey: String, format: BulkIpSecurityLookupRequestFormat? = nil, fields: String? = nil, excludes: String? = nil, request: Requests.BulkIpSecurityLookupRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkIpSecurityLookupResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/ip/security",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkIpSecurityLookupResponseItem].self
        )
    }

    /// Convert a given address or place name into geographic coordinates (latitude and longitude).
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.geocoderSearch(
    ///         apiKey: "apiKey",
    ///         query: "query"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter acceptLanguage: Preferred language order for showing search results. This may either be a simple comma-separated list of language codes or a single entry. The results will be in the 1st language which is matched from the header. As a fallback if the results are not supported in the given language, 'en' will be used.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter query: Free-form search query, e.g. Wembley Stadium, London
    /// - Parameter limit: Max number of results to return (1–40). May return fewer if matches are weak.
    /// - Parameter minLat: Minimum latitude for the viewbox. Must be ≤ max_lat and between -90 and 90.
    /// - Parameter maxLat: Maximum latitude for the viewbox. Must be ≥ min_lat and between -90 and 90.
    /// - Parameter minLon: Minimum longitude for the viewbox. Must be ≤ max_lon and between -180 and 180.
    /// - Parameter maxLon: Maximum longitude for the viewbox. Must be ≥ min_lon and between -180 and 180.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func geocoderSearch(acceptLanguage: String? = nil, apiKey: String, format: GeocoderSearchRequestFormat? = nil, query: String, limit: Int? = nil, minLat: Float? = nil, maxLat: Float? = nil, minLon: Float? = nil, maxLon: Float? = nil, requestOptions: RequestOptions? = nil) async throws -> [GeocoderSearchResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geocoder/search",
            headers: [
                "Accept-Language": acceptLanguage
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "query": .string(query), 
                "limit": limit.map { .int($0) }, 
                "min_lat": minLat.map { .float($0) }, 
                "max_lat": maxLat.map { .float($0) }, 
                "min_lon": minLon.map { .float($0) }, 
                "max_lon": maxLon.map { .float($0) }
            ],
            requestOptions: requestOptions,
            responseType: [GeocoderSearchResponseItem].self
        )
    }

    /// Convert geographic coordinates (latitude and longitude) into a human-readable address or place name.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.geocoderReverse(
    ///         apiKey: "apiKey",
    ///         lat: 1.1,
    ///         lon: 1.1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter acceptLanguage: Preferred language order for showing search results. This may either be a simple comma-separated list of language codes or a single entry. The results will be in the 1st language which is matched from the header. As a fallback if the results are not supported in the given language, en will be used.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter lat: WGS84 latitude value ranging from -90 to 90.
    /// - Parameter lon: WGS84 longitude value ranging from -180 to 180.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func geocoderReverse(acceptLanguage: String? = nil, apiKey: String, format: GeocoderReverseRequestFormat? = nil, lat: Double, lon: Double, requestOptions: RequestOptions? = nil) async throws -> GeocoderReverseResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geocoder/reverse",
            headers: [
                "Accept-Language": acceptLanguage
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "lat": .double(lat), 
                "lon": .double(lon)
            ],
            requestOptions: requestOptions,
            responseType: GeocoderReverseResponse.self
        )
    }

    /// Retrieve current WHOIS information for a domain name.
    /// This endpoint provides detailed registration information including registrar details,
    /// dates, nameservers, and registrant information.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainWhoisLookup(
    ///         apiKey: "apiKey",
    ///         domainName: "domainName"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format (defaults to json)
    /// - Parameter domainName: Domain name for WHOIS lookup
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainWhoisLookup(apiKey: String, format: DomainWhoisLookupRequestFormat? = nil, domainName: String, requestOptions: RequestOptions? = nil) async throws -> DomainWhoisLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName)
            ],
            requestOptions: requestOptions,
            responseType: DomainWhoisLookupResponse.self
        )
    }

    /// Retrieve WHOIS information for `100 Domains per Request`.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkDomainWhoisLookup(
    ///         apiKey: "apiKey",
    ///         request: .init(domainNames: [
    ///             "domainNames"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkDomainWhoisLookup(apiKey: String, format: BulkDomainWhoisLookupRequestFormat? = nil, request: Requests.BulkDomainWhoisLookupRequest, requestOptions: RequestOptions? = nil) async throws -> BulkDomainWhoisLookupResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/domain/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkDomainWhoisLookupResponse.self
        )
    }

    /// Returns WHOIS registration details for a specified IP address (IPv4 or IPv6).
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.ipWhoisLookup(
    ///         apiKey: "apiKey",
    ///         ip: "ip"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter ip: The IP address (IPv4 or IPv6) for which WHOIS data is requested.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func ipWhoisLookup(apiKey: String, format: IpWhoisLookupRequestFormat? = nil, ip: String, requestOptions: RequestOptions? = nil) async throws -> IpWhoisLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/ip/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": .string(ip)
            ],
            requestOptions: requestOptions,
            responseType: IpWhoisLookupResponse.self
        )
    }

    /// Returns WHOIS registration details for a specified ASN, with or without the 'as' prefix.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.asnWhoisLookup(
    ///         apiKey: "apiKey",
    ///         asn: "asn"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter asn: The Autonomous System Number (ASN) to retrieve WHOIS data for. Can be prefixed with 'as' or not.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func asnWhoisLookup(apiKey: String, format: AsnWhoisLookupRequestFormat? = nil, asn: String, requestOptions: RequestOptions? = nil) async throws -> AsnWhoisLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/asn/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "asn": .string(asn)
            ],
            requestOptions: requestOptions,
            responseType: AsnWhoisLookupResponse.self
        )
    }

    /// Retrieve historical WHOIS records for a domain name.
    /// This endpoint provides a timeline of all recorded changes in domain registration information.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainWhoisHistory(
    ///         apiKey: "apiKey",
    ///         domainName: "domainName"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domainName: Domain name for historical WHOIS lookup
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainWhoisHistory(apiKey: String, format: DomainWhoisHistoryRequestFormat? = nil, domainName: String, requestOptions: RequestOptions? = nil) async throws -> DomainWhoisHistoryResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/whois/history",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName)
            ],
            requestOptions: requestOptions,
            responseType: DomainWhoisHistoryResponse.self
        )
    }

    /// Performs a reverse WHOIS search using one or more search parameters like keyword, email, owner, or company.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainWhoisReverse(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter keyword: Keyword search term for reverse WHOIS by keyword (case-insensitive pattern matching).
    /// - Parameter email: Email search term for reverse WHOIS by email address (case-insensitive exact or regex match; * wildcard supported).
    /// - Parameter owner: Registrant or owner name for reverse WHOIS (a full-text search phrase matching technique to retrieve results).
    /// - Parameter company: Organization or company name for reverse WHOIS (full-text search phrase matching technique to retrieve results).
    /// - Parameter exact: Accepts 'true' or 'false'. "true" returns only records that exactly match the input (keyword, owner/registrant, or company). "false" returns all matches and is the default when omitted.
    /// - Parameter page: Page number for paginated results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainWhoisReverse(apiKey: String, format: DomainWhoisReverseRequestFormat? = nil, keyword: String? = nil, email: String? = nil, owner: String? = nil, company: String? = nil, exact: Bool? = nil, mode: DomainWhoisReverseRequestMode? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainWhoisReverseResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/whois/reverse",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "keyword": keyword.map { .string($0) }, 
                "email": email.map { .string($0) }, 
                "owner": owner.map { .string($0) }, 
                "company": company.map { .string($0) }, 
                "exact": exact.map { .bool($0) }, 
                "mode": mode.map { .string($0.rawValue) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainWhoisReverseResponse.self
        )
    }

    /// Retrieve real-time DNS records for any hostname. Supports multiple record types including A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainDnsLookup(
    ///         apiKey: "apiKey",
    ///         type: [
    ///             "type"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter hostName: Hostname or URL whose DNS records are required. Give either `host-name` or `ipAddress`.
    /// - Parameter ipAddress: The IP address whose PTR (reverse DNS) record is required. Give either `host-name` or `ipAddress`; with `ipAddress`, set `type` to `all` or `PTR`.
    /// - Parameter type: DNS record types to look up, sent as a comma-separated list (e.g. `A,MX`). Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, PTR, or all. When ipAddress is provided, use "all" or "PTR".
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainDnsLookup(apiKey: String, format: DomainDnsLookupRequestFormat? = nil, hostName: String? = nil, ipAddress: String? = nil, type: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainDnsLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/dns/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "host-name": hostName.map { .string($0) }, 
                "ipAddress": ipAddress.map { .string($0) }, 
                "type": type.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainDnsLookupResponse.self
        )
    }

    /// Perform DNS lookups for multiple hostnames in a single request. Supports up to `100 host-names per request`
    /// and returns DNS records including A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkDomainDnsLookup(
    ///         apiKey: "apiKey",
    ///         type: [
    ///             "type"
    ///         ],
    ///         request: .init(domainNames: [
    ///             "domainNames"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter type: DNS record types to look up, sent as a comma-separated list (e.g. `A,MX`). Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, or all.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkDomainDnsLookup(apiKey: String, format: BulkDomainDnsLookupRequestFormat? = nil, type: [String]? = nil, request: Requests.BulkDomainDnsLookupRequest, requestOptions: RequestOptions? = nil) async throws -> BulkDomainDnsLookupResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/domain/dns/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "type": type.map { .stringArray($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkDomainDnsLookupResponse.self
        )
    }

    /// Retrieve historical DNS records for any hostname. Access unique historical data for A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records,
    /// including subdomains. Results are paginated with up to 100 unique records per page.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainDnsHistory(
    ///         apiKey: "apiKey",
    ///         hostName: "host-name",
    ///         type: [
    ///             "type"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter hostName: Hostname or URL whose historical DNS records are required
    /// - Parameter type: DNS record types to look up, sent as a comma-separated list (e.g. `A,MX`). Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, or all.
    /// - Parameter page: Page number for paginated results
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainDnsHistory(apiKey: String, format: DomainDnsHistoryRequestFormat? = nil, hostName: String, type: [String]? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainDnsHistoryResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/dns/history",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "host-name": .string(hostName), 
                "type": type.map { .stringArray($0) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainDnsHistoryResponse.self
        )
    }

    /// Retrieve all the hostnames associated with any particular A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME DNS records. For instance, you can access all the hostnames hosted on any IP/CIDR notation, all the domain names using Cloudflare name servers, and all the domain names using Google Mailbox
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainDnsReverse(
    ///         apiKey: "apiKey",
    ///         type: .a,
    ///         value: "value"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter type: The type of reverse DNS lookup to perform. Determines how the value parameter is interpreted:
    /// - A: IPv4 CIDR block
    /// - AAAA: IPv6 CIDR block
    /// - MX: Mail provider domain
    /// - NS: Name server provider hostname
    /// - SOA: SOA record admin domain
    /// - SPF/TXT: Target verification strings
    /// - CNAME: Target hostname
    /// - Parameter value: Provide an IP or CIDR for A/AAAA lookups, or a hostname/selector for MX, NS, SOA, SPF, TXT, and CNAME queries. Wildcard regex patterns are also supported (e.g., mail.google.com, m*.google.com, _spf.g*.com, s*.g*.com).
    /// - Parameter exact: Accepts 'true' or 'false'. "true" returns only records that exactly match the input (NS, MX, CNAME, SOA, SPF, TXT). "false" returns all matches (default when omitted).
    /// - Parameter page: Page number to paginate through results (defaults to 1).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainDnsReverse(apiKey: String, format: DomainDnsReverseRequestFormat? = nil, type: DomainDnsReverseRequestType, value: String, exact: Bool? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainDnsReverseResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/dns/reverse",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "type": .string(type.rawValue), 
                "value": .string(value), 
                "exact": exact.map { .bool($0) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainDnsReverseResponse.self
        )
    }

    /// Execute a series of web scraping instructions on a target URL. 
    /// Supports various operations like form filling, clicking, data extraction, and CAPTCHA solving.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.webScrape(
    ///         apiKey: "apiKey",
    ///         url: "https://example.com",
    ///         request: WebScrapeRequestBody.webScrapeRequestBodyBlockUrl(
    ///             WebScrapeRequestBodyBlockUrl(
    ///                 instructions: [
    ///                     WebScrapeRequestBodyBlockUrlInstructionsItem(
    ///
    ///                     ),
    ///                     WebScrapeRequestBodyBlockUrlInstructionsItem(
    ///
    ///                     ),
    ///                     WebScrapeRequestBodyBlockUrlInstructionsItem(
    ///
    ///                     ),
    ///                     WebScrapeRequestBodyBlockUrlInstructionsItem(
    ///
    ///                     ),
    ///                     WebScrapeRequestBodyBlockUrlInstructionsItem(
    ///                         extract: [
    ///                             "profile": "#profile", 
    ///                             "welcomeMessage": "#welcome-message", 
    ///                             "userInfo": "#user-info"
    ///                         ]
    ///                     ),
    ///                     WebScrapeRequestBodyBlockUrlInstructionsItem(
    ///
    ///                     ),
    ///                     WebScrapeRequestBodyBlockUrlInstructionsItem(
    ///
    ///                     )
    ///                 ]
    ///             )
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API.
    /// - Parameter url: Target URL to scrape
    /// - Parameter text: Set to `true` to return the data in text format else `false` for data in html format with tags.
    /// - Parameter jsEnabled: Set  `true` to handle websites with JavaScript. Set `false` to handle static html websites.
    /// 
    /// 
    ///  Default value is `true`.
    /// - Parameter proxy: Use a proxy for the request. Pass true/false to toggle the default proxy pool, or a proxy URL string to use a specific proxy.
    /// - Parameter sslIgnore: Ignore SSL certificate errors.
    /// 
    /// 
    ///  Only works if **jsEnabled** is **true**.
    /// - Parameter windowSize: Specify the browser window size in the format 'width,height' (e.g., "1920w,1080h"). Default value is the default resolutions provided by web/browser.
    /// 
    /// 
    ///  Only works if **jsEnabled** is **true**.
    /// - Parameter adBlock: Set to `true` to apply ad-blocker to the specified URL else false or ignore to not apply.
    /// 
    /// 
    ///  Only works if **jsEnabled** is **true**.
    /// - Parameter captcha: if true user can provide captcha instructions in the instructions to solve image captchas.
    /// 
    /// 
    ///   Only works if **jsEnabled** is **true**.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func webScrape(apiKey: String, format: WebScrapeRequestFormat? = nil, url: String, text: Bool? = nil, jsEnabled: Bool? = nil, proxy: WebScrapeRequestProxy? = nil, sslIgnore: Bool? = nil, windowSize: String? = nil, adBlock: Bool? = nil, captcha: Bool? = nil, request: WebScrapeRequestBody, requestOptions: RequestOptions? = nil) async throws -> WebScrapeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/scraping",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "url": .string(url), 
                "text": text.map { .bool($0) }, 
                "jsEnabled": jsEnabled.map { .bool($0) }, 
                "proxy": proxy.map { (p: WebScrapeRequestProxy) -> QueryParameter in
                    switch p {
                    case .bool(let v): return .bool(v)
                    case .string(let v): return .string(v)
                    }
                }, 
                "sslIgnore": sslIgnore.map { .bool($0) }, 
                "windowSize": windowSize.map { .string($0) }, 
                "adBlock": adBlock.map { .bool($0) }, 
                "captcha": captcha.map { .bool($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: WebScrapeResponse.self
        )
    }

    /// Validates a single email address and returns result.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.emailValidate(
    ///         apiKey: "apiKey",
    ///         request: .init(email: "email")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func emailValidate(apiKey: String, format: EmailValidateRequestFormat? = nil, request: Requests.EmailValidateRequest, requestOptions: RequestOptions? = nil) async throws -> EmailValidateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/email-validation/single",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: EmailValidateResponse.self
        )
    }

    /// Validates a bulk of email addresses and returns result for each. Maximum `10` email addresses per request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkEmailValidate(
    ///         apiKey: "apiKey",
    ///         request: .init(emailData: [
    ///             BulkEmailValidateRequestEmailDataItem(
    ///                 email: "email"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkEmailValidate(apiKey: String, format: BulkEmailValidateRequestFormat? = nil, request: Requests.BulkEmailValidateRequest, requestOptions: RequestOptions? = nil) async throws -> BulkEmailValidateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/email-validation/bulk",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkEmailValidateResponse.self
        )
    }

    /// Validates email syntax and checks the domain for disposable, free, spam, and role-account signals, plus MX/A DNS records. Send the email (and optionally an ip) as a JSON request body. When an ip is included, the response also carries geolocation and security data for it.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.disposableEmailCheckV2(
    ///         apiKey: "apiKey",
    ///         request: .init(email: "test@sogetthis.com")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func disposableEmailCheckV2(apiKey: String, format: DisposableEmailCheckV2RequestFormat? = nil, request: Requests.DisposableEmailCheckV2Request, requestOptions: RequestOptions? = nil) async throws -> DisposableEmailCheckV2Response {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v2.0/email/disposable-check",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: DisposableEmailCheckV2Response.self
        )
    }

    /// Checks a bulk of email addresses (each with an optional ip) and returns a disposable email check result for each, in the same order as the request. Maximum `100` entries per request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkDisposableEmailCheckV2(
    ///         apiKey: "apiKey",
    ///         request: .init(emailData: [
    ///             BulkDisposableEmailCheckV2RequestEmailDataItem(
    ///                 email: "abc"
    ///             ),
    ///             BulkDisposableEmailCheckV2RequestEmailDataItem(
    ///                 email: "john@microsoft.com",
    ///                 ip: "8.8.8.8"
    ///             ),
    ///             BulkDisposableEmailCheckV2RequestEmailDataItem(
    ///                 email: "test@mailinator.com"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkDisposableEmailCheckV2(apiKey: String, format: BulkDisposableEmailCheckV2RequestFormat? = nil, request: Requests.BulkDisposableEmailCheckV2Request, requestOptions: RequestOptions? = nil) async throws -> BulkDisposableEmailCheckV2Response {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v2.0/email/disposable-check/bulk",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkDisposableEmailCheckV2Response.self
        )
    }

    /// Validates a single phone number and returns detailed metadata including carrier, line type, geolocation, time zones, and standardized formats.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.phoneValidate(
    ///         apiKey: "apiKey",
    ///         request: .init(number: "+14155552671")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object. If not provided, the API defaults to JSON format.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func phoneValidate(apiKey: String, format: PhoneValidateRequestFormat? = nil, request: Requests.PhoneValidateRequest, requestOptions: RequestOptions? = nil) async throws -> PhoneValidateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/phone/validation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: PhoneValidateResponse.self
        )
    }

    /// Validates up to 100 phone numbers in a single request. Each number is processed independently — invalid entries return per-number errors without affecting the rest of the batch.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkPhoneValidate(
    ///         apiKey: "apiKey",
    ///         request: .init(numbers: [
    ///             BulkPhoneValidateRequestNumbersItem(
    ///                 number: "+14155552671"
    ///             ),
    ///             BulkPhoneValidateRequestNumbersItem(
    ///                 number: "+447911123456"
    ///             ),
    ///             BulkPhoneValidateRequestNumbersItem(
    ///                 number: "+919876543210"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object. If not provided, the API defaults to JSON format.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkPhoneValidate(apiKey: String, format: BulkPhoneValidateRequestFormat? = nil, request: Requests.BulkPhoneValidateRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkPhoneValidateResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/phone/validation/bulk",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkPhoneValidateResponseItem].self
        )
    }

    /// Retrieve comprehensive SSL certificate information without the certificate chain.
    /// This endpoint provides detailed information about the SSL certificate including expiry dates, issuer details, and encryption methods.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainSslLookup(
    ///         apiKey: "apiKey",
    ///         domainName: "domainName"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domainName: Domain name or URL whose SSL certificate lookup is required
    /// - Parameter sslRaw: Set to true to get the raw openSSL response of the domain
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainSslLookup(apiKey: String, format: DomainSslLookupRequestFormat? = nil, domainName: String, sslRaw: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainSslLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/ssl/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName), 
                "sslRaw": sslRaw.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainSslLookupResponse.self
        )
    }

    /// Retrieve the complete SSL certificate chain from root Certificate Authority (CA) to end-user certificate.
    /// This endpoint provides comprehensive information about each certificate in the chain.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainSslChainLookup(
    ///         apiKey: "apiKey",
    ///         domainName: "domainName"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domainName: Domain name or URL whose SSL certificate chain lookup is required
    /// - Parameter sslRaw: Set to true to get the raw openSSL response for each certificate in the chain
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainSslChainLookup(apiKey: String, format: DomainSslChainLookupRequestFormat? = nil, domainName: String, sslRaw: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainSslChainLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/ssl/live/chain",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName), 
                "sslRaw": sslRaw.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainSslChainLookupResponse.self
        )
    }

    /// The Domain Search API is designed to simplify the process of finding available domain names across all top-level domains (TLDs) and second-level domains (SLDs).
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainAvailabilityCheck(
    ///         apiKey: "apiKey",
    ///         domain: "domain"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domain: Domain name whose availability is to be checked.
    /// - Parameter source: Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainAvailabilityCheck(apiKey: String, format: DomainAvailabilityCheckRequestFormat? = nil, domain: String, source: DomainAvailabilityCheckRequestSource? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainAvailabilityCheckResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/availability",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domain": .string(domain), 
                "source": source.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: DomainAvailabilityCheckResponse.self
        )
    }

    /// Perform Bulk Domain Availability checks using a list of domains. Supports upto `100 Domains Per Request`.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkDomainAvailabilityCheck(
    ///         apiKey: "apiKey",
    ///         request: .init(domainNames: [
    ///             "domainNames"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter source: Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkDomainAvailabilityCheck(apiKey: String, format: BulkDomainAvailabilityCheckRequestFormat? = nil, source: BulkDomainAvailabilityCheckRequestSource? = nil, request: Requests.BulkDomainAvailabilityCheckRequest, requestOptions: RequestOptions? = nil) async throws -> BulkDomainAvailabilityCheckResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/domain/availability",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "source": source.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkDomainAvailabilityCheckResponse.self
        )
    }

    /// The Domain Search API is designed to simplify the process of finding available domain names across all top-level domains (TLDs) and second-level domains (SLDs).
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainAvailabilitySuggestions(
    ///         apiKey: "apiKey",
    ///         domain: "domain"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domain: Domain name for availability and suggestions.
    /// - Parameter source: Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    /// - Parameter count: Number of suggestions to retrieve. The API returns a minimum of 5 suggestions regardless of a lower value.
    /// - Parameter sug: Controls the response shape. When `false`, returns a single availability object for the queried domain only. When omitted or `true`, returns an array of suggested domains instead.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainAvailabilitySuggestions(apiKey: String, format: DomainAvailabilitySuggestionsRequestFormat? = nil, domain: String, source: DomainAvailabilitySuggestionsRequestSource? = nil, count: Int? = nil, sug: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainAvailabilitySuggestionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/availability/suggestions",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domain": .string(domain), 
                "source": source.map { .string($0.rawValue) }, 
                "count": count.map { .int($0) }, 
                "sug": sug.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainAvailabilitySuggestionsResponse.self
        )
    }

    /// The Subdomain Lookup API is designed to retrieve subdomains related to the given domain name. It helps you explore subdomains that are available for registration or usage.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.subdomainsLookup(
    ///         apiKey: "apiKey",
    ///         domain: "domain"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domain: Domain name for availability and suggestions.
    /// - Parameter after: Filter subdomains seen after this date (format YYYY-MM-DD).
    /// - Parameter before: Filter subdomains seen before this date( format YYYY-MM-DD).
    /// - Parameter status: Filter subdomains by status (active or inactive).
    /// - Parameter page: Page number for paginated results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func subdomainsLookup(apiKey: String, format: SubdomainsLookupRequestFormat? = nil, domain: String, after: CalendarDate? = nil, before: CalendarDate? = nil, status: SubdomainsLookupRequestStatus? = nil, page: String? = nil, requestOptions: RequestOptions? = nil) async throws -> SubdomainsLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/subdomains/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domain": .string(domain), 
                "after": after.map { .calendarDate($0) }, 
                "before": before.map { .calendarDate($0) }, 
                "status": status.map { .string($0.rawValue) }, 
                "page": page.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: SubdomainsLookupResponse.self
        )
    }

    /// The Domain Typosquatting API searches for registered domains that are typo or look-alike variants of a brand keyword, or that match a wildcard pattern. Results include registration lifecycle data and drop status across 1529+ TLDs, paginated at 100 domains per page.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainTyposquatting(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter keyword: Brand or label to find typo variants for. 3-63 characters, letters, digits, or hyphens, a single label with no dots. Case-insensitive. Use either keyword or pattern, never both.
    /// - Parameter pattern: Wildcard search string that combines fuzzy matching with * wildcards. 3-63 characters total, * is the only supported wildcard and each one matches zero or more characters, maximum 3 asterisks per request. Use either keyword or pattern, never both.
    /// - Parameter pageToken: Token from nextPageToken in the previous response. Required to retrieve page 2 and onward. The original keyword or pattern must be passed alongside the token on every page request. Results page at 100 domains per page.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainTyposquatting(apiKey: String, format: DomainTyposquattingRequestFormat? = nil, keyword: String? = nil, pattern: String? = nil, pageToken: String? = nil, requestOptions: RequestOptions? = nil) async throws -> DomainTyposquattingResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/typosquatting",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "keyword": keyword.map { .string($0) }, 
                "pattern": pattern.map { .string($0) }, 
                "pageToken": pageToken.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: DomainTyposquattingResponse.self
        )
    }

    /// The Domain Reputation API evaluates a domain against threat intelligence sources, DGA (domain generation algorithm) scoring, trust signals, and email deliverability configuration, returning a consolidated risk assessment with a verdict, severity, and supporting evidence.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainReputation(
    ///         apiKey: "apiKey",
    ///         domainName: "domainName"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domainName: The domain name to assess (e.g. example.com). Must contain at least one dot and be at most 253 characters. Automatically lowercased.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainReputation(apiKey: String, format: DomainReputationRequestFormat? = nil, domainName: String, requestOptions: RequestOptions? = nil) async throws -> DomainReputationResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/domain/reputation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName)
            ],
            requestOptions: requestOptions,
            responseType: DomainReputationResponse.self
        )
    }

    /// Retrieve sunrise and sunset times, current position of the moon, and other related information by specifying a location address, location coordinates, IP address, or using the client IP address if no parameter is passed.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.astronomyLookupV2(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response. Can be "json" or "xml".
    /// - Parameter location: Extract astronomy information using location (preferably city)
    /// - Parameter lat: Latitude to extract astronomy information using location coordinates
    /// - Parameter long: Longitude to extract astronomy information using location coordinates
    /// - Parameter ip: IPv4 or IPv6 address to extract astronomy information using IP address
    /// - Parameter lang: Response language of "location" field in case of lookup through IP address only.
    /// - Parameter date: Specific date (format YYYY-MM-DD) for which astronomy data is required
    /// - Parameter elevation: Elevation above sea level at the location, in meters. The value should be between 0 meter and a maximum value of 10,000 meters. Negative value is set to 0.
    /// - Parameter timeZone: Time zone to receive all time-based data in your preferred local time.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func astronomyLookupV2(apiKey: String, format: AstronomyLookupV2RequestFormat? = nil, location: String? = nil, lat: Float? = nil, long: Float? = nil, ip: String? = nil, lang: AstronomyLookupV2RequestLang? = nil, date: CalendarDate? = nil, elevation: Float? = nil, timeZone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> AstronomyLookupV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/geolocation/astronomy",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .float($0) }, 
                "long": long.map { .float($0) }, 
                "ip": ip.map { .string($0) }, 
                "lang": lang.map { .string($0.rawValue) }, 
                "date": date.map { .calendarDate($0) }, 
                "elevation": elevation.map { .float($0) }, 
                "time_zone": timeZone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: AstronomyLookupV2Response.self
        )
    }

    /// Get current time, date, and timezone details by specifying a timezone name, location address, GPS coordinates, IP address, IATA/ICAO airport code, UN/LOCODE, or use the client IP if no parameter is provided.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.timezoneLookupV2(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response. Possible values: json, xml.
    /// - Parameter ip: IPv4 or IPv6 address to extract timezone information.
    /// - Parameter tz: Timezone name in IANA format (e.g., Asia/Kolkata) to retrieve information directly.
    /// - Parameter location: Location string (preferably city and country) to extract timezone.
    /// - Parameter lat: Latitude for geolocation-based timezone lookup. Only time_zone is returned for this mode; no location object is included.
    /// - Parameter long: Longitude for geolocation-based timezone lookup. Only time_zone is returned for this mode; no location object is included.
    /// - Parameter lang: Response language for location fields. Default: en.
    /// - Parameter iataCode: 3-letter IATA airport code (e.g., LHR) to extract timezone.
    /// - Parameter icaoCode: 4-letter ICAO airport code (e.g., KJFK) to extract timezone.
    /// - Parameter loCode: 5-letter UN/LOCODE city code to extract timezone.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func timezoneLookupV2(apiKey: String, format: TimezoneLookupV2RequestFormat? = nil, ip: String? = nil, tz: String? = nil, location: String? = nil, lat: Float? = nil, long: Float? = nil, lang: TimezoneLookupV2RequestLang? = nil, iataCode: String? = nil, icaoCode: String? = nil, loCode: String? = nil, requestOptions: RequestOptions? = nil) async throws -> TimezoneLookupV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/geolocation/timezone",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": ip.map { .string($0) }, 
                "tz": tz.map { .string($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .float($0) }, 
                "long": long.map { .float($0) }, 
                "lang": lang.map { .string($0.rawValue) }, 
                "iata_code": iataCode.map { .string($0) }, 
                "icao_code": icaoCode.map { .string($0) }, 
                "lo_code": loCode.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: TimezoneLookupV2Response.self
        )
    }

    /// Get detailed IP geolocation data for an IP address including country, city, timezone, currency, and optional threat intelligence and user-agent information.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.geolocationLookupV2(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter ip: IPv4, IPv6, or hostname for geolocation lookup.
    /// - Parameter lang: Response language for location fields. Default: en.
    /// - Parameter fields: Comma-separated list of fields to include in response. For example, `location` includes all location fields, `location.city` is a specific field.
    /// - Parameter excludes: Comma-separated list of fields to exclude from response.
    /// - Parameter include: Comma-separated list of additional data modules to include. Possible values: security (threat intelligence), hostname (IP-Hostname lookup), liveHostname (live hostname lookup), hostnameFallbackLive (hostname with live fallback), user_agent (parse User-Agent header), abuse (abuse contact info), dma_code (DMA code), geo_accuracy (accuracy_radius, confidence, locality), * (all modules).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func geolocationLookupV2(apiKey: String, format: GeolocationLookupV2RequestFormat? = nil, ip: String? = nil, lang: GeolocationLookupV2RequestLang? = nil, fields: String? = nil, excludes: String? = nil, include: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GeolocationLookupV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/geolocation/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": ip.map { .string($0) }, 
                "lang": lang.map { .string($0.rawValue) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }, 
                "include": include.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GeolocationLookupV2Response.self
        )
    }

    /// Get detailed IP geolocation data for multiple IP addresses including country, city, timezone, currency, and optional threat intelligence information. Supports up to 50,000 IP addresses per request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkGeolocationLookupV2(
    ///         apiKey: "apiKey",
    ///         request: .init(ips: [
    ///             "ips"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter lang: Response language for location fields. Default: en.
    /// - Parameter fields: Comma-separated list of fields to include in the response. For example, `location` includes all location fields, `location.city` is a specific field.
    /// - Parameter excludes: Comma-separated list of fields to exclude from response.
    /// - Parameter include: Comma-separated list of additional data modules to include. Possible values: security (threat intelligence), hostname (IP-Hostname lookup), liveHostname (live hostname lookup), user_agent (parse User-Agent header), abuse (abuse contact info), * (all modules).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkGeolocationLookupV2(apiKey: String, format: BulkGeolocationLookupV2RequestFormat? = nil, lang: BulkGeolocationLookupV2RequestLang? = nil, fields: String? = nil, excludes: String? = nil, include: String? = nil, request: Requests.BulkGeolocationLookupV2Request, requestOptions: RequestOptions? = nil) async throws -> [BulkGeolocationLookupV2ResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v2.0/geolocation/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "lang": lang.map { .string($0.rawValue) }, 
                "fields": fields.map { .string($0) }, 
                "excludes": excludes.map { .string($0) }, 
                "include": include.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkGeolocationLookupV2ResponseItem].self
        )
    }

    /// Returns the current WHOIS record for the specified domain, including registrar details, registrant/administrative/technical/billing/reseller contacts, name servers, status codes, and raw WHOIS text.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.domainWhoisLookupV2(
    ///         apiKey: "apiKey",
    ///         domainName: "domainName"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter domainName: Domain name to retrieve WHOIS data for (e.g. example.com).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func domainWhoisLookupV2(apiKey: String, format: DomainWhoisLookupV2RequestFormat? = nil, domainName: String, requestOptions: RequestOptions? = nil) async throws -> DomainWhoisLookupV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/domain/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "domainName": .string(domainName)
            ],
            requestOptions: requestOptions,
            responseType: DomainWhoisLookupV2Response.self
        )
    }

    /// Returns the current WHOIS record for each requested domain, in request order. Supports up to 100 domain names per request; a domain that fails to resolve yields an error item instead of failing the whole batch.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkDomainWhoisLookupV2(
    ///         apiKey: "apiKey",
    ///         request: .init(domainNames: [
    ///             "domainNames"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkDomainWhoisLookupV2(apiKey: String, format: BulkDomainWhoisLookupV2RequestFormat? = nil, request: Requests.BulkDomainWhoisLookupV2Request, requestOptions: RequestOptions? = nil) async throws -> BulkDomainWhoisLookupV2Response {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v2.0/domain/whois/live",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkDomainWhoisLookupV2Response.self
        )
    }

    /// Returns the current live price for the requested commodity symbols. Unresolved symbols degrade to a 206 partial response instead of failing the whole request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityLatestRatesV2(
    ///         apiKey: "apiKey",
    ///         symbols: [
    ///             "symbols"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format. Currently only `json` is supported.
    /// - Parameter symbols: Comma-separated list of commodity symbols (e.g., XAU, WTIOIL-SPOT). Case-insensitive; duplicates are deduplicated server-side, with one response entry and one credit charge per unique symbol.
    /// - Parameter quote: Target currency for the exchange rate. If omitted (or set to `default`), the default quote currency of each commodity is used. Requires a premium plan; ignored on lower-tier plans.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityLatestRatesV2(apiKey: String, format: CommodityLatestRatesV2RequestFormat? = nil, symbols: [String]? = nil, quote: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CommodityLatestRatesV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/commodity/rates/latest",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "quote": quote.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CommodityLatestRatesV2Response.self
        )
    }

    /// Returns OHLC price data for the requested commodity symbols on a specific date. Falls back to the nearest earlier rate if none exists for the exact date. Unresolved symbols degrade to a 206 partial response instead of failing the whole request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityHistoricalRatesV2(
    ///         apiKey: "apiKey",
    ///         symbols: [
    ///             "symbols"
    ///         ],
    ///         date: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format. Currently only `json` is supported.
    /// - Parameter symbols: Comma-separated list of commodity symbols. Case-insensitive; duplicates are deduplicated server-side, with one response entry and one credit charge per unique symbol.
    /// - Parameter date: Date in YYYY-MM-DD format. Data available from 1990 onwards.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityHistoricalRatesV2(apiKey: String, format: CommodityHistoricalRatesV2RequestFormat? = nil, symbols: [String]? = nil, date: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CommodityHistoricalRatesV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/commodity/rates/historical",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "date": .calendarDate(date)
            ],
            requestOptions: requestOptions,
            responseType: CommodityHistoricalRatesV2Response.self
        )
    }

    /// Returns price fluctuation metrics (start, end, change, percent change) for the requested commodity symbols over a date range. For monthly-updated commodities the range snaps to month boundaries. Unresolved symbols degrade to a 206 partial response instead of failing the whole request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityFluctuationV2(
    ///         apiKey: "apiKey",
    ///         symbols: [
    ///             "symbols"
    ///         ],
    ///         startDate: CalendarDate("2023-01-15")!,
    ///         endDate: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format. Currently only `json` is supported.
    /// - Parameter symbols: Comma-separated list of commodity symbols. Case-insensitive; duplicates are deduplicated server-side, with one response entry and one credit charge per unique symbol.
    /// - Parameter startDate: Start date (YYYY-MM-DD)
    /// - Parameter endDate: End date (YYYY-MM-DD)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityFluctuationV2(apiKey: String, format: CommodityFluctuationV2RequestFormat? = nil, symbols: [String]? = nil, startDate: CalendarDate, endDate: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CommodityFluctuationV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/commodity/fluctuation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate)
            ],
            requestOptions: requestOptions,
            responseType: CommodityFluctuationV2Response.self
        )
    }

    /// Returns day-by-day OHLC data for the requested commodity symbols within a date range, indexed by date. Non-trading days are excluded. Unresolved symbols degrade to a 206 partial response instead of failing the whole request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityTimeSeriesV2(
    ///         apiKey: "apiKey",
    ///         symbols: [
    ///             "symbols"
    ///         ],
    ///         startDate: CalendarDate("2023-01-15")!,
    ///         endDate: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format. Currently only `json` is supported.
    /// - Parameter symbols: Comma-separated list of commodity symbols. Case-insensitive; duplicates are deduplicated server-side, with one response entry and one credit charge per unique symbol.
    /// - Parameter startDate: Start date (YYYY-MM-DD)
    /// - Parameter endDate: End date (YYYY-MM-DD). Maximum range is 365 days.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityTimeSeriesV2(apiKey: String, format: CommodityTimeSeriesV2RequestFormat? = nil, symbols: [String]? = nil, startDate: CalendarDate, endDate: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CommodityTimeSeriesV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/commodity/time-series",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate)
            ],
            requestOptions: requestOptions,
            responseType: CommodityTimeSeriesV2Response.self
        )
    }

    /// Returns the list of supported commodity symbols with metadata. Deprecated symbols stay listed with status "inactive" and a deprecationDate.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commoditySymbolsV2(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format. Currently only `json` is supported.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commoditySymbolsV2(apiKey: String, format: CommoditySymbolsV2RequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CommoditySymbolsV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/commodity/symbols",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CommoditySymbolsV2Response.self
        )
    }

    /// Returns the prices of one commodity through a UTC day at the requested interval, keyed by UTC timestamp. Each request costs a flat 50 credits however many points it returns.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityIntradayRatesV2(
    ///         apiKey: "apiKey",
    ///         symbols: "symbols",
    ///         interval: .oneM,
    ///         date: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter symbols: Exactly one commodity symbol. Case-insensitive. Sending two or more returns a 400. Only symbols updated every second, every minute, or every 10 minutes have intraday rates; symbols updated hourly or less often return a 400. Use the Commodity Symbols endpoint for all valid values.
    /// - Parameter interval: Spacing between points. Case-insensitive. Symbols updated every 10 minutes accept only `10m`, `30m`, `1h`, `2h`, `4h`, `8h`, `12h`, `1d`.
    /// - Parameter date: The UTC day to read, in `YYYY-MM-DD` format. Cannot be in the future. For today, points stop at the current UTC minute.
    /// - Parameter startTime: First mark of the window, as a 24-hour UTC time in `HH:mm`. Must fall on a mark of the interval (for example, `14:30` works for `5m` or `30m`, but not for `1h`). For `1d` it can only be `00:00`.
    /// - Parameter metadata: Whether to include the `metadata` object. Pass `false` to receive only the prices.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityIntradayRatesV2(apiKey: String, symbols: String, interval: CommodityIntradayRatesV2RequestInterval, date: CalendarDate, startTime: String? = nil, metadata: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> CommodityIntradayRatesV2Response {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v2.0/commodity/rates/intraday",
            queryParams: [
                "apiKey": .string(apiKey), 
                "symbols": .string(symbols), 
                "interval": .string(interval.rawValue), 
                "date": .calendarDate(date), 
                "startTime": startTime.map { .string($0) }, 
                "metadata": metadata.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: CommodityIntradayRatesV2Response.self
        )
    }

    /// This API merges multiple PDF files into a single PDF, in the order they are provided
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfMerge(
    ///         apiKey: "apiKey",
    ///         request: .init(file: [])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: An array of unique file IDs referencing PDF files previously uploaded to the API Freaks server. Use this parameter to merge existing files without re-uploading them. Provide multiple IDs to merge files in the specified order.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: Specifies the desired name for the resulting merged PDF file. If not provided, a default name will be assigned.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfMerge(webhookAuthorization: String? = nil, apiKey: String, format: PdfMergeRequestFormat? = nil, fileId: [String]? = nil, destroy: Bool? = nil, output: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfMergeRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfMergeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/merge",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .repeatedStringArray($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfMergeResponse.self
        )
    }

    /// This API removes a selection or range of pages from a PDF file.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfRemovePages(
    ///         apiKey: "apiKey",
    ///         pages: "pages",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique identifier of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output PDF file after pages have been removed. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies which pages to remove from the PDF. Accepts individual page numbers (e.g., '1,7') and/or ascending page ranges (e.g., '3-5'). Use commas to separate entries and hyphens for ranges. Reverse ranges (e.g., '5-3') are not allowed. Alternatively, you may provide only one of the following keywords: 'even' (removes all even-numbered pages), 'odd' (removes all odd-numbered pages), or 'last' (removes only the last page). The keyword 'all' is not supported for this operation. Examples: '1,3-5', 'even'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfRemovePages(webhookAuthorization: String? = nil, apiKey: String, format: PdfRemovePagesRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfRemovePagesRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfRemovePagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/remove-pages",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": .string(pages), 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfRemovePagesResponse.self
        )
    }

    /// This API splits a PDF into multiple parts based on specified page numbers or ranges.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfSplit(
    ///         apiKey: "apiKey",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired base name for the output PDF files after splitting. If not provided, a default naming convention will be used.
    /// - Parameter pages: Defines the page numbers or ranges where the PDF should be split. Provide individual pages and/or ranges in any order (for example: "1-4,9-5,16-last"). Separate entries with commas and use hyphens for ranges.
    /// 
    /// Special keywords (use alone):
    /// 
    /// • `even` — split at every even-numbered page
    /// 
    /// • `odd` — split at every odd-numbered page
    /// 
    /// • `all` — split the PDF into single-page files
    /// 
    /// The keyword `last` can be used anywhere in the string, in combination with page numbers or ranges (for example: "5-last", "last-2", "1,last,9").
    /// 
    /// Examples:
    /// - "1,4-2,last"
    /// - "odd"
    /// - "all"
    /// - "last,2-5"
    /// 
    /// Invalid example: "1,odd" (mixing a keyword other than "last" with specific pages/ranges is not allowed). You can pass multiple pages entries to produce multiple output files.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfSplit(webhookAuthorization: String? = nil, apiKey: String, format: PdfSplitRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: [String]? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfSplitRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfSplitResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/split",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .stringArray($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfSplitResponse.self
        )
    }

    /// This API rotates pages of a PDF by a specified angle (in multiples of 90 degrees).
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfRotate(
    ///         apiKey: "apiKey",
    ///         rotate: 1,
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output PDF file after rotation. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies which pages to rotate. Accepts individual page numbers (e.g., '1,7') and/or ascending page ranges (e.g., '3-5'). Use commas to separate entries and hyphens for ranges. Reverse ranges (e.g., '5-3') are not allowed. Alternatively, provide only one of the following keywords: 'even' (rotate all even-numbered pages), 'odd' (rotate all odd-numbered pages), 'last' (rotate only the last page), or 'all' (rotate all pages). Examples: '1,3-5', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter rotate: The angle in degrees to rotate the selected pages. Must be one of the following values: 0, 90, 180, 270, -90, -180, or -270. All rotations are applied clockwise.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfRotate(webhookAuthorization: String? = nil, apiKey: String, format: PdfRotateRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, rotate: Int, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfRotateRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfRotateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/rotate",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "rotate": .int(rotate), 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfRotateResponse.self
        )
    }

    /// This API compresses a given PDF file to reduce its file size.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfCompress(
    ///         apiKey: "apiKey",
    ///         compressionLevel: .low,
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file.
    /// - Parameter output: Name of the output PDF.
    /// - Parameter compressionLevel: Controls how aggressively the PDF is compressed. Lower levels preserve more quality, while higher levels reduce file size more.
    /// - Parameter destroy: If set to true, the input file(s) will be deleted from the server immediately after the output is generated.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfCompress(webhookAuthorization: String? = nil, apiKey: String, format: PdfCompressRequestFormat? = nil, fileId: String? = nil, output: String? = nil, compressionLevel: PdfCompressRequestCompressionLevel, destroy: Bool? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfCompressRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfCompressResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/compress",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "output": output.map { .string($0) }, 
                "compression_level": .string(compressionLevel.rawValue), 
                "destroy": destroy.map { .bool($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfCompressResponse.self
        )
    }

    /// This API extracts specific pages or page ranges from a PDF file and returns them as a new PDF.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfExtractPages(
    ///         apiKey: "apiKey",
    ///         pages: "pages",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output PDF file after pages have been extracted. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies which pages to extract from the PDF. You can provide individual page numbers (e.g., '2') and/or page ranges in any order, including descending (e.g., '9-5', '16-last'). Use commas to separate entries and hyphens for ranges. You may alternatively pass only one of the special keywords: 'even' (extracts all even-numbered pages), 'odd' (extracts all odd-numbered pages), 'last' (extracts only the last page), or 'all' (extracts all pages into individual files). Examples: '2,6-3', 'even', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter separated: If set to `true`, each of the specified pages will be extracted and returned as a separate PDF file.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfExtractPages(webhookAuthorization: String? = nil, apiKey: String, format: PdfExtractPagesRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String, separated: Bool? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfExtractPagesRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfExtractPagesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/extract-pages",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": .string(pages), 
                "separated": separated.map { .bool($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfExtractPagesResponse.self
        )
    }

    /// API endpoint that linearizes any given PDF, restructuring it for faster loading and page-by-page viewing in web browsers.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfLinearize(
    ///         apiKey: "apiKey",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output PDF file after pages have been extracted. If not provided, a default name will be assigned.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfLinearize(webhookAuthorization: String? = nil, apiKey: String, format: PdfLinearizeRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfLinearizeRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfLinearizeResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/linearize",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfLinearizeResponse.self
        )
    }

    /// This API encrypts a PDF file by setting a password required to open it.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfEncrypt(
    ///         apiKey: "apiKey",
    ///         userPassword: "user_password",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output encrypted PDF file. If not provided, a default name will be assigned.
    /// - Parameter filePassword: The password to unlock the input file if it is already protected. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    /// - Parameter userPassword: Sets the user password required to open and view the encrypted PDF file. Password Length should be between 6 and 128 characters.
    /// - Parameter ownerPassword: Sets the owner password for the PDF file. This password provides full access, including the ability to remove restrictions. If not provided, the `user_password` will also be used as the owner password. Password Length should be between 6 and 128 characters.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfEncrypt(webhookAuthorization: String? = nil, apiKey: String, format: PdfEncryptRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, filePassword: String? = nil, userPassword: String, ownerPassword: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfEncryptRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfEncryptResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/encrypt",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "file_password": filePassword.map { .string($0) }, 
                "user_password": .string(userPassword), 
                "owner_password": ownerPassword.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfEncryptResponse.self
        )
    }

    /// This API decrypts PDF files, removing all encryption, including open passwords and permission restrictions.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfDecrypt(
    ///         apiKey: "apiKey",
    ///         filePassword: "file_password",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output decrypted PDF file. If not provided, a default name will be assigned.
    /// - Parameter filePassword: The password to unlock the input file if it is protected. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfDecrypt(webhookAuthorization: String? = nil, apiKey: String, format: PdfDecryptRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, filePassword: String, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfDecryptRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfDecryptResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/decrypt",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "file_password": .string(filePassword), 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfDecryptResponse.self
        )
    }

    /// This API applies permission restrictions on a PDF file, such as disabling printing, copying, or editing. This can include password protection to enforce restrictions.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfRestrict(
    ///         apiKey: "apiKey",
    ///         userPassword: "user_password",
    ///         restrictions: [
    ///             .printHigh
    ///         ],
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output restricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter filePassword: The password to unlock the input file if it is already secured. Provide the owner password if available; otherwise, the user password. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    /// - Parameter userPassword: Sets the password users will use to open the PDF. If this is not set, only the owner password will be configured, and anyone can open the PDF file with the provided restrictions enabled. Password Length should be between 6 and 128 characters.
    /// - Parameter ownerPassword: Sets the password that allows full access to the PDF (e.g., removing restrictions). If not provided, the `user_password` (if set) will also be used as the owner password. Password Length should be between 6 and 128 characters.
    /// - Parameter restrictions: A comma-separated list of restrictions to apply to the PDF. These define what the end-user is *not* allowed to do with the PDF. Available options are:
    /// 
    /// 
    /// * **print_high** – Disables high-quality printing.
    /// * **print_low** – Disables low-resolution printing.
    /// * **edit_document_assembly** – Prevents reordering or inserting pages.
    /// * **fill_form_fields** – Disallows filling in PDF form fields.
    /// * **edit_annotations** – Disables adding or modifying annotations or comments.
    /// * **modify_content** – Prevents modifying existing content in the PDF.
    /// * **copy_and_extract_content** – Disables copying text or images from the PDF.
    /// * **use_accessibility** – Prevents screen readers or accessibility tools from accessing content.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfRestrict(webhookAuthorization: String? = nil, apiKey: String, format: PdfRestrictRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, filePassword: String? = nil, userPassword: String, ownerPassword: String? = nil, restrictions: [PdfRestrictRequestRestrictionsItem]? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfRestrictRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfRestrictResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/restrict",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "file_password": filePassword.map { .string($0) }, 
                "user_password": .string(userPassword), 
                "owner_password": ownerPassword.map { .string($0) }, 
                "restrictions": restrictions.map { .stringArray($0.map(\.rawValue)) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfRestrictResponse.self
        )
    }

    /// This API removes permission restrictions from a PDF while keeping it encrypted. If you want to remove all security (including encryption), use the `/pdf/decrypt` endpoint instead.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfUnrestrict(
    ///         apiKey: "apiKey",
    ///         filePassword: "file_password",
    ///         userPassword: "user_password",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter filePassword: The password to unlock the input file. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    /// - Parameter userPassword: Sets the user password for the PDF file. Password Length should be between 6 and 128 characters.
    /// - Parameter ownerPassword: Sets the owner password for the PDF file. If the owner password is not provided, the `user_password` will also be used as the owner password. Password Length should be between 6 and 128 characters.
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfUnrestrict(webhookAuthorization: String? = nil, apiKey: String, format: PdfUnrestrictRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, filePassword: String, userPassword: String, ownerPassword: String? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfUnrestrictRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfUnrestrictResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/unrestrict",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "file_password": .string(filePassword), 
                "user_password": .string(userPassword), 
                "owner_password": ownerPassword.map { .string($0) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfUnrestrictResponse.self
        )
    }

    /// This API converts a given PDF file into a sequence of PNG images.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfConvertToPng(
    ///         apiKey: "apiKey",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToPng(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToPngRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToPngRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToPngRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfConvertToPngResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/png",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToPngResponse.self
        )
    }

    /// This API converts a given PDF file into a sequence of JPG images.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfConvertToJpg(
    ///         apiKey: "apiKey",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter quality: Controls JPG compression quality. Higher values yield sharper images with larger file sizes.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToJpg(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToJpgRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, quality: Int? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToJpgRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToJpgRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfConvertToJpgResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/jpg",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "quality": quality.map { .int($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToJpgResponse.self
        )
    }

    /// This API converts a given PDF file into a sequence of TIFF images. The output images can be saved as a single TIFF file, or as a sequence of TIFF files.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfConvertToTiff(
    ///         apiKey: "apiKey",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToTiff(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToTiffRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToTiffRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToTiffRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfConvertToTiffResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/tif",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToTiffResponse.self
        )
    }

    /// Converts a PDF file to a BMP image.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfConvertToBmp(
    ///         apiKey: "apiKey",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToBmp(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToBmpRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToBmpRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToBmpRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfConvertToBmpResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/bmp",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToBmpResponse.self
        )
    }

    /// This API converts a given PDF file into a sequence of GIF images.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfConvertToGif(
    ///         apiKey: "apiKey",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter webhookAuthorization: Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    /// - Parameter destroy: If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    /// - Parameter output: The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    /// - Parameter pages: Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    /// - Parameter resolution: Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    /// - Parameter imageSmoothing: Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    /// - Parameter profile: Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    /// - Parameter webhookUrl: The URL to which the webhook notification will be sent after the task is completed.
    /// - Parameter webhookFailureNotification: If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfConvertToGif(webhookAuthorization: String? = nil, apiKey: String, format: PdfConvertToGifRequestFormat? = nil, fileId: String? = nil, destroy: Bool? = nil, output: String? = nil, pages: String? = nil, resolution: Int? = nil, imageSmoothing: String? = nil, profile: PdfConvertToGifRequestProfile? = nil, webhookUrl: String? = nil, webhookFailureNotification: Bool? = nil, request: Requests.PdfConvertToGifRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> PdfConvertToGifResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/gif",
            contentType: .multipartFormData,
            headers: [
                "X-Webhook-Authorization": webhookAuthorization
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": fileId.map { .string($0) }, 
                "destroy": destroy.map { .bool($0) }, 
                "output": output.map { .string($0) }, 
                "pages": pages.map { .string($0) }, 
                "resolution": resolution.map { .int($0) }, 
                "image_smoothing": imageSmoothing.map { .string($0) }, 
                "profile": profile.map { .string($0.rawValue) }, 
                "webhook_url": webhookUrl.map { .string($0) }, 
                "webhook_failure_notification": webhookFailureNotification.map { .bool($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfConvertToGifResponse.self
        )
    }

    /// This API uploads multiple PDF files to the API Freaks server and generates their unique file IDs.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfUploadResources(
    ///         apiKey: "apiKey",
    ///         request: .init(file: [])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfUploadResources(apiKey: String, format: PdfUploadResourcesRequestFormat? = nil, request: Requests.PdfUploadResourcesRequest, requestOptions: RequestOptions? = nil) async throws -> PdfUploadResourcesResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/resource/upload",
            contentType: .multipartFormData,
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: PdfUploadResourcesResponse.self
        )
    }

    /// This API uploads PDF files to the API Freaks server in binary format.
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileName: The desired name for the uploaded PDF file. This name will be used for storage on the server.
    /// 
    /// 
    ///  **NOTE**: Please ensure file_name has extension `.pdf`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfUploadBinary(apiKey: String, format: PdfUploadBinaryRequestFormat? = nil, fileName: String, request: Data, requestOptions: RequestOptions? = nil) async throws -> PdfUploadBinaryResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/resource/upload-binary",
            contentType: .applicationOctetStream,
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_name": .string(fileName)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: PdfUploadBinaryResponse.self
        )
    }

    /// This API downloads PDF files or ZIP archives from the server using their unique resource ID.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfDownloadResource(
    ///         apiKey: "apiKey",
    ///         resourceId: "resource_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter resourceId: The unique identifier of the file or ZIP archive to download.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfDownloadResource(apiKey: String, format: PdfDownloadResourceRequestFormat? = nil, resourceId: String, requestOptions: RequestOptions? = nil) async throws -> Data {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/pdf/resource/download",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "resource_id": .string(resourceId)
            ],
            requestOptions: requestOptions,
            responseType: Data.self
        )
    }

    /// This API checks the status of a previously initiated PDF processing task using its unique task ID.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfGetTaskStatus(
    ///         apiKey: "apiKey",
    ///         taskId: "task_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter taskId: The unique ID of the PDF processing task for which the status is requested.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfGetTaskStatus(apiKey: String, format: PdfGetTaskStatusRequestFormat? = nil, taskId: String, requestOptions: RequestOptions? = nil) async throws -> PdfGetTaskStatusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/pdf/task-status",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "task_id": .string(taskId)
            ],
            requestOptions: requestOptions,
            responseType: PdfGetTaskStatusResponse.self
        )
    }

    /// This API checks the status of a PDF file using its unique file ID, providing information about its creation and potential deletion time.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfGetFileStatus(
    ///         apiKey: "apiKey",
    ///         fileId: "file_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of the file whose status is requested.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfGetFileStatus(apiKey: String, format: PdfGetFileStatusRequestFormat? = nil, fileId: String, requestOptions: RequestOptions? = nil) async throws -> PdfGetFileStatusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/pdf/file-status",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": .string(fileId)
            ],
            requestOptions: requestOptions,
            responseType: PdfGetFileStatusResponse.self
        )
    }

    /// This API retrieves a list of all PDF files uploaded and generated by a specific user. Please note that if the user is part of an organization, only the Organization Administrator can access this endpoint. Organization Members cannot access this endpoint.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfListFiles(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfListFiles(apiKey: String, format: PdfListFilesRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> PdfListFilesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/pdf/files",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: PdfListFilesResponse.self
        )
    }

    /// This API deletes a PDF file using its unique file ID.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfDeleteFile(
    ///         apiKey: "apiKey",
    ///         fileId: "file_id"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    /// - Parameter fileId: The unique ID of the file to be deleted.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfDeleteFile(apiKey: String, format: PdfDeleteFileRequestFormat? = nil, fileId: String, requestOptions: RequestOptions? = nil) async throws -> PdfDeleteFileResponse {
        return try await httpClient.performRequest(
            method: .delete,
            path: "/v1.0/pdf/file",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "file_id": .string(fileId)
            ],
            requestOptions: requestOptions,
            responseType: PdfDeleteFileResponse.self
        )
    }

    /// Renders the template identified by template_id with the JSON data supplied in the request body (or fetched from data_url). Returns a hosted URL for the generated PDF. Provide either a request body or a data_url; one of the two is required. The keys of the data object are the fields you bound when you designed the template in the APIFreaks PDF Template Builder, so the exact shape is up to you. Pin the version parameter to a specific template version (e.g. version=v2) so later design changes never touch what is already live; omit it to use the latest version.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.pdfGenerateFromTemplate(
    ///         apiKey: "apiKey",
    ///         templateId: "template_id",
    ///         request: [
    ///             "candidate_name": .string("Ava Thompson"), 
    ///             "candidate_title": .string("Senior Operations Analyst"), 
    ///             "email": .string("ava.thompson@example.com"), 
    ///             "phone": .string("+1 (555) 381-2048"), 
    ///             "city": .string("Austin, TX"), 
    ///             "portfolio_url": .string("portfolio.example.com"), 
    ///             "profile_summary": .string("Analytical operations professional with 8+ years of experience improving reporting pipelines, streamlining process documentation, and coordinating cross-functional delivery for distributed teams across multiple time zones."), 
    ///             "company_name": .string("Northwind Logistics"), 
    ///             "job_title": .string("Operations Analyst"), 
    ///             "employment_period": .string("2021 - Present"), 
    ///             "job_achievement_1": .string("Led weekly KPI reporting for finance, fulfillment, and customer success stakeholders across three business units."), 
    ///             "job_achievement_2": .string("Reduced manual reconciliation work by 35% through workflow redesign and documentation automation."), 
    ///             "job_achievement_3": .string("Spearheaded a cross-team initiative that improved on-time delivery metrics by 18% within six months."), 
    ///             "skills": .array([
    ///                 .object([
    ///                     "skill": .string("Process Improvement"), 
    ///                     "level": .string("Advanced"), 
    ///                     "years": .string("7")
    ///                 ]),
    ///                 .object([
    ///                     "skill": .string("Stakeholder Reporting"), 
    ///                     "level": .string("Expert"), 
    ///                     "years": .string("8")
    ///                 ]),
    ///                 .object([
    ///                     "skill": .string("Cross-functional Coordination"), 
    ///                     "level": .string("Advanced"), 
    ///                     "years": .string("5")
    ///                 ]),
    ///                 .object([
    ///                     "skill": .string("Workflow Documentation"), 
    ///                     "level": .string("Advanced"), 
    ///                     "years": .string("6")
    ///                 ])
    ///             ]), 
    ///             "degree": .string("B.S. in Information Systems"), 
    ///             "institution": .string("University of Texas"), 
    ///             "graduation_year": .string("2018"), 
    ///             "certification_1": .string("Certified Business Analysis Professional (CBAP)"), 
    ///             "certification_2": .string("Six Sigma Green Belt"), 
    ///             "languages": .string("English (Native), Spanish (Professional)")
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter templateId: The template to render, from the APIFreaks PDF Template Builder. Copy it from your dashboard when you save the template.
    /// - Parameter version: Template version to render, e.g. v2. Must start with v. Omit this parameter entirely to use the latest version; the literal value 'latest' is not accepted by the API.
    /// - Parameter dataUrl: A URL the API fetches your JSON data from, instead of the request body. Provide this when you are not sending a request body.
    /// - Parameter request: Free-form JSON object whose keys map to the fields bound in the template.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func pdfGenerateFromTemplate(apiKey: String, templateId: String, version: String? = nil, dataUrl: String? = nil, request: [String: JSONValue], requestOptions: RequestOptions? = nil) async throws -> PdfGenerateFromTemplateResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/template/generate",
            queryParams: [
                "apiKey": .string(apiKey), 
                "template_id": .string(templateId), 
                "version": version.map { .string($0) }, 
                "data_url": dataUrl.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: PdfGenerateFromTemplateResponse.self
        )
    }

    /// Upload a CSV file where each row is one record. The API generates one PDF per row and returns an array of results, each with its own pdf_url. Rows are processed independently, so a failure in one row does not block the rest of the batch. The response gives a row-by-row breakdown of which PDFs succeeded and which failed.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkPdfGenerateFromTemplate(
    ///         apiKey: "apiKey",
    ///         templateId: "template_id",
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter templateId: The template to render, from the APIFreaks PDF Template Builder. Copy it from your dashboard when you save the template.
    /// - Parameter version: Template version to render, e.g. v2. Must start with v. Omit this parameter entirely to use the latest version; the literal value 'latest' is not accepted by the API.
    /// - Parameter request: Multipart form-data request body containing the CSV file to render in bulk.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkPdfGenerateFromTemplate(apiKey: String, templateId: String, version: String? = nil, request: Requests.BulkPdfGenerateFromTemplateRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkPdfGenerateFromTemplateResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/pdf/template/generate/bulk",
            contentType: .multipartFormData,
            queryParams: [
                "apiKey": .string(apiKey), 
                "template_id": .string(templateId), 
                "version": version.map { .string($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: [BulkPdfGenerateFromTemplateResponseItem].self
        )
    }

    /// Capture full-page screenshots and videos of websites with advanced options like device simulation, custom code injection, cookie banner blocking, and scrollable content recording.
    /// Supports multiple output formats including JSON, image, GIF, MP4, and WebM.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.screenshotCapture(
    ///         apiKey: "apiKey",
    ///         url: "url"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter output: Output format for screenshot results. The SDKs support only `json`, which returns metadata with the captured file's URL in `screenshot`; download the file from that URL. (The API's `output=image`, which returns the raw file, is not supported by the SDK methods.)
    /// - Parameter fileType: File type for screenshot output
    /// - Parameter url: URLs to capture screenshots of
    /// - Parameter width: Browser viewport width in pixels
    /// - Parameter height: Browser viewport height in pixels
    /// - Parameter fullPage: Capture a full-page screenshot
    /// - Parameter fresh: Bypass cache and take a fresh screenshot
    /// - Parameter noCookieBanners: Remove cookie banners from the screenshot
    /// - Parameter enableCaching: Enable caching for repeated requests
    /// - Parameter blockAds: Block advertisements on the page
    /// - Parameter blockChatWidgets: Block chat widget scripts from loading
    /// - Parameter extractText: Extract visible text from the page
    /// - Parameter extractHtml: Extract HTML content of the page
    /// - Parameter destroyScreenshot: Auto-destroy screenshot after fetch
    /// - Parameter lazyLoad: Enable lazy-loading content before screenshot
    /// - Parameter retina: Capture screenshot in high-DPI (Retina) mode
    /// - Parameter darkMode: Render page in dark mode
    /// - Parameter blockTracking: Block common user-tracking scripts
    /// - Parameter enableIncognito: Enable private/incognito mode for browser session
    /// - Parameter omitBackground: Omit background color (transparent background)
    /// - Parameter thumbnailWidth: Thumbnail width in pixels
    /// - Parameter adjustTop: Adjust top in pixels
    /// - Parameter waitForEvent: Wait for a specific load event before capturing the screenshot.
    /// - Parameter grayscale: Range:0 to 100 for grayscale filter
    /// - Parameter delay: How many milliseconds to wait before taking the screenshot
    /// - Parameter timeout: Maximum timeout in milliseconds. Defalut is `10,000`
    /// - Parameter ttl: Number of seconds the screenshot should be cached
    /// - Parameter clipX: X position of the clipping rectangle in pixels
    /// - Parameter clipY: Y position of the clipping rectangle in pixels
    /// - Parameter clipWidth: Width of the clipping rectangle in pixels
    /// - Parameter clipHeight: Height of the clipping rectangle in pixels
    /// - Parameter cssUrl: URL to CSS file
    /// - Parameter css: Your custom CSS code
    /// - Parameter jsUrl: URL to JS file
    /// - Parameter js: Your JS code
    /// - Parameter blockJs: Block Scripts
    /// - Parameter blockStylesheets: Block Stylesheets
    /// - Parameter blockImages: Block Images
    /// - Parameter blockMedia: Block Media
    /// - Parameter blockFont: Block Fonts
    /// - Parameter blockTextTrack: Block Text Tracks
    /// - Parameter blockXhr: Block XHR Requests
    /// - Parameter blockFetch: Block Fetch Requests
    /// - Parameter blockEventSource: Block Event Source
    /// - Parameter blockWebSocket: Block Web Sockets
    /// - Parameter blockManifest: Block Manifest
    /// - Parameter blockSpecificRequests: Comma- or newline-separated list of specific requests to block. Each line and comma are treated as separate requests for processing. Example: https://example.com, https://example.js
    /// - Parameter blurSelector: Comma-separated list of indexed CSS selectors to blur.
    /// Format: `index:<selector>`, e.g., `0:.banner,1:#ads`.
    /// - Parameter removeSelector: Comma-separated list of indexed CSS selectors to blur.
    /// Format: `index:<selector>`, e.g., `0:.banner,1:#ads`.
    /// - Parameter resultFileName: Specify a meaningful & unique file name to easily identify the screenshot result.
    /// Avoid using spaces or special characters; use hyphens or underscores to separate words.
    /// - Parameter scrollingScreenshot: **`Scrolling Screenshot`**: Capture a long scrolling screenshot. When true, disable `fullPage` and `freshScreenshot`.
    /// - Parameter scrollSpeed: Speed of scrolling during the screenshot.
    /// - Parameter scrollBack: If true, the scroll will reverse back to the top after reaching the bottom.
    /// - Parameter startImmediately: If true, the scrolling capture will start immediately upon page load.
    /// - Parameter multipleScrolling: If true, multiple scrolling screenshots will be taken at different viewport sizes.
    /// - Parameter sizes: Comma-separated list of viewport sizes in the format index:XXw:YYh. Example: sizes=0:120w:300h,1:240w:500h
    /// - Parameter duration: Duration in seconds for the scrolling capture. Acceptable range: 0 to 100 seconds.
    /// - Parameter captchaError: CSS selector of the message shown for a wrong answer. While it is visible, the solver tries again.
    /// - Parameter captchaImage: CSS selector of the captcha picture. Required when solve_captcha is true.
    /// - Parameter captchaInput: CSS selector of the box the answer is typed into. Required when solve_captcha is true.
    /// - Parameter captchaRefresh: CSS selector of the control that loads a new captcha picture before the next try.
    /// - Parameter captchaRetries: Number of guesses the solver makes, from 1 to 5.
    /// - Parameter captchaSubmit: CSS selector of the button to click after the answer is typed.
    /// - Parameter classicProxy: Loads the page through a datacenter proxy. Adds 20 credits per request. Ignored when premium_proxy is true or a custom proxy is set.
    /// - Parameter clickRecursion: Number of times to click the selector (when set via `selector_to_click`).
    /// - Parameter country: Two-letter country code, such as US or DE, for the exit address of classic_proxy or premium_proxy. Ignored when you send your own proxy. Any two-letter code is sent, including one that is not listed. Classic proxy countries: BG, GE, DE, HN, MD, UA, GB, US. Premium proxy countries: AF, AL, DZ, AO, AG, AR, AM, AW, AU, AT, AZ, BS, BH, BD, BB, BY, BE, BZ, BJ, BT, BO, BQ, BA, BW, BR, BN, BG, BF, BI, CV, KH, CM, CA, KY, CF, TD, CL, CN, CO, KM, CG, CR, CI, HR, CU, CW, CY, CZ, CD, DK, DJ, DM, DO, EC, EG, SV, GQ, EE, SZ, ET, FO, FJ, FI, FR, GF, PF, GA, GM, GE, DE, GH, GI, GR, GL, GD, GP, GU, GT, GG, GN, GW, GY, HT, HN, HK, HU, IS, IN, ID, IR, IQ, IE, IL, IT, JM, JP, JE, JO, KZ, KE, XK, KW, KG, LA, LV, LB, LS, LR, LY, LT, MO, MG, MW, MY, MV, ML, MT, MQ, MR, MU, YT, MX, MD, MN, ME, MA, MZ, MM, NA, NP, NL, NC, NZ, NI, NE, NG, MK, NO, OM, PK, PS, PA, PG, PY, PE, PH, PL, PT, PR, QA, RE, RO, RU, RW, KN, LC, VC, WS, SA, SN, RS, SC, SL, SG, SK, SI, SB, SO, ZA, KR, SS, ES, LK, SD, SR, SE, CH, SY, TW, TJ, TZ, TH, TL, TG, TO, TT, TN, TR, TM, UG, UA, AE, GB, US, UY, UZ, VE, VN, YE, ZM, ZW.
    /// - Parameter extractMarkdown: Extracts rendered page content as a structured .md (Markdown) file. Preserves headings, lists, links. Only with output=json.
    /// - Parameter format: Response format: json (default).
    /// - Parameter getImageUrls: Extracts all image URLs from the rendered DOM and returns them in structured format. Only with output=json.
    /// - Parameter gpu: Renders the page with a GPU, including WebGL and canvas content. Adds 20 credits per request.
    /// - Parameter markdown: Markdown to render instead of loading a URL. Works like custom_html, so you can capture a README or notes without hosting a page.
    /// - Parameter ocrModel: Recognition model used by the captcha solver: mini-ocr-v1 (default) or ocr-v1.
    /// - Parameter pdfOptionsFormat: Paper size of the PDF. Applies when file_type is PDF. Without it, width and height are used if set, otherwise the page renders as one long page: A0, A1, A2, A3, A4, A5, A6, Letter, Legal, Tabloid, or Ledger.
    /// - Parameter pdfOptionsLandscape: Renders the PDF in landscape orientation, swapping the width and height of the paper size. Applies when file_type is PDF.
    /// - Parameter pdfOptionsMedia: CSS media type used to render the PDF: print or screen.
    /// - Parameter pdfOptionsPageRange: Pages to keep in the PDF, as start-end, for example 1-3 or 5-5. Pages are rendered first and then trimmed. Has no effect on a single-page PDF. Applies when file_type is PDF.
    /// - Parameter pdfOptionsPrintBackground: Includes background colors and images in the PDF. Applies when file_type is PDF.
    /// - Parameter premiumProxy: Loads the page through a residential proxy. Adds 200 credits per request. Used instead of classic_proxy.
    /// - Parameter scrollDelay: Delay in milliseconds between scroll steps when `lazy_load` is enabled. Use higher values for heavy pages.
    /// - Parameter selectorToClick: CSS selector for an element to click before capturing the screenshot. Useful for opening dropdowns, modals, or triggering content.
    /// - Parameter solveCaptcha: Solves a captcha made of text drawn in a picture, then takes the screenshot. Requires captcha_image and captcha_input. Adds 20 credits per request.
    /// - Parameter stealth: Makes the browser look like a regular visitor for pages that block automated traffic. No extra credits.
    /// - Parameter timezone: IANA timezone the browser uses while rendering, such as Asia/Karachi or Europe/London. Useful for clocks and localized dates.
    /// - Parameter video: Records visible viewport only for a specified duration. Use with `duration` parameter. Ideal for dashboards and animations.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func screenshotCapture(apiKey: String, output: ScreenshotCaptureRequestOutput? = nil, fileType: ScreenshotCaptureRequestFileType? = nil, url: String, width: Int? = nil, height: Int? = nil, fullPage: Bool? = nil, fresh: Bool? = nil, noCookieBanners: Bool? = nil, enableCaching: Bool? = nil, blockAds: Bool? = nil, blockChatWidgets: Bool? = nil, extractText: Bool? = nil, extractHtml: Bool? = nil, destroyScreenshot: Bool? = nil, lazyLoad: Bool? = nil, retina: Bool? = nil, darkMode: Bool? = nil, blockTracking: Bool? = nil, enableIncognito: Bool? = nil, omitBackground: Bool? = nil, thumbnailWidth: Int? = nil, adjustTop: Int? = nil, waitForEvent: ScreenshotCaptureRequestWaitForEvent? = nil, grayscale: Int? = nil, delay: Int? = nil, timeout: Int? = nil, ttl: Int? = nil, clipX: Int? = nil, clipY: Int? = nil, clipWidth: Int? = nil, clipHeight: Int? = nil, cssUrl: String? = nil, css: String? = nil, jsUrl: String? = nil, js: String? = nil, blockJs: Bool? = nil, blockStylesheets: Bool? = nil, blockImages: Bool? = nil, blockMedia: Bool? = nil, blockFont: Bool? = nil, blockTextTrack: Bool? = nil, blockXhr: Bool? = nil, blockFetch: Bool? = nil, blockEventSource: Bool? = nil, blockWebSocket: Bool? = nil, blockManifest: Bool? = nil, blockSpecificRequests: String? = nil, blurSelector: String? = nil, removeSelector: String? = nil, resultFileName: String? = nil, scrollingScreenshot: Bool? = nil, scrollSpeed: ScreenshotCaptureRequestScrollSpeed? = nil, scrollBack: Bool? = nil, startImmediately: Bool? = nil, multipleScrolling: Bool? = nil, sizes: [String]? = nil, duration: Double? = nil, failOnError: Bool? = nil, longitude: Double? = nil, latitude: Double? = nil, proxy: String? = nil, headers: String? = nil, cookies: String? = nil, scrollToElement: String? = nil, selector: String? = nil, userAgent: String? = nil, acceptLanguages: String? = nil, customHtml: String? = nil, imageQuality: Double? = nil, captchaError: String? = nil, captchaImage: String? = nil, captchaInput: String? = nil, captchaRefresh: String? = nil, captchaRetries: Int? = nil, captchaSubmit: String? = nil, classicProxy: Bool? = nil, clickRecursion: Int? = nil, country: String? = nil, extractMarkdown: Bool? = nil, format: ScreenshotCaptureRequestFormat? = nil, getImageUrls: Bool? = nil, gpu: Bool? = nil, markdown: String? = nil, ocrModel: ScreenshotCaptureRequestOcrModel? = nil, pdfOptionsFormat: ScreenshotCaptureRequestPdfOptionsFormat? = nil, pdfOptionsLandscape: Bool? = nil, pdfOptionsMedia: ScreenshotCaptureRequestPdfOptionsMedia? = nil, pdfOptionsPageRange: String? = nil, pdfOptionsPrintBackground: Bool? = nil, premiumProxy: Bool? = nil, scrollDelay: Int? = nil, selectorToClick: String? = nil, solveCaptcha: Bool? = nil, stealth: Bool? = nil, timezone: String? = nil, video: Bool? = nil, requestOptions: RequestOptions? = nil) async throws -> ScreenshotCaptureResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/screenshot",
            queryParams: [
                "apiKey": .string(apiKey), 
                "output": output.map { .string($0.rawValue) }, 
                "file_type": fileType.map { .string($0.rawValue) }, 
                "url": .string(url), 
                "width": width.map { .int($0) }, 
                "height": height.map { .int($0) }, 
                "full_page": fullPage.map { .bool($0) }, 
                "fresh": fresh.map { .bool($0) }, 
                "no_cookie_banners": noCookieBanners.map { .bool($0) }, 
                "enable_caching": enableCaching.map { .bool($0) }, 
                "block_ads": blockAds.map { .bool($0) }, 
                "block_chat_widgets": blockChatWidgets.map { .bool($0) }, 
                "extract_text": extractText.map { .bool($0) }, 
                "extract_html": extractHtml.map { .bool($0) }, 
                "destroy_screenshot": destroyScreenshot.map { .bool($0) }, 
                "lazy_load": lazyLoad.map { .bool($0) }, 
                "retina": retina.map { .bool($0) }, 
                "dark_mode": darkMode.map { .bool($0) }, 
                "block_tracking": blockTracking.map { .bool($0) }, 
                "enable_incognito": enableIncognito.map { .bool($0) }, 
                "omit_background": omitBackground.map { .bool($0) }, 
                "thumbnail_width": thumbnailWidth.map { .int($0) }, 
                "adjust_top": adjustTop.map { .int($0) }, 
                "wait_for_event": waitForEvent.map { .string($0.rawValue) }, 
                "grayscale": grayscale.map { .int($0) }, 
                "delay": delay.map { .int($0) }, 
                "timeout": timeout.map { .int($0) }, 
                "ttl": ttl.map { .int($0) }, 
                "clip[x]": clipX.map { .int($0) }, 
                "clip[y]": clipY.map { .int($0) }, 
                "clip[width]": clipWidth.map { .int($0) }, 
                "clip[height]": clipHeight.map { .int($0) }, 
                "css_url": cssUrl.map { .string($0) }, 
                "css": css.map { .string($0) }, 
                "js_url": jsUrl.map { .string($0) }, 
                "js": js.map { .string($0) }, 
                "block_js": blockJs.map { .bool($0) }, 
                "block_stylesheets": blockStylesheets.map { .bool($0) }, 
                "block_images": blockImages.map { .bool($0) }, 
                "block_media": blockMedia.map { .bool($0) }, 
                "block_font": blockFont.map { .bool($0) }, 
                "block_text_track": blockTextTrack.map { .bool($0) }, 
                "block_xhr": blockXhr.map { .bool($0) }, 
                "block_fetch": blockFetch.map { .bool($0) }, 
                "block_event_source": blockEventSource.map { .bool($0) }, 
                "block_web_socket": blockWebSocket.map { .bool($0) }, 
                "block_manifest": blockManifest.map { .bool($0) }, 
                "block_specific_requests": blockSpecificRequests.map { .string($0) }, 
                "blur_selector": blurSelector.map { .string($0) }, 
                "remove_selector": removeSelector.map { .string($0) }, 
                "result_file_name": resultFileName.map { .string($0) }, 
                "scrolling_screenshot": scrollingScreenshot.map { .bool($0) }, 
                "scroll_speed": scrollSpeed.map { .string($0.rawValue) }, 
                "scroll_back": scrollBack.map { .bool($0) }, 
                "start_immediately": startImmediately.map { .bool($0) }, 
                "multiple_scrolling": multipleScrolling.map { .bool($0) }, 
                "sizes": sizes.map { .stringArray($0) }, 
                "duration": duration.map { .double($0) }, 
                "fail_on_error": failOnError.map { .bool($0) }, 
                "longitude": longitude.map { .double($0) }, 
                "latitude": latitude.map { .double($0) }, 
                "proxy": proxy.map { .string($0) }, 
                "headers": headers.map { .string($0) }, 
                "cookies": cookies.map { .string($0) }, 
                "scroll_to_element": scrollToElement.map { .string($0) }, 
                "selector": selector.map { .string($0) }, 
                "user_agent": userAgent.map { .string($0) }, 
                "accept_languages": acceptLanguages.map { .string($0) }, 
                "custom_html": customHtml.map { .string($0) }, 
                "image_quality": imageQuality.map { .double($0) }, 
                "captcha_error": captchaError.map { .string($0) }, 
                "captcha_image": captchaImage.map { .string($0) }, 
                "captcha_input": captchaInput.map { .string($0) }, 
                "captcha_refresh": captchaRefresh.map { .string($0) }, 
                "captcha_retries": captchaRetries.map { .int($0) }, 
                "captcha_submit": captchaSubmit.map { .string($0) }, 
                "classic_proxy": classicProxy.map { .bool($0) }, 
                "click_recursion": clickRecursion.map { .int($0) }, 
                "country": country.map { .string($0) }, 
                "extract_markdown": extractMarkdown.map { .bool($0) }, 
                "format": format.map { .string($0.rawValue) }, 
                "get_image_urls": getImageUrls.map { .bool($0) }, 
                "gpu": gpu.map { .bool($0) }, 
                "markdown": markdown.map { .string($0) }, 
                "ocr_model": ocrModel.map { .string($0.rawValue) }, 
                "pdf_options[format]": pdfOptionsFormat.map { .string($0.rawValue) }, 
                "pdf_options[landscape]": pdfOptionsLandscape.map { .bool($0) }, 
                "pdf_options[media]": pdfOptionsMedia.map { .string($0.rawValue) }, 
                "pdf_options[page_range]": pdfOptionsPageRange.map { .string($0) }, 
                "pdf_options[print_background]": pdfOptionsPrintBackground.map { .bool($0) }, 
                "premium_proxy": premiumProxy.map { .bool($0) }, 
                "scroll_delay": scrollDelay.map { .int($0) }, 
                "selector_to_click": selectorToClick.map { .string($0) }, 
                "solve_captcha": solveCaptcha.map { .bool($0) }, 
                "stealth": stealth.map { .bool($0) }, 
                "timezone": timezone.map { .string($0) }, 
                "video": video.map { .bool($0) }
            ],
            requestOptions: requestOptions,
            responseType: ScreenshotCaptureResponse.self
        )
    }

    /// Our Bulk Screenshot API allows you to capture screenshots of multiple webpages simultaneously, saving you time and effort. Instead of manually capturing each page one by one, you can batch process URLs and receive high-quality screenshots in the format you choose.
    ///  Maximum `50 URLs` per request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkScreenshotCapture(
    ///         apiKey: "apiKey",
    ///         request: .init(urls: [
    ///             BulkScreenshotCaptureRequestUrlsItem(
    ///                 url: "url"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkScreenshotCapture(apiKey: String, format: BulkScreenshotCaptureRequestFormat? = nil, request: Requests.BulkScreenshotCaptureRequest, requestOptions: RequestOptions? = nil) async throws -> BulkScreenshotCaptureResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/screenshot",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkScreenshotCaptureResponse.self
        )
    }

    /// Get live forex rates for all world currencies with customizable update frequency
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencyLatestRates(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter base: Base currency for rate calculations
    /// - Parameter symbols: Comma separated list of desired currency codes
    /// - Parameter updates: Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyLatestRates(apiKey: String, format: CurrencyLatestRatesRequestFormat? = nil, base: String? = nil, symbols: [String]? = nil, updates: CurrencyLatestRatesRequestUpdates? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyLatestRatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/rates/latest",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "base": base.map { .string($0) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "updates": updates.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyLatestRatesResponse.self
        )
    }

    /// Get historical exchange rates for any specific date
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencyHistoricalRates(
    ///         apiKey: "apiKey",
    ///         date: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter base: Base currency for rate calculations
    /// - Parameter symbols: Comma separated list of desired currency codes
    /// - Parameter date: Specific date in YYYY-MM-DD format
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyHistoricalRates(apiKey: String, format: CurrencyHistoricalRatesRequestFormat? = nil, base: String? = nil, symbols: [String]? = nil, date: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CurrencyHistoricalRatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/rates/historical",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "base": base.map { .string($0) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "date": .calendarDate(date)
            ],
            requestOptions: requestOptions,
            responseType: CurrencyHistoricalRatesResponse.self
        )
    }

    /// Convert amount between currencies using the latest exchange rates
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencyConvertLatest(
    ///         apiKey: "apiKey",
    ///         from: "from",
    ///         to: "to"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter from: Source currency code
    /// - Parameter to: Target currency code
    /// - Parameter amount: Amount to convert
    /// - Parameter updates: Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyConvertLatest(apiKey: String, format: CurrencyConvertLatestRequestFormat? = nil, from: String, to: String, amount: Double? = nil, updates: CurrencyConvertLatestRequestUpdates? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyConvertLatestResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/converter/latest/prices",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "from": .string(from), 
                "to": .string(to), 
                "amount": amount.map { .double($0) }, 
                "updates": updates.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyConvertLatestResponse.self
        )
    }

    /// Convert amount between currencies using historical rates
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencyConvertHistorical(
    ///         apiKey: "apiKey",
    ///         from: "from",
    ///         to: "to",
    ///         date: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter from: From currency symbol
    /// - Parameter to: To currency symbol
    /// - Parameter amount: The Amount to be converted
    /// - Parameter date: specific date (format YYYY-MM-DD) of which exchange rates is used.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyConvertHistorical(apiKey: String, format: CurrencyConvertHistoricalRequestFormat? = nil, from: String, to: String, amount: Double? = nil, date: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CurrencyConvertHistoricalResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/converter/historical/prices",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "from": .string(from), 
                "to": .string(to), 
                "amount": amount.map { .double($0) }, 
                "date": .calendarDate(date)
            ],
            requestOptions: requestOptions,
            responseType: CurrencyConvertHistoricalResponse.self
        )
    }

    /// Get exchange rates for a time range
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencyTimeSeries(
    ///         apiKey: "apiKey",
    ///         startDate: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter startDate: Start date (format YYYY-MM-DD) of the preferred time frame
    /// - Parameter endDate: End date (format YYYY-MM-DD) of the preferred time frame
    /// - Parameter base: Base currency
    /// - Parameter symbols: comma separated list of desired currencies/ commodities symbols
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyTimeSeries(apiKey: String, format: CurrencyTimeSeriesRequestFormat? = nil, startDate: CalendarDate, endDate: CalendarDate? = nil, base: String? = nil, symbols: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyTimeSeriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/time-series",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": endDate.map { .calendarDate($0) }, 
                "base": base.map { .string($0) }, 
                "symbols": symbols.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyTimeSeriesResponse.self
        )
    }

    /// Get currency fluctuation data for a time period
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencyFluctuation(
    ///         apiKey: "apiKey",
    ///         startDate: CalendarDate("2023-01-15")!,
    ///         base: "USD"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter startDate: Start date (format YYYY-MM-DD) of the preferred time frame
    /// - Parameter endDate: End date (format YYYY-MM-DD) of the preferred time frame
    /// - Parameter base: Base currency
    /// - Parameter symbols: comma separated list of desired currencies/ commodities symbols
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyFluctuation(apiKey: String, format: CurrencyFluctuationRequestFormat? = nil, startDate: CalendarDate, endDate: CalendarDate? = nil, base: String? = nil, symbols: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyFluctuationResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/fluctuation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": endDate.map { .calendarDate($0) }, 
                "base": base.map { .string($0) }, 
                "symbols": symbols.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyFluctuationResponse.self
        )
    }

    /// Convert amount using user's location
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencyConvertByIp(
    ///         apiKey: "apiKey",
    ///         from: "from"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter updates: Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    /// - Parameter from: From currency symbol
    /// - Parameter ip: IPv4 or IPv6 geolocated currency
    /// - Parameter amount: Amount to convert
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyConvertByIp(apiKey: String, format: CurrencyConvertByIpRequestFormat? = nil, updates: CurrencyConvertByIpRequestUpdates? = nil, from: String, ip: String? = nil, amount: Double? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyConvertByIpResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/converter/ip-to-currency",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "updates": updates.map { .string($0.rawValue) }, 
                "from": .string(from), 
                "ip": ip.map { .string($0) }, 
                "amount": amount.map { .double($0) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyConvertByIpResponse.self
        )
    }

    /// Get list of all supported currencies with their metadata
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencySupported(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencySupported(apiKey: String, format: CurrencySupportedRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencySupportedResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/supported",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencySupportedResponse.self
        )
    }

    /// Get currency symbols and codes
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencySymbols(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencySymbols(apiKey: String, format: CurrencySymbolsRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencySymbolsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/symbols",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencySymbolsResponse.self
        )
    }

    /// Get information about historical data availability and limits
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currencyHistoricalLimits(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currencyHistoricalLimits(apiKey: String, format: CurrencyHistoricalLimitsRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrencyHistoricalLimitsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/currency/historical/data/limits",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CurrencyHistoricalLimitsResponse.self
        )
    }

    /// Get live commodity rates with customizable update frequency
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityLatestRates(
    ///         apiKey: "apiKey",
    ///         symbols: [
    ///             "symbols"
    ///         ],
    ///         updates: .tenM
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the Response
    /// - Parameter symbols: Comma separated list of desired commodities symbols *(e.g. XAU,XAG,WTI,BRENT)* **Required**
    /// - Parameter updates: Exchange rates update period. Possible values are: (1) `10m` - 10 minute update (2) `1m` - 1 minute update **Required**
    /// - Parameter quote: Specifies the target currency for the exchange rate; default quote currency is the market currency of commodity *(e.g. USD, EUR, INR)*
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityLatestRates(apiKey: String, format: CommodityLatestRatesRequestFormat? = nil, symbols: [String]? = nil, updates: CommodityLatestRatesRequestUpdates, quote: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CommodityLatestRatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/rates/latest",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "updates": .string(updates.rawValue), 
                "quote": quote.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CommodityLatestRatesResponse.self
        )
    }

    /// Get historical commodity rates for a specific date
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityHistoricalRates(
    ///         apiKey: "apiKey",
    ///         date: CalendarDate("2023-01-15")!,
    ///         symbols: [
    ///             "symbols"
    ///         ]
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter date: Historical date (YYYY-MM-DD)
    /// - Parameter symbols: Comma-separated list of commodity symbols
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityHistoricalRates(apiKey: String, format: CommodityHistoricalRatesRequestFormat? = nil, date: CalendarDate, symbols: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> CommodityHistoricalRatesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/rates/historical",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "date": .calendarDate(date), 
                "symbols": symbols.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: CommodityHistoricalRatesResponse.self
        )
    }

    /// Get commodity price fluctuation data for a time period
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityFluctuation(
    ///         apiKey: "apiKey",
    ///         symbols: [
    ///             "symbols"
    ///         ],
    ///         startDate: CalendarDate("2023-01-15")!,
    ///         endDate: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter symbols: Comma-separated list of commodity symbols
    /// - Parameter startDate: Start date (YYYY-MM-DD)
    /// - Parameter endDate: End date (YYYY-MM-DD)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityFluctuation(apiKey: String, format: CommodityFluctuationRequestFormat? = nil, symbols: [String]? = nil, startDate: CalendarDate, endDate: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CommodityFluctuationResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/fluctuation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate)
            ],
            requestOptions: requestOptions,
            responseType: CommodityFluctuationResponse.self
        )
    }

    /// Get commodity rates for a time range
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commodityTimeSeries(
    ///         apiKey: "apiKey",
    ///         symbols: [
    ///             "symbols"
    ///         ],
    ///         startDate: CalendarDate("2023-01-15")!,
    ///         endDate: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter symbols: Comma-separated list of commodity symbols
    /// - Parameter startDate: Start date (YYYY-MM-DD)
    /// - Parameter endDate: End date (YYYY-MM-DD)
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commodityTimeSeries(apiKey: String, format: CommodityTimeSeriesRequestFormat? = nil, symbols: [String]? = nil, startDate: CalendarDate, endDate: CalendarDate, requestOptions: RequestOptions? = nil) async throws -> CommodityTimeSeriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/time-series",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "symbols": symbols.map { .stringArray($0) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate)
            ],
            requestOptions: requestOptions,
            responseType: CommodityTimeSeriesResponse.self
        )
    }

    /// Get list of supported commodities
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.commoditySymbols(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func commoditySymbols(apiKey: String, format: CommoditySymbolsRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> CommoditySymbolsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/commodity/symbols",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: CommoditySymbolsResponse.self
        )
    }

    /// Retrieves a list of supported countries.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.vatSupportedCountries(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response. Default is JSON.
    /// - Parameter type: Which list to return: VAT (`VAT_Supported_Countries_And_States`), IBAN (`IBAN_Supported_Countries`) or SWIFT (`SWIFT_Supported_Countries`). Each value returns only its own list. If omitted (or unknown), all three lists are returned.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vatSupportedCountries(apiKey: String, format: VatSupportedCountriesRequestFormat? = nil, type: VatSupportedCountriesRequestType? = nil, requestOptions: RequestOptions? = nil) async throws -> VatSupportedCountriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/vat/supported-countries",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "type": type.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: VatSupportedCountriesResponse.self
        )
    }

    /// Fetches VAT rate based on the specified or originating IP address.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.vatRateByIp(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter ipAddress: IPv4 or IPv6 address to look up VAT rate for. If omitted, the originating IP address will be used.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vatRateByIp(apiKey: String, format: VatRateByIpRequestFormat? = nil, ipAddress: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [VatRateByIpResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/vat/rates/ip-address",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ipAddress": ipAddress.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [VatRateByIpResponseItem].self
        )
    }

    /// Fetches VAT rates for a single country or state provided via query parameters.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.vatRateByCountry(
    ///         apiKey: "apiKey",
    ///         country: "country"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter country: Country identifier in Alpha-2 (PK), Alpha-3 (PAK), or full name (Pakistan). Combine with the optional "state" query for sub-national VAT; values are case-insensitive and may use underscores instead of spaces.
    /// - Parameter state: Optional state or region in Alpha-2 (NY) or full name (New_York). Use with "country" for state-level VAT; values are case-insensitive and may use underscores.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vatRateByCountry(apiKey: String, format: VatRateByCountryRequestFormat? = nil, country: String, state: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [VatRateByCountryResponseItem] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/vat/rates/country",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "state": state.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [VatRateByCountryResponseItem].self
        )
    }

    /// Retrieves VAT details for multiple countries or country-state combinations in a single request. Maximum of `100` entries per request are allowed.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkVatRateByCountry(
    ///         apiKey: "apiKey",
    ///         request: .init(countries: [
    ///             BulkVatRateByCountryRequestCountriesItem(
    ///                 country: "PAK"
    ///             ),
    ///             BulkVatRateByCountryRequestCountriesItem(
    ///                 country: "United_States",
    ///                 state: "New_York"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkVatRateByCountry(apiKey: String, format: BulkVatRateByCountryRequestFormat? = nil, request: Requests.BulkVatRateByCountryRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkVatRateByCountryResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/vat/rates/country",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkVatRateByCountryResponseItem].self
        )
    }

    /// Validates an EU or UK VAT number and returns registration status details.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.vatValidate(
    ///         apiKey: "apiKey",
    ///         vatNumber: "vatNumber"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter vatNumber: EU or UK VAT number to validate.
    /// - Parameter requesterVatNumber: Requester EU or UK VAT number.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func vatValidate(apiKey: String, format: VatValidateRequestFormat? = nil, vatNumber: String, requesterVatNumber: String? = nil, requestOptions: RequestOptions? = nil) async throws -> VatValidateResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/vat/validation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "vatNumber": .string(vatNumber), 
                "requesterVatNumber": requesterVatNumber.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: VatValidateResponse.self
        )
    }

    /// Checks an IBAN for structural validity, checksum accuracy, and bank metadata.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.ibanValidate(
    ///         apiKey: "apiKey",
    ///         iban: "iban"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter iban: IBAN to validate.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func ibanValidate(apiKey: String, format: IbanValidateRequestFormat? = nil, iban: String, requestOptions: RequestOptions? = nil) async throws -> IbanValidateResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/iban/validation",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "iban": .string(iban)
            ],
            requestOptions: requestOptions,
            responseType: IbanValidateResponse.self
        )
    }

    /// Fetches SWIFT codes for a given country, bank, and city.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.swiftCodeFind(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter country: Country name (accepts full name, e.g., Pakistan, United States). If only the country parameter is supplied, lists all banks in the country.
    /// - Parameter bank: Bank name (upper case) used to filter SWIFT codes. Should be used together with the country parameter. If only country and bank are provided (without city), returns the list of cities for that bank.
    /// - Parameter city: Gives SWIFT codes for a bank. Optionally specify the city (upper case) to narrow results to a specific city for that bank.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func swiftCodeFind(apiKey: String, format: SwiftCodeFindRequestFormat? = nil, country: String? = nil, bank: String? = nil, city: String? = nil, requestOptions: RequestOptions? = nil) async throws -> [String] {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/swift-code/finder",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": country.map { .string($0) }, 
                "bank": bank.map { .string($0) }, 
                "city": city.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: [String].self
        )
    }

    /// Fetches detailed information about a SWIFT code.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.swiftCodeLookup(
    ///         apiKey: "apiKey",
    ///         swiftCode: "swiftCode"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Specify the desired response format. Options: 'json' (default) or 'xml'.
    /// - Parameter swiftCode: SWIFT/BIC code to lookup (must be 8 or 11 characters).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func swiftCodeLookup(apiKey: String, format: SwiftCodeLookupRequestFormat? = nil, swiftCode: String, requestOptions: RequestOptions? = nil) async throws -> SwiftCodeLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/swift-code/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "swiftCode": .string(swiftCode)
            ],
            requestOptions: requestOptions,
            responseType: SwiftCodeLookupResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.zipcodeLookup(
    ///         apiKey: "apiKey",
    ///         code: "code"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter code: Comma separated list of postal / zip codes. Max. 100 values.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format. If not provided, search results will be returned from all countries.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func zipcodeLookup(apiKey: String, format: ZipcodeLookupRequestFormat? = nil, code: String, country: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ZipcodeLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/zipcode/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "code": .string(code), 
                "country": country.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ZipcodeLookupResponse.self
        )
    }

    /// Validates a bulk of ZIP/postal codes and returns result for each. Maximum `100` ZIP/postal codes per request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkZipcodeLookup(
    ///         apiKey: "apiKey",
    ///         request: .init(codes: [
    ///             "codes"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkZipcodeLookup(apiKey: String, format: BulkZipcodeLookupRequestFormat? = nil, request: Requests.BulkZipcodeLookupRequest, requestOptions: RequestOptions? = nil) async throws -> BulkZipcodeLookupResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/zipcode/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkZipcodeLookupResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.zipcodeSearchByCity(
    ///         apiKey: "apiKey",
    ///         city: "city",
    ///         country: "country"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter city: Name of the city in which we want to find zipcodes in.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter stateName: Name of the state or province associated with the country.
    /// - Parameter page: Page number to retrieve paginated results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func zipcodeSearchByCity(apiKey: String, format: ZipcodeSearchByCityRequestFormat? = nil, city: String, country: String, stateName: String? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ZipcodeSearchByCityResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/zipcode/search/city",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "city": .string(city), 
                "country": .string(country), 
                "state_name": stateName.map { .string($0) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ZipcodeSearchByCityResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.zipcodeSearchByRegion(
    ///         apiKey: "apiKey",
    ///         country: "country"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter region: Name of the region, state or province associated with the country. Either region or region_code is required; region_code takes priority if both are given.
    /// - Parameter page: Page no. to retrieve paginated results.
    /// - Parameter regionCode: ISO code of the region, state, or province associated with the country. Either region or region_code is required. region_code takes priority if both are given.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func zipcodeSearchByRegion(apiKey: String, format: ZipcodeSearchByRegionRequestFormat? = nil, country: String, region: String? = nil, page: Int? = nil, regionCode: String? = nil, requestOptions: RequestOptions? = nil) async throws -> ZipcodeSearchByRegionResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/zipcode/search/region",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "region": region.map { .string($0) }, 
                "page": page.map { .int($0) }, 
                "region_code": regionCode.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: ZipcodeSearchByRegionResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.zipcodeSearchByRadius(
    ///         apiKey: "apiKey",
    ///         radius: 1.1
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter code: Postal/Zip code to be used as the center point for the search.
    /// - Parameter lat: Latitude coordinate for the base location.
    /// - Parameter long: Longitude coordinate for the base location.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format. Required only when using the code parameter.
    /// - Parameter radius: Search radius for the query. The maximum allowed values are: - 100 km - 100 mi - 109361 yd - 100000 m - 328084 ft - 3937007.75 in
    /// - Parameter unit: Supported distance units are m, km, mi, ft, yd, in.
    /// - Parameter page: Page no. to retrieve paginated results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func zipcodeSearchByRadius(apiKey: String, format: ZipcodeSearchByRadiusRequestFormat? = nil, code: String? = nil, lat: Float? = nil, long: Float? = nil, country: String? = nil, radius: Float, unit: ZipcodeSearchByRadiusRequestUnit? = nil, page: Int? = nil, requestOptions: RequestOptions? = nil) async throws -> ZipcodeSearchByRadiusResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/zipcode/search/radius",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "code": code.map { .string($0) }, 
                "lat": lat.map { .float($0) }, 
                "long": long.map { .float($0) }, 
                "country": country.map { .string($0) }, 
                "radius": .float(radius), 
                "unit": unit.map { .string($0.rawValue) }, 
                "page": page.map { .int($0) }
            ],
            requestOptions: requestOptions,
            responseType: ZipcodeSearchByRadiusResponse.self
        )
    }

    /// Get distance between postal codes. Maximum `100` postal codes per request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.zipcodeDistance(
    ///         apiKey: "apiKey",
    ///         request: .init(
    ///             compare: [
    ///                 "compare"
    ///             ],
    ///             country: "country"
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func zipcodeDistance(apiKey: String, format: ZipcodeDistanceRequestFormat? = nil, request: Requests.ZipcodeDistanceRequest, requestOptions: RequestOptions? = nil) async throws -> ZipcodeDistanceResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/zipcode/distance",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ZipcodeDistanceResponse.self
        )
    }

    /// Get matching ZIP/postal code pairs within a specified distance. Maximum `100` postal codes per request.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.zipcodeDistanceMatch(
    ///         apiKey: "apiKey",
    ///         request: .init(
    ///             codes: [
    ///                 "codes"
    ///             ],
    ///             country: "country"
    ///         )
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func zipcodeDistanceMatch(apiKey: String, format: ZipcodeDistanceMatchRequestFormat? = nil, request: Requests.ZipcodeDistanceMatchRequest, requestOptions: RequestOptions? = nil) async throws -> ZipcodeDistanceMatchResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/zipcode/distance/match",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ZipcodeDistanceMatchResponse.self
        )
    }

    /// Get current weather data including temperature, humidity, precipitation, wind conditions, atmospheric pressure, and air quality for any location. Accepts city names, coordinates, or IP addresses. Also includes astronomy data and timezone-aware timestamps.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.currentWeather(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API. Only JSON is supported.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func currentWeather(apiKey: String, format: CurrentWeatherRequestFormat? = nil, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> CurrentWeatherResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/current",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: CurrentWeatherResponse.self
        )
    }

    /// Retrieve current weather conditions for up to `50 locations` in a single request. A maximum of 50 locations (city names, IP addresses, or geographic coordinates) can be included in the request body.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkCurrentWeather(
    ///         apiKey: "apiKey",
    ///         request: .init(locations: [
    ///             BulkCurrentWeatherRequestLocationsItem(
    ///                 location: "lahore"
    ///             ),
    ///             BulkCurrentWeatherRequestLocationsItem(
    ///                 lat: 32.5,
    ///                 long: 74.5
    ///             ),
    ///             BulkCurrentWeatherRequestLocationsItem(
    ///                 ip: "8.8.8.8"
    ///             ),
    ///             BulkCurrentWeatherRequestLocationsItem(
    ///                 location: "seoul"
    ///             )
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API. Only JSON is supported.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkCurrentWeather(apiKey: String, format: BulkCurrentWeatherRequestFormat? = nil, timezone: String? = nil, request: Requests.BulkCurrentWeatherRequest, requestOptions: RequestOptions? = nil) async throws -> BulkCurrentWeatherResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/weather/current",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: BulkCurrentWeatherResponse.self
        )
    }

    /// Access comprehensive weather forecasts with customizable precision - choose from daily overviews, hourly breakdowns, or even minute-by-minute data. Configure your date ranges or use the default 7-day forecast for standard weather planning.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.weatherForecast(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API. Only JSON is supported.
    /// - Parameter startDate: Start date for the forecast in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between startDate and endDate must not exceed 16 days.
    /// - Parameter endDate: End date for the forecast in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between startDate and endDate must not exceed 16 days.
    /// - Parameter forecastDays: Number of days for the forecast, from 1 to 16. Default is 7. Maximum value is 16.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Precision of the forecast data.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func weatherForecast(apiKey: String, format: WeatherForecastRequestFormat? = nil, startDate: CalendarDate? = nil, endDate: CalendarDate? = nil, forecastDays: Int? = nil, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: WeatherForecastRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> WeatherForecastResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/forecast",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": startDate.map { .calendarDate($0) }, 
                "endDate": endDate.map { .calendarDate($0) }, 
                "forecastDays": forecastDays.map { .int($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: WeatherForecastResponse.self
        )
    }

    /// Access past weather conditions for specific dates with records going back to 1940. Retrieve comprehensive historical data with both daily and hourly precision options.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.historicalWeather(
    ///         apiKey: "apiKey",
    ///         date: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API. Only JSON is supported.
    /// - Parameter date: Specific date for which to fetch weather data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Precision of the historical data. **Note:** 'daily' returns daily aggregates, 'hourly' returns hourly data.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func historicalWeather(apiKey: String, format: HistoricalWeatherRequestFormat? = nil, date: CalendarDate, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: HistoricalWeatherRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> HistoricalWeatherResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/historical",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "date": .calendarDate(date), 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: HistoricalWeatherResponse.self
        )
    }

    /// Pull historical weather information for date ranges up to 90 days (daily data) or 7 days (hourly data). Get consistent formatting across your specified date range with reliable historical weather patterns.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.weatherTimeSeries(
    ///         apiKey: "apiKey",
    ///         startDate: CalendarDate("2023-01-15")!,
    ///         endDate: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API. Only JSON is supported.
    /// - Parameter startDate: Starting date for the data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards. For precision=daily, the difference between endDate and startDate must not exceed 90 days. For precision=hourly, the difference must not exceed 7 days.
    /// - Parameter endDate: End date for the data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards. For precision=daily, the difference between endDate and startDate must not exceed 90 days. For precision=hourly, the difference must not exceed 7 days.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Precision of the data.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func weatherTimeSeries(apiKey: String, format: WeatherTimeSeriesRequestFormat? = nil, startDate: CalendarDate, endDate: CalendarDate, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: WeatherTimeSeriesRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> WeatherTimeSeriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/time-series",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate), 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: WeatherTimeSeriesResponse.self
        )
    }

    /// Provides hourly forecasts of marine conditions including wave heights, wave directions, wave periods, swell info, sea surface temperatures, and ocean currents. Supports multiple geographical points and returns daily max wave statistics for up to 7 days. Ideal for maritime planning, navigation, and coastal activities.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.marineWeather(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API. Only JSON is supported.
    /// - Parameter startDate: Starting date for marine forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    /// - Parameter endDate: End date for marine forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Precision of the marine data.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func marineWeather(apiKey: String, format: MarineWeatherRequestFormat? = nil, startDate: CalendarDate? = nil, endDate: CalendarDate? = nil, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: MarineWeatherRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> MarineWeatherResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/marine",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": startDate.map { .calendarDate($0) }, 
                "endDate": endDate.map { .calendarDate($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: MarineWeatherResponse.self
        )
    }

    /// Monitor and predict air quality conditions using European and US AQI standards. Track pollutant concentrations including PM10, PM2.5, carbon monoxide, nitrogen dioxide, sulfur dioxide, ozone, and dust particles. Get current readings plus hourly forecasts up to 5 days ahead, complete with UV index and aerosol measurements for comprehensive air quality assessment.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.airQuality(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API. Only JSON is supported.
    /// - Parameter startDate: Starting date for AQI forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 5 days.
    /// - Parameter endDate: End date for AQI forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 5 days.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Only hourly precision is supported; returns hourly AQI data for the selected date range.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func airQuality(apiKey: String, format: AirQualityRequestFormat? = nil, startDate: CalendarDate? = nil, endDate: CalendarDate? = nil, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: AirQualityRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> AirQualityResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/air-quality",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": startDate.map { .calendarDate($0) }, 
                "endDate": endDate.map { .calendarDate($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: AirQualityResponse.self
        )
    }

    /// Provides flood forecast data for a given location, including river discharge metrics such as mean, median, maximum, minimum, and percentile values (p25, p75). Requires a startDate and endDate, with the date range limited to 16 days. Location can be specified using city name, latitude/longitude, or IP address.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.floodForecast(
    ///         apiKey: "apiKey",
    ///         startDate: CalendarDate("2023-01-15")!,
    ///         endDate: CalendarDate("2023-01-15")!
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Response format returned by the API. Only JSON is supported.
    /// - Parameter startDate: Starting date for flood forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    /// - Parameter endDate: End date for flood forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    /// - Parameter location: City name, place name, or full address.
    /// - Parameter lat: Latitude of the location.
    /// - Parameter long: Longitude of the location.
    /// - Parameter ip: IP(v4 or v6) address for location inference.
    /// - Parameter precision: Only daily precision is supported; returns flood forecast data for the selected date range.
    /// - Parameter timezone: Timezone for the results.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func floodForecast(apiKey: String, format: FloodForecastRequestFormat? = nil, startDate: CalendarDate, endDate: CalendarDate, location: String? = nil, lat: Double? = nil, long: Double? = nil, ip: String? = nil, precision: FloodForecastRequestPrecision? = nil, timezone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> FloodForecastResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/weather/flood",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "startDate": .calendarDate(startDate), 
                "endDate": .calendarDate(endDate), 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .double($0) }, 
                "long": long.map { .double($0) }, 
                "ip": ip.map { .string($0) }, 
                "precision": precision.map { .string($0.rawValue) }, 
                "timezone": timezone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: FloodForecastResponse.self
        )
    }

    /// Retrieve countries, optionally filtered by region or subregion.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getCountries(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter region: Optional filter to return countries within a specific region from the region endpoint.
    /// - Parameter subregion: Optional filter to return countries within a specific subregion from the subregion endpoint.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getCountries(apiKey: String, format: GetCountriesRequestFormat? = nil, region: String? = nil, subregion: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GetCountriesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/countries",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "region": region.map { .string($0) }, 
                "subregion": subregion.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetCountriesResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getCountryDetails(
    ///         apiKey: "apiKey",
    ///         country: "country"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getCountryDetails(apiKey: String, format: GetCountryDetailsRequestFormat? = nil, country: String, requestOptions: RequestOptions? = nil) async throws -> GetCountryDetailsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/country/details",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country)
            ],
            requestOptions: requestOptions,
            responseType: GetCountryDetailsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getRegions(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getRegions(apiKey: String, format: GetRegionsRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> GetRegionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/regions",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: GetRegionsResponse.self
        )
    }

    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getSubregions(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter region: Name of the region. If omitted, all subregions are returned.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getSubregions(apiKey: String, format: GetSubregionsRequestFormat? = nil, region: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GetSubregionsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/subregions",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "region": region.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetSubregionsResponse.self
        )
    }

    /// Retrieve administrative units based on ISO 3166-1 alpha-2 country code.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getAdminLevels(
    ///         apiKey: "apiKey",
    ///         country: "country"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getAdminLevels(apiKey: String, format: GetAdminLevelsRequestFormat? = nil, country: String, requestOptions: RequestOptions? = nil) async throws -> GetAdminLevelsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/admin-levels",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country)
            ],
            requestOptions: requestOptions,
            responseType: GetAdminLevelsResponse.self
        )
    }

    /// Retrieve administrative divisions for a given country using ISO 3166-1 alpha-2 country codes. You can optionally filter by administrative levels.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getAdminUnits(
    ///         apiKey: "apiKey",
    ///         country: "country"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter adminLevel: Filter results by one or more administrative level names (e.g. `land`, `state`, `province`), sent as a comma-separated list. Use the admin levels endpoint to list the levels a country has.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getAdminUnits(apiKey: String, format: GetAdminUnitsRequestFormat? = nil, country: String, adminLevel: [String]? = nil, requestOptions: RequestOptions? = nil) async throws -> GetAdminUnitsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/admin-units",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "admin_level": adminLevel.map { .stringArray($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetAdminUnitsResponse.self
        )
    }

    /// Retrieve detailed administrative unit information by country and optionally filtered by admin code.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getAdminUnitDetails(
    ///         apiKey: "apiKey",
    ///         country: "country",
    ///         adminUnit: "admin_unit"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter adminUnit: Optional admin code to fetch details for a specific administrative unit.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getAdminUnitDetails(apiKey: String, format: GetAdminUnitDetailsRequestFormat? = nil, country: String, adminUnit: String, requestOptions: RequestOptions? = nil) async throws -> GetAdminUnitDetailsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/admin-unit/details",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "admin_unit": .string(adminUnit)
            ],
            requestOptions: requestOptions,
            responseType: GetAdminUnitDetailsResponse.self
        )
    }

    /// Retrieve a list of cities within a country, optionally filtered by an administrative unit code.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getCities(
    ///         apiKey: "apiKey",
    ///         country: "country"
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter country: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter adminUnit: Administrative unit code used to filter cities within a specific region.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getCities(apiKey: String, format: GetCitiesRequestFormat? = nil, country: String, adminUnit: String? = nil, requestOptions: RequestOptions? = nil) async throws -> GetCitiesResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geo/cities",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "country": .string(country), 
                "admin_unit": adminUnit.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: GetCitiesResponse.self
        )
    }

    /// Get list of all supported flags with their metadata
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getSupportedFlags(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getSupportedFlags(apiKey: String, requestOptions: RequestOptions? = nil) async throws -> GetSupportedFlagsResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/flags/supported",
            queryParams: [
                "apiKey": .string(apiKey)
            ],
            requestOptions: requestOptions,
            responseType: GetSupportedFlagsResponse.self
        )
    }

    /// Retrieve the flag for a specific country
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getFlags(
    ///         apiKey: "apiKey",
    ///         name: "name",
    ///         shape: .flat,
    ///         type: .country
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter name: Country code in ISO 3166-1 alpha-2 format.
    /// - Parameter shape: Flag shape. One of: `'flat'` or `'round'`.
    /// - Parameter format: Flag format. Applicable only for PNG or WEBP formats. Default is png.
    /// - Parameter size: Flag size in pixels. Valid options: `16px`, `24px`, `32px`, `48px`, `64px`. Applicable only for PNG or WEBP formats.
    /// - Parameter type: Type of flag. One of: `country` or `organization`.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getFlags(apiKey: String, name: String, shape: GetFlagsRequestShape, format: GetFlagsRequestFormat? = nil, size: GetFlagsRequestSize? = nil, type: GetFlagsRequestType, requestOptions: RequestOptions? = nil) async throws -> Data {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/flags",
            queryParams: [
                "apiKey": .string(apiKey), 
                "name": .string(name), 
                "shape": .string(shape.rawValue), 
                "format": format.map { .string($0.rawValue) }, 
                "size": size.map { .string($0.rawValue) }, 
                "type": .string(type.rawValue)
            ],
            requestOptions: requestOptions,
            responseType: Data.self
        )
    }

    /// Retrieve current time, date, and timezone-related information by specifying a timezone name, location address, location coordinates, IP address, or use the client IP address if no parameter is passed.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.timezoneLookup(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter ip: IPv4 or IPv6 address to extract timezone information.
    /// - Parameter tz: Timezone name (e.g., "Asia/Kolkata") to retrieve information directly.
    /// - Parameter location: Location string (preferably city and country) to extract timezone.
    /// - Parameter lat: Latitude for geolocation lookup.
    /// - Parameter long: Longitude for geolocation lookup.
    /// - Parameter lang: Language code for response localization (default is "en").
    /// - Parameter iataCode: 3-letter IATA airport code (e.g., JFK).
    /// - Parameter icaoCode: 4-letter ICAO airport code (e.g., KJFK).
    /// - Parameter loCode: 5-letter UN/LO city code.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func timezoneLookup(apiKey: String, format: TimezoneLookupRequestFormat? = nil, ip: String? = nil, tz: String? = nil, location: String? = nil, lat: Float? = nil, long: Float? = nil, lang: TimezoneLookupRequestLang? = nil, iataCode: String? = nil, icaoCode: String? = nil, loCode: String? = nil, requestOptions: RequestOptions? = nil) async throws -> TimezoneLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geolocation/timezone",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "ip": ip.map { .string($0) }, 
                "tz": tz.map { .string($0) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .float($0) }, 
                "long": long.map { .float($0) }, 
                "lang": lang.map { .string($0.rawValue) }, 
                "iata_code": iataCode.map { .string($0) }, 
                "icao_code": icaoCode.map { .string($0) }, 
                "lo_code": loCode.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: TimezoneLookupResponse.self
        )
    }

    /// Converts a given time from one timezone to another using various input types like timezone name, coordinates, location, or codes.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.timezoneConvert(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response .
    /// - Parameter time: Time to convert in `yyyy-MM-dd HH:mm` or `yyyy-MM-dd HH:mm:ss` format.
    /// - Parameter tzFrom: Source timezone name (e.g., `Asia/Kolkata`).
    /// - Parameter tzTo: Target timezone name (e.g., `America/New_York`).
    /// - Parameter latFrom: Latitude of source location.
    /// - Parameter longFrom: Longitude of source location.
    /// - Parameter latTo: Latitude of target location.
    /// - Parameter longTo: Longitude of target location.
    /// - Parameter locationFrom: From location (city/country).
    /// - Parameter locationTo: To location (city/country).
    /// - Parameter iataFrom: From IATA airport code (e.g., JFK).
    /// - Parameter iataTo: To IATA airport code.
    /// - Parameter icaoFrom: From ICAO airport code (e.g., KJFK).
    /// - Parameter icaoTo: To ICAO airport code.
    /// - Parameter locodeFrom: From UN/LO CODE.
    /// - Parameter locodeTo: To UN/LO CODE.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func timezoneConvert(apiKey: String, format: TimezoneConvertRequestFormat? = nil, time: String? = nil, tzFrom: String? = nil, tzTo: String? = nil, latFrom: Double? = nil, longFrom: Double? = nil, latTo: Double? = nil, longTo: Double? = nil, locationFrom: String? = nil, locationTo: String? = nil, iataFrom: String? = nil, iataTo: String? = nil, icaoFrom: String? = nil, icaoTo: String? = nil, locodeFrom: String? = nil, locodeTo: String? = nil, requestOptions: RequestOptions? = nil) async throws -> TimezoneConvertResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/timezone/converter",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "time": time.map { .string($0) }, 
                "tz_from": tzFrom.map { .string($0) }, 
                "tz_to": tzTo.map { .string($0) }, 
                "lat_from": latFrom.map { .double($0) }, 
                "long_from": longFrom.map { .double($0) }, 
                "lat_to": latTo.map { .double($0) }, 
                "long_to": longTo.map { .double($0) }, 
                "location_from": locationFrom.map { .string($0) }, 
                "location_to": locationTo.map { .string($0) }, 
                "iata_from": iataFrom.map { .string($0) }, 
                "iata_to": iataTo.map { .string($0) }, 
                "icao_from": icaoFrom.map { .string($0) }, 
                "icao_to": icaoTo.map { .string($0) }, 
                "locode_from": locodeFrom.map { .string($0) }, 
                "locode_to": locodeTo.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: TimezoneConvertResponse.self
        )
    }

    /// Parse User Agent string to get detailed browser, device, and operating system information
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.userAgentLookup(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func userAgentLookup(apiKey: String, userAgent: String, format: UserAgentLookupRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> UserAgentLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/user-agent/lookup",
            headers: [
                "User-Agent": userAgent
            ],
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: UserAgentLookupResponse.self
        )
    }

    /// Parse up to `20000 User-Agent strings` at once in a single request; exceeding that returns a 413, not a 400.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.bulkUserAgentLookup(
    ///         apiKey: "apiKey",
    ///         request: .init(uaStrings: [
    ///             "uaStrings"
    ///         ])
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func bulkUserAgentLookup(apiKey: String, format: BulkUserAgentLookupRequestFormat? = nil, request: Requests.BulkUserAgentLookupRequest, requestOptions: RequestOptions? = nil) async throws -> [BulkUserAgentLookupResponseItem] {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/user-agent/lookup",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: [BulkUserAgentLookupResponseItem].self
        )
    }

    /// Perform Optical Character Recognition (OCR) on images, PDFs, or ZIP archives. Supports two models: `mini-ocr-v1` for CAPTCHA-optimized OCR and `ocr-v1` for general-purpose document text extraction. Supports zonal OCR to extract text from specific regions of an image.
    ///
    /// **Notes:**
    /// - The `zone` query parameter cannot be given with .pdf and .zip types as it can only be applied to single image query.
    /// - The `page_range` query parameter cannot be given in any other type except .pdf types.
    /// - PDFs containing images in them are allowed only for processing.
    /// - The `mini-ocr-v1` model doesn’t support the following query parameters:
    ///     - `page_range` (.pdf types)
    ///     - `zone`
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.ocrPredict(
    ///         apiKey: "apiKey",
    ///         model: .miniOcrV1,
    ///         request: .init(file: .init(data: Data("".utf8)))
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter model: OCR model to use. `mini-ocr-v1` for CAPTCHA OCR, `ocr-v1` for general OCR.
    /// - Parameter url: URL of the image or PDF (required if `file` is not uploaded).
    /// - Parameter pageRange: Specify page range for multi-page PDFs (e.g., '1,3,5-10' or 'allpages'). **Note:** This parameter can only be used with .pdf file types.
    /// - Parameter zone: Define OCR zones using coordinates (top:left:height:width). Multiple zones can be defined using commas. Only available for model 'ocr-v1'. **Note:** This parameter cannot be used with .pdf and .zip file types as it can only be applied to single image queries.
    /// - Parameter newLine: Set to 1 to split output text into individual lines (default: 0). This changes the shape of `OCRText` (see the response).
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func ocrPredict(apiKey: String, model: OcrPredictRequestModel, url: String? = nil, pageRange: String? = nil, zone: String? = nil, newLine: Int? = nil, request: Requests.OcrPredictRequest = .init(), requestOptions: RequestOptions? = nil) async throws -> OcrPredictResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/ocr/predict",
            contentType: .multipartFormData,
            queryParams: [
                "apiKey": .string(apiKey), 
                "model": .string(model.rawValue), 
                "url": url.map { .string($0) }, 
                "page_range": pageRange.map { .string($0) }, 
                "zone": zone.map { .string($0) }, 
                "new_line": newLine.map { .int($0) }
            ],
            body: request.asMultipartFormData(),
            requestOptions: requestOptions,
            responseType: OcrPredictResponse.self
        )
    }

    /// Analyze text for grammar errors and return the exact words flagged as grammatically incorrect with zero-based word positions.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.grammarDetect(
    ///         apiKey: "apiKey",
    ///         request: .init(text: "The global mental is health crisis is now a serious and compelex problem. It need quick and ongoing action from policymakers, healthcare workers, and the whole society.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func grammarDetect(apiKey: String, request: Requests.GrammarDetectRequest, requestOptions: RequestOptions? = nil) async throws -> GrammarDetectResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/readability/grammar/detect",
            queryParams: [
                "apiKey": .string(apiKey)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: GrammarDetectResponse.self
        )
    }

    /// Submit text with grammatical issues and receive a clean grammar-corrected result for proofreading and content workflows.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.grammarCorrect(
    ///         apiKey: "apiKey",
    ///         request: .init(text: "The global mental is health crisis is now a serious and compelex problem. It need quick and ongoing action from policymakers, healthcare workers, and the whole society.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func grammarCorrect(apiKey: String, request: Requests.GrammarCorrectRequest, requestOptions: RequestOptions? = nil) async throws -> GrammarCorrectResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/readability/grammar/correct",
            queryParams: [
                "apiKey": .string(apiKey)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: GrammarCorrectResponse.self
        )
    }

    /// Analyze text and return weak, vague, or filler words with zero-based word positions to help writers produce clearer and more concise content.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.weakWordsDetect(
    ///         apiKey: "apiKey",
    ///         request: .init(text: "Many people cannot get the support they need to handle their conditions well.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func weakWordsDetect(apiKey: String, request: Requests.WeakWordsDetectRequest, requestOptions: RequestOptions? = nil) async throws -> WeakWordsDetectResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/readability/weak-words",
            queryParams: [
                "apiKey": .string(apiKey)
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: WeakWordsDetectResponse.self
        )
    }

    /// Analyze text readability using industry-standard formulas including Flesch Reading Ease, Flesch-Kincaid Grade Level, Gunning Fog Index, SMOG Index, Coleman-Liau Index, and Automated Readability Index.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.readabilityScore(
    ///         apiKey: "apiKey",
    ///         request: .init(text: "The global mental is health crisis is now a serious and compelex problem. It needs quick and ongoing action from policymakers, healthcare workers, and the whole society.")
    ///     )
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter target: Target audience used to tune sentence difficulty levels
    /// - Parameter exclude: Comma-separated response sections to omit. Possible values are readability_scores, sentence_readability, readability_grade
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func readabilityScore(apiKey: String, target: ReadabilityScoreRequestTarget? = nil, exclude: String? = nil, request: Requests.ReadabilityScoreRequest, requestOptions: RequestOptions? = nil) async throws -> ReadabilityScoreResponse {
        return try await httpClient.performRequest(
            method: .post,
            path: "/v1.0/readability/score",
            queryParams: [
                "apiKey": .string(apiKey), 
                "target": target.map { .string($0.rawValue) }, 
                "exclude": exclude.map { .string($0) }
            ],
            body: request,
            requestOptions: requestOptions,
            responseType: ReadabilityScoreResponse.self
        )
    }

    /// Retrieve sunrise and sunset times, current position of the moon, and other related information by specifying a location address, location coordinates, IP address, or using the client IP address if no parameter is passed.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.astronomyLookup(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response.
    /// - Parameter location: Location name or address
    /// - Parameter lat: Latitude for location coordinates
    /// - Parameter long: Longitude for location coordinates
    /// - Parameter ip: IP address for location detection
    /// - Parameter date: Date for astronomy data (YYYY-MM-DD)
    /// - Parameter elevation: Timezone of the location for which astronomy data is required
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func astronomyLookup(apiKey: String, format: AstronomyLookupRequestFormat? = nil, location: String? = nil, lat: Float? = nil, long: Float? = nil, ip: String? = nil, lang: String? = nil, date: CalendarDate? = nil, elevation: Double? = nil, timeZone: String? = nil, requestOptions: RequestOptions? = nil) async throws -> AstronomyLookupResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/geolocation/astronomy",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }, 
                "location": location.map { .string($0) }, 
                "lat": lat.map { .float($0) }, 
                "long": long.map { .float($0) }, 
                "ip": ip.map { .string($0) }, 
                "lang": lang.map { .string($0) }, 
                "date": date.map { .calendarDate($0) }, 
                "elevation": elevation.map { .double($0) }, 
                "time_zone": timeZone.map { .string($0) }
            ],
            requestOptions: requestOptions,
            responseType: AstronomyLookupResponse.self
        )
    }

    /// Returns subscription, subscription-surcharge, and one-off credit balances for the authenticated organization's account.
    ///
    /// ```swift
    /// import Foundation
    /// import APIFreaks
    ///
    /// private func main() async throws {
    ///     let client = APIFreaks()
    ///
    ///     _ = try await client.getCreditsUsage(apiKey: "apiKey")
    /// }
    ///
    /// try await main()
    /// ```
    ///
    /// - Parameter apiKey: Your API key
    /// - Parameter format: Format of the response. Possible values: json, xml.
    /// - Parameter requestOptions: Additional options for configuring the request, such as custom headers or timeout settings.
    public func getCreditsUsage(apiKey: String, format: GetCreditsUsageRequestFormat? = nil, requestOptions: RequestOptions? = nil) async throws -> GetCreditsUsageResponse {
        return try await httpClient.performRequest(
            method: .get,
            path: "/v1.0/credits/usage/info",
            queryParams: [
                "apiKey": .string(apiKey), 
                "format": format.map { .string($0.rawValue) }
            ],
            requestOptions: requestOptions,
            responseType: GetCreditsUsageResponse.self
        )
    }
}