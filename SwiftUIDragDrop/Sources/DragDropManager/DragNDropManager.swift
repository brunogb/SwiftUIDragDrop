//
//  DragNDropManager.swift
//  SwiftUIDragDrop
//
//  Created by Bruno Bilescky on 16/07/2019.
//  Copyright © 2019 Bilescky. All rights reserved.
//

import SwiftUI
import Combine

class DragNDropManager: Identifiable, BindableObject {
    
    let id: UUID = UUID()
    
    let didChange = PassthroughSubject<Void, Never>()
    
    private var containersMap: [UUID: CGRect] = [:]
    private var draggableViewsMap: [UUID: CGRect] = [:]
    
    private var currentDraggingViewID: UUID? {
        didSet {
            if currentDraggingViewID != oldValue {
                self.didChange.send()
            }
        }
    }
    
    private var currentDraggingOffset: CGSize = .zero {
        didSet {
            if currentDraggingOffset.width != oldValue.width || currentDraggingOffset.height != oldValue.height {
                self.didChange.send()
            }
        }
    }
    
    func registerFor(drag id: UUID, frame: CGRect) {
        draggableViewsMap[id] = frame
    }
    
    func registerFor(drop id: UUID, frame: CGRect) {
        containersMap[id] = frame
    }
    
    func report(drag id: UUID, offset: CGSize) {
        self.currentDraggingViewID = id
        self.currentDraggingOffset = offset
    }
    
    func draggingOffset(for view: UUID) -> CGSize {
        guard currentDraggingViewID == view else { return .zero }
        return currentDraggingOffset
    }
    
    func draggingEnd(for view: UUID) {
        self.currentDraggingViewID = nil
        self.currentDraggingOffset = .zero
    }
    
    func canDrop(on container: UUID)-> Bool {
        guard let containerFrame = containersMap[container],
            let currentDraggingId = currentDraggingViewID, let dragFrame = draggableViewsMap[currentDraggingId] else { return false }
        let newFrame = dragFrame.offsetBy(dx: self.currentDraggingOffset.width, dy: self.currentDraggingOffset.height)
        return containerFrame.intersects(newFrame)
    }
    
    func isDragging(id: UUID)-> Bool {
        return id == currentDraggingViewID
    }
    
}
