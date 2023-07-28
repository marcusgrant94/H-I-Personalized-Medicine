//
//  CartManager.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 10/21/22.
//

import Foundation

class CartManager: ObservableObject {
    @Published private(set) var products: [Product] = []
    @Published private(set) var total: Int = 0
    
    let paymentHandler = PaymentHandler()
    @Published var paymentSuccess = false
    
    func addToCart(product: Product) {
        products.append(product)
        total += product.price
    }
    
    func removeFromCart(product: Product) {
        products = products.filter { $0.id != product.id }
        total -= product.price
    }
    
    func pay() {
        paymentHandler.startPayment(products: products, total: Int(total)) { success in
            self.paymentSuccess = success
            self.products = []
            self.total = 0
        }
    }
    
}
