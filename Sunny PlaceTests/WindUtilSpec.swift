//
//  WindUtilSpec.swift
//  Sunny PlaceTests
//
//  Created by Josh Roberts on 03/08/2017.
//  Copyright © 2017 Josh Roberts. All rights reserved.
//

import Quick
import Nimble
@testable import Sunny_Place

class WindUtilSpec: QuickSpec {
    
    override func spec() {
        
        describe("a wind direction parser") {
            context("1 degree") {
                it("should return an up arrow") {
                    expect(WindUtil.arrow(forDegreeDirection: 1)).to(equal("↑"))
                }
            }
            
            context("46 degree") {
                it("should return an up-right arrow") {
                    expect(WindUtil.arrow(forDegreeDirection: 46)).to(equal("↗"))
                }
            }
            
            context("91 degree") {
                it("should return a right arrow") {
                    expect(WindUtil.arrow(forDegreeDirection: 91)).to(equal("→"))
                }
            }
            
            context("136 degree") {
                it("should return a down-right arrow") {
                    expect(WindUtil.arrow(forDegreeDirection: 136)).to(equal("↘"))
                }
            }
            
            context("181 degree") {
                it("should return a down arrow") {
                    expect(WindUtil.arrow(forDegreeDirection: 181)).to(equal("↓"))
                }
            }
            
            context("226 degree") {
                it("should return a down-left arrow") {
                    expect(WindUtil.arrow(forDegreeDirection: 226)).to(equal("↙"))
                }
            }
            
            context("271 degree") {
                it("should return a left arrow") {
                    expect(WindUtil.arrow(forDegreeDirection: 271)).to(equal("←"))
                }
            }
            
            context("315 degree") {
                it("should return an up-left arrow") {
                    expect(WindUtil.arrow(forDegreeDirection: 315)).to(equal("↖"))
                }
            }
        }
        
    }
}
