import Foundation

#if DEBUG
extension WeatherSummary {
  static func createMock() -> WeatherSummary {
    let path = Bundle.main.path(forResource: "MockOneCallResponse", ofType: "json")!
    let url = URL(fileURLWithPath: path)
    let data = try! Data(contentsOf: url)
    let response = try! JSONDecoder().decode(OneCallResponse.self, from: data)
    return WeatherSummary.convert(fromResponse: response)
  }
}
#endif
