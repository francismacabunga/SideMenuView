//
//  SideMenuView.swift
//  TestProject
//
//  Created by Macabunga, Francis Norman (Cognizant) on 4/26/24.
//

import SwiftUI

@available(macOS 10.15, *)
public struct SideMenuView<mainView: View,
                           sideMenuView: View>: View {
    private var MainView: mainView
    private var SideMenuView: sideMenuView
    @Binding private var barIsShown: Bool
    
    public init(MainView: mainView, 
                SideMenuView: sideMenuView,
                barIsShown: Binding<Bool>) {
        self.MainView = MainView
        self.SideMenuView = SideMenuView
        self._barIsShown = barIsShown
    }
    
    public var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                MainView
                    .frame(width: geometry.size.width,
                           height: geometry.size.height)
                    .offset(x: barIsShown ? geometry.size.width / 2 : 0)
                
                if barIsShown {
                    SideMenuView
                        .frame(width: geometry.size.width / 2)
                        .transition(.move(edge: .leading))
                }
            }
        }
    }
}
