class TestsController < ApplicationController
  def new
    @test = Test.new(:service_id => params[:service_id])
  end

  def create
    @test = Test.new(params[:test])
    @test.save
    redirect_to test_path(@test)
  end

  def show
    @test = Test.find(params[:id])
  end

  def remove_watcher
    @test = Test.find(params[:test_id])
    @watcher = User.find(params[:watcher_id])
    @test.watchers.delete(@watcher)
    redirect_to test_path(@test)
  end

  def update
    @test = Test.find(params[:id])

    if (params[:test][:new_watcher])
      @test.watchers << User.find(params[:test][:new_watcher])
    end
    
    redirect_to test_path(@test)
  end

end
