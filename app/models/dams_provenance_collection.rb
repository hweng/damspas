class DamsProvenanceCollection < ActiveFedora::Base
  include Hydra::ModelMethods  
  has_metadata 'damsMetadata', :type => DamsProvenanceCollectionDatastream 
  delegate_to "damsMetadata", [
    :beginDate,
    :builtWorkPlace_attributes,
    :builtWorkPlace,
    :complexSubject_attributes,
    :complexSubject,
    :conferenceName_attributes,
    :conferenceName,
    :corporateName_attributes,
    :corporateName,
    :creatorURI, 
    :culturalContext_attributes,
    :culturalContext,
    :custodialResponsibilityNote,
    :custodialResponsibilityNote_attributes,
    :date_attributes,
    :date,
    :dateValue,
    :endDate,
    :event,
    :familyName_attributes, 
    :familyName,
    :file_attributes,
    :file,
    :function_attributes,
    :function,
    :genreForm_attributes,
    :genreForm,
    :geographic_attributes,
    :geographic,
    :iconography_attributes,
    :iconography,
    :language_attributes,
    :language,
    :languageURI,
    :license_attributes, 
    :license,
    :licenseURI,
    :name_attributes,
    :name,
    :nameType,
    :nameURI,
    :note_attributes,
    :note,
    :noteDisplayLabel, 
    :noteType, 
    :occupation_attributes, 
    :occupation,
    :otherRights_attributes,
    :otherRights, 
    :otherRightsURI,
    :personalName_attributes,
    :personalName,
    :preferredCitationNote,
    :preferredCitationNote_attributes,
    :assembledCollection,    
    :provenanceCollectionPart_attributes,    
    :provenanceCollectionPart,
    :provenanceCollectionPartURI,
    :provenanceHasCollPartURI,
    :part_node,
    :relatedResource_attributes,
    :relatedResource,
    :relatedResourceDescription, 
    :relatedResourceType, 
    :relatedResourceUri, 
    :relationship_attributes,
    :relationship,
    :relationshipNameType, 
    :relationshipNameURI, 
    :relationshipRoleURI,
    #:role,
    #:role_attributes,
    :scientificName_attributes,
    :scientificName,
    :scopeContentNote_attributes,
    :scopeContentNote,
    :simpleSubjectURI, 
    :sourceCapture,
    :statute_attributes,
    :statute,
    :statuteURI,
    :stylePeriod_attributes,
    :stylePeriod,
    :subject,
    :subjectType,
    :subjectURI,
    :subtitle,
    :technique_attributes,
    :technique,
    :temporal_attributes,
    :temporal,
    :title_attributes,    
    :title,
    :titleNonSort,
    :titlePartName,
    :titlePartNumber,
    :titleValue,
    :titleVariant,
    :titleTranslationVariant,
    :titleAbbreviationVariant,
    :titleAcronymVariant,
    :titleExpansionVariant,
    :topic_attributes,
    :topic,
    :typeOfResource,
    :unit_attributes,
    :unit,
    :unitURI,
    :visibility,
    :resource_type
  ]

  # rights metadata
  has_metadata 'rightsMetadata', :type => Hydra::Datastream::RightsMetadata
  include Hydra::ModelMixins::RightsMetadata

 def provenanceCollectionParts
    damsMetadata.load_provenanceCollectionParts damsMetadata.provenanceCollectionPart
  end

 def languages
    damsMetadata.load_languages damsMetadata.language
  end

  def collections
    damsMetadata.load_collection damsMetadata.collection,damsMetadata.assembledCollection,damsMetadata.provenanceCollection,damsMetadata.provenanceCollectionPart
  end

  def complexSubjects
    damsMetadata.load_complexSubjects damsMetadata.subject
  end


  
end
