class PrivilegesUser < ApplicationRecord
  belongs_to :privilege
  belongs_to :user
end
