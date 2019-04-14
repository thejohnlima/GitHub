//
//  HomeViewModelTests.swift
//  GithubTests
//
//  Created by John Lima on 14/04/19.
//  Copyright © 2019 limadeveloper. All rights reserved.
//

@testable import Github
import Nimble
import Quick

class HomeViewModelTests: QuickSpec {
  override func spec() {

    // swiftlint:disable closure_body_length
    describe("home view model spec") {

      var viewModel: HomeViewModel?

      beforeSuite {
        viewModel = HomeViewModel()
      }

      it("should be able to fetch data with success") {
        let expected = HomeMockSuccess.getModel()

        viewModel?.observable.didChange = { status in
          switch status {
          case .load(data: let model):
            expect(model) == expected
          case .errored:
            fail("⚠️ This test should finish with success")
          default:
            break
          }
        }

        viewModel?.service = HomeServiceMockSuccess()
        viewModel?.fetchData()
      }

      it("should be able to fetch data with fail") {
        let expected = ErrorManager.default

        viewModel?.observable.didChange = { status in
          switch status {
          case .load:
            fail("⚠️ This test should finish with fail")
          case .errored(error: let error):
            expect(error.description) == expected.description
          default:
            break
          }
        }

        viewModel?.service = HomeServiceMockError()
        viewModel?.fetchData()
      }
    }
  }
}
