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
    user_ip = request.remote_addr
    @safe_ip = user_ip.gsub('.', '-')
    @voted = Poll.exists?(ip: user_ip)
    @count = Poll.all.length
  end

  def vote
    user_ip = params.require(:ip).gsub('-', '.')
    p "*** IP ***: " + user_ip
    if !Poll.exists?(ip: user_ip)
      Poll.create(ip: user_ip)
    end
    @count = Poll.all.length
    redirect_to action: "poll"
  end
end