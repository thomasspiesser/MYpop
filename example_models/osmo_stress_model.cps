<?xml version="1.0" encoding="UTF-8"?>
<!-- generated with COPASI 4.15.96 (Source) (http://www.copasi.org) at 2015-09-23 10:11:37 UTC -->
<?oxygen RNGSchema="http://www.copasi.org/static/schema/CopasiML.rng" type="xml"?>
<COPASI xmlns="http://www.copasi.org/static/schema" versionMajor="4" versionMinor="15" versionDevel="96" copasiSourcesModified="0">
  <ListOfFunctions>
    <Function key="Function_6" name="Constant flux (irreversible)" type="PreDefined" reversible="false">
      <Expression>
        v
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_49" name="v" order="0" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_13" name="Mass action (irreversible)" type="MassAction" reversible="false">
      <MiriamAnnotation>
<rdf:RDF xmlns:CopasiMT="http://www.copasi.org/RDF/MiriamTerms#" xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
   <rdf:Description rdf:about="#Function_13">
   <CopasiMT:is rdf:resource="urn:miriam:obo.sbo:SBO:0000041" />
   </rdf:Description>
   </rdf:RDF>
      </MiriamAnnotation>
      <Comment>
        <body xmlns="http://www.w3.org/1999/xhtml">
<b>Mass action rate law for first order irreversible reactions</b>
<p>
Reaction scheme where the products are created from the reactants and the change of a product quantity is proportional to the product of reactant activities. The reaction scheme does not include any reverse process that creates the reactants from the products. The change of a product quantity is proportional to the quantity of one reactant.
</p>
</body>
      </Comment>
      <Expression>
        k1*PRODUCT&lt;substrate_i&gt;
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_81" name="k1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_79" name="substrate" order="1" role="substrate"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_40" name="Rate Law for Vos osmoregulation_1" type="UserDefined" reversible="false">
      <Expression>
        parameter_1*parameter_7*(parameter_8+parameter_10-parameter_9)
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_258" name="parameter_1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_246" name="parameter_10" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_254" name="parameter_7" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_262" name="parameter_8" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_264" name="parameter_9" order="4" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_41" name="Rate Law for glycerol export_1" type="UserDefined" reversible="false">
      <Expression>
        parameter_30*species_4/species_7*parameter_1
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_268" name="parameter_1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_267" name="parameter_30" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_266" name="species_4" order="2" role="substrate"/>
        <ParameterDescription key="FunctionParameter_265" name="species_7" order="3" role="modifier"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_42" name="Rate law for Cln1/2 production [1]_1" type="UserDefined" reversible="false">
      <Expression>
        parameter_1*(parameter_35/parameter_6)*species_6*species_1
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_273" name="parameter_1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_272" name="parameter_35" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_271" name="parameter_6" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_270" name="species_1" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_269" name="species_6" order="4" role="modifier"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_43" name="Rate Law for Vos Growth_1" type="UserDefined" reversible="false">
      <Expression>
        parameter_41*(3/2)*(parameter_11*species_3^(1/2)+parameter_12*species_2^(1/2))
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_278" name="parameter_11" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_277" name="parameter_12" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_276" name="parameter_41" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_275" name="species_2" order="3" role="modifier"/>
        <ParameterDescription key="FunctionParameter_274" name="species_3" order="4" role="modifier"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_44" name="Rate Law for Gpd1 stress transcription_1" type="UserDefined" reversible="false">
      <Expression>
        parameter_39*parameter_33
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_280" name="parameter_33" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_279" name="parameter_39" order="1" role="constant"/>
      </ListOfParameterDescriptions>
    </Function>
    <Function key="Function_45" name="Rate Law for glycerol produciton_1" type="UserDefined" reversible="false">
      <Expression>
        parameter_1*parameter_2*(parameter_26/(parameter_3+parameter_4+parameter_5+parameter_26))*(1/parameter_6)*species_1
      </Expression>
      <ListOfParameterDescriptions>
        <ParameterDescription key="FunctionParameter_288" name="parameter_1" order="0" role="constant"/>
        <ParameterDescription key="FunctionParameter_287" name="parameter_2" order="1" role="constant"/>
        <ParameterDescription key="FunctionParameter_286" name="parameter_26" order="2" role="constant"/>
        <ParameterDescription key="FunctionParameter_285" name="parameter_3" order="3" role="constant"/>
        <ParameterDescription key="FunctionParameter_284" name="parameter_4" order="4" role="constant"/>
        <ParameterDescription key="FunctionParameter_283" name="parameter_5" order="5" role="constant"/>
        <ParameterDescription key="FunctionParameter_282" name="parameter_6" order="6" role="constant"/>
        <ParameterDescription key="FunctionParameter_281" name="species_1" order="7" role="modifier"/>
      </ListOfParameterDescriptions>
    </Function>
  </ListOfFunctions>
  <Model key="Model_4" name="spiesser2012_size_control_Sc" simulationType="time" timeUnit="min" volumeUnit="fl" areaUnit="fm²" lengthUnit="fm" quantityUnit="dimensionless" type="deterministic" avogadroConstant="6.02214129e+23">
    <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Model_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T14:28:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

    </MiriamAnnotation>
    <Comment>
      
  <body xmlns="http://www.w3.org/1999/xhtml">
    <pre>This model is based on core_model_osmo_stress_20140828_clean_addon_newItsnotif_VosPt0fracPar.xml and extends it by an additional parameter khforkosmo to describe an effect of Hog1 activity on glycerol production and will comes in 3 different flavors for different determinations of kosmo as given in CompareVersionsForKosmo.nb. The first corresponds to the oringinal model and does not need to be fitted.</pre>
  </body>

    </Comment>
    <ListOfCompartments>
      <Compartment key="Compartment_1" name="compartment" simulationType="fixed" dimensionality="3">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Compartment_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T14:32:53Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Compartment>
    </ListOfCompartments>
    <ListOfMetabolites>
      <Metabolite key="Metabolite_1" name="B_R" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:33:09Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_3" name="B_Am" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:32:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_5" name="B_Ad" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:19:53Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_7" name="glycerol" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:07:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_9" name="Gpd1" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_9">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-09T09:46:09Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_11" name="mGpd1" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_11">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-09T09:46:19Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
      <Metabolite key="Metabolite_13" name="Vos" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:11:21Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <InitialExpression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=InitialValue&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[BosRatio],Reference=InitialValue&gt;
        </InitialExpression>
      </Metabolite>
      <Metabolite key="Metabolite_15" name="mB_A" simulationType="reactions" compartment="Compartment_1">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Metabolite_15">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-08-29T14:25:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
      </Metabolite>
    </ListOfMetabolites>
    <ListOfModelValues>
      <ModelValue key="ModelValue_0" name="A_t" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:23:22Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_1" name="growth" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:25:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          
  <body xmlns="http://www.w3.org/1999/xhtml">
    <pre>nutrient quality term</pre>
  </body>

        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_2" name="k_R" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:27:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          
  <body xmlns="http://www.w3.org/1999/xhtml">
    <pre>energy allocation to internal biomass (ribosomes etc.)</pre>
  </body>

        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_3" name="k_Am" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:28:48Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          
  <body xmlns="http://www.w3.org/1999/xhtml">
    <pre>energy allocation to biomass mother</pre>
  </body>

        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_4" name="k_Ad" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:28:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Comment>
          
  <body xmlns="http://www.w3.org/1999/xhtml">
    <pre>energy allocation to biomass daughter</pre>
  </body>

        </Comment>
      </ModelValue>
      <ModelValue key="ModelValue_5" name="V_t" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2011-10-26T17:21:09Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_6" name="Lp" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:05:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_7" name="Pt" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:09:04Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pt0],Reference=Value&gt;*(1-(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0],Reference=Value&gt;-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Vos],Reference=Concentration&gt;)/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0],Reference=Value&gt;-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[VosPt0],Reference=Value&gt;))*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[itsnotif],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_8" name="Pi" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_8">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:06:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[osmoi],Reference=Value&gt;/&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Vos],Reference=Concentration&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[R],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[T],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[cpc],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_9" name="Pe" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_9">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:05:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[osmoe],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[R],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[T],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[cpc],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_10" name="dAddt" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_10">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:00:27Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[A_t],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[growth],Reference=Value&gt;*(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Ad],Reference=Value&gt;/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Ad],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Am],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_R],Reference=Value&gt;))*(1/&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=Value&gt;)*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[mB_A],Reference=Concentration&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[B_R],Reference=Concentration&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[factor],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_11" name="dAmdt" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_11">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:00:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[A_t],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[growth],Reference=Value&gt;*(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Am],Reference=Value&gt;/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Ad],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Am],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_R],Reference=Value&gt;))*(1/&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=Value&gt;)*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[mB_A],Reference=Concentration&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[B_R],Reference=Concentration&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[factor],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_12" name="Vos0" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_12">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:13:47Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[BosRatio],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_13" name="VosPt0" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_13">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:14:10Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[BosRatio],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[VosPt0_fraction],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_14" name="Pt0" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_14">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:10:02Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_15" name="R" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_15">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:10:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_16" name="T" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_16">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:10:32Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_17" name="osmoe" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_17">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:05:56Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_18" name="osmoi" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_18">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:06:01Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[B_R],Reference=Concentration&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kconvert],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[glycerol],Reference=Concentration&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_19" name="cpc" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_19">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:16:12Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <InitialExpression>
          10^3
        </InitialExpression>
      </ModelValue>
      <ModelValue key="ModelValue_20" name="Vrel" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_20">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:15:50Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Vos],Reference=Concentration&gt;/&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=Value&gt;+(1-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[BosRatio],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_21" name="kconvert" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_21">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T16:37:17Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_22" name="NaCl_conc" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_22">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T21:55:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_23" name="itsnotif" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_23">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-06T22:36:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          (1-(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0],Reference=Value&gt;-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Vos],Reference=Concentration&gt;)/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0],Reference=Value&gt;-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[VosPt0],Reference=Value&gt;)+abs(1-(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0],Reference=Value&gt;-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Vos],Reference=Concentration&gt;)/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0],Reference=Value&gt;-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[VosPt0],Reference=Value&gt;)))/(2*(1-(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0],Reference=Value&gt;-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Vos],Reference=Concentration&gt;)/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0],Reference=Value&gt;-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[VosPt0],Reference=Value&gt;)))
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_24" name="factor" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_24">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:00:08Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          (&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_R],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Ad],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Am],Reference=Value&gt;)/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_R],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Ad],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Am],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kosmo],Reference=Value&gt;)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_25" name="kosmo" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_25">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:05:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kgpd1],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Gpd1],Reference=Concentration&gt;^2+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[khforkosmo],Reference=Value&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kHog1],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_26" name="ko1" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_26">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:04:36Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_27" name="ko2" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_27">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:04:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_28" name="ko3" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_28">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:05:09Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_29" name="kfps1" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_29">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:03:53Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pt],Reference=Value&gt;^&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kf3],Reference=Value&gt;/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pt],Reference=Value&gt;^&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kf3],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kf2],Reference=Value&gt;^&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kf3],Reference=Value&gt;)*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kf1],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_30" name="kf1" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_30">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:02:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_31" name="kf2" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_31">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:02:29Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_32" name="kHog1" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_32">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T11:22:31Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          (1-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vrel],Reference=Value&gt;^&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ko3],Reference=Value&gt;/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vrel],Reference=Value&gt;^&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ko3],Reference=Value&gt;+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ko2],Reference=Value&gt;^&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ko3],Reference=Value&gt;))*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ko1],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_33" name="kgpd1" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_33">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:38:05Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_34" name="ktransl" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_34">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:05:59Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_35" name="kdeg2" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_35">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:37:54Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_36" name="kdeg1" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_36">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:37:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_37" name="kbasal" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_37">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:37:45Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_38" name="ktransc" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_38">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:38:15Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_39" name="kf3" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_39">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:37:58Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_40" name="BosRatio" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_40">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:37:13Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_41" name="k__Cln_plus" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_41">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-02-12T14:34:21Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          1-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kHog1],Reference=Value&gt;^10/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kHog1],Reference=Value&gt;^10+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[hog1threshold],Reference=Value&gt;^10)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_42" name="k__Clb_plus" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_42">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-06-25T14:40:33Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          1-&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kHog1],Reference=Value&gt;^10/(&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kHog1],Reference=Value&gt;^10+&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[itsnotif],Reference=Value&gt;^10)
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_43" name="k__B_R" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_43">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-08-29T14:55:18Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[factor],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_44" name="k__B_Am" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_44">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-08-29T14:55:41Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[factor],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_45" name="k__B_Ad" simulationType="assignment">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_45">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2013-08-29T14:55:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
        <Expression>
          &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[factor],Reference=Value&gt;
        </Expression>
      </ModelValue>
      <ModelValue key="ModelValue_46" name="kmgpd1" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_46">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-09-23T12:08:57Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_47" name="VosPt0_fraction" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_47">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-09-23T12:10:26Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_48" name="hog1threshold" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_48">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-09-23T12:07:20Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
      <ModelValue key="ModelValue_49" name="khforkosmo" simulationType="fixed">
        <MiriamAnnotation>
