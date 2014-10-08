class Log < ActiveRecord::Base
  define_callbacks: add_info_about_email

# Custom callback
  def add_info_about_email
    ActiveRecord::Base.transaction do
      run_callbacks do

      end
    end
  end
end
