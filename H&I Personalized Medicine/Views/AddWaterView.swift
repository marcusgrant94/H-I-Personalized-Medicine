//
//  AddWaterView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/20/23.
//

import SwiftUI
import FirebaseAuth

struct AddWaterView: View {
    @State private var selectedDate = Date()
    @State private var selectedUnit = "ounces"
    @State private var amount = ""
    @ObservedObject var waterLogViewModel: WaterLogViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var showingConfirmation = false
    
    var body: some View {
            VStack {
                Divider()
                HStack {
                    Text("Date:")
                        .padding(.horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    DatePicker("", selection: $selectedDate, displayedComponents: .date)
                        .labelsHidden()
                        .padding(.horizontal)
                }
                Divider()
                HStack {
                    Text("Unit: ")
                        .padding(
                            .horizontal)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Picker("", selection: $selectedUnit) {
                        Text("ounces").tag("ounces")
                        Text("glasses").tag("glasses")
                    }
                    .pickerStyle(.menu)
                }
                Divider()
                HStack {
                    Text("Amount: ")
                        .padding(.horizontal)
                    if selectedUnit == "ounces" {
                        TextField("Please enter your amount in ounces", text: $amount)
                            .keyboardType(.numberPad)
                    } else {
                        TextField("Please enter your amount in glasses", text: $amount)
                            .keyboardType(.numberPad)
                    }
                }
                Divider()
                Spacer()
            }
            .navigationTitle("+ Add Water")
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing:
                            Button(action: {
                                let newLog = WaterLog(date: selectedDate, unit: selectedUnit, amount: amount) // add documentID here if you have it
                                waterLogViewModel.addWaterLog(forUserWithID: Auth.auth().currentUser?.uid ?? "", logEntry: newLog)
                                self.showingConfirmation = true
                                self.presentationMode.wrappedValue.dismiss()
                            }) {
                                Text("Done")
                            }
                            .alert(isPresented: $showingConfirmation) {
                                Alert(title: Text("Saved"), message: Text("Your log has been saved."), dismissButton: .default(Text("OK")))
                            }
                        )
                    }
                }

struct AddWaterView_Previews: PreviewProvider {
    static var previews: some View {
        AddWaterView(waterLogViewModel: WaterLogViewModel(userID: "dummyUserID"))
    }
}

