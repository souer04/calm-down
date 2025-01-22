class PagesController < ApplicationController
  def home
  end

  def about
  end

  def faq
  end

  def donate
  end

  def poll
    @user_ip = request.remote_ip.gsub('.', '-')
    @voted = false
    @count = Poll.all.length

    if Poll.exists?(ip: @user_ip)
      @voted = true
    end
  end

  def vote
    user_ip = request.remote_ip.gsub('-', '.')
    if !Poll.exists?(ip: user_ip)
      Poll.create(ip: user_ip)
    end
    @count = Poll.all.length
    @voted = true
    render 'poll'
  end
end