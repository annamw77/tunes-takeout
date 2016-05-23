require 'test_helper'
require 'TunesTakeoutWrapper'

class TunesTakeoutWrapperTest < ActiveSupport::TestCase

  describe TunesTakeoutWrapper.new do
    it "uses the correct API" do
      assert_equal "https://tunes-takeout-api.herokuapp.com/", TunesTakeoutWrapper::BASE_URL
    end

    describe "API" do
      before do
        @banana_suggestion = TunesTakeoutWrapper.find("banana")
      end

      VCR.use_cassette('knows_its_id') do
        it "knows its id", :vcr do
            assert_equal "V0HIl1ElJwADzFsI", @banana_suggestion.id
        end
      end
    end

  end
end
