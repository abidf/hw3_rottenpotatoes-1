require 'spec_helper'

describe Movie do
  describe 'Searching for movies with same Director' do
    it 'should call DB for Movies with given Director' do
			Movie.find_by_director('Ridley Scott')
    end
  end
end

