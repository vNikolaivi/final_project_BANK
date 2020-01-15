class ApplicationMailer < ActionMailer::Base
  default from: 'vnikolaivi@gmail.com'

  def approved(bill)
    @bill_type = bill.bill_type
    @user = bill.user
    mail (to @user.email, subject: "Your Bill was Approved!")
  end
end
