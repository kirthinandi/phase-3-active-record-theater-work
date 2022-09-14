class Role < ActiveRecord::Base
    has_many :auditions

    def actors 
        auditions.map {|audition| audition.character_name}
    end

    def locations
        auditions.map {|audition| audition.location}
    end

    def lead 
        if auditions.where(hired: true)
            auditions.find(hired: true)
        else
            "no actor has been hired for this role"
        end
    end

    def understudy
        if auditions.where(hired: true).length > 1
            auditions.where(hired: true)[1]
        else
            'no actor has been hired for understudy for this role'
        end
    end
end