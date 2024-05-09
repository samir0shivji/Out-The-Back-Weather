import Foundation
import Combine

class MockWeatherFetcher: WeatherFetcher {
  func weatherSummary(forCity city: String) -> AnyPublisher<WeatherSummary, WeatherError> {
    return Just(WeatherSummary.createMock())
      .setFailureType(to: WeatherError.self)
      .eraseToAnyPublisher()
  }
}
