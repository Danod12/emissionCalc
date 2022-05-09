#email:string
#password_digest: string

#The method has secure password also has some virtual attributes assosciated with it. Only will ever intereact with 
#password and password confirmation. These are run through the has_secure_password method then run it through
#bcrypt to create as password digest. has_secure_password also checks to see if password and passwprd_confirmation matches
#password digest is then inserted into the database.

#password:string virtual
#password_confirmation: string virtual

class User < ApplicationRecord
    has_secure_password
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    validates :email , presence: true,uniqueness:{case_sensetive:false},
    format:{with:VALID_EMAIL_REGEX, multiline:true, message: "must be a valid email address"}
end
