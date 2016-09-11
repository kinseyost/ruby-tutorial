class DemoController < ApplicationController

  layout false

  def index
    render(:template => 'demo/hello')
  end
  def somethingRandom
    render('index')
  end
end
