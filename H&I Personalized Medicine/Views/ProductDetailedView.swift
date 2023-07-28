//
//  ProductDetailedView.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 10/24/22.
//

import SwiftUI
//
//struct ProductDetailedView: View {
//    @StateObject var cartManager = CartManager()
//    var product: Product
//    var body: some View {
//            ScrollView {
//                VStack(alignment: .leading) {
//                    Image(product.image)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 300, height: 500)
//                        .padding(30)
//                    Spacer()
//                        Button {
//                            cartManager.addToCart(product: product)
//                        } label: {
//                            Text("Add to cart")
//                        }
//                        .foregroundColor(.white)
//                        .background(Color(.black))
//                        .buttonStyle(.bordered)
//                        .cornerRadius(30)
//                        .symbolVariant(.fill)
//                        .frame(maxWidth: 300, maxHeight: 500, alignment: .center)
//                        .padding(.horizontal, 29)
//                    Text(product.name)
//                        .font(.title2)
//                        .bold()
//                        .padding(8)
//                    Spacer()
//                    Text(product.author)
//                        .fontWeight(.light)
//                        .padding(8)
//                    Spacer()
//                    Text("$\(product.price)")
//                        .fontWeight(.semibold)
//                        .padding(8)
//                    Spacer()
//                    Group {
//                        Text("Details:")
//                            .padding(8)
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                        Text(product.details)
//                            .padding(8)
//                        Spacer()
//                        Text("Ingredients:")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .padding(8)
//                        Text(product.ingredients)
//                            .padding(10)
//                        Spacer()
//                        Text("Suggested Use:")
//                            .font(.title3)
//                            .fontWeight(.semibold)
//                            .padding(8)
//                        Text(product.suggestedUse)
//                            .padding(8)
//                    }
//                }
//            
//            .navigationTitle(Text("Shop"))
//            .toolbar {
//                if cartManager.products.isEmpty {
//                    NavigationLink {
//                        CartView()
//                            .environmentObject(cartManager)
//                    } label: {
//                        CartButton(numberOfProducts: cartManager.products.count)
//                    }
//                    .disabled(true)
//                } else {
//                    NavigationLink {
//                        CartView()
//                            .environmentObject(cartManager)
//                    } label: {
//                        CartButton(numberOfProducts: cartManager.products.count)
//                    }
//                }
//            }
//            }
//
//        }
//    }
//
//struct ProductDetailedView_Previews: PreviewProvider {
//    static var previews: some View {
//        ProductDetailedView(product: productList[0])
//            .environmentObject(CartManager())
//    }
//}
