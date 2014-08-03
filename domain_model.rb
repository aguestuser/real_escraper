class Property
  has_one :location, as: :locatable
  has_many :deeds
  has_many :owners, through: :deeds
  has_many :mortgages
  has_many :hpd_violations
  has_many :building_permits

  PROPERTY_TYPES = [ 'Residential', 'Commerical', 'Condo' ]
  @type # Property::PROPERTY_TYPE

  ZONINGS = [ '' ]
  @zoning # PROPRTY::ZONING
  
  @units # Int
  @floor_area_ratio

  current_deed # output: Deed
  current_owner # output: Owner



end

class Deed
  belongs_to :property
  belongs_to :owner

  OWNER_TYPES = [ 'Landlord', 'Firm', 'Agency' ]
  @owner_type # Property::OWNER_TYPE

end

class Location
  belongs_to :locatable
  
  LOCATABLE_TYPES = [ 'Property', 'Office' ]
  @locatable_type # Location::LOCATABLE_TYPE

  @block # Int w/ formatting constraints
  BOROUGHS = [ 'Brooklyn', 'Manhattan', 'Bronx', 'Staten Island', 'Queens' ]
  @borough # Location::BOROUGH
  @street_number # Int w/ formatting constraints
  @street # Str
  @address # Str w/ formatting constraints
  @lat # Decimal w/ formatting constraints
  @lon # Decimal w/ formatting constraints 
end


class Landlord
  has_many :deeds as: :owner
  has_many :shares as: :shareholder

end

class Investor
  has_many :shares as: :shareholder
end

class Firm
  has_many :properties as: :owner
  has_many :shares
  has_many :offices, as: :officeable
end

class Office
  belongs_to :officeable
  has_one :location, as: :locatable

  OFFICABLE_TYPES = [ 'Firm', 'Landlord', 'Agency' ]
  @officeable_type
end

class Share
  belongs_to :shareholder
  belongs_to :firms

  SHAREHOLDER_TYPES = ['Landlord', 'Investor', 'Manager'] 
  @shareholder_type 
end


class Block
  has_many :lots
  @number
end

class Lot
  belongs_to :block
end

