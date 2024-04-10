class TestMailer < ActionMailer::Base
  def test(email)
    mail(
      subject: "Email Test",
      to: email,
      from: from_address
    ) do |format|
      format.html { render 'test' }
    end
  end

  private

  def from_address
    Setting.dig(:smtp, :from).presence || "Line5 <noreply@line5.com>"
  end
end
