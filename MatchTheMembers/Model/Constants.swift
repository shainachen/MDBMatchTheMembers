//
//  MDB Mini Project 1 - Match the Members!
//
//  Constants.swift
//  Created by Will Oakley on 9/5/18.
//

import Foundation
import UIKit

class Constants {
    
    static let names = ["Aady Pillai", "Aarushi Agrawal", "Aayush Tyagi", "Abhinav Kejriwal", "Aditya Yadav", "Ajay Merchia", "Anand Chandra", "Andres Medrano", "Andrew Santoso", "Angela Dong", "Anika Bagga", "Anik Gupta", "Anita Shen", "Anjali Thakrar", "Anmol Parande", "Ashwin Aggarwal", "Ashwin Kumar", "Athena Leong", "Austin Davis", "Ayush Kumar", "Brandon David", "Candace Chiang", "Candice Ye","Charles Yang", "Daniel Andrews", "Divya Tadimeti", "DoHyun Cheon", "Eric Kong", "Ethan Wong", "Imran Khaliq", "Izzie Lau", "Jacqueline Zhang", "Japjot Singh", "Joey Hejna", "Justin Kim", "Kanyes Thaker", "Karen Alarcon", "Katniss Lee", "Kayli Jiang", "Kiana Go", "Leon Kwak", "Lewis Zhang", "Matthew Locayo", "Max Emerling", "Max Miranda", "Melanie Cooray", "Michelle Mao", "Mohit Katyal", "Mudabbir Khan", "Natasha Wong", "Neha Nagabothu", "Nikhar Arora", "Noah Pepper", "Patrick Yin", "Paul Shao", "Radhika Dhomse", "Sai Yandapalli", "Salman Husain", "Samantha Lee", "Shaina Chen", "Sharie Wang", "Shaurya Sanghvi", "Shiv Kushwah", "Shomil Jain", "Shubha Jagannatha", "Shubham Gupta", "Sinjon Santos", "Srujay Korlakunta", "Stephen Jayakar", "Tyler Reinecke", "Vaibhav Gattani", "Varun Jhunjhunwalla", "Victor Sun", "Vidya Ravikumar", "Vineeth Yeevani", "Will Oakley","Xin Yi Chen"]
    
    static func getImageFor(name: String) -> UIImage {
        let noWhitespace = name.components(separatedBy: .whitespaces).joined().lowercased()
        return UIImage(named: noWhitespace)!
    }
}

