# Hoopla!

An example of MVVM-C + POP + UIKit + Combine + URLSession show movies from Hoopla API.


# Key Features
-  Using **Swift** + **MVVM-C** + **UIKit** + **Combine** + **POP** + **URLSession**
-  Show list of top movies and the detail of a movie
-  Custom network layer with URLSession.
-  Make UI with 2 ways storyboard and programmatically.
-  Light & dark mode compatible.
-  No third-party libraries.
-  Unit test


## Requirements
-   iOS 13.0+
-   Xcode 12.2

## Architecture
Using MVVM-C pattern gives us some benefits like code reuse, ease of testing, bindings make UI updates easier to handle, ease of maintainability.

And splitting off protocols (DataSource and Delegate) into separate objects we can re-use those objects in other view controllers, or use different objects in the same view controller to get different behavior at runtime.
<a href="https://drive.google.com/uc?export=view&id=1qrEkNSqrtW3So7ySrn9P_S2mgBdWWFNu"><img src="https://drive.google.com/uc?export=view&id=1qrEkNSqrtW3So7ySrn9P_S2mgBdWWFNu" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture" />

## Unit Test

    func test_get_top_list_movies() throws {
        //Given
        let totalMovies = 2
        
        //When
        var movies: [OverviewMovie]?
        apiProvider.request(.topMovies) { (result: Result<[OverviewMovie], HooplaError>) in
            if case let .success(items) = result {
                movies = items
            }
        }
        
        //Then
        XCTAssert(movies != nil)
        XCTAssert(movies?.count == totalMovies)
    }
    
## Next Features
- Make UI with SwiftUI

## Screenshot
<a href="https://drive.google.com/uc?export=view&id=12xUGDegSaBNLz_l2Gu_EdnucDE2iJ_zZ"><img src="https://drive.google.com/uc?export=view&id=12xUGDegSaBNLz_l2Gu_EdnucDE2iJ_zZ" style="width: 650px; max-width: 100%; height: auto" title="Click to enlarge picture" />

## Author
Tommy Doan, [tiendnuit@gmail.com](mailto:tiendnuit@gmail.com) or [tommy.doan2710@gmail.com](mailto:tommy.doan2710@gmail.com)
