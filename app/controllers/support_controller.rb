class SupportController < ApplicationController

  def privacy
    redirect_to "https://www.iubenda.com/privacy-policy/825168"
  end

  def new
    @support_email = @support_email || SupportEmail.new
  end

  def create
    @support_email = SupportEmail.new(support_params)
    if @support_email.save
      @support_email.update(sent_on: Time.new)
      render "thanks"
    else
      render "new"
    end
  end

  def thanks
  end

  private

  def support_params
    params.require(:support_email).permit(:sender, :body, :subject)
  end

end
