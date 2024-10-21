//
//  IdleView.swift
//  Lego
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

@available(iOS 15.0, *)
public struct IdleView: View {

    public let task: () -> Void

    public init(task: @escaping () -> Void) {
        self.task = task
    }

    public var body: some View {
        Color.clear
            .task {
                task()
            }
    }
}
