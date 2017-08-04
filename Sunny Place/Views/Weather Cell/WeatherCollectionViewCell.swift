//
//  WeatherTableViewCell.swift
//  Sunny Place
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var tempCurrentLabel: UILabel!
    @IBOutlet weak var tempScaleLabel: UILabel!
    @IBOutlet weak var tempMinMaxLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    var viewModel: WeatherLocationViewModel? {
        didSet {
            guard let viewModel = viewModel else { return }
            locationNameLabel.text = viewModel.locationName
            descriptionLabel.text = viewModel.description
            tempCurrentLabel.text = viewModel.temperature
            tempScaleLabel.text = viewModel.temperatureSuffix
    
            tempMinMaxLabel.attributedText = attributedText(
                forString: "Min: \(viewModel.temperatureMin) / Max: \(viewModel.temperatureMax)",
                values: [viewModel.temperatureMin, viewModel.temperatureMax],
                titleFont: .title,
                valueFont: .value)
            
            windLabel.attributedText = attributedText(
                forString: "Wind: \(viewModel.wind)",
                values: [viewModel.wind],
                titleFont: .title,
                valueFont: .value)
            
            humidityLabel.attributedText = attributedText(
                forString: "Humidity: \(viewModel.humidity)",
                values: [viewModel.humidity],
                titleFont: .title,
                valueFont: .value)
            
            pressureLabel.attributedText = attributedText(
                forString: "Pressure: \(viewModel.pressure)",
                values: [viewModel.pressure],
                titleFont: .title,
                valueFont: .value)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear
    }
    
    func attributedText(forString string: String, values: [String], titleFont: UIFont, valueFont: UIFont) -> NSAttributedString {
        let titleAttributes = [NSAttributedStringKey.font: titleFont]
        let valueAttributes = [NSAttributedStringKey.font: valueFont]
        let attr = NSMutableAttributedString(string: string, attributes: titleAttributes)
        
        for value in values {
            attr.addAttributes(valueAttributes, range: (attr.string as NSString).range(of: value))
        }
        return attr
    }
    
}
