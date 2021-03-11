//
//  main.swift
//  challenge
//
//  Created by João Brentano on 11/03/21.
//

/*
 
 A school network has X schools and a lot of employees. Some of the employees are paid by hour (teachers) and some are paid by month (people from the support team).
 Each employee has: registration number, full name and role. The employees paid by month have a monthly salary and the employees paid by hour have the value of the hours (it can be different from each employee) and the amount of hours worked for a given month.
 Each school needs to know how much it spends per month with each employee and also the monthly expense with payroll.
 The school network needs an annual salary report.
 You can create as many employees as you want to and add them in any school. Let’s assume each employee is exclusive of a school.
 
 */

import Foundation

struct school {
    var name: String
    var employees = [employee]()
    
    func monthlyReport() -> String {
        var report: String = "Monthly Report: \n"
        for aEmployee in employees {
            report.append("Employee \(aEmployee.name)(\(aEmployee.role)): R$")
            if(aEmployee.hoursWorked<=0){
                report.append("\(aEmployee.salary)")
            } else {
                report.append("\(aEmployee.salary*aEmployee.hoursWorked)")
            }
            report.append(" \n")
        }
        report.append("End Report")
        return report
    }
    
    func annualReport() -> String {
        var report: String = "Annual Report: \n"
        for aEmployee in employees {
            report.append("Employee \(aEmployee.name)(\(aEmployee.role)): R$")
            if(aEmployee.hoursWorked<=0){
                report.append("\(aEmployee.salary*12)")
            } else {
                report.append("\(aEmployee.salary*aEmployee.hoursWorked*12)")
            }
            report.append(" \n")
        }
        report.append("End Report")
        return report
    }
}

struct employee {
    var name: String
    var role: String
    var registrationNumber: Int
    var salary: Double
    var hoursWorked: Double // if hours <= 0 then employee is paid with a monthly salary
}

/*
 struct employeeHourly {
    var name: String
    var role: String
    var registrationNumber: Int
    var salary: Double
    var hours: Double
}
*/

var aSchool = school(name: "a School")

aSchool.employees.append(employee(name: "João Brentano", role: "Teacher", registrationNumber: 001, salary: 40000.0, hoursWorked: 0))
aSchool.employees.append(employee(name: "Lucas Brentano", role: "Teacher", registrationNumber: 002, salary: 600, hoursWorked: 40.0))

print(aSchool.monthlyReport())
print(aSchool.annualReport())
