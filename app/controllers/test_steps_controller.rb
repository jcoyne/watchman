class TestStepsController < ApplicationController
  def new 
    @test_step = TestStep.new(:test_id => params[:test_id])
  end

  def create
    @test_step = TestStep.new(params[:test_step])
    @test_step.save

    redirect_to test_path(@test_step.test)
  end

  def edit
    @test_step = TestStep.find(params[:id])
    render 'new'
  end

  def update
    @test_step = TestStep.find(params[:id])
    if @test_step.update_attributes(params[:test_step])
      redirect_to test_path(@test_step.test)
    else 
      render 'new'
    end
    
  end

end
