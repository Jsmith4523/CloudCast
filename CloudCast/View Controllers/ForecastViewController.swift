//
//  ViewController.swift
//  CloudCast
//
//  Created by Jaylen Smith on 9/26/23.
//

import Foundation
import UIKit

class ForecastViewController: UIViewController {
    
    private var degree: Degree = .fahrenheit
    
    private var forecast: WeatherForecast?
    
    //MARK: Outlets
    @IBOutlet weak var degreePicker: UISegmentedControl!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var conditonLabel: UILabel!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var weatherImageView: UIImageView!
    
    //MARK: Actions
    @IBAction func didTapBackButton(_ sender: UIButton) {
        configureView(WeatherForecast.mockData().randomElement()!)
    }
    @IBAction func didTapNextButton(_ sender: UIButton) {
        configureView(WeatherForecast.mockData().randomElement()!)
    }
    
    @IBAction func didSelectDegree(_ sender: UISegmentedControl) {
        self.degree = Degree(rawValue: sender.titleForSegment(at: sender.selectedSegmentIndex)!)!
        configureView(self.forecast!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePicker()
        configureView(.mockData()[0])
    }
    
    private func configureView(_ forecast: WeatherForecast) {
        self.forecast = forecast
        weatherImageView.image = forecast.weatherCode.image
        conditonLabel.text = forecast.weatherCode.description
        temperatureLabel.text = forecast.temperature.covert(to: degree)
        
        dateLabel.text = forecast.date.formatted(date: .complete, time: .omitted)
    }
    
    private func configurePicker() {
        Degree.allCases.forEach { [weak self] degree in
            self?.degreePicker.setTitle(degree.rawValue, forSegmentAt: Degree.allCases.firstIndex(of: degree)!)
        }
    }
}
