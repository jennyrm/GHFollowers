//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Jenny Morales on 10/20/21.
//

import Foundation

extension Date {
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        
        return dateFormatter.string(from: self)
    }
}


