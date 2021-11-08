//
//  MacEditorv2.swift
//
//  Created by Marc Maset - 2021
//  https://bluelemonbits.com
//  https://twitter.com/MarcMasVi
//

import SwiftUI

struct MacEditorv2: NSViewRepresentable {
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    var theTextView = NSTextView.scrollableTextView()
    
    @Binding var text: String
    
    func makeNSView(context: Context) -> NSScrollView {
        let textView = (theTextView.documentView as! NSTextView)
        textView.delegate = context.coordinator
        textView.string = text
        
        
        return theTextView
    }
    
    func updateNSView(_ nsView: NSScrollView, context: Context) {

    }
    
    
}

extension MacEditorv2{
    
    class Coordinator: NSObject, NSTextViewDelegate{
        
        var parent: MacEditorv2
        var affectedCharRange: NSRange?
        
        init(_ parent: MacEditorv2) {
            self.parent = parent
        }
        
        func textDidChange(_ notification: Notification) {
            guard let textView = notification.object as? NSTextView else {
                return
            }
            
            //Update text
            self.parent.text = textView.string
        }
        
        func textView(_ textView: NSTextView, shouldChangeTextIn affectedCharRange: NSRange, replacementString: String?) -> Bool {
            return true
        }
        
    }
    
    
}
