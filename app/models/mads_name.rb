class MadsName < ActiveFedora::Base
  has_metadata 'damsMetadata', :type => MadsNameDatastream 
  delegate_to "damsMetadata", [:name, :elementList, :scheme, :externalAuthority, :fullNameValue, :familyNameValue, :givenNameValue, :dateNameValue, :nameLabel, :termOfAddressValue, :nameValue]
  
end
