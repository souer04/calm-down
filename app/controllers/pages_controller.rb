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
    @voted = self.voted?(cookies)
    @count = Poll.all.length
  end

  def vote
    if !cookies[:voted].present?
      Poll.create(ip: request.remote_ip)
      cookies.permanent[:voted] = "true"
    end
    @count = Poll.all.length
    redirect_to action: "poll"
  end

  private

  def get_user_ip
    forwarded_for = request.env['HTTP_X_FORWARDED_FOR']
    if forwarded_for
      forwarded_for.split(',').first.strip
    else
      request.remote_ip
    end
  end

  def voted?(cookies)
    cookies[:voted].present?
  end
end