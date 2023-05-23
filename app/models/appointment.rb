class Appointment < ApplicationRecord
    belongs_to :user

    #Technician Appointments and it is inherited by Users Controller and instance variables name is "@techpassedapp, @techupcomingapp"
    scope :techpassedapp, -> { where("appdate < ?", DateTime.now).order("appdate desc") }
    scope :techupcomingapp, -> { where("appdate >= ?", DateTime.now).where("techname: current_user") }    

    scope :techupcomingappfirstrecord, -> { where("appdate >= ?", DateTime.now) }
    

    #Customer Appointments and it is inherited by Users Controller and instance variables name is "@customerpastapp, @customerupcomingapp"
    scope :customerpastapp, -> { where("appdate < ?", Date.current).order("appdate desc") }
    scope :customerupcomingapp, -> { where("appdate >= ?", Date.current) }

end