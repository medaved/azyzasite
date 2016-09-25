class IndexController < ApplicationController
  def home
    #static page
  end

  def faq
    @section = 'faq'
  end

  def blog
    #w.i.p
  end
end