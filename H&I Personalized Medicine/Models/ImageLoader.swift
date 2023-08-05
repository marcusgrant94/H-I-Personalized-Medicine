//
//  ImageLoader.swift
//  H&I Personalized Medicine
//
//  Created by Marcus Grant on 7/30/23.
//

import Foundation
import SwiftUI
import Combine

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private var cancellable: AnyCancellable?
    
    func load(from url: URL) {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .assign(to: \.image, on: self)
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

struct URLImage: View {
    @StateObject private var loader = ImageLoader()
    
    let url: URL
    
    var body: some View {
        Group {
            if let image = loader.image {
                Image(uiImage: image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
            } else {
                ProgressView() // or a placeholder image
            }
        }
        .onAppear {
            loader.load(from: url)
        }
        .onDisappear {
            loader.cancel()
        }
    }
}


