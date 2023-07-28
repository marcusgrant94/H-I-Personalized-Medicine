//
//  CartView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 10/21/22.
//

//import SwiftUI
//
//struct CartView: View {
//    @EnvironmentObject var cartManager: CartManager
//    var body: some View {
//        ScrollView {
//            if cartManager.paymentSuccess {
//                Text("Thanks for your purchase! A confirmation email will be sent to  ")
//                    .padding()
//            } else {
//                if cartManager.products.count > 0 {
//                    ForEach(cartManager.products, id: \.id) {
//                        product in
//                        ProductRow(product: product)
//                    }
//                    
//                    HStack {
//                        Text("Your cart total is")
//                        Spacer()
//                        Text("$\(cartManager.total).00")
//                            .bold()
//                    }
//                    .padding()
//                    
//                    PaymentButton(action: cartManager.pay)
//                        .padding()
//                } else {
//                    Text("Cart is empty")
//                }
//            }
//            
//        }
//        .navigationTitle(Text("My cart"))
//            .padding()
//            .padding(.top)
//            .onDisappear {
//                if cartManager.paymentSuccess {
//                    cartManager.paymentSuccess = false
//                }
//            }
//    }
//}
//
//struct CartView_Previews: PreviewProvider {
//    static var previews: some View {
//        CartView()
//            .environmentObject(CartManager())
//    }
//}
