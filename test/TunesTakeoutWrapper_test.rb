require 'test_helper'
require 'TunesTakeoutWrapper'

class TunesTakeoutWrapperTest < ActiveSupport::TestCase

  describe "TunesTakeoutWrapper" do
    it "uses the correct API" do
      assert_equal "https://tunes-takeout-api.herokuapp.com/", TunesTakeoutWrapper::BASE_URL
    end

    describe "API", :vcr do
      before do
        @search = TunesTakeoutWrapper.find("banana")
      end

      it "knows its id", :vcr do
          assert_equal "V0HIl1ElJwADzFsI", @search.id
      end
    end
  end
end
