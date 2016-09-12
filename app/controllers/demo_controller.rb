class DemoController < ApplicationController

  layout false

  def index
    render(:template => 'demo/hello')
  end
  def somethingRandom
    render('index')
  end
  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end
  def kinseyost
    redirect_to('https://github.com/kinseyost')
  end
end
