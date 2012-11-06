require 'spec_helper'

describe MoviesController do
	describe 'Creating a new Movie' do
		it 'it should select crate template for rendering' do
			post :new
			response.should render_template('new')
		end
	end
  describe 'searching Movies With Same Director' do
    before :each do
      @fake_results=[mock('Movie'), mock('Movie')]
    end
    it 'should call the model method that performs movies search' do
      Movie.should_receive(:find_by_director).with("director").
				and_return(@fake_results)      
      post :search_by_director, {:director => 'director'}
    end
    describe 'after valid search' do
      before :each do
        Movie.stub(:find_by_director).and_return(@fake_results)
        post :search_by_director, {:director => 'director'}
      end
      it 'should select the Search Results template for rendering' do
        response.should render_template('search_by_director')
      end
      it 'should make the search results available to that template' do
        assigns(:movies).should == @fake_results
      end
    end
  end
end


