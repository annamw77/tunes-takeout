require 'test_helper'

class TunesTakeoutWrapperTest < ActiveSupport::TestCase

  describe TunesTakeoutWrapper do
    it "uses the correct API" do
      assert_equal "https://tunes-takeout-api.herokuapp.com/", TunesTakeoutWrapper::BASE_URL
    end

    describe "API" do
      before do
        @banana_suggestion = TunesTakeoutWrapper.find("banana")
      end

      it "knows its id", :vcr do
        assert_equal "V0HIl1ElJwADzFsI", @banana_suggestion.id
      end
    end

  end
end
