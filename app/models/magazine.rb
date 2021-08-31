class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

    def email_list
        readers.pluck(:email).join(';')
    end 

    def self.most_popular
        most_popular = all.map{|magazine| magazine.subscriptions.count}.max
        all.find{|magazine| magazine.subscriptions.count == most_popular}
        
    end  
  
end