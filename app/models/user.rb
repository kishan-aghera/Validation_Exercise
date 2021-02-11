class User < ApplicationRecord
  before_save :normalize_name, :normalize_remaining_input
  before_validation :email_downcase
  before_save :number_to_indian_currency
  
  validates :first_name, :last_name, :city, :designation, :company, :linkedin_id, presence: true
  validates :email, presence: true, format: { with: /\A([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)\z/, message: "Invalid" }
  validates :phone, presence: true, format: { with: /\+?\d[\d -]{8,12}\d/, message: "Invalid" }
  validates :zip_code, presence: true, length: { is: 6 }
  validates :experience, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :salary, presence: true
  
  private
    def normalize_name
      self.first_name = first_name.downcase.titleize
      self.last_name = last_name.downcase.titleize
    end

    def email_downcase
      self.email = email.downcase
    end

    def normalize_remaining_input  
      self.city = city.downcase.titleize
      self.designation = designation.downcase.titleize
      self.company = company.downcase.titleize
    end

    def number_to_indian_currency
      if self.salary.present?
        string = self.salary.to_s.split('.')
        self.salary = string[0].gsub(/(\d+)(\d{3})$/){ p = $2;"#{$1.reverse.gsub(/(\d{2})/,'\1,').reverse},#{p}"}
        self.salary = self.salary.gsub(/^,/, '') + '.' + string[1] if string[1] # remove leading comma
        self.salary = self.salary[1..-1] if self.salary[0] == 44
      end
      self.salary = "₹ #{self.salary}"
    end
end
