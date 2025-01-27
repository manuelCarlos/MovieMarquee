//
//  IdleView.swift
//  Lego
//
//  Created by Manuel Lopes on 11.10.24.
//

import SwiftUI

/// A SwiftUI view that runs a provided task when it is displayed.
///
///
/// This view requires iOS 15.0 or later to use the `.task` modifier.
@available(iOS 15.0, *)
public struct IdleView: View {

    /// The task to be executed when the view appears.
    ///
    /// This closure is invoked when the `IdleView` is rendered within the view hierarchy.
    public let task: () -> Void

    /// Initializes a new `IdleView` with a task to be executed.
    ///
    /// - Parameter task: The closure representing the task to run when the view appears.
    ///   The closure should be an asynchronous operation.
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