<rdf:RDF
   xmlns:dcterms="http://purl.org/dc/terms/"
   xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#ModelValue_49">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2015-09-23T12:08:46Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>

        </MiriamAnnotation>
      </ModelValue>
    </ListOfModelValues>
    <ListOfReactions>
      <Reaction key="Reaction_0" name="glycerol export" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_0">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:08:06Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4398" name="parameter_1" value="1"/>
          <Constant key="Parameter_4399" name="parameter_30" value="4.4779e-07"/>
        </ListOfConstants>
        <KineticLaw function="Function_41">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_268">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_267">
              <SourceParameter reference="ModelValue_29"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_266">
              <SourceParameter reference="Metabolite_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_265">
              <SourceParameter reference="Metabolite_13"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_1" name="glycerol produciton" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_1">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T10:08:55Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_7" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4400" name="parameter_1" value="1"/>
          <Constant key="Parameter_4401" name="parameter_2" value="0.0409953"/>
          <Constant key="Parameter_4402" name="parameter_26" value="0.000952175"/>
          <Constant key="Parameter_4403" name="parameter_3" value="1"/>
          <Constant key="Parameter_4404" name="parameter_4" value="1"/>
          <Constant key="Parameter_4405" name="parameter_5" value="1"/>
          <Constant key="Parameter_4406" name="parameter_6" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_45">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_288">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_287">
              <SourceParameter reference="ModelValue_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_286">
              <SourceParameter reference="ModelValue_25"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_285">
              <SourceParameter reference="ModelValue_2"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_284">
              <SourceParameter reference="ModelValue_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_283">
              <SourceParameter reference="ModelValue_4"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_282">
              <SourceParameter reference="ModelValue_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_281">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_2" name="Gpd1 base transcription" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_2">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T11:24:56Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4407" name="v" value="1.90362e-05"/>
        </ListOfConstants>
        <KineticLaw function="Function_6">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_49">
              <SourceParameter reference="ModelValue_37"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_3" name="Gpd1 translation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_3">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T11:25:36Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_11" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_1" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4408" name="parameter_1" value="1"/>
          <Constant key="Parameter_4409" name="parameter_35" value="2.57252e-08"/>
          <Constant key="Parameter_4410" name="parameter_6" value="1"/>
        </ListOfConstants>
        <KineticLaw function="Function_42">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_273">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_272">
              <SourceParameter reference="ModelValue_34"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_271">
              <SourceParameter reference="ModelValue_5"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_270">
              <SourceParameter reference="Metabolite_1"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_269">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_4" name="mGpd1 deg" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_4">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T11:26:12Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4411" name="k1" value="0.0736589"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="ModelValue_36"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_11"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_5" name="Gpd1 deg" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_5">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T11:25:07Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_9" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4412" name="k1" value="0.0263114"/>
        </ListOfConstants>
        <KineticLaw function="Function_13">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_81">
              <SourceParameter reference="ModelValue_35"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_79">
              <SourceParameter reference="Metabolite_9"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_6" name="Gpd1 stress transcription" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_6">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T11:25:23Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_11" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfConstants>
          <Constant key="Parameter_4413" name="parameter_33" value="0.952084"/>
          <Constant key="Parameter_4414" name="parameter_39" value="0.253222"/>
        </ListOfConstants>
        <KineticLaw function="Function_44">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_280">
              <SourceParameter reference="ModelValue_32"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_279">
              <SourceParameter reference="ModelValue_38"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_7" name="Vos growth" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_7">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:10:49Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfProducts>
          <Product metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfProducts>
        <ListOfModifiers>
          <Modifier metabolite="Metabolite_5" stoichiometry="1"/>
          <Modifier metabolite="Metabolite_3" stoichiometry="1"/>
        </ListOfModifiers>
        <ListOfConstants>
          <Constant key="Parameter_4415" name="parameter_11" value="0.449439"/>
          <Constant key="Parameter_4416" name="parameter_12" value="0.449439"/>
          <Constant key="Parameter_4417" name="parameter_41" value="0.6"/>
        </ListOfConstants>
        <KineticLaw function="Function_43">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_278">
              <SourceParameter reference="ModelValue_10"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_277">
              <SourceParameter reference="ModelValue_11"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_276">
              <SourceParameter reference="ModelValue_40"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_275">
              <SourceParameter reference="Metabolite_3"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_274">
              <SourceParameter reference="Metabolite_5"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
      <Reaction key="Reaction_8" name="Vos osmoregulation" reversible="false" fast="false">
        <MiriamAnnotation>
