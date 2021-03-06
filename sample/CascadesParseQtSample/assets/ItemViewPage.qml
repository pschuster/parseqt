/*
 * ParseError.hpp
 * 
 * Copyright (c) 2013, Framework Labs
 * 
 */

import bb.cascades 1.0
import bb.system 1.0
import com.frameworklabs.parseqt 1.0

Page {

    /// interface

    property ParseObject item: defaultItem
    signal save()
    signal didSave()

    /// internals

    attachedObjects: [
        // To have the item property bound and not undefined, we use a defaultItem
        ParseObject {
            id: defaultItem
        },
        SystemToast {
            id: toast
        }
    ]
    function handleSaveCompleted(success, error) {

        // Disconnect from the signal
        item.saveCompleted.disconnect(handleSaveCompleted)

        if (success) {
            toast.body = "Saved new Item"

            // Send signal to caller that save completed
            didSave()
        } else {
            toast.body = "Failed to save Item"
        }
        toast.show()
    }
    onSave: {
        // Fill ParseObject datamodel with values from UI
        item.data.name = nameField.text
        item.data.count = parseInt(countField.text)
        item.data.date = datePicker.value

        // Connect to signal when asynchronous save completed
        item.saveCompleted.connect(handleSaveCompleted)

        // Save the item
        item.save()
    }

    /// layout
    titleBar: TitleBar {
        title: "Show Item"
    }
    Container {
        id: container

        layout: DockLayout {
        }

        Container {
            leftPadding: 10.0
            rightPadding: 10.0
            topPadding: 10.0
            bottomPadding: 10.0

            enabled: ! item.busy

            // Name
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                bottomMargin: 10

                Label {
                    verticalAlignment: VerticalAlignment.Center
                    text: "Name"
                }
                TextField {
                    id: nameField
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Center
                    input.submitKeyFocusBehavior: SubmitKeyFocusBehavior.Next
                    text: item.data.name ? item.data.name : ""
                    hintText: "enter name"
                }
            }

            // Count
            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
                }
                bottomMargin: 10

                Label {
                    verticalAlignment: VerticalAlignment.Center
                    text: "Count"
                }
                TextField {
                    id: countField
                    horizontalAlignment: HorizontalAlignment.Fill
                    verticalAlignment: VerticalAlignment.Center
                    inputMode: TextFieldInputMode.NumbersAndPunctuation
                    input.submitKeyFocusBehavior: SubmitKeyFocusBehavior.Next
                    text: item.data.count ? item.data.count : ""
                    hintText: "enter count"
                }
            }

            // Date
            DateTimePicker {
                id: datePicker
                title: "Date"
                value: item.data.date ? item.data.date : new Date()
            }
        }

        ActivityIndicator {
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            preferredWidth: 100.0
            preferredHeight: 100.0
            running: item.busy
            visible: running
        }
    }
}