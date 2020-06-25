//
//  Home.swift
//  GridsWithMatchedGeometryEffect
//
//  Created by ramil on 25.06.2020.
//

import SwiftUI

struct Home: View {
    @State private var languages: [Language] = [
        
        Language(id: 0, language: "English"),
        Language(id: 1, language: "Spanish"),
        Language(id: 2, language: "French"),
        Language(id: 3, language: "German"),
        Language(id: 4, language: "Japanese"),
        Language(id: 5, language: "Chinise"),
        Language(id: 6, language: "Korean"),
        Language(id: 7, language: "Estonian")
    ]
    
    var columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 3)
    
    @Namespace var namespace
    
    @State var selected: [Language] = []
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                if !languages.isEmpty {
                    LazyVGrid(columns: columns, spacing: 15) {
                        ForEach(languages) { language in
                            Text(language.language)
                                .foregroundColor(.white)
                                .fontWeight(.bold)
                                .frame(width: 100, height: 100)
                                .background(Color.blue)
                                .cornerRadius(15)
                                .matchedGeometryEffect(id: language.id, in: self.namespace)
                                .onTapGesture {
                                    selected.append(language)
                                    
                                    languages.removeAll() { lang -> Bool in
                                        if lang.id == language.id {
                                            return true
                                        } else {
                                            return false
                                        }
                                    }
                                }
                        }
                    }.padding(.all, 10)
                }
                
                HStack {
                    Text("Selected Language")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Spacer()
                }.padding(.horizontal)
                
                LazyVGrid(columns: columns, spacing: 15) {
                    ForEach(selected) { language in
                        Text(language.language)
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .frame(width: 100, height: 100)
                            .background(Color.green)
                            .cornerRadius(15)
                            .matchedGeometryEffect(id: language.id, in: self.namespace)
                            .onTapGesture {
                                languages.append(language)
                                
                                selected.removeAll() { lang -> Bool in
                                    if lang.id == language.id {
                                        return true
                                    } else {
                                        return false
                                    }
                                }
                            }
                    }
                }.padding(.all, 10)
                
            }.navigationTitle("Choose Language")
            .navigationBarTitleDisplayMode(.inline) 
        }.animation(.easeOut)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
