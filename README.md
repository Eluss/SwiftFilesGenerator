# SwiftFilesGenerator

This tools creates Swift files from templates. Currently there are templates for View, ViewController and PageViewController. These are templates that I most often use when I create apps.

In order to see how the script works run `./stepper.sh GuitarAppExample.txt`. It will run through the GuitarAppExample file and generate Swift files based on the content.

Input file line examples:

`MainScreen/Guitars/[V]Ibanez` - creates IbanezView.swift. File will be placed in MainScreen/Guitars/ folder.

`GuitarsGallery/[PVC]GuitarsGallery`- creates GuitarsGalleryPageViewController.swift, GuitarsGallerySinglePageViewController.swift and GuitarsGallerySinglePageView.swift. Files will be placed in GuitarsGallery/ folder.

`Options/[VC]Options`- creates OptionsViewController.swift and OptionsView.swift. File will be placed in Options/ folder.

[V] stands for View

[VC] stands for ViewController

[PVC] stands for PageViewController





