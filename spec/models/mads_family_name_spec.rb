# -*- encoding: utf-8 -*-
require 'spec_helper'

describe MadsFamilyName do
  subject do
    MadsFamilyName.new pid: "zzXXXXXXX1"
  end
  it "should create a xml" do    
    subject.name = "Calder (Family : 1757-1959 : N.C.)"
    subject.scheme = "bd0683587d"
    subject.externalAuthority =  "http://id.loc.gov/authorities/names/n2012026835"
    subject.familyNameValue = "Calder (Family :"
    subject.dateNameValue = "1757-1959 :"
    subject.termOfAddressValue = "N.C.)"
    xml =<<END
<rdf:RDF
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:mads="http://www.loc.gov/mads/rdf/v1#"
  xmlns:owl="http://www.w3.org/2002/07/owl#"
  xmlns:dams="http://library.ucsd.edu/ontology/dams#">
 <mads:FamilyName rdf:about="#{Rails.configuration.id_namespace}zzXXXXXXX1">
    <mads:authoritativeLabel>Calder (Family : 1757-1959 : N.C.)</mads:authoritativeLabel>
    <mads:hasExactExternalAuthority rdf:resource="http://id.loc.gov/authorities/names/n2012026835"/>
    <mads:isMemberOfMADSScheme rdf:resource="#{Rails.configuration.id_namespace}bd0683587d"/>
    <mads:elementList rdf:parseType="Collection">
      <mads:FamilyNameElement>
        <mads:elementValue>Calder (Family :</mads:elementValue>
      </mads:FamilyNameElement>
      <mads:DateNameElement>
        <mads:elementValue>1757-1959 :</mads:elementValue>
      </mads:DateNameElement>
      <mads:TermsOfAddressNameElement>
        <mads:elementValue>N.C.)</mads:elementValue>
      </mads:TermsOfAddressNameElement>
    </mads:elementList>    
  </mads:FamilyName>
</rdf:RDF>
END
    subject.damsMetadata.content.should be_equivalent_to xml

  end
end
