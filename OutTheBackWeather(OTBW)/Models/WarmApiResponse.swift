import Foundation

struct WarmAPIResponse: Decodable {
    let latitude: Double
    let longitude: Double
    let generationtime_ms: Double
    let utc_offset_seconds: Int
    let timezone: String
    let timezone_abbreviation: String
    let elevation: Double
    let current_units: CurrentUnits
    let current: Current
    
    enum CodingKeys: String, CodingKey {
        case latitude, longitude, generationtime_ms, utc_offset_seconds, timezone, timezone_abbreviation, elevation, current_units, current
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        latitude = try container.decodeIfPresent(Double.self, forKey: .latitude) ?? 0.0
        longitude = try container.decodeIfPresent(Double.self, forKey: .longitude) ?? 0.0
        generationtime_ms = try container.decodeIfPresent(Double.self, forKey: .generationtime_ms) ?? 0.0
        utc_offset_seconds = try container.decodeIfPresent(Int.self, forKey: .utc_offset_seconds) ?? 0
        timezone = try container.decodeIfPresent(String.self, forKey: .timezone) ?? ""
        timezone_abbreviation = try container.decodeIfPresent(String.self, forKey: .timezone_abbreviation) ?? ""
        elevation = try container.decodeIfPresent(Double.self, forKey: .elevation) ?? 0.0
        current_units = try container.decodeIfPresent(CurrentUnits.self, forKey: .current_units) ?? CurrentUnits(time: "", interval: "", wave_height: "", swell_wave_height: "", swell_wave_direction: "", swell_wave_period: "")
        current = try container.decodeIfPresent(Current.self, forKey: .current) ?? Current(time: "", interval: 0, wave_height: 0.0, swell_wave_height: 0.0, swell_wave_direction: 0, swell_wave_period: 0.0)
    }
    
}

struct CurrentUnits: Decodable {
    let time: String
    let interval: String
    let wave_height: String
    let swell_wave_height: String
    let swell_wave_direction: String
    let swell_wave_period: String
}

struct Current: Decodable {
    let time: String
    let interval: Int
    let wave_height: Double
    let swell_wave_height: Double
    let swell_wave_direction: Int
    let swell_wave_period: Double
}


struct WarmApiErrorResponse: Decodable {
    let error: Bool
    let reason: String
}


