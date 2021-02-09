class User < ApplicationRecord
  before_create :normalize_input
  validates :first_name, :last_name, :city, :designation, :company, :linkedin_id, presence: true
  validates :email, presence: true, format: { with: /\A([\w\.\-]+)@([\w\-]+)((\.(\w){2,3})+)\z/, message: "Invalid" }
  validates :phone, presence: true, format: { with: /\+?\d[\d -]{8,12}\d/, message: "Invalid" }
  validates :zip_code, presence: true, length: { is: 6 }
  validates :experience, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :salary, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  
  private
    def normalize_input
      self.first_name = first_name.downcase.titleize
      self.last_name = last_name.downcase.titleize
      self.city = city.downcase.titleize
      self.designation = designation.downcase.titleize
      self.company = company.downcase.titleize
      self.email = email.downcase
    end
end
