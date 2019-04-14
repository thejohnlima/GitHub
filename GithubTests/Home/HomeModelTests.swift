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
        expect(model?.repositories.count) > 0
        expect(model?.repositories.first?.name) == "awesome-ios"
        expect(model?.repositories.first?.description)
          == "A curated list of awesome iOS ecosystem, including Objective-C and Swift Projects "
        expect(model?.repositories.first?.stars) == 31_041
        expect(model?.repositories.first?.forks) == 5_195
        expect(model?.repositories.first?.author.name) == "vsouza"
        expect(model?.repositories.first?.author.avatar) == "https://avatars2.githubusercontent.com/u/484656?v=4"
      }
    }
  }
}
