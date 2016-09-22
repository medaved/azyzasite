class IndexController < ApplicationController
  def home
    @title = 'Azyza | Главная'
    @section = 'home'
  end
  def contacts
    @title = 'Azyza | Contacts'
    @section = 'contacts'
  end
  def faq
    @title = 'Azyza | F.A.Q.'
    @section = 'faq'
  end
  def gallery
    @title = 'Azyza | Галерея'
    @section = 'gallery'
  end
  def shop
    @title = 'Azyza | Магазин'
    @section = 'shop'
  end
  def blog
    @title = 'Azyza | Блог'
    @section = 'blog'
  end
end