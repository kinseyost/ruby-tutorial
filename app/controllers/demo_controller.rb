class DemoController < ApplicationController

  layout false

  def index
    @array = [1, 2, 3, 4, 5]
    render(:template => 'demo/hello')
  end
  def somethingRandom
    @actionName = 'actionName'
    render('index')
  end
  def actionName
    @actionName = 'somethingRandom'
    render('index')
  end
  def other_hello
    redirect_to(:controller => 'demo', :action => 'index')
  end
  def kinseyost
    redirect_to('https://github.com/kinseyost')
  end
end
