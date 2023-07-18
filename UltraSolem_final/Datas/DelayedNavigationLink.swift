//
//  DelayedNavigationLink.swift
//  UltraSolem_final
//
//  Created by Teck Hao Tea on 03/11/2022.
//

import SwiftUI

public struct DelayedNavigationLink<Destination: View, Content: View>: View {
    @State private var activate = false
    private let delay: TimeInterval
    private let content: Content
    private let destination: Destination
    public init(destination: Destination, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.destination = destination
        self.delay = 0
    }
    private init(delay: TimeInterval, destination: Destination, content: Content) {
        self.content = content
        self.destination = destination
        self.delay = delay
    }
    public var body: some View {
        Button(action: {
            DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                activate = true
            }
        }) {
            content
        }.background(
            NavigationLink(destination: destination, isActive: $activate) {
                Color.clear
            }
        )
    }
    public func delayed(by delay: TimeInterval) -> Self {
        DelayedNavigationLink(delay: delay, destination: destination, content: content)
    }
}
