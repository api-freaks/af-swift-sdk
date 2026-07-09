# Reference
<details><summary><code>client.<a href="/Sources/APIFreaks.swift">geolocationLookup</a>(apiKey: String, format: GeolocationLookupRequestFormat?, ip: String?, lang: GeolocationLookupRequestLang?, fields: String?, excludes: String?, include: String?, requestOptions: RequestOptions?) -> GeolocationLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get detailed geolocation data for an IP address including country, city, timezone, currency, and optional security and user-agent information
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.geolocationLookup(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GeolocationLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IPv4, IPv6, or hostname for geolocation lookup
    
</dd>
</dl>

<dl>
<dd>

**lang:** `GeolocationLookupRequestLang?` — Response language for location fields
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String?` — Comma separated list of fields to include in response
    
</dd>
</dl>

<dl>
<dd>

**excludes:** `String?` — Comma separated list of fields to exclude from response
    
</dd>
</dl>

<dl>
<dd>

**include:** `String?` — Additional data to include (location, network, security, currency, time_zone, user_agent, country_metadata , hostname, liveHostname, hostnameFallbackLivet)
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">geolocationLookupV2</a>(apiKey: String, format: GeolocationLookupRequestFormat?, ip: String?, lang: GeolocationLookupRequestLang?, fields: String?, excludes: String?, include: String?, requestOptions: RequestOptions?) -> GeolocationLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get detailed geolocation data for an IP address including country, city, timezone, currency, and optional security and user-agent information (v2.0 endpoint).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.geolocationLookupV2(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GeolocationLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IPv4, IPv6, or hostname for geolocation lookup
    
</dd>
</dl>

<dl>
<dd>

**lang:** `GeolocationLookupRequestLang?` — Response language for location fields
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String?` — Comma separated list of fields to include in response
    
</dd>
</dl>

<dl>
<dd>

**excludes:** `String?` — Comma separated list of fields to exclude from response
    
</dd>
</dl>

<dl>
<dd>

**include:** `String?` — Additional data to include (location, network, security, currency, time_zone, user_agent, country_metadata , hostname, liveHostname, hostnameFallbackLivet)
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkGeolocationLookup</a>(apiKey: String, format: BulkGeolocationLookupRequestFormat?, lang: String?, fields: String?, excludes: String?, include: String?, request: Requests.BulkGeolocationLookupRequest, requestOptions: RequestOptions?) -> [BulkGeolocationLookupResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed geolocation data for multiple IP addresses in a single request.
Supports up to `50,000` IP-addresses/host-names per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkGeolocationLookup(
        apiKey: "apiKey",
        request: .init(ips: [
            "ips"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkGeolocationLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**lang:** `String?` — Language of the response.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String?` — Comma-separated list of fields to include in the response. Can include "geo".
    
</dd>
</dl>

<dl>
<dd>

**excludes:** `String?` — Comma-separated list of fields to exclude from the response (except "ip").
    
</dd>
</dl>

<dl>
<dd>

**include:** `String?` — Comma-separated list of additional information to include in the response.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkGeolocationLookupRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkGeolocationLookupV2</a>(apiKey: String, format: BulkGeolocationLookupRequestFormat?, lang: String?, fields: String?, excludes: String?, include: String?, request: Requests.BulkGeolocationLookupRequest, requestOptions: RequestOptions?) -> [BulkGeolocationLookupResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed geolocation data for multiple IP addresses in a single request (v2.0 endpoint).
Supports up to `50,000` IP-addresses/host-names per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkGeolocationLookupV2(
        apiKey: "apiKey",
        request: .init(ips: [
            "ips"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkGeolocationLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**lang:** `String?` — Language of the response.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String?` — Comma-separated list of fields to include in the response. Can include "geo".
    
</dd>
</dl>

<dl>
<dd>

**excludes:** `String?` — Comma-separated list of fields to exclude from the response (except "ip").
    
</dd>
</dl>

<dl>
<dd>

**include:** `String?` — Comma-separated list of additional information to include in the response.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkGeolocationLookupRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">ipSecurityLookup</a>(apiKey: String, format: IpSecurityLookupRequestFormat?, ip: String?, fields: String?, excludes: String?, requestOptions: RequestOptions?) -> IpSecurityLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get comprehensive security information for a given IP address. Detects VPNs, proxies, Tor nodes, and other security threats.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.ipSecurityLookup(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `IpSecurityLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — A valid IPv4 or IPv6 address to look up. If omitted, the API uses the public IP of the requesting client.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String?` — Comma-separated list of fields to return. Supports dot notation (e.g. security.threat_score).
    
</dd>
</dl>

<dl>
<dd>

**excludes:** `String?` — Comma-separated list of fields to remove from the response. Supports dot notation (e.g. security.is_tor).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkIpSecurityLookup</a>(apiKey: String, format: BulkIpSecurityLookupRequestFormat?, fields: String?, excludes: String?, request: Requests.BulkIpSecurityLookupRequest, requestOptions: RequestOptions?) -> [BulkIpSecurityLookupResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The Bulk IP Security Lookup API allows you to retrieve security details for up to `50,000` IP-addresses in a single request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkIpSecurityLookup(
        apiKey: "apiKey",
        request: .init(ips: [
            "ips"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkIpSecurityLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**fields:** `String?` — Comma-separated list of fields to return. Supports dot notation (e.g. security.threat_score).
    
</dd>
</dl>

<dl>
<dd>

**excludes:** `String?` — Comma-separated list of fields to remove from the response. Supports dot notation (e.g. security.is_tor).
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkIpSecurityLookupRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">geocoderSearch</a>(acceptLanguage: String?, apiKey: String, format: GeocoderSearchRequestFormat?, query: String, limit: Int?, minLat: Float?, maxLat: Float?, minLon: Float?, maxLon: Float?, requestOptions: RequestOptions?) -> [GeocoderSearchResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Convert a given address or place name into geographic coordinates (latitude and longitude).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.geocoderSearch(
        apiKey: "apiKey",
        query: "query"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**acceptLanguage:** `String?` — Preferred language order for showing search results. This may either be a simple comma-separated list of language codes or a single entry. The results will be in the 1st language which is matched from the header. As a fallback if the results are not supported in the given language, 'en' will be used.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GeocoderSearchRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**query:** `String` — Free-form search query, e.g. Wembley Stadium, London
    
</dd>
</dl>

<dl>
<dd>

**limit:** `Int?` — Max number of results to return (1–40). May return fewer if matches are weak.
    
</dd>
</dl>

<dl>
<dd>

**minLat:** `Float?` — Minimum latitude for the viewbox. Must be ≤ max_lat and between -90 and 90.
    
</dd>
</dl>

<dl>
<dd>

**maxLat:** `Float?` — Maximum latitude for the viewbox. Must be ≥ min_lat and between -90 and 90.
    
</dd>
</dl>

<dl>
<dd>

**minLon:** `Float?` — Minimum longitude for the viewbox. Must be ≤ max_lon and between -180 and 180.
    
</dd>
</dl>

<dl>
<dd>

**maxLon:** `Float?` — Maximum longitude for the viewbox. Must be ≥ min_lon and between -180 and 180.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">geocoderReverse</a>(acceptLanguage: String?, apiKey: String, format: GeocoderReverseRequestFormat?, lat: Double, lon: Double, requestOptions: RequestOptions?) -> GeocoderReverseResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Convert geographic coordinates (latitude and longitude) into a human-readable address or place name.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.geocoderReverse(
        apiKey: "apiKey",
        lat: 1.1,
        lon: 1.1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**acceptLanguage:** `String?` — Preferred language order for showing search results. This may either be a simple comma-separated list of language codes or a single entry. The results will be in the 1st language which is matched from the header. As a fallback if the results are not supported in the given language, en will be used.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GeocoderReverseRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Double` — WGS84 latitude value ranging from -90 to 90.
    
</dd>
</dl>

<dl>
<dd>

**lon:** `Double` — WGS84 longitude value ranging from -180 to 180.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainWhoisLookup</a>(apiKey: String, format: DomainWhoisLookupRequestFormat?, domainName: String, requestOptions: RequestOptions?) -> DomainWhoisLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve current WHOIS information for a domain name.
This endpoint provides detailed registration information including registrar details,
dates, nameservers, and registrant information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainWhoisLookup(
        apiKey: "apiKey",
        domainName: "domainName"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainWhoisLookupRequestFormat?` — Response format (defaults to json)
    
</dd>
</dl>

<dl>
<dd>

**domainName:** `String` — Domain name for WHOIS lookup
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainWhoisLookupV2</a>(apiKey: String, format: DomainWhoisLookupRequestFormat?, domainName: String, requestOptions: RequestOptions?) -> DomainWhoisLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve current WHOIS information for a domain name (v2.0 endpoint).
This endpoint provides detailed registration information including registrar details,
dates, nameservers, and registrant information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainWhoisLookupV2(
        apiKey: "apiKey",
        domainName: "domainName"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainWhoisLookupRequestFormat?` — Response format (defaults to json)
    
</dd>
</dl>

<dl>
<dd>

**domainName:** `String` — Domain name for WHOIS lookup
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkDomainWhoisLookup</a>(apiKey: String, format: BulkDomainWhoisLookupRequestFormat?, request: Requests.BulkDomainWhoisLookupRequest, requestOptions: RequestOptions?) -> BulkDomainWhoisLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve WHOIS information for `100 Domains per Request`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkDomainWhoisLookup(
        apiKey: "apiKey",
        request: .init(domainNames: [
            "domainNames"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkDomainWhoisLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkDomainWhoisLookupRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkDomainWhoisLookupV2</a>(apiKey: String, format: BulkDomainWhoisLookupRequestFormat?, request: Requests.BulkDomainWhoisLookupRequest, requestOptions: RequestOptions?) -> BulkDomainWhoisLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve WHOIS information for `100 Domains per Request` (v2.0 endpoint).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkDomainWhoisLookupV2(
        apiKey: "apiKey",
        request: .init(domainNames: [
            "domainNames"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkDomainWhoisLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkDomainWhoisLookupRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">ipWhoisLookup</a>(apiKey: String, format: IpWhoisLookupRequestFormat?, ip: String, requestOptions: RequestOptions?) -> IpWhoisLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns WHOIS registration details for a specified IP address (IPv4 or IPv6).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.ipWhoisLookup(
        apiKey: "apiKey",
        ip: "ip"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `IpWhoisLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String` — The IP address (IPv4 or IPv6) for which WHOIS data is requested.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">asnWhoisLookup</a>(apiKey: String, format: AsnWhoisLookupRequestFormat?, asn: String, requestOptions: RequestOptions?) -> AsnWhoisLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Returns WHOIS registration details for a specified ASN, with or without the 'as' prefix.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.asnWhoisLookup(
        apiKey: "apiKey",
        asn: "asn"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `AsnWhoisLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**asn:** `String` — The Autonomous System Number (ASN) to retrieve WHOIS data for. Can be prefixed with 'as' or not.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainWhoisHistory</a>(apiKey: String, format: DomainWhoisHistoryRequestFormat?, domainName: String, requestOptions: RequestOptions?) -> DomainWhoisHistoryResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve historical WHOIS records for a domain name.
This endpoint provides a timeline of all recorded changes in domain registration information.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainWhoisHistory(
        apiKey: "apiKey",
        domainName: "domainName"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainWhoisHistoryRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**domainName:** `String` — Domain name for historical WHOIS lookup
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainWhoisReverse</a>(apiKey: String, format: DomainWhoisReverseRequestFormat?, keyword: String?, email: String?, owner: String?, company: String?, exact: Bool?, mode: DomainWhoisReverseRequestMode?, page: Int?, requestOptions: RequestOptions?) -> DomainWhoisReverseResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Performs a reverse WHOIS search using one or more search parameters like keyword, email, owner, or company.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainWhoisReverse(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainWhoisReverseRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**keyword:** `String?` — Keyword search term for reverse WHOIS by keyword (case-insensitive pattern matching).
    
</dd>
</dl>

<dl>
<dd>

**email:** `String?` — Email search term for reverse WHOIS by email address (case-insensitive exact or regex match; * wildcard supported).
    
</dd>
</dl>

<dl>
<dd>

**owner:** `String?` — Registrant or owner name for reverse WHOIS (a full-text search phrase matching technique to retrieve results).
    
</dd>
</dl>

<dl>
<dd>

**company:** `String?` — Organization or company name for reverse WHOIS (full-text search phrase matching technique to retrieve results).
    
</dd>
</dl>

<dl>
<dd>

**exact:** `Bool?` — Accepts 'true' or 'false'. "true" returns only records that exactly match the input (keyword, owner/registrant, or company). "false" returns all matches and is the default when omitted.
    
</dd>
</dl>

<dl>
<dd>

**mode:** `DomainWhoisReverseRequestMode?` 
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` — Page number for paginated results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainDnsLookup</a>(apiKey: String, format: DomainDnsLookupRequestFormat?, hostName: String?, ipAddress: String?, type: String, requestOptions: RequestOptions?) -> DomainDnsLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve real-time DNS records for any hostname. Supports multiple record types including A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainDnsLookup(
        apiKey: "apiKey",
        type: "type"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainDnsLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**hostName:** `String?` — Hostname or URL whose DNS records are required.
    
</dd>
</dl>

<dl>
<dd>

**ipAddress:** `String?` — The IP address for requested DNS's PTR record. 'type' parameter must be set to 'all'.
    
</dd>
</dl>

<dl>
<dd>

**type:** `String` — A comma-separated list of DNS record types for lookup. Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, or all. When ipAddress is provided, type must be "all". **Required**
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkDomainDnsLookup</a>(apiKey: String, format: BulkDomainDnsLookupRequestFormat?, type: String, request: Requests.BulkDomainDnsLookupRequest, requestOptions: RequestOptions?) -> BulkDomainDnsLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Perform DNS lookups for multiple hostnames in a single request. Supports up to `100 host-names per request`
and returns DNS records including A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkDomainDnsLookup(
        apiKey: "apiKey",
        type: "type",
        request: .init(domainNames: [
            "domainNames"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkDomainDnsLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**type:** `String` 

A comma-separated list of DNS record types for lookup.
Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, or all **Required**
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkDomainDnsLookupRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainDnsHistory</a>(apiKey: String, format: DomainDnsHistoryRequestFormat?, hostName: String, type: String, page: Int?, requestOptions: RequestOptions?) -> DomainDnsHistoryResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve historical DNS records for any hostname. Access unique historical data for A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME records,
including subdomains. Results are paginated with up to 100 unique records per page.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainDnsHistory(
        apiKey: "apiKey",
        hostName: "host-name",
        type: "type"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainDnsHistoryRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**hostName:** `String` — Hostname or URL whose historical DNS records are required
    
</dd>
</dl>

<dl>
<dd>

**type:** `String` 

A comma-separated list of DNS record types for lookup.
Possible values: A, AAAA, MX, NS, SOA, SPF, TXT, CNAME, or all **Required**
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` — Page number for paginated results
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainDnsReverse</a>(apiKey: String, format: DomainDnsReverseRequestFormat?, type: DomainDnsReverseRequestType, value: String, exact: Bool?, page: Int?, requestOptions: RequestOptions?) -> DomainDnsReverseResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve all the hostnames associated with any particular A, AAAA, MX, NS, SOA, SPF, TXT, and CNAME DNS records. For instance, you can access all the hostnames hosted on any IP/CIDR notation, all the domain names using Cloudflare name servers, and all the domain names using Google Mailbox
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainDnsReverse(
        apiKey: "apiKey",
        type: .a,
        value: "value"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainDnsReverseRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**type:** `DomainDnsReverseRequestType` 

The type of reverse DNS lookup to perform. Determines how the value parameter is interpreted:
- A: IPv4 CIDR block
- AAAA: IPv6 CIDR block
- MX: Mail provider domain
- NS: Name server provider hostname
- SOA: SOA record admin domain
- SPF/TXT: Target verification strings
- CNAME: Target hostname
    
</dd>
</dl>

<dl>
<dd>

**value:** `String` — Provide an IP or CIDR for A/AAAA lookups, or a hostname/selector for MX, NS, SOA, SPF, TXT, and CNAME queries. Wildcard regex patterns are also supported (e.g., mail.google.com, m*.google.com, _spf.g*.com, s*.g*.com).
    
</dd>
</dl>

<dl>
<dd>

**exact:** `Bool?` — Accepts 'true' or 'false'. "true" returns only records that exactly match the input (NS, MX, CNAME, SOA, SPF, TXT). "false" returns all matches (default when omitted).
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` — Page number to paginate through results (defaults to 1).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">webScrape</a>(apiKey: String, format: WebScrapeRequestFormat?, url: String, text: Bool?, jsEnabled: Bool?, proxy: WebScrapeRequestProxy?, sslIgnore: Bool?, windowSize: String?, adBlock: Bool?, captcha: Bool?, request: WebScrapeRequestBody, requestOptions: RequestOptions?) -> WebScrapeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Execute a series of web scraping instructions on a target URL. 
Supports various operations like form filling, clicking, data extraction, and CAPTCHA solving.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.webScrape(
        apiKey: "apiKey",
        url: "https://example.com",
        request: WebScrapeRequestBody.webScrapeRequestBodyBlockUrl(
            WebScrapeRequestBodyBlockUrl(
                blockUrl: [
                    "https://example.com/ads.js",
                    "https://tracker.example.com/*"
                ],
                cookies: [
                    WebScrapeRequestBodyBlockUrlCookiesItem(
                        name: "sessionid",
                        value: "abc123"
                    ),
                    WebScrapeRequestBodyBlockUrlCookiesItem(
                        name: "user_pref",
                        value: "darkmode"
                    )
                ],
                instructions: [
                    WebScrapeRequestBodyBlockUrlInstructionsItem.webScrapeRequestBodyBlockUrlInstructionsItemFill(
                        WebScrapeRequestBodyBlockUrlInstructionsItemFill(
                            fill: WebScrapeRequestBodyBlockUrlInstructionsItemFillFill(
                                place: "#username",
                                value: "myuser"
                            )
                        )
                    ),
                    WebScrapeRequestBodyBlockUrlInstructionsItem.webScrapeRequestBodyBlockUrlInstructionsItemFill(
                        WebScrapeRequestBodyBlockUrlInstructionsItemFill(
                            fill: WebScrapeRequestBodyBlockUrlInstructionsItemFillFill(
                                place: "#password",
                                value: "mypassword"
                            )
                        )
                    ),
                    WebScrapeRequestBodyBlockUrlInstructionsItem.webScrapeRequestBodyBlockUrlInstructionsItemFill(
                        WebScrapeRequestBodyBlockUrlInstructionsItemFill(

                        )
                    ),
                    WebScrapeRequestBodyBlockUrlInstructionsItem.webScrapeRequestBodyBlockUrlInstructionsItemFill(
                        WebScrapeRequestBodyBlockUrlInstructionsItemFill(

                        )
                    ),
                    WebScrapeRequestBodyBlockUrlInstructionsItem.webScrapeRequestBodyBlockUrlInstructionsItemFill(
                        WebScrapeRequestBodyBlockUrlInstructionsItemFill(

                        )
                    ),
                    WebScrapeRequestBodyBlockUrlInstructionsItem.webScrapeRequestBodyBlockUrlInstructionsItemFill(
                        WebScrapeRequestBodyBlockUrlInstructionsItemFill(

                        )
                    ),
                    WebScrapeRequestBodyBlockUrlInstructionsItem.webScrapeRequestBodyBlockUrlInstructionsItemFill(
                        WebScrapeRequestBodyBlockUrlInstructionsItemFill(

                        )
                    )
                ]
            )
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `WebScrapeRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**url:** `String` — Target URL to scrape
    
</dd>
</dl>

<dl>
<dd>

**text:** `Bool?` — Set to `true` to return the data in text format else `false` for data in html format with tags.
    
</dd>
</dl>

<dl>
<dd>

**jsEnabled:** `Bool?` 

Set  `true` to handle websites with JavaScript. Set `false` to handle static html websites.


 Default value is `true`.
    
</dd>
</dl>

<dl>
<dd>

**proxy:** `WebScrapeRequestProxy?` — Use proxy for requests
    
</dd>
</dl>

<dl>
<dd>

**sslIgnore:** `Bool?` 

Ignore SSL certificate errors.


 Only works if **jsEnabled** is **true**.
    
</dd>
</dl>

<dl>
<dd>

**windowSize:** `String?` 

Specify the browser window size in the format 'width,height' (e.g., "1920w,1080h"). Default value is the default resolutions provided by web/browser.


 Only works if **jsEnabled** is **true**.
    
</dd>
</dl>

<dl>
<dd>

**adBlock:** `Bool?` 

Set to `true` to apply ad-blocker to the specified URL else false or ignore to not apply.


 Only works if **jsEnabled** is **true**.
    
</dd>
</dl>

<dl>
<dd>

**captcha:** `Bool?` 

if true user can provide captcha instructions in the instructions to solve image captchas.


  Only works if **jsEnabled** is **true**.
    
</dd>
</dl>

<dl>
<dd>

**request:** `WebScrapeRequestBody` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">emailValidate</a>(apiKey: String, format: EmailValidateRequestFormat?, request: Requests.EmailValidateRequest, requestOptions: RequestOptions?) -> EmailValidateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates a single email address and returns result.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.emailValidate(
        apiKey: "apiKey",
        request: .init(email: "email")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `EmailValidateRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.EmailValidateRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkEmailValidate</a>(apiKey: String, format: BulkEmailValidateRequestFormat?, request: Requests.BulkEmailValidateRequest, requestOptions: RequestOptions?) -> BulkEmailValidateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates a bulk of email addresses and returns result for each. Maximum `10` email addresses per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkEmailValidate(
        apiKey: "apiKey",
        request: .init(emailData: [
            BulkEmailValidateRequestEmailDataItem(
                email: "email"
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkEmailValidateRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkEmailValidateRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">phoneValidate</a>(apiKey: String, format: PhoneValidateRequestFormat?, request: Requests.PhoneValidateRequest, requestOptions: RequestOptions?) -> PhoneValidateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates a single phone number and returns detailed metadata including carrier, line type, geolocation, time zones, and standardized formats.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.phoneValidate(
        apiKey: "apiKey",
        request: .init(number: "+14155552671")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PhoneValidateRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object. If not provided, the API defaults to JSON format.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PhoneValidateRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkPhoneValidate</a>(apiKey: String, format: BulkPhoneValidateRequestFormat?, request: Requests.BulkPhoneValidateRequest, requestOptions: RequestOptions?) -> [BulkPhoneValidateResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates up to 100 phone numbers in a single request. Each number is processed independently — invalid entries return per-number errors without affecting the rest of the batch.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkPhoneValidate(
        apiKey: "apiKey",
        request: .init(numbers: [
            BulkPhoneValidateRequestNumbersItem(
                number: "+14155552671"
            ),
            BulkPhoneValidateRequestNumbersItem(
                number: "+447911123456"
            ),
            BulkPhoneValidateRequestNumbersItem(
                number: "+919876543210"
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkPhoneValidateRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object. If not provided, the API defaults to JSON format.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkPhoneValidateRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainSslLookup</a>(apiKey: String, format: DomainSslLookupRequestFormat?, domainName: String, sslRaw: Bool?, requestOptions: RequestOptions?) -> DomainSslLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve comprehensive SSL certificate information without the certificate chain.
This endpoint provides detailed information about the SSL certificate including expiry dates, issuer details, and encryption methods.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainSslLookup(
        apiKey: "apiKey",
        domainName: "domainName"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainSslLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**domainName:** `String` — Domain name or URL whose SSL certificate lookup is required
    
</dd>
</dl>

<dl>
<dd>

**sslRaw:** `Bool?` — Set to true to get the raw openSSL response of the domain
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainSslChainLookup</a>(apiKey: String, format: DomainSslChainLookupRequestFormat?, domainName: String, sslRaw: Bool?, requestOptions: RequestOptions?) -> DomainSslChainLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the complete SSL certificate chain from root Certificate Authority (CA) to end-user certificate.
This endpoint provides comprehensive information about each certificate in the chain.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainSslChainLookup(
        apiKey: "apiKey",
        domainName: "domainName"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainSslChainLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**domainName:** `String` — Domain name or URL whose SSL certificate chain lookup is required
    
</dd>
</dl>

<dl>
<dd>

**sslRaw:** `Bool?` — Set to true to get the raw openSSL response for each certificate in the chain
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainAvailabilityCheck</a>(apiKey: String, format: DomainAvailabilityCheckRequestFormat?, domain: String, source: DomainAvailabilityCheckRequestSource?, requestOptions: RequestOptions?) -> DomainAvailabilityCheckResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The Domain Search API is designed to simplify the process of finding available domain names across all top-level domains (TLDs) and second-level domains (SLDs).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainAvailabilityCheck(
        apiKey: "apiKey",
        domain: "domain"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainAvailabilityCheckRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**domain:** `String` — Domain name whose availability is to be checked.
    
</dd>
</dl>

<dl>
<dd>

**source:** `DomainAvailabilityCheckRequestSource?` — Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkDomainAvailabilityCheck</a>(apiKey: String, format: BulkDomainAvailabilityCheckRequestFormat?, source: BulkDomainAvailabilityCheckRequestSource?, request: Requests.BulkDomainAvailabilityCheckRequest, requestOptions: RequestOptions?) -> BulkDomainAvailabilityCheckResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Perform Bulk Domain Availability checks using a list of domains. Supports upto `100 Domains Per Request`.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkDomainAvailabilityCheck(
        apiKey: "apiKey",
        request: .init(domainNames: [
            "domainNames"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkDomainAvailabilityCheckRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**source:** `BulkDomainAvailabilityCheckRequestSource?` — Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkDomainAvailabilityCheckRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">domainAvailabilitySuggestions</a>(apiKey: String, format: DomainAvailabilitySuggestionsRequestFormat?, domain: String, source: DomainAvailabilitySuggestionsRequestSource?, count: Int?, sug: Bool?, requestOptions: RequestOptions?) -> DomainAvailabilitySuggestionsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The Domain Search API is designed to simplify the process of finding available domain names across all top-level domains (TLDs) and second-level domains (SLDs).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.domainAvailabilitySuggestions(
        apiKey: "apiKey",
        domain: "domain"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `DomainAvailabilitySuggestionsRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**domain:** `String` — Domain name for availability and suggestions.
    
</dd>
</dl>

<dl>
<dd>

**source:** `DomainAvailabilitySuggestionsRequestSource?` — Specify the data source for domain availability checks. Use "dns" for DNS-based lookups or "whois" for WHOIS-based lookups. By default, "dns" is used.
    
</dd>
</dl>

<dl>
<dd>

**count:** `Int?` — Number of suggestions to retrieve.
    
</dd>
</dl>

<dl>
<dd>

**sug:** `Bool?` — Whether to include name suggestions in the response.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">subdomainsLookup</a>(apiKey: String, format: SubdomainsLookupRequestFormat?, domain: String, after: CalendarDate?, before: CalendarDate?, status: SubdomainsLookupRequestStatus?, page: String?, requestOptions: RequestOptions?) -> SubdomainsLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

The Subdomain Lookup API is designed to retrieve subdomains related to the given domain name. It helps you explore subdomains that are available for registration or usage.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.subdomainsLookup(
        apiKey: "apiKey",
        domain: "domain"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `SubdomainsLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**domain:** `String` — Domain name for availability and suggestions.
    
</dd>
</dl>

<dl>
<dd>

**after:** `CalendarDate?` — Filter subdomains seen after this date (format YYYY-MM-DD).
    
</dd>
</dl>

<dl>
<dd>

**before:** `CalendarDate?` — Filter subdomains seen before this date( format YYYY-MM-DD).
    
</dd>
</dl>

<dl>
<dd>

**status:** `SubdomainsLookupRequestStatus?` — Filter subdomains by status (active or inactive).
    
</dd>
</dl>

<dl>
<dd>

**page:** `String?` — Page number for paginated results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfMerge</a>(webhookAuthorization: String?, apiKey: String, format: PdfMergeRequestFormat?, fileId: String?, destroy: Bool?, output: String?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfMergeRequest, requestOptions: RequestOptions?) -> PdfMergeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API merges multiple PDF files into a single PDF, in the order they are provided
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfMerge(
        apiKey: "apiKey",
        request: .init(file: [])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfMergeRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — An array of unique file IDs referencing PDF files previously uploaded to the API Freaks server. Use this parameter to merge existing files without re-uploading them. Provide multiple IDs to merge files in the specified order.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — Specifies the desired name for the resulting merged PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfMergeRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfRemovePages</a>(webhookAuthorization: String?, apiKey: String, format: PdfRemovePagesRequestFormat?, fileId: String?, destroy: Bool?, output: String?, pages: String, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfRemovePagesRequest, requestOptions: RequestOptions?) -> PdfRemovePagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API removes a selection or range of pages from a PDF file.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfRemovePages(
        apiKey: "apiKey",
        pages: "pages",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfRemovePagesRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique identifier of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output PDF file after pages have been removed. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String` — Specifies which pages to remove from the PDF. Accepts individual page numbers (e.g., '1,7') and/or ascending page ranges (e.g., '3-5'). Use commas to separate entries and hyphens for ranges. Reverse ranges (e.g., '5-3') are not allowed. Alternatively, you may provide only one of the following keywords: 'even' (removes all even-numbered pages), 'odd' (removes all odd-numbered pages), or 'last' (removes only the last page). The keyword 'all' is not supported for this operation. Examples: '1,3-5', 'even'. Mixing special keywords with specific pages/ranges is not allowed.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfRemovePagesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfSplit</a>(webhookAuthorization: String?, apiKey: String, format: PdfSplitRequestFormat?, fileId: String?, destroy: Bool?, output: String?, pages: String?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfSplitRequest, requestOptions: RequestOptions?) -> PdfSplitResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API splits a PDF into multiple parts based on specified page numbers or ranges.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfSplit(
        apiKey: "apiKey",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfSplitRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired base name for the output PDF files after splitting. If not provided, a default naming convention will be used.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String?` 

Defines the page numbers or ranges where the PDF should be split. Provide individual pages and/or ranges in any order (for example: "1-4,9-5,16-last"). Separate entries with commas and use hyphens for ranges.

Special keywords (use alone):

• `even` — split at every even-numbered page

• `odd` — split at every odd-numbered page

• `all` — split the PDF into single-page files

The keyword `last` can be used anywhere in the string, in combination with page numbers or ranges (for example: "5-last", "last-2", "1,last,9").

Examples:
- "1,4-2,last"
- "odd"
- "all"
- "last,2-5"

Invalid example: "1,odd" (mixing a keyword other than "last" with specific pages/ranges is not allowed). You can pass multiple pages entries to produce multiple output files.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfSplitRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfRotate</a>(webhookAuthorization: String?, apiKey: String, format: PdfRotateRequestFormat?, fileId: String?, destroy: Bool?, output: String?, pages: String?, rotate: Int, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfRotateRequest, requestOptions: RequestOptions?) -> PdfRotateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API rotates pages of a PDF by a specified angle (in multiples of 90 degrees).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfRotate(
        apiKey: "apiKey",
        rotate: 1,
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfRotateRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output PDF file after rotation. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String?` — Specifies which pages to rotate. Accepts individual page numbers (e.g., '1,7') and/or ascending page ranges (e.g., '3-5'). Use commas to separate entries and hyphens for ranges. Reverse ranges (e.g., '5-3') are not allowed. Alternatively, provide only one of the following keywords: 'even' (rotate all even-numbered pages), 'odd' (rotate all odd-numbered pages), 'last' (rotate only the last page), or 'all' (rotate all pages). Examples: '1,3-5', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    
</dd>
</dl>

<dl>
<dd>

**rotate:** `Int` — The angle in degrees to rotate the selected pages. Must be one of the following values: 0, 90, 180, 270, -90, -180, or -270. All rotations are applied clockwise.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfRotateRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfCompress</a>(webhookAuthorization: String?, apiKey: String, format: PdfCompressRequestFormat?, fileId: String?, output: String?, compressionLevel: PdfCompressRequestCompressionLevel, destroy: Bool?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfCompressRequest, requestOptions: RequestOptions?) -> PdfCompressResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API compresses a given PDF file to reduce its file size.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfCompress(
        apiKey: "apiKey",
        compressionLevel: .low,
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfCompressRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — Name of the output PDF.
    
</dd>
</dl>

<dl>
<dd>

**compressionLevel:** `PdfCompressRequestCompressionLevel` — Controls how aggressively the PDF is compressed. Lower levels preserve more quality, while higher levels reduce file size more.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to true, the input file(s) will be deleted from the server immediately after the output is generated.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfCompressRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfExtractPages</a>(webhookAuthorization: String?, apiKey: String, format: PdfExtractPagesRequestFormat?, fileId: String?, destroy: Bool?, output: String?, pages: String, separated: Bool?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfExtractPagesRequest, requestOptions: RequestOptions?) -> PdfExtractPagesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API extracts specific pages or page ranges from a PDF file and returns them as a new PDF.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfExtractPages(
        apiKey: "apiKey",
        pages: "pages",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfExtractPagesRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output PDF file after pages have been extracted. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String` — Specifies which pages to extract from the PDF. You can provide individual page numbers (e.g., '2') and/or page ranges in any order, including descending (e.g., '9-5', '16-last'). Use commas to separate entries and hyphens for ranges. You may alternatively pass only one of the special keywords: 'even' (extracts all even-numbered pages), 'odd' (extracts all odd-numbered pages), 'last' (extracts only the last page), or 'all' (extracts all pages into individual files). Examples: '2,6-3', 'even', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    
</dd>
</dl>

<dl>
<dd>

**separated:** `Bool?` — If set to `true`, each of the specified pages will be extracted and returned as a separate PDF file.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfExtractPagesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfLinearize</a>(webhookAuthorization: String?, apiKey: String, format: PdfLinearizeRequestFormat?, fileId: String?, destroy: Bool?, output: String?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfLinearizeRequest, requestOptions: RequestOptions?) -> PdfLinearizeResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

API endpoint that linearizes any given PDF, restructuring it for faster loading and page-by-page viewing in web browsers.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfLinearize(
        apiKey: "apiKey",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfLinearizeRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output PDF file after pages have been extracted. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfLinearizeRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfEncrypt</a>(webhookAuthorization: String?, apiKey: String, format: PdfEncryptRequestFormat?, fileId: String?, destroy: Bool?, output: String?, filePassword: String?, userPassword: String, ownerPassword: String?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfEncryptRequest, requestOptions: RequestOptions?) -> PdfEncryptResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API encrypts a PDF file by setting a password required to open it.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfEncrypt(
        apiKey: "apiKey",
        userPassword: "user_password",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfEncryptRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output encrypted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**filePassword:** `String?` — The password to unlock the input file if it is already protected. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**userPassword:** `String` — Sets the user password required to open and view the encrypted PDF file. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**ownerPassword:** `String?` — Sets the owner password for the PDF file. This password provides full access, including the ability to remove restrictions. If not provided, the `user_password` will also be used as the owner password. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfEncryptRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfDecrypt</a>(webhookAuthorization: String?, apiKey: String, format: PdfDecryptRequestFormat?, fileId: String?, destroy: Bool?, output: String?, filePassword: String, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfDecryptRequest, requestOptions: RequestOptions?) -> PdfDecryptResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API decrypts PDF files, removing all encryption, including open passwords and permission restrictions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfDecrypt(
        apiKey: "apiKey",
        filePassword: "file_password",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfDecryptRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output decrypted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**filePassword:** `String` — The password to unlock the input file if it is protected. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfDecryptRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfRestrict</a>(webhookAuthorization: String?, apiKey: String, format: PdfRestrictRequestFormat?, fileId: String?, destroy: Bool?, output: String?, filePassword: String?, userPassword: String, ownerPassword: String?, restrictions: PdfRestrictRequestRestrictionsItem?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfRestrictRequest, requestOptions: RequestOptions?) -> PdfRestrictResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API applies permission restrictions on a PDF file, such as disabling printing, copying, or editing. This can include password protection to enforce restrictions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfRestrict(
        apiKey: "apiKey",
        userPassword: "user_password",
        restrictions: [
            .printHigh
        ],
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfRestrictRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output restricted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**filePassword:** `String?` — The password to unlock the input file if it is already secured. Provide the owner password if available; otherwise, the user password. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**userPassword:** `String` — Sets the password users will use to open the PDF. If this is not set, only the owner password will be configured, and anyone can open the PDF file with the provided restrictions enabled. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**ownerPassword:** `String?` — Sets the password that allows full access to the PDF (e.g., removing restrictions). If not provided, the `user_password` (if set) will also be used as the owner password. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**restrictions:** `PdfRestrictRequestRestrictionsItem?` 

A comma-separated list of restrictions to apply to the PDF. These define what the end-user is *not* allowed to do with the PDF. Available options are:


* **print_high** – Disables high-quality printing.
* **print_low** – Disables low-resolution printing.
* **edit_document_assembly** – Prevents reordering or inserting pages.
* **fill_form_fields** – Disallows filling in PDF form fields.
* **edit_annotations** – Disables adding or modifying annotations or comments.
* **modify_content** – Prevents modifying existing content in the PDF.
* **copy_and_extract_content** – Disables copying text or images from the PDF.
* **use_accessibility** – Prevents screen readers or accessibility tools from accessing content.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfRestrictRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfUnrestrict</a>(webhookAuthorization: String?, apiKey: String, format: PdfUnrestrictRequestFormat?, fileId: String?, destroy: Bool?, output: String?, filePassword: String, userPassword: String?, ownerPassword: String?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfUnrestrictRequest, requestOptions: RequestOptions?) -> PdfUnrestrictResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API removes permission restrictions from a PDF while keeping it encrypted. If you want to remove all security (including encryption), use the `/pdf/decrypt` endpoint instead.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfUnrestrict(
        apiKey: "apiKey",
        filePassword: "file_password",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfUnrestrictRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**filePassword:** `String` — The password to unlock the input file. Either the owner password or user password can be provided. The owner password takes precedence. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**userPassword:** `String?` — Sets the user password for the PDF file. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**ownerPassword:** `String?` — Sets the owner password for the PDF file. If the owner password is not provided, the `user_password` will also be used as the owner password. Password Length should be between 6 and 128 characters.
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfUnrestrictRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfConvertToPng</a>(webhookAuthorization: String?, apiKey: String, format: PdfConvertToPngRequestFormat?, fileId: String?, destroy: Bool?, output: String?, pages: String?, resolution: Int?, imageSmoothing: String?, profile: PdfConvertToPngRequestProfile?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfConvertToPngRequest, requestOptions: RequestOptions?) -> PdfConvertToPngResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API converts a given PDF file into a sequence of PNG images.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfConvertToPng(
        apiKey: "apiKey",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfConvertToPngRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String?` — Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    
</dd>
</dl>

<dl>
<dd>

**resolution:** `Int?` — Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    
</dd>
</dl>

<dl>
<dd>

**imageSmoothing:** `String?` — Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    
</dd>
</dl>

<dl>
<dd>

**profile:** `PdfConvertToPngRequestProfile?` — Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfConvertToPngRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfConvertToJpg</a>(webhookAuthorization: String?, apiKey: String, format: PdfConvertToJpgRequestFormat?, fileId: String?, destroy: Bool?, output: String?, quality: Int?, pages: String?, resolution: Int?, imageSmoothing: String?, profile: PdfConvertToJpgRequestProfile?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfConvertToJpgRequest, requestOptions: RequestOptions?) -> PdfConvertToJpgResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API converts a given PDF file into a sequence of JPG images.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfConvertToJpg(
        apiKey: "apiKey",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfConvertToJpgRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**quality:** `Int?` — Controls JPG compression quality. Higher values yield sharper images with larger file sizes.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String?` — Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    
</dd>
</dl>

<dl>
<dd>

**resolution:** `Int?` — Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    
</dd>
</dl>

<dl>
<dd>

**imageSmoothing:** `String?` — Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    
</dd>
</dl>

<dl>
<dd>

**profile:** `PdfConvertToJpgRequestProfile?` — Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfConvertToJpgRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfConvertToTiff</a>(webhookAuthorization: String?, apiKey: String, format: PdfConvertToTiffRequestFormat?, fileId: String?, destroy: Bool?, output: String?, pages: String?, resolution: Int?, imageSmoothing: String?, profile: PdfConvertToTiffRequestProfile?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfConvertToTiffRequest, requestOptions: RequestOptions?) -> PdfConvertToTiffResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API converts a given PDF file into a sequence of TIFF images. The output images can be saved as a single TIFF file, or as a sequence of TIFF files.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfConvertToTiff(
        apiKey: "apiKey",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfConvertToTiffRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String?` — Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    
</dd>
</dl>

<dl>
<dd>

**resolution:** `Int?` — Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    
</dd>
</dl>

<dl>
<dd>

**imageSmoothing:** `String?` — Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    
</dd>
</dl>

<dl>
<dd>

**profile:** `PdfConvertToTiffRequestProfile?` — Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfConvertToTiffRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfConvertToBmp</a>(webhookAuthorization: String?, apiKey: String, format: PdfConvertToBmpRequestFormat?, fileId: String?, destroy: Bool?, output: String?, pages: String?, resolution: Int?, imageSmoothing: String?, profile: PdfConvertToBmpRequestProfile?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfConvertToBmpRequest, requestOptions: RequestOptions?) -> PdfConvertToBmpResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Converts a PDF file to a BMP image.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfConvertToBmp(
        apiKey: "apiKey",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfConvertToBmpRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String?` — Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    
</dd>
</dl>

<dl>
<dd>

**resolution:** `Int?` — Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    
</dd>
</dl>

<dl>
<dd>

**imageSmoothing:** `String?` — Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    
</dd>
</dl>

<dl>
<dd>

**profile:** `PdfConvertToBmpRequestProfile?` — Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfConvertToBmpRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfConvertToGif</a>(webhookAuthorization: String?, apiKey: String, format: PdfConvertToGifRequestFormat?, fileId: String?, destroy: Bool?, output: String?, pages: String?, resolution: Int?, imageSmoothing: String?, profile: PdfConvertToGifRequestProfile?, webhookUrl: String?, webhookFailureNotification: Bool?, request: Requests.PdfConvertToGifRequest, requestOptions: RequestOptions?) -> PdfConvertToGifResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API converts a given PDF file into a sequence of GIF images.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfConvertToGif(
        apiKey: "apiKey",
        request: .init(file: .init(data: Data("".utf8)))
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**webhookAuthorization:** `String?` — Optional custom header for webhook requests. Format: `Key:Value` (e.g., `Authorization:Bearer token123`). This will be sent as an HTTP header in the webhook call.
    
</dd>
</dl>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfConvertToGifRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String?` — The unique ID of a PDF file already uploaded to the API Freaks server. Use this as an alternative to uploading a new file directly.
    
</dd>
</dl>

<dl>
<dd>

**destroy:** `Bool?` — If set to `true`, the input file(s) will be permanently deleted from the server immediately after the output PDF is generated.
    
</dd>
</dl>

<dl>
<dd>

**output:** `String?` — The desired name for the output unrestricted PDF file. If not provided, a default name will be assigned.
    
</dd>
</dl>

<dl>
<dd>

**pages:** `String?` — Specifies the pages or ranges at which to split the PDF. Accepts individual page numbers (e.g., '1') and/or page ranges (e.g., '4-2', 'last'). Ranges can be ascending or descending. Use commas to separate entries and hyphens for ranges. Alternatively, provide only one of the following keywords: 'even' (split at every even-numbered page), 'odd' (split at every odd-numbered page), 'last' (split at the last page only), or 'all' (split into single pages). Examples: '1,4-2,last', 'odd', 'all'. Mixing special keywords with specific pages/ranges is not allowed.
    
</dd>
</dl>

<dl>
<dd>

**resolution:** `Int?` — Specifies the resolution (in DPI) for the output images. Acceptable Range is from 20 to 1200.
    
</dd>
</dl>

<dl>
<dd>

**imageSmoothing:** `String?` — Determines the smoothing options to apply during image conversion. Valid values are 'none', 'all' or a combination of 'text', 'line', and 'image' (comma-separated).If not provided, no smoothing will be applied.
    
</dd>
</dl>

<dl>
<dd>

**profile:** `PdfConvertToGifRequestProfile?` — Specifies the color profile for the output PNG images. Acceptable values: bw (1-bit black & white, smallest size, no grayscale or color), gray (8-bit grayscale), rgb (24-bit RGB color, default), rgba (32-bit RGB color with alpha channel for transparency), 4-bit (4-bit indexed color, up to 16 colors, smaller size), or 8-bit (8-bit indexed color, up to 256 colors).
    
</dd>
</dl>

<dl>
<dd>

**webhookUrl:** `String?` — The URL to which the webhook notification will be sent after the task is completed.
    
</dd>
</dl>

<dl>
<dd>

**webhookFailureNotification:** `Bool?` — If true, a notification will also be sent by email in case the webhook request fails all the retries.  The email notification will be sent to the requesting user or their organization’s admin if part of one.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfConvertToGifRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfUploadResources</a>(apiKey: String, format: PdfUploadResourcesRequestFormat?, request: Requests.PdfUploadResourcesRequest, requestOptions: RequestOptions?) -> PdfUploadResourcesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API uploads multiple PDF files to the API Freaks server and generates their unique file IDs.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfUploadResources(
        apiKey: "apiKey",
        request: .init(file: [])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfUploadResourcesRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.PdfUploadResourcesRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfDownloadResource</a>(apiKey: String, format: PdfDownloadResourceRequestFormat?, resourceId: String, requestOptions: RequestOptions?) -> Data</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API downloads PDF files or ZIP archives from the server using their unique resource ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfDownloadResource(
        apiKey: "apiKey",
        resourceId: "resource_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfDownloadResourceRequestFormat?` 
    
</dd>
</dl>

<dl>
<dd>

**resourceId:** `String` — The unique identifier of the file or ZIP archive to download.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfGetTaskStatus</a>(apiKey: String, format: PdfGetTaskStatusRequestFormat?, taskId: String, requestOptions: RequestOptions?) -> PdfGetTaskStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API checks the status of a previously initiated PDF processing task using its unique task ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfGetTaskStatus(
        apiKey: "apiKey",
        taskId: "task_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfGetTaskStatusRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**taskId:** `String` — The unique ID of the PDF processing task for which the status is requested.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfGetFileStatus</a>(apiKey: String, format: PdfGetFileStatusRequestFormat?, fileId: String, requestOptions: RequestOptions?) -> PdfGetFileStatusResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API checks the status of a PDF file using its unique file ID, providing information about its creation and potential deletion time.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfGetFileStatus(
        apiKey: "apiKey",
        fileId: "file_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfGetFileStatusRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String` — The unique ID of the file whose status is requested.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfListFiles</a>(apiKey: String, format: PdfListFilesRequestFormat?, requestOptions: RequestOptions?) -> PdfListFilesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API retrieves a list of all PDF files uploaded and generated by a specific user. Please note that if the user is part of an organization, only the Organization Administrator can access this endpoint. Organization Members cannot access this endpoint.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfListFiles(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfListFilesRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">pdfDeleteFile</a>(apiKey: String, format: PdfDeleteFileRequestFormat?, fileId: String, requestOptions: RequestOptions?) -> PdfDeleteFileResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

This API deletes a PDF file using its unique file ID.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.pdfDeleteFile(
        apiKey: "apiKey",
        fileId: "file_id"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `PdfDeleteFileRequestFormat?` — Specifies the desired format for the API response. Choose 'json' for a JSON object or 'xml' for an XML structure.
    
</dd>
</dl>

<dl>
<dd>

**fileId:** `String` — The unique ID of the file to be deleted.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">screenshotCapture</a>(apiKey: String, output: ScreenshotCaptureRequestOutput?, fileType: ScreenshotCaptureRequestFileType?, url: String, width: Int?, height: Int?, fullPage: Bool?, fresh: Bool?, noCookieBanners: Bool?, enableCaching: Bool?, blockAds: Bool?, blockChatWidgets: Bool?, extractText: Bool?, extractHtml: Bool?, destroyScreenshot: Bool?, lazyLoad: Bool?, retina: Bool?, darkMode: Bool?, blockTracking: Bool?, enableIncognito: Bool?, omitBackground: Bool?, thumbnailWidth: Int?, adjustTop: Int?, waitForEvent: ScreenshotCaptureRequestWaitForEvent?, grayscale: Int?, delay: Int?, timeout: Int?, ttl: Int?, clipX: Int?, clipY: Int?, clipWidth: Int?, clipHeight: Int?, cssUrl: String?, css: String?, jsUrl: String?, js: String?, blockJs: Bool?, blockStylesheets: Bool?, blockImages: Bool?, blockMedia: Bool?, blockFont: Bool?, blockTextTrack: Bool?, blockXhr: Bool?, blockFetch: Bool?, blockEventSource: Bool?, blockWebSocket: Bool?, blockManifest: Bool?, blockSpecificRequests: String?, blurSelector: String?, removeSelector: String?, resultFileName: String?, scrollingScreenshot: Bool?, scrollSpeed: ScreenshotCaptureRequestScrollSpeed?, scrollBack: Bool?, startImmediately: Bool?, multipleScrolling: Bool?, sizes: String?, duration: Double?, failOnError: Bool?, longitude: Double?, latitude: Double?, proxy: String?, headers: String?, cookies: String?, scrollToElement: String?, selector: String?, userAgent: String?, acceptLanguages: String?, customHtml: String?, imageQuality: Double?, requestOptions: RequestOptions?) -> Data</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Capture full-page screenshots and videos of websites with advanced options like device simulation, custom code injection, cookie banner blocking, and scrollable content recording.
Supports multiple output formats including JSON, image, GIF, MP4, and WebM.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.screenshotCapture(
        apiKey: "apiKey",
        url: "url"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**output:** `ScreenshotCaptureRequestOutput?` — Output format for screenshot results
    
</dd>
</dl>

<dl>
<dd>

**fileType:** `ScreenshotCaptureRequestFileType?` — File type for screenshot output
    
</dd>
</dl>

<dl>
<dd>

**url:** `String` — URLs to capture screenshots of
    
</dd>
</dl>

<dl>
<dd>

**width:** `Int?` — Browser viewport width in pixels
    
</dd>
</dl>

<dl>
<dd>

**height:** `Int?` — Browser viewport height in pixels
    
</dd>
</dl>

<dl>
<dd>

**fullPage:** `Bool?` — Capture a full-page screenshot
    
</dd>
</dl>

<dl>
<dd>

**fresh:** `Bool?` — Bypass cache and take a fresh screenshot
    
</dd>
</dl>

<dl>
<dd>

**noCookieBanners:** `Bool?` — Remove cookie banners from the screenshot
    
</dd>
</dl>

<dl>
<dd>

**enableCaching:** `Bool?` — Enable caching for repeated requests
    
</dd>
</dl>

<dl>
<dd>

**blockAds:** `Bool?` — Block advertisements on the page
    
</dd>
</dl>

<dl>
<dd>

**blockChatWidgets:** `Bool?` — Block chat widget scripts from loading
    
</dd>
</dl>

<dl>
<dd>

**extractText:** `Bool?` — Extract visible text from the page
    
</dd>
</dl>

<dl>
<dd>

**extractHtml:** `Bool?` — Extract HTML content of the page
    
</dd>
</dl>

<dl>
<dd>

**destroyScreenshot:** `Bool?` — Auto-destroy screenshot after fetch
    
</dd>
</dl>

<dl>
<dd>

**lazyLoad:** `Bool?` — Enable lazy-loading content before screenshot
    
</dd>
</dl>

<dl>
<dd>

**retina:** `Bool?` — Capture screenshot in high-DPI (Retina) mode
    
</dd>
</dl>

<dl>
<dd>

**darkMode:** `Bool?` — Render page in dark mode
    
</dd>
</dl>

<dl>
<dd>

**blockTracking:** `Bool?` — Block common user-tracking scripts
    
</dd>
</dl>

<dl>
<dd>

**enableIncognito:** `Bool?` — Enable private/incognito mode for browser session
    
</dd>
</dl>

<dl>
<dd>

**omitBackground:** `Bool?` — Omit background color (transparent background)
    
</dd>
</dl>

<dl>
<dd>

**thumbnailWidth:** `Int?` — Thumbnail width in pixels
    
</dd>
</dl>

<dl>
<dd>

**adjustTop:** `Int?` — Adjust top in pixels
    
</dd>
</dl>

<dl>
<dd>

**waitForEvent:** `ScreenshotCaptureRequestWaitForEvent?` — Wait for a specific load event before capturing the screenshot.
    
</dd>
</dl>

<dl>
<dd>

**grayscale:** `Int?` — Range:0 to 100 for grayscale filter
    
</dd>
</dl>

<dl>
<dd>

**delay:** `Int?` — How many milliseconds to wait before taking the screenshot
    
</dd>
</dl>

<dl>
<dd>

**timeout:** `Int?` — Maximum timeout in milliseconds. Defalut is `10,000`
    
</dd>
</dl>

<dl>
<dd>

**ttl:** `Int?` — Number of seconds the screenshot should be cached
    
</dd>
</dl>

<dl>
<dd>

**clipX:** `Int?` — X position of the clipping rectangle in pixels
    
</dd>
</dl>

<dl>
<dd>

**clipY:** `Int?` — Y position of the clipping rectangle in pixels
    
</dd>
</dl>

<dl>
<dd>

**clipWidth:** `Int?` — Width of the clipping rectangle in pixels
    
</dd>
</dl>

<dl>
<dd>

**clipHeight:** `Int?` — Height of the clipping rectangle in pixels
    
</dd>
</dl>

<dl>
<dd>

**cssUrl:** `String?` — URL to CSS file
    
</dd>
</dl>

<dl>
<dd>

**css:** `String?` — Your custom CSS code
    
</dd>
</dl>

<dl>
<dd>

**jsUrl:** `String?` — URL to JS file
    
</dd>
</dl>

<dl>
<dd>

**js:** `String?` — Your JS code
    
</dd>
</dl>

<dl>
<dd>

**blockJs:** `Bool?` — Block Scripts
    
</dd>
</dl>

<dl>
<dd>

**blockStylesheets:** `Bool?` — Block Stylesheets
    
</dd>
</dl>

<dl>
<dd>

**blockImages:** `Bool?` — Block Images
    
</dd>
</dl>

<dl>
<dd>

**blockMedia:** `Bool?` — Block Media
    
</dd>
</dl>

<dl>
<dd>

**blockFont:** `Bool?` — Block Fonts
    
</dd>
</dl>

<dl>
<dd>

**blockTextTrack:** `Bool?` — Block Text Tracks
    
</dd>
</dl>

<dl>
<dd>

**blockXhr:** `Bool?` — Block XHR Requests
    
</dd>
</dl>

<dl>
<dd>

**blockFetch:** `Bool?` — Block Fetch Requests
    
</dd>
</dl>

<dl>
<dd>

**blockEventSource:** `Bool?` — Block Event Source
    
</dd>
</dl>

<dl>
<dd>

**blockWebSocket:** `Bool?` — Block Web Sockets
    
</dd>
</dl>

<dl>
<dd>

**blockManifest:** `Bool?` — Block Manifest
    
</dd>
</dl>

<dl>
<dd>

**blockSpecificRequests:** `String?` — Comma- or newline-separated list of specific requests to block. Each line and comma are treated as separate requests for processing. Example: https://example.com, https://example.js
    
</dd>
</dl>

<dl>
<dd>

**blurSelector:** `String?` 

Comma-separated list of indexed CSS selectors to blur.
Format: `index:<selector>`, e.g., `0:.banner,1:#ads`.
    
</dd>
</dl>

<dl>
<dd>

**removeSelector:** `String?` 

Comma-separated list of indexed CSS selectors to blur.
Format: `index:<selector>`, e.g., `0:.banner,1:#ads`.
    
</dd>
</dl>

<dl>
<dd>

**resultFileName:** `String?` 

Specify a meaningful & unique file name to easily identify the screenshot result.
Avoid using spaces or special characters; use hyphens or underscores to separate words.
    
</dd>
</dl>

<dl>
<dd>

**scrollingScreenshot:** `Bool?` — **`Scrolling Screenshot`**: Capture a long scrolling screenshot. When true, disable `fullPage` and `freshScreenshot`.
    
</dd>
</dl>

<dl>
<dd>

**scrollSpeed:** `ScreenshotCaptureRequestScrollSpeed?` — Speed of scrolling during the screenshot.
    
</dd>
</dl>

<dl>
<dd>

**scrollBack:** `Bool?` — If true, the scroll will reverse back to the top after reaching the bottom.
    
</dd>
</dl>

<dl>
<dd>

**startImmediately:** `Bool?` — If true, the scrolling capture will start immediately upon page load.
    
</dd>
</dl>

<dl>
<dd>

**multipleScrolling:** `Bool?` — If true, multiple scrolling screenshots will be taken at different viewport sizes.
    
</dd>
</dl>

<dl>
<dd>

**sizes:** `String?` — Comma-separated list of viewport sizes in the format index:XXw:YYh. Example: sizes=0:120w:300h,1:240w:500h
    
</dd>
</dl>

<dl>
<dd>

**duration:** `Double?` — Duration in seconds for the scrolling capture. Acceptable range: 0 to 100 seconds.
    
</dd>
</dl>

<dl>
<dd>

**failOnError:** `Bool?` 
    
</dd>
</dl>

<dl>
<dd>

**longitude:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**latitude:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**proxy:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**headers:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**cookies:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**scrollToElement:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**selector:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**userAgent:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**acceptLanguages:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**customHtml:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**imageQuality:** `Double?` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkScreenshotCapture</a>(apiKey: String, format: BulkScreenshotCaptureRequestFormat?, request: Requests.BulkScreenshotCaptureRequest, requestOptions: RequestOptions?) -> BulkScreenshotCaptureResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Our Bulk Screenshot API allows you to capture screenshots of multiple webpages simultaneously, saving you time and effort. Instead of manually capturing each page one by one, you can batch process URLs and receive high-quality screenshots in the format you choose.
 Maximum `50 URLs` per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkScreenshotCapture(
        apiKey: "apiKey",
        request: .init(urls: [
            BulkScreenshotCaptureRequestUrlsItem(
                url: "url"
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkScreenshotCaptureRequestFormat?` 
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkScreenshotCaptureRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencyLatestRates</a>(apiKey: String, format: CurrencyLatestRatesRequestFormat?, base: String?, symbols: String?, updates: CurrencyLatestRatesRequestUpdates?, requestOptions: RequestOptions?) -> CurrencyLatestRatesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get live forex rates for all world currencies with customizable update frequency
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencyLatestRates(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencyLatestRatesRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**base:** `String?` — Base currency for rate calculations
    
</dd>
</dl>

<dl>
<dd>

**symbols:** `String?` — Comma separated list of desired currency codes
    
</dd>
</dl>

<dl>
<dd>

**updates:** `CurrencyLatestRatesRequestUpdates?` — Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencyHistoricalRates</a>(apiKey: String, format: CurrencyHistoricalRatesRequestFormat?, base: String?, symbols: String?, date: CalendarDate, requestOptions: RequestOptions?) -> CurrencyHistoricalRatesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get historical exchange rates for any specific date
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencyHistoricalRates(
        apiKey: "apiKey",
        date: CalendarDate("2023-01-15")!
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencyHistoricalRatesRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**base:** `String?` — Base currency for rate calculations
    
</dd>
</dl>

<dl>
<dd>

**symbols:** `String?` — Comma separated list of desired currency codes
    
</dd>
</dl>

<dl>
<dd>

**date:** `CalendarDate` — Specific date in YYYY-MM-DD format
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencyConvertLatest</a>(apiKey: String, format: CurrencyConvertLatestRequestFormat?, from: String, to: String, amount: String?, updates: CurrencyConvertLatestRequestUpdates?, requestOptions: RequestOptions?) -> CurrencyConvertLatestResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Convert amount between currencies using the latest exchange rates
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencyConvertLatest(
        apiKey: "apiKey",
        from: "from",
        to: "to"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencyConvertLatestRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — Source currency code
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — Target currency code
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String?` — Amount to convert
    
</dd>
</dl>

<dl>
<dd>

**updates:** `CurrencyConvertLatestRequestUpdates?` — Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencyConvertHistorical</a>(apiKey: String, format: CurrencyConvertHistoricalRequestFormat?, from: String, to: String, amount: String?, date: CalendarDate, requestOptions: RequestOptions?) -> CurrencyConvertHistoricalResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Convert amount between currencies using historical rates
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencyConvertHistorical(
        apiKey: "apiKey",
        from: "from",
        to: "to",
        date: CalendarDate("2023-01-15")!
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencyConvertHistoricalRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — From currency symbol
    
</dd>
</dl>

<dl>
<dd>

**to:** `String` — To currency symbol
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String?` — The Amount to be converted
    
</dd>
</dl>

<dl>
<dd>

**date:** `CalendarDate` — specific date (format YYYY-MM-DD) of which exchange rates is used.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencyTimeSeries</a>(apiKey: String, format: CurrencyTimeSeriesRequestFormat?, startDate: CalendarDate, endDate: CalendarDate?, base: String?, symbols: String?, requestOptions: RequestOptions?) -> CurrencyTimeSeriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get exchange rates for a time range
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencyTimeSeries(
        apiKey: "apiKey",
        startDate: CalendarDate("2023-01-15")!
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencyTimeSeriesRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate` — Start date (format YYYY-MM-DD) of the preferred time frame
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate?` — End date (format YYYY-MM-DD) of the preferred time frame
    
</dd>
</dl>

<dl>
<dd>

**base:** `String?` — Base currency
    
</dd>
</dl>

<dl>
<dd>

**symbols:** `String?` — comma separated list of desired currencies/ commodities symbols
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencyFluctuation</a>(apiKey: String, format: CurrencyFluctuationRequestFormat?, startDate: CalendarDate, endDate: CalendarDate?, base: String?, symbols: String?, requestOptions: RequestOptions?) -> CurrencyFluctuationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get currency fluctuation data for a time period
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencyFluctuation(
        apiKey: "apiKey",
        startDate: CalendarDate("2023-01-15")!,
        base: "USD"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencyFluctuationRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate` — Start date (format YYYY-MM-DD) of the preferred time frame
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate?` — End date (format YYYY-MM-DD) of the preferred time frame
    
</dd>
</dl>

<dl>
<dd>

**base:** `String?` — Base currency
    
</dd>
</dl>

<dl>
<dd>

**symbols:** `String?` — comma separated list of desired currencies/ commodities symbols
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencyConvertByIp</a>(apiKey: String, format: CurrencyConvertByIpRequestFormat?, updates: CurrencyConvertByIpRequestUpdates?, from: String, ip: String?, amount: String?, requestOptions: RequestOptions?) -> CurrencyConvertByIpResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Convert amount using user's location
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencyConvertByIp(
        apiKey: "apiKey",
        from: "from"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencyConvertByIpRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**updates:** `CurrencyConvertByIpRequestUpdates?` — Exchange rates update period (1d=daily, 1h=hourly, 10m=10 minutes, 1m=1 minute)
    
</dd>
</dl>

<dl>
<dd>

**from:** `String` — From currency symbol
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IPv4 or IPv6 geolocated currency
    
</dd>
</dl>

<dl>
<dd>

**amount:** `String?` — Amount to convert
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencySupported</a>(apiKey: String, format: CurrencySupportedRequestFormat?, requestOptions: RequestOptions?) -> CurrencySupportedResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get list of all supported currencies with their metadata
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencySupported(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencySupportedRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencySymbols</a>(apiKey: String, format: CurrencySymbolsRequestFormat?, requestOptions: RequestOptions?) -> CurrencySymbolsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get currency symbols and codes
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencySymbols(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencySymbolsRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currencyHistoricalLimits</a>(apiKey: String, format: CurrencyHistoricalLimitsRequestFormat?, requestOptions: RequestOptions?) -> CurrencyHistoricalLimitsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get information about historical data availability and limits
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currencyHistoricalLimits(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrencyHistoricalLimitsRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">commodityLatestRates</a>(apiKey: String, format: CommodityLatestRatesRequestFormat?, symbols: String, updates: CommodityLatestRatesRequestUpdates, quote: String?, requestOptions: RequestOptions?) -> CommodityLatestRatesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get live commodity rates with customizable update frequency
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.commodityLatestRates(
        apiKey: "apiKey",
        symbols: "symbols",
        updates: .tenM
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CommodityLatestRatesRequestFormat?` — Format of the Response
    
</dd>
</dl>

<dl>
<dd>

**symbols:** `String` — Comma separated list of desired commodities symbols *(e.g. XAU,XAG,WTI,BRENT)* **Required**
    
</dd>
</dl>

<dl>
<dd>

**updates:** `CommodityLatestRatesRequestUpdates` — Exchange rates update period. Possible values are: (1) `10m` - 10 minute update (2) `1m` - 1 minute update **Required**
    
</dd>
</dl>

<dl>
<dd>

**quote:** `String?` — Specifies the target currency for the exchange rate; default quote currency is the market currency of commodity *(e.g. USD, EUR, INR)*
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">commodityHistoricalRates</a>(apiKey: String, format: CommodityHistoricalRatesRequestFormat?, date: CalendarDate, symbols: String, requestOptions: RequestOptions?) -> CommodityHistoricalRatesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get historical commodity rates for a specific date
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.commodityHistoricalRates(
        apiKey: "apiKey",
        date: CalendarDate("2023-01-15")!,
        symbols: "symbols"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CommodityHistoricalRatesRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**date:** `CalendarDate` — Historical date (YYYY-MM-DD)
    
</dd>
</dl>

<dl>
<dd>

**symbols:** `String` — Comma-separated list of commodity symbols **Required**
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">commodityFluctuation</a>(apiKey: String, format: CommodityFluctuationRequestFormat?, symbols: String?, startDate: CalendarDate, endDate: CalendarDate, requestOptions: RequestOptions?) -> CommodityFluctuationResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get commodity price fluctuation data for a time period
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.commodityFluctuation(
        apiKey: "apiKey",
        symbols: "symbols",
        startDate: CalendarDate("2023-01-15")!,
        endDate: CalendarDate("2023-01-15")!
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CommodityFluctuationRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**symbols:** `String` — Comma-separated list of commodity symbols **Required**
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate` — Start date (YYYY-MM-DD)
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate` — End date (YYYY-MM-DD)
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">commodityTimeSeries</a>(apiKey: String, format: CommodityTimeSeriesRequestFormat?, symbols: String, startDate: CalendarDate, endDate: CalendarDate, requestOptions: RequestOptions?) -> CommodityTimeSeriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get commodity rates for a time range
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.commodityTimeSeries(
        apiKey: "apiKey",
        symbols: "symbols",
        startDate: CalendarDate("2023-01-15")!,
        endDate: CalendarDate("2023-01-15")!
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CommodityTimeSeriesRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**symbols:** `String` — Comma-separated list of commodity symbols **Required**
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate` — Start date (YYYY-MM-DD)
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate` — End date (YYYY-MM-DD)
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">commoditySymbols</a>(apiKey: String, format: CommoditySymbolsRequestFormat?, requestOptions: RequestOptions?) -> CommoditySymbolsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get list of supported commodities
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.commoditySymbols(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CommoditySymbolsRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">vatSupportedCountries</a>(apiKey: String, format: VatSupportedCountriesRequestFormat?, type: VatSupportedCountriesRequestType?, requestOptions: RequestOptions?) -> VatSupportedCountriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves a list of supported countries.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.vatSupportedCountries(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `VatSupportedCountriesRequestFormat?` — Format of the response. Default is JSON.
    
</dd>
</dl>

<dl>
<dd>

**type:** `VatSupportedCountriesRequestType?` — Type of supported country. Supported values: IBAN, SWIFT, VAT. By default, it returns all supported countries for all types.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">vatRateByIp</a>(apiKey: String, format: VatRateByIpRequestFormat?, ipAddress: String?, requestOptions: RequestOptions?) -> [VatRateByIpResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetches VAT rate based on the specified or originating IP address.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.vatRateByIp(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `VatRateByIpRequestFormat?` — Specify the desired response format. Options: 'json' (default) or 'xml'.
    
</dd>
</dl>

<dl>
<dd>

**ipAddress:** `String?` — IPv4 or IPv6 address to look up VAT rate for. If omitted, the originating IP address will be used.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">vatRateByCountry</a>(apiKey: String, format: VatRateByCountryRequestFormat?, country: String, state: String?, requestOptions: RequestOptions?) -> [VatRateByCountryResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetches VAT rates for a single country or state provided via query parameters.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.vatRateByCountry(
        apiKey: "apiKey",
        country: "country"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `VatRateByCountryRequestFormat?` — Specify the desired response format. Options: 'json' (default) or 'xml'.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Country identifier in Alpha-2 (PK), Alpha-3 (PAK), or full name (Pakistan). Combine with the optional "state" query for sub-national VAT; values are case-insensitive and may use underscores instead of spaces.
    
</dd>
</dl>

<dl>
<dd>

**state:** `String?` — Optional state or region in Alpha-2 (NY) or full name (New_York). Use with "country" for state-level VAT; values are case-insensitive and may use underscores.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkVatRateByCountry</a>(apiKey: String, format: BulkVatRateByCountryRequestFormat?, request: Requests.BulkVatRateByCountryRequest, requestOptions: RequestOptions?) -> BulkVatRateByCountryResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieves VAT details for multiple countries or country-state combinations in a single request. Maximum of `100` entries per request are allowed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkVatRateByCountry(
        apiKey: "apiKey",
        request: .init(countries: [
            BulkVatRateByCountryRequestCountriesItem(
                country: "PAK"
            ),
            BulkVatRateByCountryRequestCountriesItem(
                country: "United_States",
                state: "New_York"
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkVatRateByCountryRequestFormat?` — Specify the desired response format. Options: 'json' (default) or 'xml'.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkVatRateByCountryRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">vatValidate</a>(apiKey: String, format: VatValidateRequestFormat?, vatNumber: String, requesterVatNumber: String?, requestOptions: RequestOptions?) -> VatValidateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates an EU or UK VAT number and returns registration status details.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.vatValidate(
        apiKey: "apiKey",
        vatNumber: "vatNumber"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `VatValidateRequestFormat?` — Specify the desired response format. Options: 'json' (default) or 'xml'.
    
</dd>
</dl>

<dl>
<dd>

**vatNumber:** `String` — EU or UK VAT number to validate.
    
</dd>
</dl>

<dl>
<dd>

**requesterVatNumber:** `String?` — Requester EU or UK VAT number.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">ibanValidate</a>(apiKey: String, format: IbanValidateRequestFormat?, iban: String, requestOptions: RequestOptions?) -> IbanValidateResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Checks an IBAN for structural validity, checksum accuracy, and bank metadata.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.ibanValidate(
        apiKey: "apiKey",
        iban: "iban"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `IbanValidateRequestFormat?` — Specify the desired response format. Options: 'json' (default) or 'xml'.
    
</dd>
</dl>

<dl>
<dd>

**iban:** `String` — IBAN to validate.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">swiftCodeFind</a>(apiKey: String, format: SwiftCodeFindRequestFormat?, country: String?, bank: String?, city: String?, requestOptions: RequestOptions?) -> [String]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetches SWIFT codes for a given country, bank, and city.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.swiftCodeFind(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `SwiftCodeFindRequestFormat?` — Specify the desired response format. Options: 'json' (default) or 'xml'.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — Country name (accepts full name, e.g., Pakistan, United States). If only the country parameter is supplied, lists all banks in the country.
    
</dd>
</dl>

<dl>
<dd>

**bank:** `String?` — Bank name (upper case) used to filter SWIFT codes. Should be used together with the country parameter. If only country and bank are provided (without city), returns the list of cities for that bank.
    
</dd>
</dl>

<dl>
<dd>

**city:** `String?` — Gives SWIFT codes for a bank. Optionally specify the city (upper case) to narrow results to a specific city for that bank.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">swiftCodeLookup</a>(apiKey: String, format: SwiftCodeLookupRequestFormat?, swiftCode: String, requestOptions: RequestOptions?) -> SwiftCodeLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Fetches detailed information about a SWIFT code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.swiftCodeLookup(
        apiKey: "apiKey",
        swiftCode: "swiftCode"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `SwiftCodeLookupRequestFormat?` — Specify the desired response format. Options: 'json' (default) or 'xml'.
    
</dd>
</dl>

<dl>
<dd>

**swiftCode:** `String` — SWIFT/BIC code to lookup (must be 8 or 11 characters).
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">zipcodeLookup</a>(apiKey: String, format: ZipcodeLookupRequestFormat?, code: String, country: String?, requestOptions: RequestOptions?) -> ZipcodeLookupResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.zipcodeLookup(
        apiKey: "apiKey",
        code: "code"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `ZipcodeLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**code:** `String` — Comma separated list of postal / zip codes. Max. 100 values.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — Country code in ISO 3166-1 alpha-2 format. If not provided, search results will be returned from all countries.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkZipcodeLookup</a>(apiKey: String, format: BulkZipcodeLookupRequestFormat?, request: Requests.BulkZipcodeLookupRequest, requestOptions: RequestOptions?) -> BulkZipcodeLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Validates a bulk of ZIP/postal codes and returns result for each. Maximum `100` ZIP/postal codes per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkZipcodeLookup(
        apiKey: "apiKey",
        request: .init(codes: [
            "codes"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkZipcodeLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkZipcodeLookupRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">zipcodeSearchByCity</a>(apiKey: String, format: ZipcodeSearchByCityRequestFormat?, city: String, country: String, stateName: String?, page: Int?, requestOptions: RequestOptions?) -> ZipcodeSearchByCityResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.zipcodeSearchByCity(
        apiKey: "apiKey",
        city: "city",
        country: "country"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `ZipcodeSearchByCityRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**city:** `String` — Name of the city in which we want to find zipcodes in.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Country code in ISO 3166-1 alpha-2 format.
    
</dd>
</dl>

<dl>
<dd>

**stateName:** `String?` — Name of the state or province associated with the country.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` — Page number to retrieve paginated results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">zipcodeSearchByRegion</a>(apiKey: String, format: ZipcodeSearchByRegionRequestFormat?, country: String, region: String, page: Int?, requestOptions: RequestOptions?) -> ZipcodeSearchByRegionResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.zipcodeSearchByRegion(
        apiKey: "apiKey",
        country: "country",
        region: "region"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `ZipcodeSearchByRegionRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Country code in ISO 3166-1 alpha-2 format.
    
</dd>
</dl>

<dl>
<dd>

**region:** `String` — Name of the region, state or province associated with the country.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` — Page no. to retrieve paginated results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">zipcodeSearchByRadius</a>(apiKey: String, format: ZipcodeSearchByRadiusRequestFormat?, code: String?, lat: Float?, long: Float?, country: String?, radius: Float, unit: ZipcodeSearchByRadiusRequestUnit?, page: Int?, requestOptions: RequestOptions?) -> ZipcodeSearchByRadiusResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.zipcodeSearchByRadius(
        apiKey: "apiKey",
        radius: 1.1
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `ZipcodeSearchByRadiusRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**code:** `String?` — Postal/Zip code to be used as the center point for the search.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Float?` — Latitude coordinate for the base location.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Float?` — Longitude coordinate for the base location.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String?` — Country code in ISO 3166-1 alpha-2 format. Required only when using the code parameter.
    
</dd>
</dl>

<dl>
<dd>

**radius:** `Float` — Search radius for the query. The maximum allowed values are: - 100 km - 100 mi - 109361 yd - 100000 m - 328084 ft - 3937007.75 in
    
</dd>
</dl>

<dl>
<dd>

**unit:** `ZipcodeSearchByRadiusRequestUnit?` — Supported distance units are m, km, mi, ft, yd, in.
    
</dd>
</dl>

<dl>
<dd>

**page:** `Int?` — Page no. to retrieve paginated results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">zipcodeDistance</a>(apiKey: String, format: ZipcodeDistanceRequestFormat?, request: Requests.ZipcodeDistanceRequest, requestOptions: RequestOptions?) -> ZipcodeDistanceResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get distance between postal codes. Maximum `100` postal codes per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.zipcodeDistance(
        apiKey: "apiKey",
        request: .init(
            compare: [
                "compare"
            ],
            country: "country"
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `ZipcodeDistanceRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ZipcodeDistanceRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">zipcodeDistanceMatch</a>(apiKey: String, format: ZipcodeDistanceMatchRequestFormat?, request: Requests.ZipcodeDistanceMatchRequest, requestOptions: RequestOptions?) -> ZipcodeDistanceMatchResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get matching ZIP/postal code pairs within a specified distance. Maximum `100` postal codes per request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.zipcodeDistanceMatch(
        apiKey: "apiKey",
        request: .init(
            codes: [
                "codes"
            ],
            country: "country"
        )
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `ZipcodeDistanceMatchRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ZipcodeDistanceMatchRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">currentWeather</a>(apiKey: String, format: CurrentWeatherRequestFormat?, location: String?, lat: Double?, long: Double?, ip: String?, timezone: String?, requestOptions: RequestOptions?) -> CurrentWeatherResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get current weather data including temperature, humidity, precipitation, wind conditions, atmospheric pressure, and air quality for any location. Accepts city names, coordinates, or IP addresses. Also includes astronomy data and timezone-aware timestamps.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.currentWeather(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `CurrentWeatherRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — City name, place name, or full address.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Double?` — Latitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Double?` — Longitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP(v4 or v6) address for location inference.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — Timezone for the results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkCurrentWeather</a>(apiKey: String, format: BulkCurrentWeatherRequestFormat?, timezone: String?, request: Requests.BulkCurrentWeatherRequest, requestOptions: RequestOptions?) -> BulkCurrentWeatherResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve current weather conditions for up to `50 locations` in a single request. A maximum of 50 locations (city names, IP addresses, or geographic coordinates) can be included in the request body.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkCurrentWeather(
        apiKey: "apiKey",
        request: .init(locations: [
            BulkCurrentWeatherRequestLocationsItem(
                location: "lahore"
            ),
            BulkCurrentWeatherRequestLocationsItem(
                lat: 32.5,
                long: 74.5
            ),
            BulkCurrentWeatherRequestLocationsItem(
                ip: "8.8.8.8"
            ),
            BulkCurrentWeatherRequestLocationsItem(
                location: "seoul"
            )
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkCurrentWeatherRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — Timezone for the results.
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkCurrentWeatherRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">weatherForecast</a>(apiKey: String, format: WeatherForecastRequestFormat?, startDate: CalendarDate?, endDate: CalendarDate?, forecastDays: Int?, location: String?, lat: Double?, long: Double?, ip: String?, precision: WeatherForecastRequestPrecision?, timezone: String?, requestOptions: RequestOptions?) -> WeatherForecastResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Access comprehensive weather forecasts with customizable precision - choose from daily overviews, hourly breakdowns, or even minute-by-minute data. Configure your date ranges or use the default 7-day forecast for standard weather planning.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.weatherForecast(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `WeatherForecastRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate?` — Start date for the forecast in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between startDate and endDate must not exceed 16 days.
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate?` — End date for the forecast in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between startDate and endDate must not exceed 16 days.
    
</dd>
</dl>

<dl>
<dd>

**forecastDays:** `Int?` — Number of days for the forecast, from 1 to 16. Default is 7. Maximum value is 16.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — City name, place name, or full address.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Double?` — Latitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Double?` — Longitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP(v4 or v6) address for location inference.
    
</dd>
</dl>

<dl>
<dd>

**precision:** `WeatherForecastRequestPrecision?` — Precision of the forecast data.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — Timezone for the results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">historicalWeather</a>(apiKey: String, format: HistoricalWeatherRequestFormat?, date: CalendarDate, location: String?, lat: Double?, long: Double?, ip: String?, precision: HistoricalWeatherRequestPrecision?, timezone: String?, requestOptions: RequestOptions?) -> HistoricalWeatherResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Access past weather conditions for specific dates with records going back to 1940. Retrieve comprehensive historical data with both daily and hourly precision options.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.historicalWeather(
        apiKey: "apiKey",
        date: CalendarDate("2023-01-15")!
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `HistoricalWeatherRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**date:** `CalendarDate` — Specific date for which to fetch weather data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — City name, place name, or full address.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Double?` — Latitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Double?` — Longitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP(v4 or v6) address for location inference.
    
</dd>
</dl>

<dl>
<dd>

**precision:** `HistoricalWeatherRequestPrecision?` — Precision of the historical data. **Note:** 'daily' returns daily aggregates, 'hourly' returns hourly data.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — Timezone for the results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">weatherTimeSeries</a>(apiKey: String, format: WeatherTimeSeriesRequestFormat?, startDate: CalendarDate, endDate: CalendarDate, location: String?, lat: Double?, long: Double?, ip: String?, precision: WeatherTimeSeriesRequestPrecision?, timezone: String?, requestOptions: RequestOptions?) -> WeatherTimeSeriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Pull historical weather information for date ranges up to 90 days (daily data) or 7 days (hourly data). Get consistent formatting across your specified date range with reliable historical weather patterns.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.weatherTimeSeries(
        apiKey: "apiKey",
        startDate: CalendarDate("2023-01-15")!,
        endDate: CalendarDate("2023-01-15")!
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `WeatherTimeSeriesRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate` — Starting date for the data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards. For precision=daily, the difference between endDate and startDate must not exceed 90 days. For precision=hourly, the difference must not exceed 7 days.
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate` — End date for the data in YYYY-MM-DD format. Historical dates must be past dates only. Current or future dates are not allowed for historical data. Data available from 1940 onwards. For precision=daily, the difference between endDate and startDate must not exceed 90 days. For precision=hourly, the difference must not exceed 7 days.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — City name, place name, or full address.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Double?` — Latitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Double?` — Longitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP(v4 or v6) address for location inference.
    
</dd>
</dl>

<dl>
<dd>

**precision:** `WeatherTimeSeriesRequestPrecision?` — Precision of the data.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — Timezone for the results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">marineWeather</a>(apiKey: String, format: MarineWeatherRequestFormat?, startDate: CalendarDate?, endDate: CalendarDate?, location: String?, lat: Double?, long: Double?, ip: String?, precision: MarineWeatherRequestPrecision?, timezone: String?, requestOptions: RequestOptions?) -> MarineWeatherResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides hourly forecasts of marine conditions including wave heights, wave directions, wave periods, swell info, sea surface temperatures, and ocean currents. Supports multiple geographical points and returns daily max wave statistics for up to 7 days. Ideal for maritime planning, navigation, and coastal activities.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.marineWeather(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `MarineWeatherRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate?` — Starting date for marine forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate?` — End date for marine forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — City name, place name, or full address.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Double?` — Latitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Double?` — Longitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP(v4 or v6) address for location inference.
    
</dd>
</dl>

<dl>
<dd>

**precision:** `MarineWeatherRequestPrecision?` — Precision of the marine data.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — Timezone for the results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">airQuality</a>(apiKey: String, format: AirQualityRequestFormat?, startDate: CalendarDate?, endDate: CalendarDate?, location: String?, lat: Double?, long: Double?, ip: String?, precision: AirQualityRequestPrecision?, timezone: String?, requestOptions: RequestOptions?) -> AirQualityResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Monitor and predict air quality conditions using European and US AQI standards. Track pollutant concentrations including PM10, PM2.5, carbon monoxide, nitrogen dioxide, sulfur dioxide, ozone, and dust particles. Get current readings plus hourly forecasts up to 5 days ahead, complete with UV index and aerosol measurements for comprehensive air quality assessment.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.airQuality(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `AirQualityRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate?` — Starting date for AQI forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 5 days.
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate?` — End date for AQI forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 5 days.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — City name, place name, or full address.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Double?` — Latitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Double?` — Longitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP(v4 or v6) address for location inference.
    
</dd>
</dl>

<dl>
<dd>

**precision:** `AirQualityRequestPrecision?` — Only hourly precision is supported; returns hourly AQI data for the selected date range.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — Timezone for the results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">floodForecast</a>(apiKey: String, format: FloodForecastRequestFormat?, startDate: CalendarDate, endDate: CalendarDate, location: String?, lat: Double?, long: Double?, ip: String?, precision: FloodForecastRequestPrecision?, timezone: String?, requestOptions: RequestOptions?) -> FloodForecastResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Provides flood forecast data for a given location, including river discharge metrics such as mean, median, maximum, minimum, and percentile values (p25, p75). Requires a startDate and endDate, with the date range limited to 16 days. Location can be specified using city name, latitude/longitude, or IP address.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.floodForecast(
        apiKey: "apiKey",
        startDate: CalendarDate("2023-01-15")!,
        endDate: CalendarDate("2023-01-15")!
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `FloodForecastRequestFormat?` — Response format returned by the API.
    
</dd>
</dl>

<dl>
<dd>

**startDate:** `CalendarDate` — Starting date for flood forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    
</dd>
</dl>

<dl>
<dd>

**endDate:** `CalendarDate` — End date for flood forecast data in YYYY-MM-DD format. Forecast dates must be current or future dates only. Past dates are not allowed for forecast data. The difference between endDate and startDate must not exceed 16 days.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — City name, place name, or full address.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Double?` — Latitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Double?` — Longitude of the location.
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP(v4 or v6) address for location inference.
    
</dd>
</dl>

<dl>
<dd>

**precision:** `FloodForecastRequestPrecision?` — Only daily precision is supported; returns flood forecast data for the selected date range.
    
</dd>
</dl>

<dl>
<dd>

**timezone:** `String?` — Timezone for the results.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getCountries</a>(apiKey: String, format: GetCountriesRequestFormat?, region: String?, subregion: String?, requestOptions: RequestOptions?) -> GetCountriesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve countries, optionally filtered by region or subregion.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getCountries(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetCountriesRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**region:** `String?` — Optional filter to return countries within a specific region from the region endpoint.
    
</dd>
</dl>

<dl>
<dd>

**subregion:** `String?` — Optional filter to return countries within a specific subregion from the subregion endpoint.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getCountryDetails</a>(apiKey: String, format: GetCountryDetailsRequestFormat?, country: String, requestOptions: RequestOptions?) -> GetCountryDetailsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getCountryDetails(
        apiKey: "apiKey",
        country: "country"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetCountryDetailsRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Country code in ISO 3166-1 alpha-2 format.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getRegions</a>(apiKey: String, format: GetRegionsRequestFormat?, requestOptions: RequestOptions?) -> GetRegionsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getRegions(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetRegionsRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getSubregions</a>(apiKey: String, format: GetSubregionsRequestFormat?, region: String, requestOptions: RequestOptions?) -> GetSubregionsResponse</code></summary>
<dl>
<dd>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getSubregions(
        apiKey: "apiKey",
        region: "region"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetSubregionsRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**region:** `String` — Name of the region.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getAdminLevels</a>(apiKey: String, format: GetAdminLevelsRequestFormat?, country: String, requestOptions: RequestOptions?) -> GetAdminLevelsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve administrative units based on ISO 3166-1 alpha-2 country code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getAdminLevels(
        apiKey: "apiKey",
        country: "country"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetAdminLevelsRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Country code in ISO 3166-1 alpha-2 format
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getAdminUnits</a>(apiKey: String, format: GetAdminUnitsRequestFormat?, country: String, adminLevels: String?, requestOptions: RequestOptions?) -> GetAdminUnitsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve administrative divisions for a given country using ISO 3166-1 alpha-2 country codes. You can optionally filter by administrative levels.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getAdminUnits(
        apiKey: "apiKey",
        country: "country"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetAdminUnitsRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Country code in ISO 3166-1 alpha-2 format.
    
</dd>
</dl>

<dl>
<dd>

**adminLevels:** `String?` — Comma-separated list to filter results by one or more administrative levels.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getAdminUnitDetails</a>(apiKey: String, format: GetAdminUnitDetailsRequestFormat?, country: String, adminUnit: String, requestOptions: RequestOptions?) -> GetAdminUnitDetailsResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve detailed administrative unit information by country and optionally filtered by admin code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getAdminUnitDetails(
        apiKey: "apiKey",
        country: "country",
        adminUnit: "admin_unit"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetAdminUnitDetailsRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Country code in ISO 3166-1 alpha-2 format.
    
</dd>
</dl>

<dl>
<dd>

**adminUnit:** `String` — Optional admin code to fetch details for a specific administrative unit.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getCities</a>(apiKey: String, format: GetCitiesRequestFormat?, country: String, adminUnit: String?, requestOptions: RequestOptions?) -> GetCitiesResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve a list of cities within a country, optionally filtered by an administrative unit code.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getCities(
        apiKey: "apiKey",
        country: "country"
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetCitiesRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**country:** `String` — Country code in ISO 3166-1 alpha-2 format.
    
</dd>
</dl>

<dl>
<dd>

**adminUnit:** `String?` — Administrative unit code used to filter cities within a specific region.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getSupportedFlags</a>(apiKey: String, requestOptions: RequestOptions?) -> [GetSupportedFlagsResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Get list of all supported flags with their metadata
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getSupportedFlags(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">getFlags</a>(apiKey: String, name: String, shape: GetFlagsRequestShape, format: GetFlagsRequestFormat?, size: GetFlagsRequestSize?, type: GetFlagsRequestType, requestOptions: RequestOptions?) -> Data</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve the flag for a specific country
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.getFlags(
        apiKey: "apiKey",
        name: "name",
        shape: .flat,
        type: .country
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**name:** `String` — Country code in ISO 3166-1 alpha-2 format.
    
</dd>
</dl>

<dl>
<dd>

**shape:** `GetFlagsRequestShape` — Flag shape. One of: `'flat'` or `'round'`.
    
</dd>
</dl>

<dl>
<dd>

**format:** `GetFlagsRequestFormat?` — Flag format. Applicable only for PNG or WEBP formats. Default is png.
    
</dd>
</dl>

<dl>
<dd>

**size:** `GetFlagsRequestSize?` — Flag size in pixels. Valid options: `16px`, `24px`, `32px`, `48px`, `64px`. Applicable only for PNG or WEBP formats.
    
</dd>
</dl>

<dl>
<dd>

**type:** `GetFlagsRequestType` — Type of flag. One of: `country` or `organization`.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">timezoneLookup</a>(apiKey: String, format: TimezoneLookupRequestFormat?, ip: String?, tz: String?, location: String?, lat: Float?, long: Float?, lang: TimezoneLookupRequestLang?, iataCode: String?, icaoCode: String?, loCode: String?, requestOptions: RequestOptions?) -> TimezoneLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve current time, date, and timezone-related information by specifying a timezone name, location address, location coordinates, IP address, or use the client IP address if no parameter is passed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.timezoneLookup(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `TimezoneLookupRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IPv4 or IPv6 address to extract timezone information.
    
</dd>
</dl>

<dl>
<dd>

**tz:** `String?` — Timezone name (e.g., "Asia/Kolkata") to retrieve information directly.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — Location string (preferably city and country) to extract timezone.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Float?` — Latitude for geolocation lookup.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Float?` — Longitude for geolocation lookup.
    
</dd>
</dl>

<dl>
<dd>

**lang:** `TimezoneLookupRequestLang?` — Language code for response localization (default is "en").
    
</dd>
</dl>

<dl>
<dd>

**iataCode:** `String?` — 3-letter IATA airport code (e.g., JFK).
    
</dd>
</dl>

<dl>
<dd>

**icaoCode:** `String?` — 4-letter ICAO airport code (e.g., KJFK).
    
</dd>
</dl>

<dl>
<dd>

**loCode:** `String?` — 5-letter UN/LO city code.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">timezoneLookupV2</a>(apiKey: String, format: TimezoneLookupRequestFormat?, ip: String?, tz: String?, location: String?, lat: Float?, long: Float?, lang: TimezoneLookupRequestLang?, iataCode: String?, icaoCode: String?, loCode: String?, requestOptions: RequestOptions?) -> TimezoneLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve current time, date, and timezone-related information by specifying a timezone name, location address, location coordinates, IP address, or use the client IP address if no parameter is passed (v2.0 endpoint).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.timezoneLookupV2(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `TimezoneLookupRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IPv4 or IPv6 address to extract timezone information.
    
</dd>
</dl>

<dl>
<dd>

**tz:** `String?` — Timezone name (e.g., "Asia/Kolkata") to retrieve information directly.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — Location string (preferably city and country) to extract timezone.
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Float?` — Latitude for geolocation lookup.
    
</dd>
</dl>

<dl>
<dd>

**long:** `Float?` — Longitude for geolocation lookup.
    
</dd>
</dl>

<dl>
<dd>

**lang:** `TimezoneLookupRequestLang?` — Language code for response localization (default is "en").
    
</dd>
</dl>

<dl>
<dd>

**iataCode:** `String?` — 3-letter IATA airport code (e.g., JFK).
    
</dd>
</dl>

<dl>
<dd>

**icaoCode:** `String?` — 4-letter ICAO airport code (e.g., KJFK).
    
</dd>
</dl>

<dl>
<dd>

**loCode:** `String?` — 5-letter UN/LO city code.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">timezoneConvert</a>(apiKey: String, format: TimezoneConvertRequestFormat?, time: String?, tzFrom: String?, tzTo: String?, latFrom: Double?, longFrom: Double?, latTo: Double?, longTo: Double?, locationFrom: String?, locationTo: String?, iataFrom: String?, iataTo: String?, icaoFrom: String?, icaoTo: String?, locodeFrom: String?, locodeTo: String?, requestOptions: RequestOptions?) -> TimezoneConvertResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Converts a given time from one timezone to another using various input types like timezone name, coordinates, location, or codes.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.timezoneConvert(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `TimezoneConvertRequestFormat?` — Format of the response .
    
</dd>
</dl>

<dl>
<dd>

**time:** `String?` — Time to convert in `yyyy-MM-dd HH:mm` or `yyyy-MM-dd HH:mm:ss` format.
    
</dd>
</dl>

<dl>
<dd>

**tzFrom:** `String?` — Source timezone name (e.g., `Asia/Kolkata`).
    
</dd>
</dl>

<dl>
<dd>

**tzTo:** `String?` — Target timezone name (e.g., `America/New_York`).
    
</dd>
</dl>

<dl>
<dd>

**latFrom:** `Double?` — Latitude of source location.
    
</dd>
</dl>

<dl>
<dd>

**longFrom:** `Double?` — Longitude of source location.
    
</dd>
</dl>

<dl>
<dd>

**latTo:** `Double?` — Latitude of target location.
    
</dd>
</dl>

<dl>
<dd>

**longTo:** `Double?` — Longitude of target location.
    
</dd>
</dl>

<dl>
<dd>

**locationFrom:** `String?` — From location (city/country).
    
</dd>
</dl>

<dl>
<dd>

**locationTo:** `String?` — To location (city/country).
    
</dd>
</dl>

<dl>
<dd>

**iataFrom:** `String?` — From IATA airport code (e.g., JFK).
    
</dd>
</dl>

<dl>
<dd>

**iataTo:** `String?` — To IATA airport code.
    
</dd>
</dl>

<dl>
<dd>

**icaoFrom:** `String?` — From ICAO airport code (e.g., KJFK).
    
</dd>
</dl>

<dl>
<dd>

**icaoTo:** `String?` — To ICAO airport code.
    
</dd>
</dl>

<dl>
<dd>

**locodeFrom:** `String?` — From UN/LO CODE.
    
</dd>
</dl>

<dl>
<dd>

**locodeTo:** `String?` — To UN/LO CODE.
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">userAgentLookup</a>(apiKey: String, format: UserAgentLookupRequestFormat?, userAgent: String, requestOptions: RequestOptions?) -> UserAgentLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Parse User Agent string to get detailed browser, device, and operating system information
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.userAgentLookup(apiKey: "apiKey", userAgent: "User-Agent")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `UserAgentLookupRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**userAgent:** `String` — User-Agent string to parse. Sent as the `User-Agent` HTTP header. **Required**
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">bulkUserAgentLookup</a>(apiKey: String, format: BulkUserAgentLookupRequestFormat?, request: Requests.BulkUserAgentLookupRequest, requestOptions: RequestOptions?) -> [BulkUserAgentLookupResponseItem]</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Parse up to `50,000 User-Agent strings` at once in a single request.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.bulkUserAgentLookup(
        apiKey: "apiKey",
        request: .init(uaStrings: [
            "uaStrings"
        ])
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `BulkUserAgentLookupRequestFormat?` — Format of the response
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.BulkUserAgentLookupRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">ocrPredict</a>(apiKey: String, url: String?, model: OcrPredictRequestModel, pageRange: String?, zone: String?, newLine: Int?, request: Requests.OcrPredictRequest, requestOptions: RequestOptions?) -> OcrPredictResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Perform Optical Character Recognition (OCR) on images, PDFs, or ZIP archives. Supports two models: `mini-ocr-v1` for CAPTCHA-optimized OCR and `ocr-v1` for general-purpose document text extraction. Supports zonal OCR to extract text from specific regions of an image.

**Notes:**
- The `zone` query parameter cannot be given with .pdf and .zip types as it can only be applied to single image query.
- The `page_range` query parameter cannot be given in any other type except .pdf types.
- PDFs containing images in them are allowed only for processing.
- The `mini-ocr-v1` model doesn’t support the following query parameters:
    - `page_range` (.pdf types)
    - `zone`
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.ocrPredict(
        apiKey: "apiKey",
        model: .miniOcrV1,
        request: .init(ocrPredictRequestModel: .miniOcrV1)
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**url:** `String?` — URL of the image or PDF (required if `file` not provided)
    
</dd>
</dl>

<dl>
<dd>

**model:** `OcrPredictRequestModel` — OCR model to use.
    
</dd>
</dl>

<dl>
<dd>

**pageRange:** `String?` — Specify page range for multi-page PDFs (e.g., '1,3,5-10' or 'allpages'). **Note:** This parameter can only be used with .pdf file types.
    
</dd>
</dl>

<dl>
<dd>

**zone:** `String?` — Define OCR zones using coordinates (top:left:height:width). Multiple zones can be defined using commas. Only available for model 'ocr-v1'. **Note:** This parameter cannot be used with .pdf and .zip file types as it can only be applied to single image queries.
    
</dd>
</dl>

<dl>
<dd>

**newLine:** `Int?` — Set to 1 to split output text into individual lines (default: 0)
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.OcrPredictRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">grammarDetect</a>(apiKey: String, request: Requests.GrammarDetectRequest, requestOptions: RequestOptions?) -> GrammarDetectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Analyze text for grammar errors and return the exact words flagged as grammatically incorrect with zero-based word positions.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.grammarDetect(
        apiKey: "apiKey",
        request: .init(text: "The global mental is health crisis is now a serious and compelex problem. It need quick and ongoing action from policymakers, healthcare workers, and the whole society.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.GrammarDetectRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">grammarCorrect</a>(apiKey: String, request: Requests.GrammarCorrectRequest, requestOptions: RequestOptions?) -> GrammarCorrectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Submit text with grammatical issues and receive a clean grammar-corrected result for proofreading and content workflows.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.grammarCorrect(
        apiKey: "apiKey",
        request: .init(text: "The global mental is health crisis is now a serious and compelex problem. It need quick and ongoing action from policymakers, healthcare workers, and the whole society.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.GrammarCorrectRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">weakWordsDetect</a>(apiKey: String, request: Requests.WeakWordsDetectRequest, requestOptions: RequestOptions?) -> WeakWordsDetectResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Analyze text and return weak, vague, or filler words with zero-based word positions to help writers produce clearer and more concise content.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.weakWordsDetect(
        apiKey: "apiKey",
        request: .init(text: "Many people cannot get the support they need to handle their conditions well.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.WeakWordsDetectRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">readabilityScore</a>(apiKey: String, target: ReadabilityScoreRequestTarget?, exclude: String?, request: Requests.ReadabilityScoreRequest, requestOptions: RequestOptions?) -> ReadabilityScoreResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Analyze text readability using industry-standard formulas including Flesch Reading Ease, Flesch-Kincaid Grade Level, Gunning Fog Index, SMOG Index, Coleman-Liau Index, and Automated Readability Index.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.readabilityScore(
        apiKey: "apiKey",
        request: .init(text: "The global mental is health crisis is now a serious and compelex problem. It needs quick and ongoing action from policymakers, healthcare workers, and the whole society.")
    )
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**target:** `ReadabilityScoreRequestTarget?` — Target audience used to tune sentence difficulty levels
    
</dd>
</dl>

<dl>
<dd>

**exclude:** `String?` — Comma-separated response sections to omit. Possible values are readability_scores, sentence_readability, readability_grade
    
</dd>
</dl>

<dl>
<dd>

**request:** `Requests.ReadabilityScoreRequest` 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">astronomyLookup</a>(apiKey: String, format: AstronomyLookupRequestFormat?, location: String?, lat: Float?, long: Float?, ip: String?, lang: String?, date: CalendarDate?, elevation: Double?, timeZone: String?, requestOptions: RequestOptions?) -> AstronomyLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve sunrise and sunset times, current position of the moon, and other related information by specifying a location address, location coordinates, IP address, or using the client IP address if no parameter is passed.
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.astronomyLookup(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `AstronomyLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — Location name or address
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Float?` — Latitude for location coordinates
    
</dd>
</dl>

<dl>
<dd>

**long:** `Float?` — Longitude for location coordinates
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP address for location detection
    
</dd>
</dl>

<dl>
<dd>

**lang:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**date:** `CalendarDate?` — Date for astronomy data (YYYY-MM-DD)
    
</dd>
</dl>

<dl>
<dd>

**elevation:** `Double?` — Timezone of the location for which astronomy data is required
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

<details><summary><code>client.<a href="/Sources/APIFreaks.swift">astronomyLookupV2</a>(apiKey: String, format: AstronomyLookupRequestFormat?, location: String?, lat: Float?, long: Float?, ip: String?, lang: String?, date: CalendarDate?, elevation: Double?, timeZone: String?, requestOptions: RequestOptions?) -> AstronomyLookupResponse</code></summary>
<dl>
<dd>

#### 📝 Description

<dl>
<dd>

<dl>
<dd>

Retrieve sunrise and sunset times, current position of the moon, and other related information by specifying a location address, location coordinates, IP address, or using the client IP address if no parameter is passed (v2.0 endpoint).
</dd>
</dl>
</dd>
</dl>

#### 🔌 Usage

<dl>
<dd>

<dl>
<dd>

```swift
import Foundation
import APIFreaks

private func main() async throws {
    let client = APIFreaks()

    _ = try await client.astronomyLookupV2(apiKey: "apiKey")
}

try await main()
```
</dd>
</dl>
</dd>
</dl>

#### ⚙️ Parameters

<dl>
<dd>

<dl>
<dd>

**apiKey:** `String` — Your API key
    
</dd>
</dl>

<dl>
<dd>

**format:** `AstronomyLookupRequestFormat?` — Format of the response.
    
</dd>
</dl>

<dl>
<dd>

**location:** `String?` — Location name or address
    
</dd>
</dl>

<dl>
<dd>

**lat:** `Float?` — Latitude for location coordinates
    
</dd>
</dl>

<dl>
<dd>

**long:** `Float?` — Longitude for location coordinates
    
</dd>
</dl>

<dl>
<dd>

**ip:** `String?` — IP address for location detection
    
</dd>
</dl>

<dl>
<dd>

**lang:** `String?` 
    
</dd>
</dl>

<dl>
<dd>

**date:** `CalendarDate?` — Date for astronomy data (YYYY-MM-DD)
    
</dd>
</dl>

<dl>
<dd>

**elevation:** `Double?` — Timezone of the location for which astronomy data is required
    
</dd>
</dl>

<dl>
<dd>

**timeZone:** `String?` — 
    
</dd>
</dl>

<dl>
<dd>

**requestOptions:** `RequestOptions?` — Additional options for configuring the request, such as custom headers or timeout settings.
    
</dd>
</dl>
</dd>
</dl>


</dd>
</dl>
</details>