<rdf:RDF xmlns:dcterms="http://purl.org/dc/terms/" xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#">
  <rdf:Description rdf:about="#Reaction_8">
    <dcterms:created>
      <rdf:Description>
        <dcterms:W3CDTF>2012-11-07T23:11:52Z</dcterms:W3CDTF>
      </rdf:Description>
    </dcterms:created>
  </rdf:Description>
</rdf:RDF>
        </MiriamAnnotation>
        <ListOfSubstrates>
          <Substrate metabolite="Metabolite_13" stoichiometry="1"/>
        </ListOfSubstrates>
        <ListOfConstants>
          <Constant key="Parameter_4418" name="parameter_1" value="1"/>
          <Constant key="Parameter_4419" name="parameter_10" value="645250"/>
          <Constant key="Parameter_4420" name="parameter_7" value="2.58423e-06"/>
          <Constant key="Parameter_4421" name="parameter_8" value="375000"/>
          <Constant key="Parameter_4422" name="parameter_9" value="1.03517e+08"/>
        </ListOfConstants>
        <KineticLaw function="Function_40">
          <ListOfCallParameters>
            <CallParameter functionParameter="FunctionParameter_258">
              <SourceParameter reference="ModelValue_0"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_246">
              <SourceParameter reference="ModelValue_9"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_254">
              <SourceParameter reference="ModelValue_6"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_262">
              <SourceParameter reference="ModelValue_7"/>
            </CallParameter>
            <CallParameter functionParameter="FunctionParameter_264">
              <SourceParameter reference="ModelValue_8"/>
            </CallParameter>
          </ListOfCallParameters>
        </KineticLaw>
      </Reaction>
    </ListOfReactions>
    <ListOfModelParameterSets activeSet="ModelParameterSet_0">
      <ModelParameterSet key="ModelParameterSet_0" name="Initial State">
        <ModelParameterGroup cn="String=Initial Time" type="Group">
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc" value="0" type="Model" simulationType="time"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Compartment Sizes" type="Group">
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment]" value="1" type="Compartment" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Species Values" type="Group">
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[B_R]" value="32.9" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[B_Am]" value="17.9" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[B_Ad]" value="0" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[glycerol]" value="0.4996230185" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Gpd1]" value="9.04e-07" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[mGpd1]" value="0.0589312554" type="Species" simulationType="reactions"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[Vos]" value="0.6" type="Species" simulationType="reactions">
            <InitialExpression>
              &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=InitialValue&gt;*&lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[BosRatio],Reference=InitialValue&gt;
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Compartments[compartment],Vector=Metabolites[mB_A]" value="1" type="Species" simulationType="reactions"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Initial Global Quantities" type="Group">
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[A_t]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[growth]" value="0.0578939386" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_R]" value="3.56126" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Am]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Ad]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Lp]" value="2.58e-06" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pt]" value="375000" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pi]" value="91880320.73346496" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pe]" value="645249.54" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[dAddt]" value="0.3113348690372567" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[dAmdt]" value="0.3113348690372567" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vos0]" value="0.6" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[VosPt0]" value="0.5876961324" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pt0]" value="375000" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[R]" value="8.314" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[T]" value="298.5" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[osmoe]" value="0.26" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[osmoi]" value="22.2136230185" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[cpc]" value="1000" type="ModelValue" simulationType="fixed">
            <InitialExpression>
              10^3
            </InitialExpression>
          </ModelParameter>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Vrel]" value="1" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kconvert]" value="0.66" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[NaCl_conc]" value="0.3928" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[itsnotif]" value="1" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[factor]" value="0.9090169246797986" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kosmo]" value="0.5566238908405966" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ko1]" value="1" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ko2]" value="0.8752279501" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ko3]" value="40" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kfps1]" value="0.004464064825571263" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kf1]" value="0.0070949241" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kf2]" value="18176.019889614" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kHog1]" value="0.004816706753640765" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kgpd1]" value="2036741486.97893" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ktransl]" value="7.970000000000001e-08" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kdeg2]" value="0.0206148371" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kdeg1]" value="0.0313083658" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kbasal]" value="6.37e-07" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ktransc]" value="0.6444240371" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kf3]" value="0.1746878668" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[BosRatio]" value="0.6" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k__Cln_plus]" value="0.9999999999987842" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k__Clb_plus]" value="1" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k__B_R]" value="0.9090169246797986" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k__B_Am]" value="0.9090169246797986" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k__B_Ad]" value="0.9090169246797986" type="ModelValue" simulationType="assignment"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kmgpd1]" value="0.001444144" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[VosPt0_fraction]" value="0.979493554" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[hog1threshold]" value="0.0748622888" type="ModelValue" simulationType="fixed"/>
          <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[khforkosmo]" value="115.2155324154" type="ModelValue" simulationType="fixed"/>
        </ModelParameterGroup>
        <ModelParameterGroup cn="String=Kinetic Parameters" type="Group">
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol export]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol export],ParameterGroup=Parameters,Parameter=parameter_1" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[A_t],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol export],ParameterGroup=Parameters,Parameter=parameter_30" value="0.004464064825571263" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kfps1],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol produciton]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol produciton],ParameterGroup=Parameters,Parameter=parameter_1" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[A_t],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol produciton],ParameterGroup=Parameters,Parameter=parameter_2" value="0.0578939386" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[growth],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol produciton],ParameterGroup=Parameters,Parameter=parameter_26" value="0.5566238908405966" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kosmo],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol produciton],ParameterGroup=Parameters,Parameter=parameter_3" value="3.56126" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_R],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol produciton],ParameterGroup=Parameters,Parameter=parameter_4" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Am],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol produciton],ParameterGroup=Parameters,Parameter=parameter_5" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[k_Ad],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[glycerol produciton],ParameterGroup=Parameters,Parameter=parameter_6" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 base transcription]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 base transcription],ParameterGroup=Parameters,Parameter=v" value="6.37e-07" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kbasal],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 translation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 translation],ParameterGroup=Parameters,Parameter=parameter_1" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[A_t],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 translation],ParameterGroup=Parameters,Parameter=parameter_35" value="7.970000000000001e-08" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ktransl],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 translation],ParameterGroup=Parameters,Parameter=parameter_6" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[V_t],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[mGpd1 deg]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[mGpd1 deg],ParameterGroup=Parameters,Parameter=k1" value="0.0313083658" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kdeg1],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 deg]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 deg],ParameterGroup=Parameters,Parameter=k1" value="0.0206148371" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kdeg2],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 stress transcription]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 stress transcription],ParameterGroup=Parameters,Parameter=parameter_33" value="0.004816706753640765" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[kHog1],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Gpd1 stress transcription],ParameterGroup=Parameters,Parameter=parameter_39" value="0.6444240371" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[ktransc],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos growth]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos growth],ParameterGroup=Parameters,Parameter=parameter_11" value="0.3113348690372567" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[dAddt],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos growth],ParameterGroup=Parameters,Parameter=parameter_12" value="0.3113348690372567" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[dAmdt],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos growth],ParameterGroup=Parameters,Parameter=parameter_41" value="0.6" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[BosRatio],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
          <ModelParameterGroup cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos osmoregulation]" type="Reaction">
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos osmoregulation],ParameterGroup=Parameters,Parameter=parameter_1" value="1" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[A_t],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos osmoregulation],ParameterGroup=Parameters,Parameter=parameter_10" value="645249.54" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pe],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos osmoregulation],ParameterGroup=Parameters,Parameter=parameter_7" value="2.58e-06" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Lp],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos osmoregulation],ParameterGroup=Parameters,Parameter=parameter_8" value="375000" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pt],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
            <ModelParameter cn="CN=Root,Model=spiesser2012_size_control_Sc,Vector=Reactions[Vos osmoregulation],ParameterGroup=Parameters,Parameter=parameter_9" value="91880320.73346496" type="ReactionParameter" simulationType="assignment">
              <InitialExpression>
                &lt;CN=Root,Model=spiesser2012_size_control_Sc,Vector=Values[Pi],Reference=InitialValue&gt;
              </InitialExpression>
            </ModelParameter>
          </ModelParameterGroup>
        </ModelParameterGroup>
      </ModelParameterSet>
    </ListOfModelParameterSets>
    <StateTemplate>
      <StateTemplateVariable objectReference="Model_4"/>
      <StateTemplateVariable objectReference="Metabolite_11"/>
      <StateTemplateVariable objectReference="Metabolite_9"/>
      <StateTemplateVariable objectReference="Metabolite_7"/>
      <StateTemplateVariable objectReference="Metabolite_13"/>
      <StateTemplateVariable objectReference="ModelValue_7"/>
      <StateTemplateVariable objectReference="ModelValue_8"/>
      <StateTemplateVariable objectReference="ModelValue_9"/>
      <StateTemplateVariable objectReference="ModelValue_10"/>
      <StateTemplateVariable objectReference="ModelValue_11"/>
      <StateTemplateVariable objectReference="ModelValue_12"/>
      <StateTemplateVariable objectReference="ModelValue_13"/>
      <StateTemplateVariable objectReference="ModelValue_18"/>
      <StateTemplateVariable objectReference="ModelValue_20"/>
      <StateTemplateVariable objectReference="ModelValue_23"/>
      <StateTemplateVariable objectReference="ModelValue_24"/>
      <StateTemplateVariable objectReference="ModelValue_25"/>
      <StateTemplateVariable objectReference="ModelValue_29"/>
      <StateTemplateVariable objectReference="ModelValue_32"/>
      <StateTemplateVariable objectReference="ModelValue_41"/>
      <StateTemplateVariable objectReference="ModelValue_42"/>
      <StateTemplateVariable objectReference="ModelValue_43"/>
      <StateTemplateVariable objectReference="ModelValue_44"/>
      <StateTemplateVariable objectReference="ModelValue_45"/>
      <StateTemplateVariable objectReference="Metabolite_1"/>
      <StateTemplateVariable objectReference="Metabolite_3"/>
      <StateTemplateVariable objectReference="Metabolite_5"/>
      <StateTemplateVariable objectReference="Metabolite_15"/>
      <StateTemplateVariable objectReference="Compartment_1"/>
      <StateTemplateVariable objectReference="ModelValue_0"/>
      <StateTemplateVariable objectReference="ModelValue_1"/>
      <StateTemplateVariable objectReference="ModelValue_2"/>
      <StateTemplateVariable objectReference="ModelValue_3"/>
      <StateTemplateVariable objectReference="ModelValue_4"/>
      <StateTemplateVariable objectReference="ModelValue_5"/>
      <StateTemplateVariable objectReference="ModelValue_6"/>
      <StateTemplateVariable objectReference="ModelValue_14"/>
      <StateTemplateVariable objectReference="ModelValue_15"/>
      <StateTemplateVariable objectReference="ModelValue_16"/>
      <StateTemplateVariable objectReference="ModelValue_17"/>
      <StateTemplateVariable objectReference="ModelValue_19"/>
      <StateTemplateVariable objectReference="ModelValue_21"/>
      <StateTemplateVariable objectReference="ModelValue_22"/>
      <StateTemplateVariable objectReference="ModelValue_26"/>
      <StateTemplateVariable objectReference="ModelValue_27"/>
      <StateTemplateVariable objectReference="ModelValue_28"/>
      <StateTemplateVariable objectReference="ModelValue_30"/>
      <StateTemplateVariable objectReference="ModelValue_31"/>
      <StateTemplateVariable objectReference="ModelValue_33"/>
      <StateTemplateVariable objectReference="ModelValue_34"/>
      <StateTemplateVariable objectReference="ModelValue_35"/>
      <StateTemplateVariable objectReference="ModelValue_36"/>
      <StateTemplateVariable objectReference="ModelValue_37"/>
      <StateTemplateVariable objectReference="ModelValue_38"/>
      <StateTemplateVariable objectReference="ModelValue_39"/>
      <StateTemplateVariable objectReference="ModelValue_40"/>
      <StateTemplateVariable objectReference="ModelValue_46"/>
      <StateTemplateVariable objectReference="ModelValue_47"/>
      <StateTemplateVariable objectReference="ModelValue_48"/>
      <StateTemplateVariable objectReference="ModelValue_49"/>
    </StateTemplate>
    <InitialState type="initialState">
      0 0.0589312554 9.04e-07 0.4996230185 0.6 375000 91880320.73346496 645249.54 0.3113348690372567 0.3113348690372567 0.6 0.5876961324 22.2136230185 1 1 0.9090169246797986 0.5566238908405966 0.004464064825571263 0.004816706753640765 0.9999999999987842 1 0.9090169246797986 0.9090169246797986 0.9090169246797986 32.9 17.9 0 1 1 1 0.0578939386 3.56126 1 1 1 2.58e-06 375000 8.314 298.5 0.26 1000 0.66 0.3928 1 0.8752279501 40 0.0070949241 18176.019889614 2036741486.97893 7.970000000000001e-08 0.0206148371 0.0313083658 6.37e-07 0.6444240371 0.1746878668 0.6 0.001444144 0.979493554 0.0748622888 115.2155324154 
    </InitialState>
  </Model>
  <ListOfTasks>
    <Task key="Task_12" name="Steady-State" type="steadyState" scheduled="false" updateModel="false">
      <Report reference="Report_8" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="JacobianRequested" type="bool" value="1"/>
        <Parameter name="StabilityAnalysisRequested" type="bool" value="1"/>
      </Problem>
      <Method name="Enhanced Newton" type="EnhancedNewton">
        <Parameter name="Resolution" type="unsignedFloat" value="1e-09"/>
        <Parameter name="Derivation Factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Use Newton" type="bool" value="1"/>
        <Parameter name="Use Integration" type="bool" value="1"/>
        <Parameter name="Use Back Integration" type="bool" value="1"/>
        <Parameter name="Accept Negative Concentrations" type="bool" value="0"/>
        <Parameter name="Iteration Limit" type="unsignedInteger" value="50"/>
        <Parameter name="Maximum duration for forward integration" type="unsignedFloat" value="1000000000"/>
        <Parameter name="Maximum duration for backward integration" type="unsignedFloat" value="1000000"/>
      </Method>
    </Task>
    <Task key="Task_11" name="Time-Course" type="timeCourse" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Continue on Simultaneous Events" type="bool" value="1"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_10" name="Scan" type="scan" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="Subtask" type="unsignedInteger" value="1"/>
        <ParameterGroup name="ScanItems">
        </ParameterGroup>
        <Parameter name="Output in subtask" type="bool" value="1"/>
        <Parameter name="Adjust initial conditions" type="bool" value="0"/>
      </Problem>
      <Method name="Scan Framework" type="ScanFramework">
      </Method>
    </Task>
    <Task key="Task_9" name="Elementary Flux Modes" type="fluxMode" scheduled="false" updateModel="false">
      <Report reference="Report_7" target="" append="1" confirmOverwrite="1"/>
      <Problem>
      </Problem>
      <Method name="EFM Algorithm" type="EFMAlgorithm">
      </Method>
    </Task>
    <Task key="Task_8" name="Optimization" type="optimization" scheduled="false" updateModel="false">
      <Report reference="Report_6" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Subtask" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <ParameterText name="ObjectiveExpression" type="expression">
          
        </ParameterText>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
      </Problem>
      <Method name="Random Search" type="RandomSearch">
        <Parameter name="Number of Iterations" type="unsignedInteger" value="100000"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_7" name="Parameter Estimation" type="parameterFitting" scheduled="false" updateModel="false">
      <Report reference="Report_5" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Maximize" type="bool" value="0"/>
        <Parameter name="Randomize Start Values" type="bool" value="0"/>
        <Parameter name="Calculate Statistics" type="bool" value="1"/>
        <ParameterGroup name="OptimizationItemList">
        </ParameterGroup>
        <ParameterGroup name="OptimizationConstraintList">
        </ParameterGroup>
        <Parameter name="Steady-State" type="cn" value="CN=Root,Vector=TaskList[Steady-State]"/>
        <Parameter name="Time-Course" type="cn" value="CN=Root,Vector=TaskList[Time-Course]"/>
        <Parameter name="Create Parameter Sets" type="bool" value="0"/>
        <ParameterGroup name="Experiment Set">
        </ParameterGroup>
        <ParameterGroup name="Validation Set">
          <Parameter name="Weight" type="unsignedFloat" value="1"/>
          <Parameter name="Threshold" type="unsignedInteger" value="5"/>
        </ParameterGroup>
      </Problem>
      <Method name="Evolutionary Programming" type="EvolutionaryProgram">
        <Parameter name="Number of Generations" type="unsignedInteger" value="200"/>
        <Parameter name="Population Size" type="unsignedInteger" value="20"/>
        <Parameter name="Random Number Generator" type="unsignedInteger" value="1"/>
        <Parameter name="Seed" type="unsignedInteger" value="0"/>
      </Method>
    </Task>
    <Task key="Task_6" name="Metabolic Control Analysis" type="metabolicControlAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_4" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_12"/>
      </Problem>
      <Method name="MCA Method (Reder)" type="MCAMethod(Reder)">
        <Parameter name="Modulation Factor" type="unsignedFloat" value="1e-09"/>
      </Method>
    </Task>
    <Task key="Task_5" name="Lyapunov Exponents" type="lyapunovExponents" scheduled="false" updateModel="false">
      <Report reference="Report_3" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="ExponentNumber" type="unsignedInteger" value="3"/>
        <Parameter name="DivergenceRequested" type="bool" value="1"/>
        <Parameter name="TransientTime" type="float" value="0"/>
      </Problem>
      <Method name="Wolf Method" type="WolfMethod">
        <Parameter name="Orthonormalization Interval" type="unsignedFloat" value="1"/>
        <Parameter name="Overall time" type="unsignedFloat" value="1000"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_4" name="Time Scale Separation Analysis" type="timeScaleSeparationAnalysis" scheduled="false" updateModel="false">
      <Report reference="Report_2" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
      </Problem>
      <Method name="ILDM (LSODA,Deuflhard)" type="TimeScaleSeparation(ILDM,Deuflhard)">
        <Parameter name="Deuflhard Tolerance" type="unsignedFloat" value="1e-06"/>
      </Method>
    </Task>
    <Task key="Task_3" name="Sensitivities" type="sensitivities" scheduled="false" updateModel="false">
      <Report reference="Report_1" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="SubtaskType" type="unsignedInteger" value="1"/>
        <ParameterGroup name="TargetFunctions">
          <Parameter name="SingleObject" type="cn" value=""/>
          <Parameter name="ObjectListType" type="unsignedInteger" value="7"/>
        </ParameterGroup>
        <ParameterGroup name="ListOfVariables">
          <ParameterGroup name="Variables">
            <Parameter name="SingleObject" type="cn" value=""/>
            <Parameter name="ObjectListType" type="unsignedInteger" value="41"/>
          </ParameterGroup>
        </ParameterGroup>
      </Problem>
      <Method name="Sensitivities Method" type="SensitivitiesMethod">
        <Parameter name="Delta factor" type="unsignedFloat" value="0.001"/>
        <Parameter name="Delta minimum" type="unsignedFloat" value="1e-12"/>
      </Method>
    </Task>
    <Task key="Task_2" name="Moieties" type="moieties" scheduled="false" updateModel="false">
      <Problem>
      </Problem>
      <Method name="Householder Reduction" type="Householder">
      </Method>
    </Task>
    <Task key="Task_1" name="Cross Section" type="crosssection" scheduled="false" updateModel="false">
      <Problem>
        <Parameter name="StepNumber" type="unsignedInteger" value="100"/>
        <Parameter name="StepSize" type="float" value="0.01"/>
        <Parameter name="Duration" type="float" value="1"/>
        <Parameter name="TimeSeriesRequested" type="bool" value="1"/>
        <Parameter name="OutputStartTime" type="float" value="0"/>
        <Parameter name="Output Event" type="bool" value="0"/>
        <Parameter name="Continue on Simultaneous Events" type="bool" value="0"/>
        <Parameter name="Start in Steady State" type="bool" value="0"/>
        <Parameter name="LimitCrossings" type="bool" value="0"/>
        <Parameter name="NumCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitOutTime" type="bool" value="0"/>
        <Parameter name="LimitOutCrossings" type="bool" value="0"/>
        <Parameter name="PositiveDirection" type="bool" value="1"/>
        <Parameter name="NumOutCrossingsLimit" type="unsignedInteger" value="0"/>
        <Parameter name="LimitUntilConvergence" type="bool" value="0"/>
        <Parameter name="ConvergenceTolerance" type="float" value="1e-06"/>
        <Parameter name="Threshold" type="float" value="0"/>
        <Parameter name="DelayOutputUntilConvergence" type="bool" value="0"/>
        <Parameter name="OutputConvergenceTolerance" type="float" value="1e-06"/>
        <ParameterText name="TriggerExpression" type="expression">
          
        </ParameterText>
        <Parameter name="SingleVariable" type="cn" value=""/>
      </Problem>
      <Method name="Deterministic (LSODA)" type="Deterministic(LSODA)">
        <Parameter name="Integrate Reduced Model" type="bool" value="0"/>
        <Parameter name="Relative Tolerance" type="unsignedFloat" value="1e-06"/>
        <Parameter name="Absolute Tolerance" type="unsignedFloat" value="1e-12"/>
        <Parameter name="Max Internal Steps" type="unsignedInteger" value="10000"/>
      </Method>
    </Task>
    <Task key="Task_13" name="Linear Noise Approximation" type="linearNoiseApproximation" scheduled="false" updateModel="false">
      <Report reference="Report_0" target="" append="1" confirmOverwrite="1"/>
      <Problem>
        <Parameter name="Steady-State" type="key" value="Task_12"/>
      </Problem>
      <Method name="Linear Noise Approximation" type="LinearNoiseApproximation">
      </Method>
    </Task>
  </ListOfTasks>
  <ListOfReports>
    <Report key="Report_8" name="Steady-State" taskType="steadyState" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Steady-State]"/>
      </Footer>
    </Report>
    <Report key="Report_7" name="Elementary Flux Modes" taskType="fluxMode" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Footer>
        <Object cn="CN=Root,Vector=TaskList[Elementary Flux Modes],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_6" name="Optimization" taskType="optimization" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Problem=Optimization,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Optimization],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_5" name="Parameter Estimation" taskType="parameterFitting" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Description"/>
        <Object cn="String=\[Function Evaluations\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Value\]"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="String=\[Best Parameters\]"/>
      </Header>
      <Body>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Function Evaluations"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Value"/>
        <Object cn="Separator=&#x09;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Problem=Parameter Estimation,Reference=Best Parameters"/>
      </Body>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Parameter Estimation],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_4" name="Metabolic Control Analysis" taskType="metabolicControlAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Metabolic Control Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_3" name="Lyapunov Exponents" taskType="lyapunovExponents" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Lyapunov Exponents],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_2" name="Time Scale Separation Analysis" taskType="timeScaleSeparationAnalysis" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Time Scale Separation Analysis],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_1" name="Sensitivities" taskType="sensitivities" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Sensitivities],Object=Result"/>
      </Footer>
    </Report>
    <Report key="Report_0" name="Linear Noise Approximation" taskType="linearNoiseApproximation" separator="&#x09;" precision="6">
      <Comment>
        Automatically generated report.
      </Comment>
      <Header>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Description"/>
      </Header>
      <Footer>
        <Object cn="String=&#x0a;"/>
        <Object cn="CN=Root,Vector=TaskList[Linear Noise Approximation],Object=Result"/>
      </Footer>
    </Report>
  </ListOfReports>
  <GUI>
  </GUI>
  <SBMLReference file="osmo_stress_model.xml">
    <SBMLMap SBMLid="VosPt0_fraction" COPASIkey="ModelValue_47"/>
    <SBMLMap SBMLid="compartment_1" COPASIkey="Compartment_1"/>
    <SBMLMap SBMLid="function_11" COPASIkey="Function_42"/>
    <SBMLMap SBMLid="function_12" COPASIkey="Function_44"/>
    <SBMLMap SBMLid="function_13" COPASIkey="Function_43"/>
    <SBMLMap SBMLid="function_14" COPASIkey="Function_40"/>
    <SBMLMap SBMLid="function_8" COPASIkey="Function_41"/>
    <SBMLMap SBMLid="function_9" COPASIkey="Function_45"/>
    <SBMLMap SBMLid="hog1threshold" COPASIkey="ModelValue_48"/>
    <SBMLMap SBMLid="khforkosmo" COPASIkey="ModelValue_49"/>
    <SBMLMap SBMLid="kmgpd1" COPASIkey="ModelValue_46"/>
    <SBMLMap SBMLid="parameter_1" COPASIkey="ModelValue_0"/>
    <SBMLMap SBMLid="parameter_10" COPASIkey="ModelValue_9"/>
    <SBMLMap SBMLid="parameter_11" COPASIkey="ModelValue_10"/>
    <SBMLMap SBMLid="parameter_12" COPASIkey="ModelValue_11"/>
    <SBMLMap SBMLid="parameter_13" COPASIkey="ModelValue_12"/>
    <SBMLMap SBMLid="parameter_14" COPASIkey="ModelValue_13"/>
    <SBMLMap SBMLid="parameter_15" COPASIkey="ModelValue_14"/>
    <SBMLMap SBMLid="parameter_16" COPASIkey="ModelValue_15"/>
    <SBMLMap SBMLid="parameter_17" COPASIkey="ModelValue_16"/>
    <SBMLMap SBMLid="parameter_18" COPASIkey="ModelValue_17"/>
    <SBMLMap SBMLid="parameter_19" COPASIkey="ModelValue_18"/>
    <SBMLMap SBMLid="parameter_2" COPASIkey="ModelValue_1"/>
    <SBMLMap SBMLid="parameter_20" COPASIkey="ModelValue_19"/>
    <SBMLMap SBMLid="parameter_21" COPASIkey="ModelValue_20"/>
    <SBMLMap SBMLid="parameter_22" COPASIkey="ModelValue_21"/>
    <SBMLMap SBMLid="parameter_23" COPASIkey="ModelValue_22"/>
    <SBMLMap SBMLid="parameter_24" COPASIkey="ModelValue_23"/>
    <SBMLMap SBMLid="parameter_25" COPASIkey="ModelValue_24"/>
    <SBMLMap SBMLid="parameter_26" COPASIkey="ModelValue_25"/>
    <SBMLMap SBMLid="parameter_27" COPASIkey="ModelValue_26"/>
    <SBMLMap SBMLid="parameter_28" COPASIkey="ModelValue_27"/>
    <SBMLMap SBMLid="parameter_29" COPASIkey="ModelValue_28"/>
    <SBMLMap SBMLid="parameter_3" COPASIkey="ModelValue_2"/>
    <SBMLMap SBMLid="parameter_30" COPASIkey="ModelValue_29"/>
    <SBMLMap SBMLid="parameter_31" COPASIkey="ModelValue_30"/>
    <SBMLMap SBMLid="parameter_32" COPASIkey="ModelValue_31"/>
    <SBMLMap SBMLid="parameter_33" COPASIkey="ModelValue_32"/>
    <SBMLMap SBMLid="parameter_34" COPASIkey="ModelValue_33"/>
    <SBMLMap SBMLid="parameter_35" COPASIkey="ModelValue_34"/>
    <SBMLMap SBMLid="parameter_36" COPASIkey="ModelValue_35"/>
    <SBMLMap SBMLid="parameter_37" COPASIkey="ModelValue_36"/>
    <SBMLMap SBMLid="parameter_38" COPASIkey="ModelValue_37"/>
    <SBMLMap SBMLid="parameter_39" COPASIkey="ModelValue_38"/>
    <SBMLMap SBMLid="parameter_4" COPASIkey="ModelValue_3"/>
    <SBMLMap SBMLid="parameter_40" COPASIkey="ModelValue_39"/>
    <SBMLMap SBMLid="parameter_41" COPASIkey="ModelValue_40"/>
    <SBMLMap SBMLid="parameter_42" COPASIkey="ModelValue_41"/>
    <SBMLMap SBMLid="parameter_43" COPASIkey="ModelValue_42"/>
    <SBMLMap SBMLid="parameter_44" COPASIkey="ModelValue_43"/>
    <SBMLMap SBMLid="parameter_45" COPASIkey="ModelValue_44"/>
    <SBMLMap SBMLid="parameter_46" COPASIkey="ModelValue_45"/>
    <SBMLMap SBMLid="parameter_5" COPASIkey="ModelValue_4"/>
    <SBMLMap SBMLid="parameter_6" COPASIkey="ModelValue_5"/>
    <SBMLMap SBMLid="parameter_7" COPASIkey="ModelValue_6"/>
    <SBMLMap SBMLid="parameter_8" COPASIkey="ModelValue_7"/>
    <SBMLMap SBMLid="parameter_9" COPASIkey="ModelValue_8"/>
    <SBMLMap SBMLid="reaction_1" COPASIkey="Reaction_0"/>
    <SBMLMap SBMLid="reaction_2" COPASIkey="Reaction_1"/>
    <SBMLMap SBMLid="reaction_3" COPASIkey="Reaction_2"/>
    <SBMLMap SBMLid="reaction_4" COPASIkey="Reaction_3"/>
    <SBMLMap SBMLid="reaction_5" COPASIkey="Reaction_4"/>
    <SBMLMap SBMLid="reaction_6" COPASIkey="Reaction_5"/>
    <SBMLMap SBMLid="reaction_7" COPASIkey="Reaction_6"/>
    <SBMLMap SBMLid="reaction_8" COPASIkey="Reaction_7"/>
    <SBMLMap SBMLid="reaction_9" COPASIkey="Reaction_8"/>
    <SBMLMap SBMLid="species_1" COPASIkey="Metabolite_1"/>
    <SBMLMap SBMLid="species_2" COPASIkey="Metabolite_3"/>
    <SBMLMap SBMLid="species_3" COPASIkey="Metabolite_5"/>
    <SBMLMap SBMLid="species_4" COPASIkey="Metabolite_7"/>
    <SBMLMap SBMLid="species_5" COPASIkey="Metabolite_9"/>
    <SBMLMap SBMLid="species_6" COPASIkey="Metabolite_11"/>
    <SBMLMap SBMLid="species_7" COPASIkey="Metabolite_13"/>
    <SBMLMap SBMLid="species_8" COPASIkey="Metabolite_15"/>
  </SBMLReference>
</COPASI>
