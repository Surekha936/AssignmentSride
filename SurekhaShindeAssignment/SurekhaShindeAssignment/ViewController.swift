//
//  ViewController.swift
//  SurekhaShindeAssignment
//
//  Created by sride on 08/01/19.
//  Copyright © 2019 sride. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var tf_maxtemp: UILabel!
    @IBOutlet weak var tf_mintemp: UILabel!
    @IBOutlet weak var tf_day: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func dateSelected(_ sender: UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM EEEE, yyyy"
        tf_day.text = dateFormatter.string(from: datePicker.date)
        tf_maxtemp.text = nil
        tf_mintemp.text = nil
//        print("Date : \(myInt)")
        let calendar = NSCalendar.current
        let day = calendar.component(.day, from: datePicker.date)
        if isPrime(day){
            getData()
             print("Prime")
        }
    }
//    http://history.openweathermap.org/data/2.5/history/city?q=pune,in&type=hour&start=1546584839&end=1546584839
    
    func isPrime(_ number: Int) -> Bool {
        // right below
        if number == 2 || number == 3 { return true }
        let maxDivider = Int(sqrt(Double(number)))
        return number > 1 && !(2...maxDivider).contains { number % $0 == 0 }
    }
    
    
    func getData(){
        let session = URLSession.shared
        let weatherURL = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=pune,in?&APPID=ca65c2d5314a3a6695b97a374fe77616")!
        let dataTask = session.dataTask(with: weatherURL) {
            (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                print("Error:\n\(error)")
            } else {
                if let data = data {
                    let dataString = String(data: data, encoding: String.Encoding.utf8)
                    print("All the weather data:\n\(dataString!)")
                    if let jsonObj = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? NSDictionary {
                        if let mainDictionary = jsonObj!.value(forKey: "main") as? NSDictionary {
                            DispatchQueue.main.async {
                            if let temperature = mainDictionary.value(forKey: "temp_min") {
                                    self.tf_mintemp.text = "Minimum Temperature: \(temperature)°F"
                                }
                                if let temperature = mainDictionary.value(forKey: "temp_max") {
                                    self.tf_maxtemp.text = "Maximum Temperature: \(temperature)°F"
                                }
                            }
                        } else {
                            print("Error occured")
                        }
                    } else {
                        print("Error occured")
                    }
                } else {
                    print("Error occured")
                }
            }
        }
        dataTask.resume()
    }
}

