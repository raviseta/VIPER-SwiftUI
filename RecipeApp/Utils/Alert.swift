//
//  Alert.swift
//  RecipeApp
//
//  Created by Ravi Seta on 27/01/25.
//


import SwiftUI

public extension View {
    @ViewBuilder
    func alert(for data: Binding<AlertData?>) -> some View {
        self.modifier(AlertModifier(data: data))
    }
}

struct AlertModifier: ViewModifier {
    private let data: Binding<AlertData?>
    private let isPresented: Binding<Bool>

    internal init(data: Binding<AlertData?>) {
        self.data = data
        self.isPresented = .init(
            get: { data.wrappedValue != nil },
            set: { isPresenting in
                
                DispatchQueue.main.async {
                    if !isPresenting { data.wrappedValue = nil }
                }
            }
        )
    }

    func body(content: Content) -> some View {
        content
            .alert(
                data.wrappedValue?.title ?? "",
                isPresented: isPresented,
                actions: {
                    ForEach(data.wrappedValue?.actions ?? []) { action in
                        Button(action.title, action: action.action)
                    }
                },
                message: {
                    Text(data.wrappedValue?.message ?? "")
                }
            )
    }
}


// MARK: - AlertData
public struct AlertData {
    let title: String
    let message: String
    let actions: [Action]

    public init(title: String, message: String, actions: [AlertData.Action]) {
        self.title = title
        self.message = message
        self.actions = actions
    }
    
    public init(error: Error) {
        self.title = NSLocalizedString("Error", comment: "")
        self.message = error.localizedDescription
        self.actions = [.init(title: NSLocalizedString("Ok", comment: ""))]
    }

    // MARK: - Action
    public struct Action: Identifiable {
        public init(title: String,
                      action: @escaping () -> Void = { }) {
            self.title = title
            self.action = action
        }

        let title: String
        let action: ()->Void
        public var id: String { return title }
    }
}
