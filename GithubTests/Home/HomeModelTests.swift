//
//  HomeModelTests.swift
//  GithubTests
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

@testable import Github
import Nimble
import Quick

class HomeModelTests: QuickSpec {
  override func spec() {
    describe("home model spec") {

      var model: HomeModel?

      beforeSuite {
        model = HomeMockSuccess.getModel()
      }

      it("should be able to parse model data with success") {
        expect(model?.items.count) > 0
        expect(model?.items.first?.name) == "awesome-ios"
        expect(model?.items.first?.description)
          == "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects "
        expect(model?.items.first?.stars) == 31_041
        expect(model?.items.first?.forks) == 5_195
        expect(model?.items.first?.author.name) == "vsouza"
        expect(model?.items.first?.author.avatar) == "https://avatars2.githubusercontent.com/u/484656?v=4"
      }
    }
  }
}
