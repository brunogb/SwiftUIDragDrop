//
//  DragElementModifier.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI

public struct DragElementModifier: ViewModifier {
    
    @EnvironmentObject var manager: DragNDropManager
    public let elementId: UUID
    
    public func body(content: Content) -> some View {
        return content
            .overlay(GeometryReader { r in
                Color.clear
                    .onAppear {
                        self.manager.registerFor(drag: self.elementId, frame: r.frame(in: .global))
                }
            })
            .gesture(DragGesture(coordinateSpace: .global).onChanged({ (value) in
                self.manager.report(drag: self.elementId, offset: value.translation)
            }).onEnded({ (value) in
                self.manager.draggingEnd(for: self.elementId)
            }))
    }
    
}
