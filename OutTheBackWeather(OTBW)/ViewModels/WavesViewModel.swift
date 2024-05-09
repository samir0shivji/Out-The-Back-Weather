import Foundation

class WavesViewModel: ObservableObject {
    
    @Published var latitude = ""
    @Published var longitude = ""
    
    @Published var waveHeight = ""
    @Published var swellHeight = ""
    @Published var swellDirection = ""
    @Published var swellPeriod = ""
    
    func fetchData() {
        guard !latitude.isEmpty, !longitude.isEmpty else {
            print("Latitude and longitude cannot be empty.")
            return
        }
        
        let urlString = Constant.warmBaseApi + "/v1/marine?latitude=\(latitude)&longitude=\(longitude)&current=wave_height,swell_wave_height,swell_wave_direction,swell_wave_period"
        
        guard let url = URL(string: urlString) else {
            print("Invalid URL")
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let result = try JSONDecoder().decode(WarmAPIResponse.self, from: data)
                
                DispatchQueue.main.async {
                    self.waveHeight = "\(result.current.wave_height) \(result.current_units.wave_height)"
                    self.swellHeight = "\(result.current.swell_wave_height) \(result.current_units.swell_wave_height)"
                    self.swellDirection = "\(result.current.swell_wave_direction) \(result.current_units.swell_wave_direction)"
                    self.swellPeriod = "\(result.current.swell_wave_period) \(result.current_units.swell_wave_period)"
                }
            } catch {
                print("Error decoding JSON: \(error)")
            }
        }
        
        task.resume()
    }
}
