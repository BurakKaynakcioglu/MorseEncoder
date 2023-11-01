//
//  ContentView.swift
//  MorseEncoder
//
//  Created by Burak on 1.11.2023.
//

import SwiftUI

struct ContentView: View {
	let morseCode : [String: String] = Bundle.main.decode("morse-code.json")
	
	@State private var text = ""
	@State private var encoded = ""
	
	
    var body: some View {
		ZStack {
			LinearGradient(stops: [
				.init(color: .white, location: 0.75),
				.init(color: .black, location: 0.9)
			], startPoint: .top, endPoint: .bottom)
			.ignoresSafeArea()
			
			VStack {
				Spacer()
				VStack {
					ScrollView {
							Text(encoded)
								.font(.system(size: 40)).bold()
								.multilineTextAlignment(.center)
								.padding(.horizontal)
						}
					}
				.padding(.bottom, 8)
				
				VStack {
					TextField("Enter your text", text: $text)
						.padding()
						.background(.white)
						.clipShape(RoundedRectangle(cornerRadius: 20))
				}
				.padding()
				Spacer()
			}
		}
		.onChange(of: text) {
			encoded = ""
			
			let loweredText = text.lowercased()
			
			if loweredText.count > 1 {
				for word in loweredText {
					encoded.append(morseCode[String(word)] ?? "")
					encoded.append(" / ")
				}
			} else {
				for word in loweredText {
					encoded.append(morseCode[String(word)] ?? "")
				}
			}
		}
    }
}

#Preview {
    ContentView()
}
