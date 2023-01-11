//
//  ContentView.swift
//  Unit Testing Tip Calculator
//
//  Created by Thomas George on 11/01/2023.
//

import SwiftUI

struct ContentView: View {
    // MARK: - Property
    
    let tipCalculator = TipCalculator()
    
    // MARK: - Binding
    
    @State private var total: String = ""
    @State private var tipPercentage: Double = 0.2
    @State private var tip: String?
    @State private var message: String = ""
    
    // MARK: - View Body
    
    var body: some View {
        NavigationStack {
            VStack {
                TextField("Enter total", text: $total)
                    .textFieldStyle(.roundedBorder)
                        
                Picker(selection: $tipPercentage) {
                    Text("10%")
                        .tag(0.1)
                    
                    Text("20%")
                        .tag(0.2)
                    
                    Text("30%")
                        .tag(0.3)
                } label: {
                    EmptyView()
                }
                .pickerStyle(.segmented)

                Button("Calculate Tip") {
                    calculateTip()
                }
                .padding(.top, 20)
                        
                Text(message)
                    .padding(.top, 50)
                        
                Spacer()
                        
                Text(tip ?? "")
                    .font(.system(size: 54))
                        
                Spacer()
            }
            .padding()
            .navigationTitle("Tip Calculator")
        }
    }
    
    // MARK: - View Function
    
    private func calculateTip() {
        clearUI()
        
        guard let total = Double(total) else {
            message = "Invalid Input"
            return
        }
        
        do {
            let result = try tipCalculator.calculate(total: total, percentage: tipPercentage)
            
            let formatter = NumberFormatter()
            formatter.numberStyle = .currency
            
            tip = formatter.string(from: NSNumber(value: result))
        } catch TipCalculatorError.invalidInput {
            message = "Invalid Input"
        } catch {
            message = error.localizedDescription
        }
    }
    
    private func clearUI() {
        message = ""
        tip = ""
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
