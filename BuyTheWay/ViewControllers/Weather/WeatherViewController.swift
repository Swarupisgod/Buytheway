//
//  WeatherViewController.swift
//  BuyTheWay
//
//  Created by Mac on 3/16/23.
//

import UIKit

class WeatherViewController: UIViewController {

    @IBOutlet var updatedLabel: UILabel!
    @IBOutlet var reginLabel: UILabel!
    @IBOutlet var countryLabel: UILabel!
    @IBOutlet var temperatureLabel: UILabel!
    @IBOutlet var humidityLabel: UILabel!
    @IBOutlet var windLabel: UILabel!
    
    @IBOutlet var refreshButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshButton.layer.cornerRadius = 8
        fetchWeatherData()

     
    }
    func fetchWeatherData() {
        let url = URL(string: "https://api.weatherapi.com/v1/current.json?key=5b937613381444d6b5455655231603&q=Kathmandu")
        let dataTask = URLSession.shared.dataTask(with: url!, completionHandler: {
            (data,resume,error) in
            guard let data = data ,error == nil else {
                print("Error")
                return
            }
            var fullWeatherData :WeatherData?
            do{
                fullWeatherData = try JSONDecoder().decode(WeatherData.self, from: data)
            }
            catch{
                 print("Error occured while decoding json \(error)")
            }
            DispatchQueue.main.async {
                let currentTime = Date()
                  let dateFormatter = DateFormatter()
                  dateFormatter.dateFormat = "MMM d, h:mm a"
                  let formattedTime = dateFormatter.string(from: currentTime)
                  self.updatedLabel.text = "Updated: \(formattedTime)"
//                self.updatedLabel.text = "Updated : \(fullWeatherData!.current.last_updated)"
                self.reginLabel.text = "Region : \(fullWeatherData!.location.region)"
                self.countryLabel.text =  "Country: \(fullWeatherData!.location.country)"
                self.temperatureLabel.text = "Temperature (Celsius) : \(fullWeatherData!.current.temp_c)"
                self.humidityLabel.text = "Humdity :\(fullWeatherData!.current.humidity)"
                self.windLabel.text = "Wind(Km/Hr) :\( fullWeatherData!.current.wind_kph)"
                
            }
        })
        dataTask.resume()
    }

    @IBAction func refreshButtonTapped(_ sender: Any) {
        
        fetchWeatherData()
        
    }
    

}
