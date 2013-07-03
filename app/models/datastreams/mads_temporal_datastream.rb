class MadsTemporalDatastream < MadsDatastream
  include DamsHelper
  map_predicates do |map|
    map.name(:in => MADS, :to => 'authoritativeLabel')
    map.schemeNode(:in => MADS, :to => 'isMemberOfMADSScheme')
	map.externalAuthorityNode(:in => MADS, :to => 'hasExactExternalAuthority') 
    map.elementList(:in => MADS, :to => 'elementList', :class_name=>'List')
  end
  rdf_subject { |ds| RDF::URI.new(Rails.configuration.id_namespace + ds.pid)}
  def serialize
    graph.insert([rdf_subject, RDF.type, MADS.Temporal]) if new?
    super
  end
  def elementValue
    getElementValue "TemporalElement"
  end
  
  def elementValue=(s)
    setElementValue( "TemporalElement", s )
  end  
end
