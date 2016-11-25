# SegmentationFault11
Project demonstrating "Command failed due to signal: Segmentation fault: 11" compilation error in Xcode 8 and Swift 3

## Happens when:
1. Swift and Objective-C are bridged together.
2. Swift calls Objective-C API which may throw an error
3. Xcode 8.1 (8B62), newset as of 26th November 2016

## Essense:

Link to the code, where it happens: https://github.com/lukaszmargielewski/SegmentationFault11/blob/master/SegmentationFault11/Classes/Swift/SegmentationFault11.swift
