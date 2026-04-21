<schema xmlns="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
	<ns prefix="xsi" uri="http://www.w3.org/2001/XMLSchema-instance"/>
	<ns prefix="identity" uri="urn:hl7-ru:identity"/>
	<ns prefix="address" uri="urn:hl7-ru:address"/>
	<ns prefix="medService" uri="urn:hl7-ru:medService"/>
	<ns prefix="fias" uri="urn:hl7-ru:fias"/>
	<pattern>
		<rule context="ClinicalDocument">
			<assert test="count(@nullFlavor)=0">Элемент ClinicalDocument не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(realmCode)=1">У1-1: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент realmCode</assert>
			<assert test="count(typeId)=1">У1-2: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент typeId</assert>
			<assert test="count(templateId)=1">У1-3: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент templateId</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.51'])=1">У1-4: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.51)</assert>
			<assert test="count(code)=1">У1-5: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(title)=1">У1-6: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент title</assert>
			<assert test="count(effectiveTime)=1">У1-7: Элемент ClinicalDocument ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(confidentialityCode)=1">У1-8: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент confidentialityCode</assert>
			<assert test="count(languageCode)=1">У1-9: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент languageCode</assert>
			<assert test="count(setId)=1">У1-10: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент setId (Элемент setId обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.50)</assert>
			<assert test="count(versionNumber)=1">У1-11: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент versionNumber</assert>
			<assert test="count(recordTarget)=1">У1-12: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент recordTarget</assert>
			<assert test="count(author)=1">У1-13: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент author</assert>
			<assert test="count(custodian)=1">У1-14: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент custodian</assert>
			<assert test="count(informationRecipient[intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13'])=1">У1-15: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент informationRecipient</assert>
			<assert test="count(informationRecipient[not(intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13')])>=0">У1-16: Элемент ClinicalDocument МОЖЕТ содержать произвольное количество [0..*] элементов informationRecipient</assert>
			<assert test="count(participant[@typeCode='IND'])>=0 and count(participant[@typeCode='IND'])&lt;=1">У1-17: Элемент ClinicalDocument МОЖЕТ содержать не более одного [0..1] элемента participant</assert>
			<assert test="count(participant[@typeCode='REF'])>=0 and count(participant[@typeCode='REF'])&lt;=1">У1-18: Элемент ClinicalDocument МОЖЕТ содержать не более одного [0..1] элемента participant</assert>
			<assert test="count(inFulfillmentOf)>=0 and count(inFulfillmentOf)&lt;=1">У1-19: Элемент ClinicalDocument МОЖЕТ содержать не более одного [0..1] элемента inFulfillmentOf</assert>
			<assert test="count(documentationOf)=1">У1-20: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент documentationOf</assert>
			<assert test="count(componentOf)=1">У1-21: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент componentOf</assert>
			<assert test="count(component)=1">У1-22: Элемент ClinicalDocument ОБЯЗАН содержать один [1..1] элемент component</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/realmCode">
			<assert test="count(@nullFlavor)=0">У1-1: Элемент realmCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='RU'">У1-1: Элемент realmCode обязан содержать один атрибут @code со значением "RU"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/typeId">
			<assert test="count(@nullFlavor)=0">У1-2: Элемент typeId не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root='2.16.840.1.113883.1.3'">У1-2: Элемент typeId обязан содержать один атрибут @root со значением "2.16.840.1.113883.1.3"</assert>
			<assert test="@extension='POCD_MT000040'">У1-2: Элемент typeId обязан содержать один атрибут @extension со значением "POCD_MT000040"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/templateId">
			<assert test="count(@nullFlavor)=0">У1-3: Элемент templateId не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root='1.2.643.5.1.13.13.15.13.7'">У1-3: Элемент templateId обязан содержать один атрибут @root со значением "1.2.643.5.1.13.13.15.13.7"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/id[substring(@root, string-length(@root) - 2)='.51']">
			<assert test="count(@nullFlavor)=0">У1-4: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-4: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.51</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.51$')">У1-4: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.51</assert>
			<assert test="@extension!=''">У1-4: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/code">
			<assert test="count(@nullFlavor)=0">У1-5: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code!=''">У1-5: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystem!=''">У1-5: Элемент code обязан содержать один атрибут @codeSystem с не пустым значением; допустимые значения: "1.2.643.5.1.13.13.11.1520", "1.2.643.5.1.13.13.11.1522"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1520', '1.2.643.5.1.13.13.11.1522']">У1-5: Элемент code обязан содержать один атрибут @codeSystem с не пустым значением; допустимые значения: "1.2.643.5.1.13.13.11.1520", "1.2.643.5.1.13.13.11.1522"</assert>
			<assert test="@codeSystemVersion!=''">У1-5: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@codeSystemName!=''">У1-5: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У1-5: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(translation)=1">У1-5.1: Элемент code ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/code/translation">
			<assert test="count(@nullFlavor)=0">У1-5.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='13'">У1-5.1: Элемент translation обязан содержать один атрибут @code со значением "13"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.1079'">У1-5.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.1079"</assert>
			<assert test="@codeSystemName!=''">У1-5.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У1-5.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-5.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У1-5 -->
	<pattern>
		<rule context="ClinicalDocument/code[@codeSystem=['1.2.643.5.1.13.13.11.1520','1.2.643.5.1.13.13.99.2.41']]">
			<assert test="@code='290'">У1-5: Элемент translation обязан содержать атрибут @code со значением "290"</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У1-5 -->
	<pattern>
		<rule context="ClinicalDocument/code[@codeSystem=['1.2.643.5.1.13.13.11.1522','1.2.643.5.1.13.2.1.1.646', '1.2.643.5.1.13.13.11.1115', '1.2.643.5.1.13.13.99.2.195']]">
			<assert test="@code='5'">У1-5: Элемент translation обязан содержать атрибут @code со значением "5"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/title">
			<assert test="count(@nullFlavor)=0">У1-6: Элемент title не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-6: Элемент title должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/effectiveTime[not(@nullFlavor)]">
			<assert test="@value!=''">У1-7: Элемент effectiveTime должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/effectiveTime[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/confidentialityCode">
			<assert test="count(@nullFlavor)=0">У1-8: Элемент confidentialityCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.285','1.2.643.5.1.13.2.1.1.1504.9','2.16.840.1.113883.2.35.10.9','1.2.643.5.1.13.13.11.1116']">У1-8: Элемент confidentialityCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.285"</assert>
			<assert test="@codeSystemName!=''">У1-8: Элемент confidentialityCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-8: Элемент confidentialityCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-8: Элемент confidentialityCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-8: Элемент confidentialityCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/languageCode">
			<assert test="count(@nullFlavor)=0">У1-9: Элемент languageCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='ru-RU'">У1-9: Элемент languageCode обязан содержать один атрибут @code со значением "ru-RU"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/setId">
			<assert test="count(@nullFlavor)=0">У1-10: Элемент setId не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-10: Элемент setId обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.50</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.50$')">У1-10: Элемент setId обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.50</assert>
			<assert test="@extension!=''">У1-10: Элемент setId обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/versionNumber">
			<assert test="count(@nullFlavor)=0">У1-11: Элемент versionNumber не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У1-11: Элемент versionNumber обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget">
			<assert test="count(@nullFlavor)=0">У1-12: Элемент recordTarget не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(patientRole)=1">У1-12.1: Элемент recordTarget ОБЯЗАН содержать один [1..1] элемент patientRole</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole">
			<assert test="count(@nullFlavor)=0">У1-12.1: Элемент patientRole не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.10'])=1">У1-12.1.1: Элемент patientRole ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.10)</assert>
			<assert test="count(id[2])=1">У1-12.1.2: Элемент patientRole ДОЛЖЕН содержать один [1..1] элемент id (СНИЛС пациента)</assert>
			<assert test="count(identity:IdentityDoc)=1">У1-12.1.3: Элемент patientRole ДОЛЖЕН содержать один [1..1] элемент identity:IdentityDoc</assert>
			<assert test="count(identity:InsurancePolicy)=1">У1-12.1.4: Элемент patientRole ДОЛЖЕН содержать один [1..1] элемент identity:InsurancePolicy</assert>
			<assert test="count(addr)>=1 and count(addr)&lt;=2">У1-12.1.5: Элемент patientRole ДОЛЖЕН содержать от одного до двух [1..2] элементов addr</assert>
			<assert test="count(telecom)>=0">У1-12.1.6: Элемент patientRole МОЖЕТ содержать произвольное количество [0..*] элементов telecom</assert>
			<assert test="count(patient)=1">У1-12.1.7: Элемент patientRole ОБЯЗАН содержать один [1..1] элемент patient</assert>
			<assert test="count(providerOrganization)=1">У1-12.1.8: Элемент patientRole ОБЯЗАН содержать один [1..1] элемент providerOrganization</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/id[substring(@root, string-length(@root) - 2)='.10']">
			<assert test="count(@nullFlavor)=0">У1-12.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-12.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.10</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.10$')">У1-12.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.10</assert>
			<assert test="@extension!=''">У1-12.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/id[2][not(@nullFlavor)]">
			<assert test="@root='1.2.643.100.3'">У1-12.1.2: Элемент id должен содержать один атрибут @root со значением "1.2.643.100.3"</assert>
			<assert test="@extension!=''">У1-12.1.2: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/id[2][@nullFlavor]">
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:IdentityDoc[not(@nullFlavor)]">
			<assert test="count(identity:IdentityCardType)=1">У1-12.1.3.1: Элемент identity:IdentityDoc ОБЯЗАН содержать один [1..1] элемент identity:IdentityCardType</assert>
			<assert test="count(identity:Series)=1">У1-12.1.3.2: Элемент identity:IdentityDoc ДОЛЖЕН содержать один [1..1] элемент identity:Series</assert>
			<assert test="count(identity:Number)=1">У1-12.1.3.3: Элемент identity:IdentityDoc ОБЯЗАН содержать один [1..1] элемент identity:Number</assert>
			<assert test="count(identity:IssueOrgName)=1">У1-12.1.3.4: Элемент identity:IdentityDoc ДОЛЖЕН содержать один [1..1] элемент identity:IssueOrgName</assert>
			<assert test="count(identity:IssueOrgCode)=1">У1-12.1.3.5: Элемент identity:IdentityDoc ДОЛЖЕН содержать один [1..1] элемент identity:IssueOrgCode</assert>
			<assert test="count(identity:IssueDate)=1">У1-12.1.3.6: Элемент identity:IdentityDoc ОБЯЗАН содержать один [1..1] элемент identity:IssueDate</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:IdentityDoc/identity:IdentityCardType">
			<assert test="count(@nullFlavor)=0">У1-12.1.3.1: Элемент identity:IdentityCardType не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.48','1.2.643.5.1.13.13.11.1011','1.2.643.5.1.13.2.1.1.736']">У1-12.1.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.48"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:IdentityDoc/identity:Series[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.3.2: Элемент identity:Series должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:IdentityDoc/identity:Number">
			<assert test="count(@nullFlavor)=0">У1-12.1.3.3: Элемент identity:Number не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.3.3: Элемент identity:Number должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:IdentityDoc/identity:IssueOrgName[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.3.4: Элемент identity:IssueOrgName должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:IdentityDoc/identity:IssueOrgCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.3.5: Элемент identity:IssueOrgCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:IdentityDoc/identity:IssueDate">
			<assert test="count(@nullFlavor)=0">У1-12.1.3.6: Элемент identity:IssueDate не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У1-12.1.3.6: Элемент identity:IssueDate обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:InsurancePolicy[not(@nullFlavor)]">
			<assert test="count(identity:InsurancePolicyType)=1">У1-12.1.4.1: Элемент identity:InsurancePolicy ОБЯЗАН содержать один [1..1] элемент identity:InsurancePolicyType</assert>
			<assert test="count(identity:Series)>=0 and count(identity:Series)&lt;=1">У1-12.1.4.2: Элемент identity:InsurancePolicy МОЖЕТ содержать не более одного [0..1] элемента identity:Series</assert>
			<assert test="count(identity:Number)=1">У1-12.1.4.3: Элемент identity:InsurancePolicy ОБЯЗАН содержать один [1..1] элемент identity:Number</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:InsurancePolicy/identity:InsurancePolicyType">
			<assert test="count(@nullFlavor)=0">У1-12.1.4.1: Элемент identity:InsurancePolicyType не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1035'">У1-12.1.4.1: Элемент identity:InsurancePolicyType обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1035"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.4.1: Элемент identity:InsurancePolicyType обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.4.1: Элемент identity:InsurancePolicyType обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.4.1: Элемент identity:InsurancePolicyType обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.4.1: Элемент identity:InsurancePolicyType обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:InsurancePolicy/identity:Series">
			<assert test="count(@nullFlavor)=0">У1-12.1.4.2: Элемент identity:Series не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.4.2: Элемент identity:Series должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/identity:InsurancePolicy/identity:Number">
			<assert test="count(@nullFlavor)=0">У1-12.1.4.3: Элемент identity:Number не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.4.3: Элемент identity:Number должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/addr[not(@nullFlavor)]">
			<assert test="count(@use!='')=[0,1]">У1-12.1.5: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-12.1.5: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(address:Type)=1">У1-12.1.5.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:Type</assert>
			<assert test="count(streetAddressLine)=1">У1-12.1.5.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-12.1.5.3: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-12.1.5.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-12.1.5.5: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/addr/address:Type">
			<assert test="count(@nullFlavor)=0">У1-12.1.5.1: Элемент address:Type не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1504','1.2.643.5.1.13.13.11.1415','1.2.643.5.1.13.13.99.2.241']">У1-12.1.5.1: Элемент address:Type обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1504"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.5.1: Элемент address:Type обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.5.1: Элемент address:Type обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.5.1: Элемент address:Type обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.5.1: Элемент address:Type обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-12.1.5.2: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.5.2: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-12.1.5.3: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-12.1.5.3: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.5.3: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.5.3: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.5.3: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.5.3: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.5.4: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-12.1.5.5.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-12.1.5.5.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-12.1.5.5.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.5.5.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.5.5.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/telecom">
			<assert test="count(@nullFlavor)=0">У1-12.1.6: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-12.1.6: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-12.1.6: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-12.1.6: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient">
			<assert test="count(@nullFlavor)=0">У1-12.1.7: Элемент patient не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(name)=1">У1-12.1.7.1: Элемент patient ОБЯЗАН содержать один [1..1] элемент name</assert>
			<assert test="count(administrativeGenderCode)=1">У1-12.1.7.2: Элемент patient ДОЛЖЕН содержать один [1..1] элемент administrativeGenderCode</assert>
			<assert test="count(birthTime)=1">У1-12.1.7.3: Элемент patient ДОЛЖЕН содержать один [1..1] элемент birthTime</assert>
			<assert test="count(guardian)>=0 and count(guardian)&lt;=1">У1-12.1.7.4: Элемент patient МОЖЕТ содержать не более одного [0..1] элемента guardian</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/name">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.1: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(family)=1">У1-12.1.7.1.1: Элемент name ДОЛЖЕН содержать один [1..1] элемент family</assert>
			<assert test="count(given)=1">У1-12.1.7.1.2: Элемент name ДОЛЖЕН содержать один [1..1] элемент given</assert>
			<assert test="count(identity:Patronymic)>=0 and count(identity:Patronymic)&lt;=1">У1-12.1.7.1.3: Элемент name МОЖЕТ содержать не более одного [0..1] элемента identity:Patronymic</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/name/family[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.1.1: Элемент family должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У1-12.1.7.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/name/family[@nullFlavor]">
			<assert test="@nullFlavor = ['UNK']">У1-12.1.7.1.1: Допустимые значения для атрибута  nullFlavor: 'UNK'</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/name/given[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.1.2: Элемент given должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У1-12.1.7.1.2 -->
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/name/given[@nullFlavor]">
			<assert test="@nullFlavor = ['UNK']">У1-12.1.7.1.2: Допустимые значения для атрибута  nullFlavor: 'UNK'</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/name/identity:Patronymic">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.1.3: Элемент identity:Patronymic не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.1.3: Элемент identity:Patronymic должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/administrativeGenderCode[not(@nullFlavor)]">
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1040','1.2.643.5.1.13.2.1.1.156']">У1-12.1.7.2: Элемент administrativeGenderCode должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1040"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.7.2: Элемент administrativeGenderCode должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.7.2: Элемент administrativeGenderCode должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.7.2: Элемент administrativeGenderCode должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.7.2: Элемент administrativeGenderCode должен содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/administrativeGenderCode[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/birthTime[not(@nullFlavor)]">
			<assert test="@value!=''">У1-12.1.7.3: Элемент birthTime должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/birthTime[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4: Элемент guardian не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='GUARD'">У1-12.1.7.4: Элемент guardian обязан содержать один атрибут @classCode со значением "GUARD"</assert>
			<assert test="count(id[@root='1.2.643.100.3'])>=0 and count(id[@root='1.2.643.100.3'])&lt;=1">У1-12.1.7.4.1: Элемент guardian МОЖЕТ содержать не более одного [0..1] элемента id</assert>
			<assert test="count(identity:IdentityDoc)>=0 and count(identity:IdentityDoc)&lt;=1">У1-12.1.7.4.2: Элемент guardian МОЖЕТ содержать не более одного [0..1] элемента identity:IdentityDoc</assert>
			<assert test="count(identity:AuthorityDoc)>=0 and count(identity:AuthorityDoc)&lt;=1">У1-12.1.7.4.3: Элемент guardian МОЖЕТ содержать не более одного [0..1] элемента identity:AuthorityDoc</assert>
			<assert test="count(code)>=0 and count(code)&lt;=1">У1-12.1.7.4.4: Элемент guardian МОЖЕТ содержать не более одного [0..1] элемента code</assert>
			<assert test="count(addr)>=0 and count(addr)&lt;=1">У1-12.1.7.4.5: Элемент guardian МОЖЕТ содержать не более одного [0..1] элемента addr</assert>
			<assert test="count(telecom)>=0">У1-12.1.7.4.6: Элемент guardian МОЖЕТ содержать произвольное количество [0..*] элементов telecom</assert>
			<assert test="count(guardianPerson)>=0 and count(guardianPerson)&lt;=1">У1-12.1.7.4.7: Элемент guardian МОЖЕТ содержать не более одного [0..1] элемента guardianPerson</assert>
			<assert test="count(guardianOrganization)>=0 and count(guardianOrganization)&lt;=1">У1-12.1.7.4.8: Элемент guardian МОЖЕТ содержать не более одного [0..1] элемента guardianOrganization</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/id[@root='1.2.643.100.3']">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root='1.2.643.100.3'">У1-12.1.7.4.1: Элемент id обязан содержать один атрибут @root со значением "1.2.643.100.3"</assert>
			<assert test="@extension!=''">У1-12.1.7.4.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:IdentityDoc">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.2: Элемент identity:IdentityDoc не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(identity:IdentityCardType)=1">У1-12.1.7.4.2.1: Элемент identity:IdentityDoc ОБЯЗАН содержать один [1..1] элемент identity:IdentityCardType</assert>
			<assert test="count(identity:Series)=1">У1-12.1.7.4.2.2: Элемент identity:IdentityDoc ДОЛЖЕН содержать один [1..1] элемент identity:Series</assert>
			<assert test="count(identity:Number)=1">У1-12.1.7.4.2.3: Элемент identity:IdentityDoc ОБЯЗАН содержать один [1..1] элемент identity:Number</assert>
			<assert test="count(identity:IssueOrgName)=1">У1-12.1.7.4.2.4: Элемент identity:IdentityDoc ДОЛЖЕН содержать один [1..1] элемент identity:IssueOrgName</assert>
			<assert test="count(identity:IssueOrgCode)=1">У1-12.1.7.4.2.5: Элемент identity:IdentityDoc ДОЛЖЕН содержать один [1..1] элемент identity:IssueOrgCode</assert>
			<assert test="count(identity:IssueDate)=1">У1-12.1.7.4.2.6: Элемент identity:IdentityDoc ОБЯЗАН содержать один [1..1] элемент identity:IssueDate</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:IdentityDoc/identity:IdentityCardType">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.2.1: Элемент identity:IdentityCardType не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.48','1.2.643.5.1.13.13.11.1011','1.2.643.5.1.13.2.1.1.736']">У1-12.1.7.4.2.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.48"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.7.4.2.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.7.4.2.1: Элемент identity:IdentityCardType обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.7.4.2.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.7.4.2.1: Элемент identity:IdentityCardType обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:IdentityDoc/identity:Series[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.2.2: Элемент identity:Series должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:IdentityDoc/identity:Number">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.2.3: Элемент identity:Number не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.2.3: Элемент identity:Number должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:IdentityDoc/identity:IssueOrgName[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.2.4: Элемент identity:IssueOrgName должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:IdentityDoc/identity:IssueOrgCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.2.5: Элемент identity:IssueOrgCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:IdentityDoc/identity:IssueDate">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.2.6: Элемент identity:IssueDate не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У1-12.1.7.4.2.6: Элемент identity:IssueDate обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:AuthorityDoc">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.3: Элемент identity:AuthorityDoc не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(identity:IdentityCardType)=1">У1-12.1.7.4.3.1: Элемент identity:AuthorityDoc ОБЯЗАН содержать один [1..1] элемент identity:IdentityCardType</assert>
			<assert test="count(identity:Series)=1">У1-12.1.7.4.3.2: Элемент identity:AuthorityDoc ДОЛЖЕН содержать один [1..1] элемент identity:Series</assert>
			<assert test="count(identity:Number)=1">У1-12.1.7.4.3.3: Элемент identity:AuthorityDoc ОБЯЗАН содержать один [1..1] элемент identity:Number</assert>
			<assert test="count(identity:IssueOrgName)=1">У1-12.1.7.4.3.4: Элемент identity:AuthorityDoc ДОЛЖЕН содержать один [1..1] элемент identity:IssueOrgName</assert>
			<assert test="count(identity:IssueDate)=1">У1-12.1.7.4.3.5: Элемент identity:AuthorityDoc ОБЯЗАН содержать один [1..1] элемент identity:IssueDate</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:AuthorityDoc/identity:IdentityCardType">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.3.1: Элемент identity:IdentityCardType не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.313'">У1-12.1.7.4.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.313"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.7.4.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.7.4.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.7.4.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.7.4.3.1: Элемент identity:IdentityCardType обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:AuthorityDoc/identity:Series[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.3.2: Элемент identity:Series должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:AuthorityDoc/identity:Number">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.3.3: Элемент identity:Number не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.3.3: Элемент identity:Number должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:AuthorityDoc/identity:IssueOrgName[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.3.4: Элемент identity:IssueOrgName должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/identity:AuthorityDoc/identity:IssueDate">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.3.5: Элемент identity:IssueDate не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У1-12.1.7.4.3.5: Элемент identity:IssueDate обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/code">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.4: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.14','1.2.643.5.1.13.2.1.1.1504.40']">У1-12.1.7.4.4: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.14"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.7.4.4: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.7.4.4: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.7.4.4: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.7.4.4: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/addr">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.5: Элемент addr не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-12.1.7.4.5: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-12.1.7.4.5: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-12.1.7.4.5.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-12.1.7.4.5.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-12.1.7.4.5.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-12.1.7.4.5.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.5.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.5.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.5.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-12.1.7.4.5.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.7.4.5.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.7.4.5.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.7.4.5.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.7.4.5.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.5.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-12.1.7.4.5.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-12.1.7.4.5.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.5.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.5.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.5.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/telecom">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.6: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-12.1.7.4.6: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-12.1.7.4.6: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-12.1.7.4.6: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianPerson">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.7: Элемент guardianPerson не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(name)=1">У1-12.1.7.4.7.1: Элемент guardianPerson ОБЯЗАН содержать один [1..1] элемент name</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianPerson/name">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.7.1: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(family)=1">У1-12.1.7.4.7.1.1: Элемент name ОБЯЗАН содержать один [1..1] элемент family</assert>
			<assert test="count(given)=1">У1-12.1.7.4.7.1.2: Элемент name ОБЯЗАН содержать один [1..1] элемент given</assert>
			<assert test="count(identity:Patronymic)>=0 and count(identity:Patronymic)&lt;=1">У1-12.1.7.4.7.1.3: Элемент name МОЖЕТ содержать не более одного [0..1] элемента identity:Patronymic</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianPerson/name/family">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.7.1.1: Элемент family не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.7.1.1: Элемент family должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianPerson/name/given">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.7.1.2: Элемент given не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.7.1.2: Элемент given должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianPerson/name/identity:Patronymic">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.7.1.3: Элемент identity:Patronymic не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.7.1.3: Элемент identity:Patronymic должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8: Элемент guardianOrganization не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')])>=0 and count(id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')])&lt;=1">У1-12.1.7.4.8.1: Элемент guardianOrganization МОЖЕТ содержать не более одного [0..1] элемента id</assert>
			<assert test="count(identity:Props)=1">У1-12.1.7.4.8.2: Элемент guardianOrganization ДОЛЖЕН содержать один [1..1] элемент identity:Props</assert>
			<assert test="count(name)=1">У1-12.1.7.4.8.3: Элемент guardianOrganization ОБЯЗАН содержать один [1..1] элемент name</assert>
			<assert test="count(addr)>=0 and count(addr)&lt;=1">У1-12.1.7.4.8.4: Элемент guardianOrganization МОЖЕТ содержать не более одного [0..1] элемента addr</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')]">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-12.1.7.4.8.1: Элемент id обязан содержать один атрибут @root с не пустым значением</assert>
			<assert test="count(@extension!='')=[0,1]">У1-12.1.7.4.8.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
			<assert test="if (@extension) then @extension!='' else(not(@extension))">У1-12.1.7.4.8.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/identity:Props[not(@nullFlavor)]">
			<assert test="count(identity:Ogrn)>=0 and count(identity:Ogrn)&lt;=1">У1-12.1.7.4.8.2.1: Элемент identity:Props МОЖЕТ содержать не более одного [0..1] элемента identity:Ogrn</assert>
			<assert test="count(identity:Ogrnip)>=0 and count(identity:Ogrnip)&lt;=1">У1-12.1.7.4.8.2.2: Элемент identity:Props МОЖЕТ содержать не более одного [0..1] элемента identity:Ogrnip</assert>
			<assert test="count(identity:Okpo)>=0 and count(identity:Okpo)&lt;=1">У1-12.1.7.4.8.2.3: Элемент identity:Props МОЖЕТ содержать не более одного [0..1] элемента identity:Okpo</assert>
			<assert test="count(identity:Okato)>=0 and count(identity:Okato)&lt;=1">У1-12.1.7.4.8.2.4: Элемент identity:Props МОЖЕТ содержать не более одного [0..1] элемента identity:Okato</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/identity:Props/identity:Ogrn">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.2.1: Элемент identity:Ogrn не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.8.2.1: Элемент identity:Ogrn должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/identity:Props/identity:Ogrnip">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.2.2: Элемент identity:Ogrnip не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.8.2.2: Элемент identity:Ogrnip должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/identity:Props/identity:Okpo">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.2.3: Элемент identity:Okpo не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.8.2.3: Элемент identity:Okpo должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/identity:Props/identity:Okato">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.2.4: Элемент identity:Okato не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.8.2.4: Элемент identity:Okato должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/name">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.3: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.8.3: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/addr">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.4: Элемент addr не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-12.1.7.4.8.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-12.1.7.4.8.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-12.1.7.4.8.4.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-12.1.7.4.8.4.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-12.1.7.4.8.4.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-12.1.7.4.8.4.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.4.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.8.4.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.4.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-12.1.7.4.8.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.7.4.8.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.7.4.8.4.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.7.4.8.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.7.4.8.4.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.8.4.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-12.1.7.4.8.4.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-12.1.7.4.8.4.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-12.1.7.4.8.4.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.7.4.8.4.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/patient/guardian/guardianOrganization/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.7.4.8.4.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization">
			<assert test="count(@nullFlavor)=0">У1-12.1.8: Элемент providerOrganization не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')])=1">У1-12.1.8.1: Элемент providerOrganization ОБЯЗАН содержать один [1..1] элемент id</assert>
			<assert test="count(id[@root='1.2.643.5.1.13.2.1.1.1504.101'])>=0 and count(id[@root='1.2.643.5.1.13.2.1.1.1504.101'])&lt;=1">У1-12.1.8.2: Элемент providerOrganization МОЖЕТ содержать не более одного [0..1] элемента id</assert>
			<assert test="count(identity:Props)=1">У1-12.1.8.3: Элемент providerOrganization ДОЛЖЕН содержать один [1..1] элемент identity:Props</assert>
			<assert test="count(identity:Dept)>=0 and count(identity:Dept)&lt;=1">У1-12.1.8.4: Элемент providerOrganization МОЖЕТ содержать не более одного [0..1] элемента identity:Dept</assert>
			<assert test="count(name)=1">У1-12.1.8.5: Элемент providerOrganization ОБЯЗАН содержать один [1..1] элемент name</assert>
			<assert test="count(telecom)>=0">У1-12.1.8.6: Элемент providerOrganization МОЖЕТ содержать произвольное количество [0..*] элементов telecom</assert>
			<assert test="count(addr)>=0 and count(addr)&lt;=1">У1-12.1.8.7: Элемент providerOrganization МОЖЕТ содержать не более одного [0..1] элемента addr</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У1-12.1.8.4 -->
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization[id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')][@extension]]">
			<assert test="count(identity:Dept)=1">У1-12.1.8.4: Элемент providerOrganization МОЖЕТ содержать не более одного [0..1] элемента identity:Dept; если атрибут providerOrganization/id[not(@root="1.2.643.5.1.13.2.1.1.1504.101")]/@extension представлен, то элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')]">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-12.1.8.1: Элемент id обязан содержать один атрибут @root с не пустым значением</assert>
			<assert test="count(@extension!='')=[0,1]">У1-12.1.8.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
			<assert test="if (@extension) then @extension!='' else(not(@extension))">У1-12.1.8.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/id[@root='1.2.643.5.1.13.2.1.1.1504.101']">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.2: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root='1.2.643.5.1.13.2.1.1.1504.101'">У1-12.1.8.2: Элемент id обязан содержать один атрибут @root со значением "1.2.643.5.1.13.2.1.1.1504.101"</assert>
			<assert test="@extension!=''">У1-12.1.8.2: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
			<assert test="@assigningAuthorityName!=''">У1-12.1.8.2: Элемент id обязан содержать один атрибут @assigningAuthorityName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/identity:Props[not(@nullFlavor)]">
			<assert test="count(identity:Ogrn)>=0 and count(identity:Ogrn)&lt;=1">У1-12.1.8.3.1: Элемент identity:Props МОЖЕТ содержать не более одного [0..1] элемента identity:Ogrn</assert>
			<assert test="count(identity:Ogrnip)>=0 and count(identity:Ogrnip)&lt;=1">У1-12.1.8.3.2: Элемент identity:Props МОЖЕТ содержать не более одного [0..1] элемента identity:Ogrnip</assert>
			<assert test="count(identity:Okpo)>=0 and count(identity:Okpo)&lt;=1">У1-12.1.8.3.3: Элемент identity:Props МОЖЕТ содержать не более одного [0..1] элемента identity:Okpo</assert>
			<assert test="count(identity:Okato)>=0 and count(identity:Okato)&lt;=1">У1-12.1.8.3.4: Элемент identity:Props МОЖЕТ содержать не более одного [0..1] элемента identity:Okato</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/identity:Props/identity:Ogrn">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.3.1: Элемент identity:Ogrn не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.8.3.1: Элемент identity:Ogrn должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/identity:Props/identity:Ogrnip">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.3.2: Элемент identity:Ogrnip не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.8.3.2: Элемент identity:Ogrnip должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/identity:Props/identity:Okpo">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.3.3: Элемент identity:Okpo не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.8.3.3: Элемент identity:Okpo должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/identity:Props/identity:Okato">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.3.4: Элемент identity:Okato не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.8.3.4: Элемент identity:Okato должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/identity:Dept">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.4: Элемент identity:Dept не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.8.4: Элемент identity:Dept должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/name">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.5: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.8.5: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/telecom">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.6: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-12.1.8.6: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-12.1.8.6: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-12.1.8.6: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/addr">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.7: Элемент addr не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-12.1.8.7: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-12.1.8.7: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-12.1.8.7.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-12.1.8.7.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-12.1.8.7.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-12.1.8.7.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.7.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.8.7.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.7.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-12.1.8.7.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-12.1.8.7.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-12.1.8.7.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-12.1.8.7.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-12.1.8.7.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.8.7.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-12.1.8.7.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-12.1.8.7.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-12.1.8.7.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-12.1.8.7.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/recordTarget/patientRole/providerOrganization/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-12.1.8.7.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author">
			<assert test="count(@nullFlavor)=0">У1-13: Элемент author не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(time)=1">У1-13.1: Элемент author ДОЛЖЕН содержать один [1..1] элемент time</assert>
			<assert test="count(assignedAuthor)=1">У1-13.2: Элемент author ОБЯЗАН содержать один [1..1] элемент assignedAuthor</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/time">
			<assert test="@nullFlavor='NI'">У1-13.1: Элемент time обязан содержать один атрибут @nullFlavor со значением "NI"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor">
			<assert test="count(@nullFlavor)=0">У1-13.2: Элемент assignedAuthor не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У1-13.2.1: Элемент assignedAuthor ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
			<assert test="count(id[@root='1.2.643.100.3'])=1">У1-13.2.2: Элемент assignedAuthor ОБЯЗАН содержать один [1..1] элемент id</assert>
			<assert test="count(code)=1">У1-13.2.3: Элемент assignedAuthor ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(addr)>=0 and count(addr)&lt;=1">У1-13.2.4: Элемент assignedAuthor МОЖЕТ содержать не более одного [0..1] элемента addr</assert>
			<assert test="count(telecom)>=0">У1-13.2.5: Элемент assignedAuthor МОЖЕТ содержать произвольное количество [0..*] элементов telecom</assert>
			<assert test="count(assignedPerson)=1">У1-13.2.6: Элемент assignedAuthor ОБЯЗАН содержать один [1..1] элемент assignedPerson</assert>
			<assert test="count(representedOrganization)>=0 and count(representedOrganization)&lt;=1">У1-13.2.7: Элемент assignedAuthor МОЖЕТ содержать не более одного [0..1] элемента representedOrganization</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У1-13.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-13.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У1-13.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У1-13.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/id[@root='1.2.643.100.3']">
			<assert test="count(@nullFlavor)=0">У1-13.2.2: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root='1.2.643.100.3'">У1-13.2.2: Элемент id обязан содержать один атрибут @root со значением "1.2.643.100.3"</assert>
			<assert test="@extension!=''">У1-13.2.2: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/code">
			<assert test="count(@nullFlavor)=0">У1-13.2.3: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1002','1.2.643.5.1.13.2.1.1.733']">У1-13.2.3: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1002"</assert>
			<assert test="@codeSystemName!=''">У1-13.2.3: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-13.2.3: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-13.2.3: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-13.2.3: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/addr">
			<assert test="count(@nullFlavor)=0">У1-13.2.4: Элемент addr не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-13.2.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-13.2.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-13.2.4.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-13.2.4.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-13.2.4.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-13.2.4.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-13.2.4.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-13.2.4.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-13.2.4.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-13.2.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-13.2.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-13.2.4.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-13.2.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-13.2.4.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-13.2.4.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-13.2.4.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-13.2.4.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-13.2.4.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-13.2.4.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-13.2.4.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/telecom">
			<assert test="count(@nullFlavor)=0">У1-13.2.5: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-13.2.5: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-13.2.5: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-13.2.5: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/assignedPerson">
			<assert test="count(@nullFlavor)=0">У1-13.2.6: Элемент assignedPerson не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(name)=1">У1-13.2.6.1: Элемент assignedPerson ОБЯЗАН содержать один [1..1] элемент name</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/assignedPerson/name">
			<assert test="count(@nullFlavor)=0">У1-13.2.6.1: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(family)=1">У1-13.2.6.1.1: Элемент name ОБЯЗАН содержать один [1..1] элемент family</assert>
			<assert test="count(given)=1">У1-13.2.6.1.2: Элемент name ОБЯЗАН содержать один [1..1] элемент given</assert>
			<assert test="count(identity:Patronymic)>=0 and count(identity:Patronymic)&lt;=1">У1-13.2.6.1.3: Элемент name МОЖЕТ содержать не более одного [0..1] элемента identity:Patronymic</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/assignedPerson/name/family">
			<assert test="count(@nullFlavor)=0">У1-13.2.6.1.1: Элемент family не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-13.2.6.1.1: Элемент family должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/assignedPerson/name/given">
			<assert test="count(@nullFlavor)=0">У1-13.2.6.1.2: Элемент given не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-13.2.6.1.2: Элемент given должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/assignedPerson/name/identity:Patronymic">
			<assert test="count(@nullFlavor)=0">У1-13.2.6.1.3: Элемент identity:Patronymic не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-13.2.6.1.3: Элемент identity:Patronymic должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization">
			<assert test="count(@nullFlavor)=0">У1-13.2.7: Элемент representedOrganization не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ORG'">У1-13.2.7: Элемент representedOrganization обязан содержать один атрибут @classCode со значением "ORG"</assert>
			<assert test="count(id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')])=1">У1-13.2.7.1: Элемент representedOrganization ОБЯЗАН содержать один [1..1] элемент id</assert>
			<assert test="count(name)=1">У1-13.2.7.2: Элемент representedOrganization ОБЯЗАН содержать один [1..1] элемент name</assert>
			<assert test="count(telecom)>=0">У1-13.2.7.3: Элемент representedOrganization МОЖЕТ содержать произвольное количество [0..*] элементов telecom</assert>
			<assert test="count(addr)>=0 and count(addr)&lt;=1">У1-13.2.7.4: Элемент representedOrganization МОЖЕТ содержать не более одного [0..1] элемента addr</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')]">
			<assert test="count(@nullFlavor)=0">У1-13.2.7.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-13.2.7.1: Элемент id обязан содержать один атрибут @root с не пустым значением</assert>
			<assert test="count(@extension!='')=[0,1]">У1-13.2.7.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
			<assert test="if (@extension) then @extension!='' else(not(@extension))">У1-13.2.7.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/name">
			<assert test="count(@nullFlavor)=0">У1-13.2.7.2: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-13.2.7.2: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/telecom">
			<assert test="count(@nullFlavor)=0">У1-13.2.7.3: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-13.2.7.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-13.2.7.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-13.2.7.3: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/addr">
			<assert test="count(@nullFlavor)=0">У1-13.2.7.4: Элемент addr не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-13.2.7.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-13.2.7.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-13.2.7.4.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-13.2.7.4.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-13.2.7.4.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-13.2.7.4.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-13.2.7.4.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-13.2.7.4.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-13.2.7.4.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-13.2.7.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-13.2.7.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-13.2.7.4.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-13.2.7.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-13.2.7.4.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-13.2.7.4.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-13.2.7.4.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-13.2.7.4.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-13.2.7.4.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-13.2.7.4.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/author/assignedAuthor/representedOrganization/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-13.2.7.4.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian">
			<assert test="count(@nullFlavor)=0">У1-14: Элемент custodian не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(assignedCustodian)=1">У1-14.1: Элемент custodian ОБЯЗАН содержать один [1..1] элемент assignedCustodian</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian">
			<assert test="count(@nullFlavor)=0">У1-14.1: Элемент assignedCustodian не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(representedCustodianOrganization)=1">У1-14.1.1: Элемент assignedCustodian ОБЯЗАН содержать один [1..1] элемент representedCustodianOrganization</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization">
			<assert test="count(@nullFlavor)=0">У1-14.1.1: Элемент representedCustodianOrganization не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ORG'">У1-14.1.1: Элемент representedCustodianOrganization обязан содержать один атрибут @classCode со значением "ORG"</assert>
			<assert test="count(id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')])=1">У1-14.1.1.1: Элемент representedCustodianOrganization ОБЯЗАН содержать один [1..1] элемент id</assert>
			<assert test="count(name)=1">У1-14.1.1.2: Элемент representedCustodianOrganization ОБЯЗАН содержать один [1..1] элемент name</assert>
			<assert test="count(telecom)>=0 and count(telecom)&lt;=1">У1-14.1.1.3: Элемент representedCustodianOrganization МОЖЕТ содержать не более одного [0..1] элемента telecom</assert>
			<assert test="count(addr)=1">У1-14.1.1.4: Элемент representedCustodianOrganization ОБЯЗАН содержать один [1..1] элемент addr</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')]">
			<assert test="count(@nullFlavor)=0">У1-14.1.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-14.1.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением</assert>
			<assert test="count(@extension!='')=[0,1]">У1-14.1.1.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
			<assert test="if (@extension) then @extension!='' else(not(@extension))">У1-14.1.1.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/name">
			<assert test="count(@nullFlavor)=0">У1-14.1.1.2: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-14.1.1.2: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/telecom">
			<assert test="count(@nullFlavor)=0">У1-14.1.1.3: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-14.1.1.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-14.1.1.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-14.1.1.3: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/addr">
			<assert test="count(@nullFlavor)=0">У1-14.1.1.4: Элемент addr не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-14.1.1.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-14.1.1.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-14.1.1.4.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-14.1.1.4.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-14.1.1.4.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-14.1.1.4.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-14.1.1.4.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-14.1.1.4.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-14.1.1.4.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-14.1.1.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-14.1.1.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-14.1.1.4.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-14.1.1.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-14.1.1.4.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-14.1.1.4.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-14.1.1.4.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-14.1.1.4.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-14.1.1.4.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-14.1.1.4.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/custodian/assignedCustodian/representedCustodianOrganization/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-14.1.1.4.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13']">
			<assert test="count(@nullFlavor)=0">У1-15: Элемент informationRecipient не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(intendedRecipient)=1">У1-15.1: Элемент informationRecipient ОБЯЗАН содержать один [1..1] элемент intendedRecipient</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13']/intendedRecipient">
			<assert test="count(@nullFlavor)=0">У1-15.1: Элемент intendedRecipient не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(receivedOrganization)=1">У1-15.1.1: Элемент intendedRecipient ОБЯЗАН содержать один [1..1] элемент receivedOrganization</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13']/intendedRecipient/receivedOrganization">
			<assert test="count(@nullFlavor)=0">У1-15.1.1: Элемент receivedOrganization не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[@root='1.2.643.5.1.13'])=1">У1-15.1.1.1: Элемент receivedOrganization ОБЯЗАН содержать один [1..1] элемент id</assert>
			<assert test="count(name)=1">У1-15.1.1.2: Элемент receivedOrganization ОБЯЗАН содержать один [1..1] элемент name</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13']/intendedRecipient/receivedOrganization/id[@root='1.2.643.5.1.13']">
			<assert test="count(@nullFlavor)=0">У1-15.1.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root='1.2.643.5.1.13'">У1-15.1.1.1: Элемент id обязан содержать один атрибут @root со значением "1.2.643.5.1.13"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13']/intendedRecipient/receivedOrganization/name">
			<assert test="count(@nullFlavor)=0">У1-15.1.1.2: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-15.1.1.2: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[not(intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13')]">
			<assert test="count(@nullFlavor)=0">У1-16: Элемент informationRecipient не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(intendedRecipient)=1">У1-16.1: Элемент informationRecipient ОБЯЗАН содержать один [1..1] элемент intendedRecipient</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[not(intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13')]/intendedRecipient">
			<assert test="count(@nullFlavor)=0">У1-16.1: Элемент intendedRecipient не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(receivedOrganization)=1">У1-16.1.1: Элемент intendedRecipient ОБЯЗАН содержать один [1..1] элемент receivedOrganization</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[not(intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13')]/intendedRecipient/receivedOrganization">
			<assert test="count(@nullFlavor)=0">У1-16.1.1: Элемент receivedOrganization не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[1])=1">У1-16.1.1.1: Элемент receivedOrganization ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор получающей организации и (при наличии) уникальный идентификатор структурного подразделения)</assert>
			<assert test="count(name)=1">У1-16.1.1.2: Элемент receivedOrganization ОБЯЗАН содержать один [1..1] элемент name</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[not(intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13')]/intendedRecipient/receivedOrganization/id[1][not(@nullFlavor)]">
			<assert test="@root!=''">У1-16.1.1.1: Элемент id должен содержать один атрибут @root с не пустым значением</assert>
			<assert test="count(@extension!='')=[0,1]">У1-16.1.1.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
			<assert test="if (@extension) then @extension!='' else(not(@extension))">У1-16.1.1.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[not(intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13')]/intendedRecipient/receivedOrganization/id[1][@nullFlavor]">
			<assert test="count(@root)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @root</assert>
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/informationRecipient[not(intendedRecipient/receivedOrganization/id/@root='1.2.643.5.1.13')]/intendedRecipient/receivedOrganization/name">
			<assert test="count(@nullFlavor)=0">У1-16.1.1.2: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-16.1.1.2: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']">
			<assert test="count(@nullFlavor)=0">У1-17: Элемент participant не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='IND'">У1-17: Элемент participant обязан содержать один атрибут @typeCode со значением "IND"</assert>
			<assert test="count(associatedEntity)=1">У1-17.1: Элемент participant ОБЯЗАН содержать один [1..1] элемент associatedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity">
			<assert test="count(@nullFlavor)=0">У1-17.1: Элемент associatedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='GUAR'">У1-17.1: Элемент associatedEntity обязан содержать один атрибут @classCode со значением "GUAR"</assert>
			<assert test="count(code)=1">У1-17.1.1: Элемент associatedEntity ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(identity:DocInfo)=1">У1-17.1.2: Элемент associatedEntity ДОЛЖЕН содержать один [1..1] элемент identity:DocInfo</assert>
			<assert test="count(scopingOrganization)>=0 and count(scopingOrganization)&lt;=1">У1-17.1.3: Элемент associatedEntity МОЖЕТ содержать не более одного [0..1] элемента scopingOrganization</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/code">
			<assert test="count(@nullFlavor)=0">У1-17.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1039'">У1-17.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1039"</assert>
			<assert test="@codeSystemName!=''">У1-17.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-17.1.1: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-17.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-17.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo[not(@nullFlavor)]">
			<assert test="count(identity:IdentityDocType)=1">У1-17.1.2.1: Элемент identity:DocInfo ОБЯЗАН содержать один [1..1] элемент identity:IdentityDocType</assert>
			<assert test="count(identity:InsurancePolicyType)=1">У1-17.1.2.2: Элемент identity:DocInfo ДОЛЖЕН содержать один [1..1] элемент identity:InsurancePolicyType</assert>
			<assert test="count(identity:Series)=1">У1-17.1.2.3: Элемент identity:DocInfo ДОЛЖЕН содержать один [1..1] элемент identity:Series</assert>
			<assert test="count(identity:Number)=1">У1-17.1.2.4: Элемент identity:DocInfo ДОЛЖЕН содержать один [1..1] элемент identity:Number</assert>
			<assert test="count(identity:INN)=1">У1-17.1.2.5: Элемент identity:DocInfo ДОЛЖЕН содержать один [1..1] элемент identity:INN</assert>
			<assert test="count(identity:effectiveTime)=1">У1-17.1.2.6: Элемент identity:DocInfo ДОЛЖЕН содержать один [1..1] элемент identity:effectiveTime</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:IdentityDocType">
			<assert test="count(@nullFlavor)=0">У1-17.1.2.1: Элемент identity:IdentityDocType не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.724'">У1-17.1.2.1: Элемент identity:IdentityDocType обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.724"</assert>
			<assert test="@codeSystemName!=''">У1-17.1.2.1: Элемент identity:IdentityDocType обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-17.1.2.1: Элемент identity:IdentityDocType обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-17.1.2.1: Элемент identity:IdentityDocType обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-17.1.2.1: Элемент identity:IdentityDocType обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:InsurancePolicyType[not(@nullFlavor)]">
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1035'">У1-17.1.2.2: Элемент identity:InsurancePolicyType должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1035"</assert>
			<assert test="@codeSystemName!=''">У1-17.1.2.2: Элемент identity:InsurancePolicyType должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-17.1.2.2: Элемент identity:InsurancePolicyType должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-17.1.2.2: Элемент identity:InsurancePolicyType должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-17.1.2.2: Элемент identity:InsurancePolicyType должен содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:InsurancePolicyType[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:Series[not(@nullFlavor)]">
			<assert test=".!=''">У1-17.1.2.3: Элемент identity:Series должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:Number[not(@nullFlavor)]">
			<assert test=".!=''">У1-17.1.2.4: Элемент identity:Number должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:INN[not(@nullFlavor)]">
			<assert test=".!=''">У1-17.1.2.5: Элемент identity:INN должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:effectiveTime[not(@nullFlavor)]">
			<assert test="count(identity:low)=1">У1-17.1.2.6.1: Элемент identity:effectiveTime ОБЯЗАН содержать один [1..1] элемент identity:low</assert>
			<assert test="count(identity:high)=1">У1-17.1.2.6.2: Элемент identity:effectiveTime ДОЛЖЕН содержать один [1..1] элемент identity:high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:effectiveTime/identity:low">
			<assert test="count(@nullFlavor)=0">У1-17.1.2.6.1: Элемент identity:low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У1-17.1.2.6.1: Элемент identity:low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:effectiveTime/identity:high[not(@nullFlavor)]">
			<assert test="@value!=''">У1-17.1.2.6.2: Элемент identity:high должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/identity:DocInfo/identity:effectiveTime/identity:high[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization">
			<assert test="count(@nullFlavor)=0">У1-17.1.3: Элемент scopingOrganization не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[1])=1">У1-17.1.3.1: Элемент scopingOrganization ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор страховой компании)</assert>
			<assert test="count(name)=1">У1-17.1.3.2: Элемент scopingOrganization ОБЯЗАН содержать один [1..1] элемент name</assert>
			<assert test="count(telecom)>=1">У1-17.1.3.3: Элемент scopingOrganization ДОЛЖЕН содержать не менее одного [1..*] элемента telecom</assert>
			<assert test="count(addr)=1">У1-17.1.3.4: Элемент scopingOrganization ДОЛЖЕН содержать один [1..1] элемент addr</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/id[1][not(@nullFlavor)]">
			<assert test="@root='1.2.643.5.1.13.13.99.2.183'">У1-17.1.3.1: Элемент id должен содержать один атрибут @root со значением "1.2.643.5.1.13.13.99.2.183"</assert>
			<assert test="@extension!=''">У1-17.1.3.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/id[1][@nullFlavor]">
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/name">
			<assert test="count(@nullFlavor)=0">У1-17.1.3.2: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-17.1.3.2: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/telecom[not(@nullFlavor)]">
			<assert test="count(@use!='')=[0,1]">У1-17.1.3.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-17.1.3.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-17.1.3.3: Элемент telecom должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/telecom[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/addr[not(@nullFlavor)]">
			<assert test="count(@use!='')=[0,1]">У1-17.1.3.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-17.1.3.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-17.1.3.4.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-17.1.3.4.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-17.1.3.4.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-17.1.3.4.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-17.1.3.4.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-17.1.3.4.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-17.1.3.4.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-17.1.3.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-17.1.3.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-17.1.3.4.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-17.1.3.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-17.1.3.4.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-17.1.3.4.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-17.1.3.4.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-17.1.3.4.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-17.1.3.4.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-17.1.3.4.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='IND']/associatedEntity/scopingOrganization/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-17.1.3.4.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']">
			<assert test="count(@nullFlavor)=0">У1-18: Элемент participant не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REF'">У1-18: Элемент participant обязан содержать один атрибут @typeCode со значением "REF"</assert>
			<assert test="count(associatedEntity)=1">У1-18.1: Элемент participant ОБЯЗАН содержать один [1..1] элемент associatedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity">
			<assert test="count(@nullFlavor)=0">У1-18.1: Элемент associatedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='PROV'">У1-18.1: Элемент associatedEntity обязан содержать один атрибут @classCode со значением "PROV"</assert>
			<assert test="count(id[1])=1">У1-18.1.1: Элемент associatedEntity ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор направившего лица в МИС)</assert>
			<assert test="count(id[2])=1">У1-18.1.2: Элемент associatedEntity ДОЛЖЕН содержать один [1..1] элемент id (СНИЛС направившего лица)</assert>
			<assert test="count(code)=1">У1-18.1.3: Элемент associatedEntity ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(addr)>=0 and count(addr)&lt;=1">У1-18.1.4: Элемент associatedEntity МОЖЕТ содержать не более одного [0..1] элемента addr</assert>
			<assert test="count(telecom)>=0">У1-18.1.5: Элемент associatedEntity МОЖЕТ содержать произвольное количество [0..*] элементов telecom</assert>
			<assert test="count(associatedPerson)=1">У1-18.1.6: Элемент associatedEntity ОБЯЗАН содержать один [1..1] элемент associatedPerson</assert>
			<assert test="count(scopingOrganization)>=0 and count(scopingOrganization)&lt;=1">У1-18.1.7: Элемент associatedEntity МОЖЕТ содержать не более одного [0..1] элемента scopingOrganization</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/id[1][not(@nullFlavor)]">
			<assert test="@root!=''">У1-18.1.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У1-18.1.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У1-18.1.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/id[1][@nullFlavor]">
			<assert test="count(@root)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @root</assert>
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/id[2][not(@nullFlavor)]">
			<assert test="@root='1.2.643.100.3'">У1-18.1.2: Элемент id должен содержать один атрибут @root со значением "1.2.643.100.3"</assert>
			<assert test="@extension!=''">У1-18.1.2: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/id[2][@nullFlavor]">
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/code">
			<assert test="count(@nullFlavor)=0">У1-18.1.3: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1002','1.2.643.5.1.13.2.1.1.733']">У1-18.1.3: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1002"</assert>
			<assert test="@codeSystemName!=''">У1-18.1.3: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-18.1.3: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-18.1.3: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-18.1.3: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/addr">
			<assert test="count(@nullFlavor)=0">У1-18.1.4: Элемент addr не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-18.1.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-18.1.4: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-18.1.4.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-18.1.4.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-18.1.4.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-18.1.4.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-18.1.4.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.4.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-18.1.4.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-18.1.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-18.1.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-18.1.4.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-18.1.4.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-18.1.4.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-18.1.4.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-18.1.4.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-18.1.4.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-18.1.4.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.4.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-18.1.4.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/telecom">
			<assert test="count(@nullFlavor)=0">У1-18.1.5: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-18.1.5: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-18.1.5: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-18.1.5: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/associatedPerson">
			<assert test="count(@nullFlavor)=0">У1-18.1.6: Элемент associatedPerson не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(name)=1">У1-18.1.6.1: Элемент associatedPerson ОБЯЗАН содержать один [1..1] элемент name</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/associatedPerson/name">
			<assert test="count(@nullFlavor)=0">У1-18.1.6.1: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(family)=1">У1-18.1.6.1.1: Элемент name ОБЯЗАН содержать один [1..1] элемент family</assert>
			<assert test="count(given)=1">У1-18.1.6.1.2: Элемент name ОБЯЗАН содержать один [1..1] элемент given</assert>
			<assert test="count(identity:Patronymic)>=0 and count(identity:Patronymic)&lt;=1">У1-18.1.6.1.3: Элемент name МОЖЕТ содержать не более одного [0..1] элемента identity:Patronymic</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/associatedPerson/name/family">
			<assert test="count(@nullFlavor)=0">У1-18.1.6.1.1: Элемент family не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.6.1.1: Элемент family должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/associatedPerson/name/given">
			<assert test="count(@nullFlavor)=0">У1-18.1.6.1.2: Элемент given не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.6.1.2: Элемент given должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/associatedPerson/name/identity:Patronymic">
			<assert test="count(@nullFlavor)=0">У1-18.1.6.1.3: Элемент identity:Patronymic не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.6.1.3: Элемент identity:Patronymic должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization">
			<assert test="count(@nullFlavor)=0">У1-18.1.7: Элемент scopingOrganization не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')])=1">У1-18.1.7.1: Элемент scopingOrganization ОБЯЗАН содержать один [1..1] элемент id</assert>
			<assert test="count(identity:Dept)>=0 and count(identity:Dept)&lt;=1">У1-18.1.7.2: Элемент scopingOrganization МОЖЕТ содержать не более одного [0..1] элемента identity:Dept</assert>
			<assert test="count(name)=1">У1-18.1.7.3: Элемент scopingOrganization ОБЯЗАН содержать один [1..1] элемент name</assert>
			<assert test="count(telecom)>=0">У1-18.1.7.4: Элемент scopingOrganization МОЖЕТ содержать произвольное количество [0..*] элементов telecom</assert>
			<assert test="count(addr)>=0 and count(addr)&lt;=1">У1-18.1.7.5: Элемент scopingOrganization МОЖЕТ содержать не более одного [0..1] элемента addr</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/id[not(@root='1.2.643.100.3')][not(@root='1.2.643.5.1.13.2.1.1.1504.101')][not(@root='1.2.643.5.1.13.13.17.1.1')]">
			<assert test="count(@nullFlavor)=0">У1-18.1.7.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-18.1.7.1: Элемент id обязан содержать один атрибут @root с не пустым значением</assert>
			<assert test="count(@extension!='')=[0,1]">У1-18.1.7.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
			<assert test="if (@extension) then @extension!='' else(not(@extension))">У1-18.1.7.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/identity:Dept">
			<assert test="count(@nullFlavor)=0">У1-18.1.7.2: Элемент identity:Dept не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.7.2: Элемент identity:Dept должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/name">
			<assert test="count(@nullFlavor)=0">У1-18.1.7.3: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.7.3: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/telecom">
			<assert test="count(@nullFlavor)=0">У1-18.1.7.4: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-18.1.7.4: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-18.1.7.4: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-18.1.7.4: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/addr">
			<assert test="count(@nullFlavor)=0">У1-18.1.7.5: Элемент addr не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-18.1.7.5: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-18.1.7.5: Элемент addr должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="count(streetAddressLine)=1">У1-18.1.7.5.1: Элемент addr ОБЯЗАН содержать один [1..1] элемент streetAddressLine</assert>
			<assert test="count(address:stateCode)=1">У1-18.1.7.5.2: Элемент addr ОБЯЗАН содержать один [1..1] элемент address:stateCode</assert>
			<assert test="count(postalCode)=1">У1-18.1.7.5.3: Элемент addr ДОЛЖЕН содержать один [1..1] элемент postalCode</assert>
			<assert test="count(fias:Address)=1">У1-18.1.7.5.4: Элемент addr ДОЛЖЕН содержать один [1..1] элемент fias:Address</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/addr/streetAddressLine">
			<assert test="count(@nullFlavor)=0">У1-18.1.7.5.1: Элемент streetAddressLine не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.7.5.1: Элемент streetAddressLine должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/addr/address:stateCode">
			<assert test="count(@nullFlavor)=0">У1-18.1.7.5.2: Элемент address:stateCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.206','1.2.643.5.1.13.13.11.1093']">У1-18.1.7.5.2: Элемент address:stateCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.206"</assert>
			<assert test="@codeSystemName!=''">У1-18.1.7.5.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-18.1.7.5.2: Элемент address:stateCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-18.1.7.5.2: Элемент address:stateCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-18.1.7.5.2: Элемент address:stateCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/addr/postalCode[not(@nullFlavor)]">
			<assert test=".!=''">У1-18.1.7.5.3: Элемент postalCode должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/addr/fias:Address[not(@nullFlavor)]">
			<assert test="count(fias:AOGUID)=1">У1-18.1.7.5.4.1: Элемент fias:Address ОБЯЗАН содержать один [1..1] элемент fias:AOGUID</assert>
			<assert test="count(fias:HOUSEGUID)=1">У1-18.1.7.5.4.2: Элемент fias:Address ДОЛЖЕН содержать один [1..1] элемент fias:HOUSEGUID</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/addr/fias:Address/fias:AOGUID">
			<assert test="count(@nullFlavor)=0">У1-18.1.7.5.4.1: Элемент fias:AOGUID не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-18.1.7.5.4.1: Элемент fias:AOGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/participant[@typeCode='REF']/associatedEntity/scopingOrganization/addr/fias:Address/fias:HOUSEGUID[not(@nullFlavor)]">
			<assert test=".!=''">У1-18.1.7.5.4.2: Элемент fias:HOUSEGUID должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/inFulfillmentOf">
			<assert test="count(@nullFlavor)=0">У1-19: Элемент inFulfillmentOf не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(order)=1">У1-19.1: Элемент inFulfillmentOf ОБЯЗАН содержать один [1..1] элемент order</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/inFulfillmentOf/order">
			<assert test="count(@nullFlavor)=0">У1-19.1: Элемент order не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[1])=1">У1-19.1.1: Элемент order ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор направления в МИС)</assert>
			<assert test="count(id[2])=1">У1-19.1.2: Элемент order ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор направления в РЭМД)</assert>
			<assert test="count(code)=1">У1-19.1.3: Элемент order ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/inFulfillmentOf/order/id[1][not(@nullFlavor)]">
			<assert test="@root!=''">У1-19.1.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.51</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.51$')">У1-19.1.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.51</assert>
			<assert test="@extension!=''">У1-19.1.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/inFulfillmentOf/order/id[1][@nullFlavor]">
			<assert test="count(@root)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @root</assert>
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/inFulfillmentOf/order/id[2][not(@nullFlavor)]">
			<assert test="@root='1.2.643.5.1.13.13.17.1.1'">У1-19.1.2: Элемент id должен содержать один атрибут @root со значением "1.2.643.5.1.13.13.17.1.1"</assert>
			<assert test="@extension!=''">У1-19.1.2: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/inFulfillmentOf/order/id[2][@nullFlavor]">
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/inFulfillmentOf/order/code">
			<assert test="count(@nullFlavor)=0">У1-19.1.3: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code!=''">У1-19.1.3: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystem!=''">У1-19.1.3: Элемент code обязан содержать один атрибут @codeSystem с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-19.1.3: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@codeSystemName!=''">У1-19.1.3: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У1-19.1.3: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf">
			<assert test="count(@nullFlavor)=0">У1-20: Элемент documentationOf не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(serviceEvent)=1">У1-20.1: Элемент documentationOf ОБЯЗАН содержать один [1..1] элемент serviceEvent</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent">
			<assert test="count(@nullFlavor)=0">У1-20.1: Элемент serviceEvent не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У1-20.1.1: Элемент serviceEvent ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(effectiveTime)=1">У1-20.1.2: Элемент serviceEvent ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(medService:serviceForm)>=0 and count(medService:serviceForm)&lt;=1">У1-20.1.3: Элемент serviceEvent МОЖЕТ содержать не более одного [0..1] элемента medService:serviceForm</assert>
			<assert test="count(medService:serviceType)>=0 and count(medService:serviceType)&lt;=1">У1-20.1.4: Элемент serviceEvent МОЖЕТ содержать не более одного [0..1] элемента medService:serviceType</assert>
			<assert test="count(medService:serviceCond)>=0 and count(medService:serviceCond)&lt;=1">У1-20.1.5: Элемент serviceEvent МОЖЕТ содержать не более одного [0..1] элемента medService:serviceCond</assert>
			<assert test="count(performer)>=0">У1-20.1.6: Элемент serviceEvent МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/code">
			<assert test="count(@nullFlavor)=0">У1-20.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='1'">У1-20.1.1: Элемент code обязан содержать один атрибут @code со значением "1"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.726'">У1-20.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.726"</assert>
			<assert test="@codeSystemName!=''">У1-20.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У1-20.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-20.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/effectiveTime">
			<assert test="count(@nullFlavor)=0">У1-20.1.2: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)=1">У1-20.1.2.1: Элемент effectiveTime ОБЯЗАН содержать один [1..1] элемент low</assert>
			<assert test="count(high)=1">У1-20.1.2.2: Элемент effectiveTime ДОЛЖЕН содержать один [1..1] элемент high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У1-20.1.2.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У1-20.1.2.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/effectiveTime/high[not(@nullFlavor)]">
			<assert test="@value!=''">У1-20.1.2.2: Элемент high должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/effectiveTime/high[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/medService:serviceForm">
			<assert test="count(@nullFlavor)=0">У1-20.1.3: Элемент medService:serviceForm не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1551','1.2.643.5.1.13.2.1.1.568','1.2.643.5.1.13.13.99.2.377']">У1-20.1.3: Элемент medService:serviceForm обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1551"</assert>
			<assert test="@codeSystemName!=''">У1-20.1.3: Элемент medService:serviceForm обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-20.1.3: Элемент medService:serviceForm обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-20.1.3: Элемент medService:serviceForm обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-20.1.3: Элемент medService:serviceForm обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/medService:serviceType">
			<assert test="count(@nullFlavor)=0">У1-20.1.4: Элемент medService:serviceType не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1034'">У1-20.1.4: Элемент medService:serviceType обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1034"</assert>
			<assert test="@codeSystemName!=''">У1-20.1.4: Элемент medService:serviceType обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-20.1.4: Элемент medService:serviceType обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-20.1.4: Элемент medService:serviceType обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-20.1.4: Элемент medService:serviceType обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/medService:serviceCond">
			<assert test="count(@nullFlavor)=0">У1-20.1.5: Элемент medService:serviceCond не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.322','1.2.643.5.1.13.2.1.1.103']">У1-20.1.5: Элемент medService:serviceCond обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.322"</assert>
			<assert test="@codeSystemName!=''">У1-20.1.5: Элемент medService:serviceCond обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-20.1.5: Элемент medService:serviceCond обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-20.1.5: Элемент medService:serviceCond обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-20.1.5: Элемент medService:serviceCond обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer">
			<assert test="count(@nullFlavor)=0">У1-20.1.6: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode!=''">У1-20.1.6: Элемент performer обязан содержать один атрибут @typeCode с не пустым значением</assert>
			<assert test="count(assignedEntity)=1">У1-20.1.6.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У1-20.1.6.1: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[1])=1">У1-20.1.6.1.1: Элемент assignedEntity ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор участника документируемого события в МИС)</assert>
			<assert test="count(code)=1">У1-20.1.6.1.2: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(telecom)>=0">У1-20.1.6.1.3: Элемент assignedEntity МОЖЕТ содержать произвольное количество [0..*] элементов telecom</assert>
			<assert test="count(assignedPerson)=1">У1-20.1.6.1.4: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент assignedPerson</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/id[1][not(@nullFlavor)]">
			<assert test="@root!=''">У1-20.1.6.1.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У1-20.1.6.1.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У1-20.1.6.1.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/id[1][@nullFlavor]">
			<assert test="count(@root)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @root</assert>
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/code">
			<assert test="count(@nullFlavor)=0">У1-20.1.6.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1002','1.2.643.5.1.13.2.1.1.733']">У1-20.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1002"</assert>
			<assert test="@codeSystemName!=''">У1-20.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-20.1.6.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-20.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-20.1.6.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/telecom">
			<assert test="count(@nullFlavor)=0">У1-20.1.6.1.3: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У1-20.1.6.1.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У1-20.1.6.1.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У1-20.1.6.1.3: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson">
			<assert test="count(@nullFlavor)=0">У1-20.1.6.1.4: Элемент assignedPerson не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(name)=1">У1-20.1.6.1.4.1: Элемент assignedPerson ОБЯЗАН содержать один [1..1] элемент name</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson/name">
			<assert test="count(@nullFlavor)=0">У1-20.1.6.1.4.1: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(family)=1">У1-20.1.6.1.4.1.1: Элемент name ОБЯЗАН содержать один [1..1] элемент family</assert>
			<assert test="count(given)=1">У1-20.1.6.1.4.1.2: Элемент name ОБЯЗАН содержать один [1..1] элемент given</assert>
			<assert test="count(identity:Patronymic)>=0 and count(identity:Patronymic)&lt;=1">У1-20.1.6.1.4.1.3: Элемент name МОЖЕТ содержать не более одного [0..1] элемента identity:Patronymic</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson/name/family">
			<assert test="count(@nullFlavor)=0">У1-20.1.6.1.4.1.1: Элемент family не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-20.1.6.1.4.1.1: Элемент family должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson/name/given">
			<assert test="count(@nullFlavor)=0">У1-20.1.6.1.4.1.2: Элемент given не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-20.1.6.1.4.1.2: Элемент given должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/documentationOf/serviceEvent/performer/assignedEntity/assignedPerson/name/identity:Patronymic">
			<assert test="count(@nullFlavor)=0">У1-20.1.6.1.4.1.3: Элемент identity:Patronymic не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-20.1.6.1.4.1.3: Элемент identity:Patronymic должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf">
			<assert test="count(@nullFlavor)=0">У1-21: Элемент componentOf не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(encompassingEncounter)=1">У1-21.1: Элемент componentOf ОБЯЗАН содержать один [1..1] элемент encompassingEncounter</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter">
			<assert test="count(@nullFlavor)=0">У1-21.1: Элемент encompassingEncounter не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.15'])=1">У1-21.1.1: Элемент encompassingEncounter ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.15)</assert>
			<assert test="count(code)=1">У1-21.1.2: Элемент encompassingEncounter ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(medService:DocType)>=0 and count(medService:DocType)&lt;=1">У1-21.1.3: Элемент encompassingEncounter МОЖЕТ содержать не более одного [0..1] элемента medService:DocType</assert>
			<assert test="count(medService:DocNumber)=1">У1-21.1.4: Элемент encompassingEncounter ОБЯЗАН содержать один [1..1] элемент medService:DocNumber</assert>
			<assert test="count(effectiveTime)>=0 and count(effectiveTime)&lt;=1">У1-21.1.5: Элемент encompassingEncounter МОЖЕТ содержать не более одного [0..1] элемента effectiveTime</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У1-21.1.4 -->
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter[code/@code='3']">
			<assert test="count(medService:DocType)=[1]">У1-21.1.4: Элемент encompassingEncounter МОЖЕТ содержать не более одного [0..1] элемента medService:DocType; атрибут ClinicalDocument/componentOf/encompassingEncounter/code/@code=="3": элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У1-21.1.4 -->
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter[code/@code!='3']">
			<assert test="count(medService:DocType)=[0]">У1-21.1.4: Элемент encompassingEncounter МОЖЕТ содержать не более одного [0..1] элемента medService:DocType; атрибут ClinicalDocument/componentOf/encompassingEncounter/code/@code!="3": элемент должен отсутствовать</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter/id[substring(@root, string-length(@root) - 2)='.15']">
			<assert test="count(@nullFlavor)=0">У1-21.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У1-21.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.15</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.15$')">У1-21.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.15</assert>
			<assert test="@extension!=''">У1-21.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter/code">
			<assert test="count(@nullFlavor)=0">У1-21.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.723'">У1-21.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.723"</assert>
			<assert test="@codeSystemName!=''">У1-21.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-21.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-21.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-21.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter/medService:DocType">
			<assert test="count(@nullFlavor)=0">У1-21.1.3: Элемент medService:DocType не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1522','1.2.643.5.1.13.2.1.1.646','1.2.643.5.1.13.13.11.1115','1.2.643.5.1.13.13.99.2.195']">У1-21.1.3: Элемент medService:DocType обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1522"</assert>
			<assert test="@codeSystemName!=''">У1-21.1.3: Элемент medService:DocType обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У1-21.1.3: Элемент medService:DocType обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У1-21.1.3: Элемент medService:DocType обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У1-21.1.3: Элемент medService:DocType обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter/medService:DocNumber">
			<assert test="count(@nullFlavor)=0">У1-21.1.4: Элемент medService:DocNumber не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У1-21.1.4: Элемент medService:DocNumber должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter/effectiveTime">
			<assert test="count(@nullFlavor)=0">У1-21.1.5: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)=1">У1-21.1.5.1: Элемент effectiveTime ОБЯЗАН содержать один [1..1] элемент low</assert>
			<assert test="count(high)>=0 and count(high)&lt;=1">У1-21.1.5.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У1-21.1.5.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У1-21.1.5.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/componentOf/encompassingEncounter/effectiveTime/high">
			<assert test="count(@nullFlavor)=0">У1-21.1.5.2: Элемент high не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У1-21.1.5.2: Элемент high обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component">
			<assert test="count(@nullFlavor)=0">У1-22: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(structuredBody)=1">У1-22.1: Элемент component ОБЯЗАН содержать один [1..1] элемент structuredBody</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody">
			<assert test="count(@nullFlavor)=0">У1-22.1: Элемент structuredBody не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(component[section/code/@code='DOCINFO'])=1">У2-1: Элемент structuredBody ОБЯЗАН содержать один [1..1] элемент component</assert>
			<assert test="count(component[section/code/@code='BENEFITS'])>=0 and count(component[section/code/@code='BENEFITS'])&lt;=1">У2-2: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='COMPLNTS'])>=0 and count(component[section/code/@code='COMPLNTS'])&lt;=1">У2-3: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='ANAM'])>=0 and count(component[section/code/@code='ANAM'])&lt;=1">У2-4: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='LANAM'])>=0 and count(component[section/code/@code='LANAM'])&lt;=1">У2-5: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='DISABILITY'])>=0 and count(component[section/code/@code='DISABILITY'])&lt;=1">У2-6: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='SOCANAM'])>=0 and count(component[section/code/@code='SOCANAM'])&lt;=1">У2-7: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='OBSTETRICANAMN'])>=0 and count(component[section/code/@code='OBSTETRICANAMN'])&lt;=1">У2-8: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='ALL'])>=0 and count(component[section/code/@code='ALL'])&lt;=1">У2-9: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='EPIDEM'])>=0 and count(component[section/code/@code='EPIDEM'])&lt;=1">У2-10: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='RESCONS'])>=0 and count(component[section/code/@code='RESCONS'])&lt;=1">У2-11: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='CONSILIUMDECISION'])>=0 and count(component[section/code/@code='CONSILIUMDECISION'])&lt;=1">У2-12: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='COMMISSION'])>=0 and count(component[section/code/@code='COMMISSION'])&lt;=1">У2-13: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='RESLAB'])>=0 and count(component[section/code/@code='RESLAB'])&lt;=1">У2-14: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='RESINSTR'])>=0 and count(component[section/code/@code='RESINSTR'])&lt;=1">У2-15: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='GISTRESULT'])>=0 and count(component[section/code/@code='GISTRESULT'])&lt;=1">У2-16: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='SUR'])>=0 and count(component[section/code/@code='SUR'])&lt;=1">У2-17: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='TRANSFUSINFO'])>=0 and count(component[section/code/@code='TRANSFUSINFO'])&lt;=1">У2-18: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='ELSEPROCEDURE'])>=0 and count(component[section/code/@code='ELSEPROCEDURE'])&lt;=1">У2-19: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='IMM'])>=0 and count(component[section/code/@code='IMM'])&lt;=1">У2-20: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='DRUG'])>=0 and count(component[section/code/@code='DRUG'])&lt;=1">У2-21: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='MEDDEVICE'])>=0 and count(component[section/code/@code='MEDDEVICE'])&lt;=1">У2-22: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='VITALPARAM'])>=0 and count(component[section/code/@code='VITALPARAM'])&lt;=1">У2-23: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='SCORES'])>=0 and count(component[section/code/@code='SCORES'])&lt;=1">У2-24: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='DGN'])=1">У2-25: Элемент structuredBody ОБЯЗАН содержать один [1..1] элемент component</assert>
			<assert test="count(component[section/code/@code='REGIME'])>=0 and count(component[section/code/@code='REGIME'])&lt;=1">У2-26: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='SERVICES'])>=0 and count(component[section/code/@code='SERVICES'])&lt;=1">У2-27: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
			<assert test="count(component[section/code/@code='LINKDOCS'])>=0 and count(component[section/code/@code='LINKDOCS'])&lt;=1">У2-28: Элемент structuredBody МОЖЕТ содержать не более одного [0..1] элемента component</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']">
			<assert test="count(@nullFlavor)=0">У2-1: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-1.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section">
			<assert test="count(@nullFlavor)=0">У2-1.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-1.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='800'])=1">У3-1: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
			<assert test="count(entry[observation/code/@code='801'])>=0 and count(entry[observation/code/@code='801'])&lt;=1">У3-2: Элемент section МОЖЕТ содержать не более одного [0..1] элемента entry</assert>
			<assert test="count(entry[observation/code/@code='7003'])>=0 and count(entry[observation/code/@code='7003'])&lt;=1">У3-3: Элемент section МОЖЕТ содержать не более одного [0..1] элемента entry</assert>
			<assert test="count(entry[observation/code/@code='804'])=1">У3-4: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
			<assert test="count(entry[observation/code/@code='836'])>=0 and count(entry[observation/code/@code='836'])&lt;=1">У3-5: Элемент section МОЖЕТ содержать не более одного [0..1] элемента entry</assert>
			<assert test="count(entry[observation/code/@code='806'])=1">У3-6: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
			<assert test="count(entry[observation/code/@code='808'])>=0">У3-7: Элемент section МОЖЕТ содержать произвольное количество [0..*] элементов entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/code">
			<assert test="count(@nullFlavor)=0">У2-1.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='DOCINFO'">У2-1.1.1: Элемент code обязан содержать один атрибут @code со значением "DOCINFO"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-1.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-1.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-1.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-1.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='800']">
			<assert test="count(@nullFlavor)=0">У3-1: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-1.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='800']/observation">
			<assert test="count(@nullFlavor)=0">У3-1.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-1.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-1.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-1.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-1.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='800']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-1.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='800'">У3-1.1.1: Элемент code обязан содержать один атрибут @code со значением "800"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-1.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-1.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-1.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-1.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='800']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-1.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-1.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1007','1.2.643.5.1.13.2.1.1.109']">У3-1.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1007"</assert>
			<assert test="@codeSystemName!=''">У3-1.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-1.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-1.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-1.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='801']">
			<assert test="count(@nullFlavor)=0">У3-2: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-2.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='801']/observation">
			<assert test="count(@nullFlavor)=0">У3-2.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-2.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-2.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-2.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-2.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='801']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-2.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='801'">У3-2.1.1: Элемент code обязан содержать один атрибут @code со значением "801"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-2.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-2.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-2.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-2.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='801']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-2.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-2.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1008'">У3-2.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1008"</assert>
			<assert test="@codeSystemName!=''">У3-2.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-2.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-2.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-2.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='7003']">
			<assert test="count(@nullFlavor)=0">У3-3: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-3.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='7003']/observation">
			<assert test="count(@nullFlavor)=0">У3-3.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-3.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-3.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-3.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-3.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='7003']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-3.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7003'">У3-3.1.1: Элемент code обязан содержать один атрибут @code со значением "7003"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-3.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-3.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-3.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-3.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='7003']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-3.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-3.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.688'">У3-3.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.688"</assert>
			<assert test="@codeSystemName!=''">У3-3.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-3.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-3.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-3.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='804']">
			<assert test="count(@nullFlavor)=0">У3-4: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-4.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='804']/observation">
			<assert test="count(@nullFlavor)=0">У3-4.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-4.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-4.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-4.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-4.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='804']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-4.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='804'">У3-4.1.1: Элемент code обязан содержать один атрибут @code со значением "804"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-4.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-4.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-4.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-4.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='804']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-4.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-4.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1006','1.2.643.5.1.13.2.1.1.111']">У3-4.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1006"</assert>
			<assert test="@codeSystemName!=''">У3-4.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-4.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-4.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-4.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='836']">
			<assert test="count(@nullFlavor)=0">У3-5: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-5.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='836']/observation">
			<assert test="count(@nullFlavor)=0">У3-5.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-5.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-5.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-5.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-5.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='836']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-5.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='836'">У3-5.1.1: Элемент code обязан содержать один атрибут @code со значением "836"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-5.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-5.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-5.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-5.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='836']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-5.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-5.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-5.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='806']">
			<assert test="count(@nullFlavor)=0">У3-6: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-6.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='806']/observation">
			<assert test="count(@nullFlavor)=0">У3-6.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-6.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-6.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-6.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-6.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='806']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='806'">У3-6.1.1: Элемент code обязан содержать один атрибут @code со значением "806"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='806']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='ST'">У3-6.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-6.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='806']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='ST'">У3-6.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='808']">
			<assert test="count(@nullFlavor)=0">У3-7: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-7.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='808']/observation">
			<assert test="count(@nullFlavor)=0">У3-7.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-7.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-7.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-7.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-7.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='808']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-7.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='808'">У3-7.1.1: Элемент code обязан содержать один атрибут @code со значением "808"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-7.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-7.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-7.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-7.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='808']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='CD'">У3-7.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1473'">У3-7.1.2: Элемент value должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1473"</assert>
			<assert test="@codeSystemName!=''">У3-7.1.2: Элемент value должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-7.1.2: Элемент value должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-7.1.2: Элемент value должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-7.1.2: Элемент value должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(originalText)>=0 and count(originalText)&lt;=1">У3-7.1.2.1: Элемент value МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-7.1.2.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='808']/observation/value[@nullFlavor='OTH']">
			<assert test="count(originalText)=[1]">У3-7.1.2.1: Элемент value МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='808']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='CD'">У3-7.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DOCINFO']/section/entry[observation/code/@code='808']/observation/value/originalText">
			<assert test="count(@nullFlavor)=0">У3-7.1.2.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-7.1.2.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='BENEFITS']">
			<assert test="count(@nullFlavor)=0">У2-2: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-2.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='BENEFITS']/section">
			<assert test="count(@nullFlavor)=0">У2-2.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-2.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='811'])>=1">У3-8: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='BENEFITS']/section/code">
			<assert test="count(@nullFlavor)=0">У2-2.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='BENEFITS'">У2-2.1.1: Элемент code обязан содержать один атрибут @code со значением "BENEFITS"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-2.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-2.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-2.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-2.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='BENEFITS']/section/entry[observation/code/@code='811']">
			<assert test="count(@nullFlavor)=0">У3-8: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-8.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='BENEFITS']/section/entry[observation/code/@code='811']/observation">
			<assert test="count(@nullFlavor)=0">У3-8.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-8.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-8.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-8.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-8.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='BENEFITS']/section/entry[observation/code/@code='811']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-8.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='811'">У3-8.1.1: Элемент code обязан содержать один атрибут @code со значением "811"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-8.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-8.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-8.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-8.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='BENEFITS']/section/entry[observation/code/@code='811']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-8.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-8.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.541'">У3-8.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.541"</assert>
			<assert test="@codeSystemName!=''">У3-8.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-8.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-8.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-8.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMPLNTS']">
			<assert test="count(@nullFlavor)=0">У2-3: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-3.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMPLNTS']/section">
			<assert test="count(@nullFlavor)=0">У2-3.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-3.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='835'])=1">У3-9: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMPLNTS']/section/code">
			<assert test="count(@nullFlavor)=0">У2-3.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='COMPLNTS'">У2-3.1.1: Элемент code обязан содержать один атрибут @code со значением "COMPLNTS"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-3.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-3.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-3.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-3.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMPLNTS']/section/entry[observation/code/@code='835']">
			<assert test="count(@nullFlavor)=0">У3-9: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-9.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMPLNTS']/section/entry[observation/code/@code='835']/observation">
			<assert test="count(@nullFlavor)=0">У3-9.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-9.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-9.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-9.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-9.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMPLNTS']/section/entry[observation/code/@code='835']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-9.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='835'">У3-9.1.1: Элемент code обязан содержать один атрибут @code со значением "835"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-9.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-9.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-9.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-9.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMPLNTS']/section/entry[observation/code/@code='835']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-9.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-9.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-9.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ANAM']">
			<assert test="count(@nullFlavor)=0">У2-4: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-4.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ANAM']/section">
			<assert test="count(@nullFlavor)=0">У2-4.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-4.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='7006'])=1">У3-10: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ANAM']/section/code">
			<assert test="count(@nullFlavor)=0">У2-4.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='ANAM'">У2-4.1.1: Элемент code обязан содержать один атрибут @code со значением "ANAM"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-4.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-4.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-4.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-4.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ANAM']/section/entry[observation/code/@code='7006']">
			<assert test="count(@nullFlavor)=0">У3-10: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-10.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ANAM']/section/entry[observation/code/@code='7006']/observation">
			<assert test="count(@nullFlavor)=0">У3-10.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-10.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-10.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-10.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-10.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ANAM']/section/entry[observation/code/@code='7006']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-10.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7006'">У3-10.1.1: Элемент code обязан содержать один атрибут @code со значением "7006"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-10.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-10.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-10.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-10.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ANAM']/section/entry[observation/code/@code='7006']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='ST'">У3-10.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-10.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ANAM']/section/entry[observation/code/@code='7006']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='ST'">У3-10.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LANAM']">
			<assert test="count(@nullFlavor)=0">У2-5: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-5.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LANAM']/section">
			<assert test="count(@nullFlavor)=0">У2-5.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-5.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='7006'])=1">У3-11: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LANAM']/section/code">
			<assert test="count(@nullFlavor)=0">У2-5.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='LANAM'">У2-5.1.1: Элемент code обязан содержать один атрибут @code со значением "LANAM"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-5.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-5.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-5.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-5.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LANAM']/section/entry[observation/code/@code='7006']">
			<assert test="count(@nullFlavor)=0">У3-11: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-11.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LANAM']/section/entry[observation/code/@code='7006']/observation">
			<assert test="count(@nullFlavor)=0">У3-11.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-11.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-11.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-11.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-11.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LANAM']/section/entry[observation/code/@code='7006']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-11.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7006'">У3-11.1.1: Элемент code обязан содержать один атрибут @code со значением "7006"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-11.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-11.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-11.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-11.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LANAM']/section/entry[observation/code/@code='7006']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='ST'">У3-11.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-11.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LANAM']/section/entry[observation/code/@code='7006']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='ST'">У3-11.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']">
			<assert test="count(@nullFlavor)=0">У2-6: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-6.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section">
			<assert test="count(@nullFlavor)=0">У2-6.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-6.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='814'])>=1">У3-12: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/code">
			<assert test="count(@nullFlavor)=0">У2-6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='DISABILITY'">У2-6.1.1: Элемент code обязан содержать один атрибут @code со значением "DISABILITY"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']">
			<assert test="count(@nullFlavor)=0">У3-12: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-12.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation">
			<assert test="count(@nullFlavor)=0">У3-12.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-12.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-12.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-12.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(effectiveTime)=1">У3-12.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-12.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(entryRelationship[observation/code/@code='815'])>=0 and count(entryRelationship[observation/code/@code='815'])&lt;=1">У3-12.1.4: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='8040'])>=0 and count(entryRelationship[observation/code/@code='8040'])&lt;=1">У3-12.1.5: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-12.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='814'">У3-12.1.1: Элемент code обязан содержать один атрибут @code со значением "814"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-12.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-12.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-12.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-12.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/effectiveTime[not(@nullFlavor)]">
			<assert test="count(low)=1">У3-12.1.2.1: Элемент effectiveTime ОБЯЗАН содержать один [1..1] элемент low</assert>
			<assert test="count(high)=1">У3-12.1.2.2: Элемент effectiveTime ДОЛЖЕН содержать один [1..1] элемент high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-12.1.2.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-12.1.2.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/effectiveTime/high[not(@nullFlavor)]">
			<assert test="@value!=''">У3-12.1.2.2: Элемент high должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/effectiveTime/high[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
			<!-- Альтернатива У3-12.1.2.2 -->
			<assert test="@nullFlavor = ['PINF']">У3-12.1.2.2: Допустимые значения для атрибута  nullFlavor: 'PINF'</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-12.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-12.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1053','1.2.643.5.1.13.2.1.1.702']">У3-12.1.3: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1053"</assert>
			<assert test="@codeSystemName!=''">У3-12.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-12.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-12.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-12.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='815']">
			<assert test="count(@nullFlavor)=0">У3-12.1.4: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-12.1.4: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-12.1.4.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='815']/observation">
			<assert test="count(@nullFlavor)=0">У3-12.1.4.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-12.1.4.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-12.1.4.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-12.1.4.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-12.1.4.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='815']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-12.1.4.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='815'">У3-12.1.4.1.1: Элемент code обязан содержать один атрибут @code со значением "815"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-12.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-12.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-12.1.4.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-12.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='815']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-12.1.4.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-12.1.4.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1041'">У3-12.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1041"</assert>
			<assert test="@codeSystemName!=''">У3-12.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-12.1.4.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-12.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-12.1.4.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']">
			<assert test="count(@nullFlavor)=0">У3-12.1.5: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-12.1.5: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-12.1.5.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation">
			<assert test="count(@nullFlavor)=0">У3-12.1.5.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-12.1.5.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-12.1.5.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-12.1.5.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-12.1.5.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(entryRelationship[observation/code/@code='8041'])>=0 and count(entryRelationship[observation/code/@code='8041'])&lt;=3">У3-12.1.5.1.3: Элемент observation МОЖЕТ содержать не более трёх [0..3] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-12.1.5.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8040'">У3-12.1.5.1.1: Элемент code обязан содержать один атрибут @code со значением "8040"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-12.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-12.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-12.1.5.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-12.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-12.1.5.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-12.1.5.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1474','1.2.643.5.1.13.2.1.1.169']">У3-12.1.5.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1474"</assert>
			<assert test="@codeSystemName!=''">У3-12.1.5.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-12.1.5.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-12.1.5.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-12.1.5.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(originalText)>=0 and count(originalText)&lt;=1">У3-12.1.5.1.2.1: Элемент value МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-12.1.5.1.2.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation/value[@code='19']">
			<assert test="count(originalText)=[1]">У3-12.1.5.1.2.1: Элемент value МОЖЕТ содержать не более одного [0..1] элемента originalText; value/@code=="19": элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation/value/originalText">
			<assert test="count(@nullFlavor)=0">У3-12.1.5.1.2.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-12.1.5.1.2.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation/entryRelationship[observation/code/@code='8041']">
			<assert test="count(@nullFlavor)=0">У3-12.1.5.1.3: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-12.1.5.1.3: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-12.1.5.1.3.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation/entryRelationship[observation/code/@code='8041']/observation">
			<assert test="count(@nullFlavor)=0">У3-12.1.5.1.3.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-12.1.5.1.3.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-12.1.5.1.3.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-12.1.5.1.3.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-12.1.5.1.3.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation/entryRelationship[observation/code/@code='8041']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-12.1.5.1.3.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8041'">У3-12.1.5.1.3.1.1: Элемент code обязан содержать один атрибут @code со значением "8041"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-12.1.5.1.3.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-12.1.5.1.3.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-12.1.5.1.3.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-12.1.5.1.3.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DISABILITY']/section/entry[observation/code/@code='814']/observation/entryRelationship[observation/code/@code='8040']/observation/entryRelationship[observation/code/@code='8041']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-12.1.5.1.3.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-12.1.5.1.3.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.686'">У3-12.1.5.1.3.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.686"</assert>
			<assert test="@codeSystemName!=''">У3-12.1.5.1.3.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-12.1.5.1.3.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-12.1.5.1.3.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-12.1.5.1.3.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']">
			<assert test="count(@nullFlavor)=0">У2-7: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-7.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section">
			<assert test="count(@nullFlavor)=0">У2-7.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-7.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='4058'])>=0">У3-13: Элемент section МОЖЕТ содержать произвольное количество [0..*] элементов entry</assert>
			<assert test="count(entry[observation/code/@code='12006'])>=0 and count(entry[observation/code/@code='12006'])&lt;=1">У3-14: Элемент section МОЖЕТ содержать не более одного [0..1] элемента entry</assert>
			<assert test="count(entry[observation/code/@code='812'])>=0">У3-15: Элемент section МОЖЕТ содержать произвольное количество [0..*] элементов entry</assert>
			<assert test="count(entry[observation/code/@code='9052'])>=0">У3-16: Элемент section МОЖЕТ содержать произвольное количество [0..*] элементов entry</assert>
			<assert test="count(entry[observation/code/@code='9053'])>=0">У3-17: Элемент section МОЖЕТ содержать произвольное количество [0..*] элементов entry</assert>
			<assert test="count(entry[observation/code/@code='12524'])>=0 and count(entry[observation/code/@code='12524'])&lt;=1">У3-18: Элемент section МОЖЕТ содержать не более одного [0..1] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/code">
			<assert test="count(@nullFlavor)=0">У2-7.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='SOCANAM'">У2-7.1.1: Элемент code обязан содержать один атрибут @code со значением "SOCANAM"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-7.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-7.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-7.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-7.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']">
			<assert test="count(@nullFlavor)=0">У3-13: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-13.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation">
			<assert test="count(@nullFlavor)=0">У3-13.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-13.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-13.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-13.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(effectiveTime)=1">У3-13.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-13.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(entryRelationship[observation/code/@code='4083'])=1">У3-13.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-13.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='4058'">У3-13.1.1: Элемент code обязан содержать один атрибут @code со значением "4058"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-13.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-13.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-13.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-13.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/effectiveTime[not(@nullFlavor)]">
			<assert test="@value!=''">У3-13.1.2: Элемент effectiveTime должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/effectiveTime[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-13.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='PQ'">У3-13.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "PQ"</assert>
			<assert test="@unit='%'">У3-13.1.3: Элемент value обязан содержать один атрибут @unit со значением "%"</assert>
			<assert test="@value!=''">У3-13.1.3: Элемент value обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="count(translation)=1">У3-13.1.3.1: Элемент value ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/value/translation">
			<assert test="count(@nullFlavor)=0">У3-13.1.3.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='53'">У3-13.1.3.1: Элемент translation обязан содержать один атрибут @code со значением "53"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-13.1.3.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-13.1.3.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-13.1.3.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@value!=''">У3-13.1.3.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-13.1.3.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/entryRelationship[observation/code/@code='4083']">
			<assert test="count(@nullFlavor)=0">У3-13.1.4: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-13.1.4: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-13.1.4.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/entryRelationship[observation/code/@code='4083']/observation">
			<assert test="count(@nullFlavor)=0">У3-13.1.4.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-13.1.4.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-13.1.4.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-13.1.4.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-13.1.4.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/entryRelationship[observation/code/@code='4083']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-13.1.4.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='4083'">У3-13.1.4.1.1: Элемент code обязан содержать один атрибут @code со значением "4083"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-13.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-13.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-13.1.4.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-13.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='4058']/observation/entryRelationship[observation/code/@code='4083']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-13.1.4.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-13.1.4.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.325'">У3-13.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.325"</assert>
			<assert test="@codeSystemName!=''">У3-13.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-13.1.4.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-13.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-13.1.4.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12006']">
			<assert test="count(@nullFlavor)=0">У3-14: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-14.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12006']/observation">
			<assert test="count(@nullFlavor)=0">У3-14.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-14.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-14.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-14.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(effectiveTime)=1">У3-14.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-14.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12006']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-14.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12006'">У3-14.1.1: Элемент code обязан содержать один атрибут @code со значением "12006"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-14.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-14.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-14.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-14.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12006']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-14.1.2: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)=1">У3-14.1.2.1: Элемент effectiveTime ОБЯЗАН содержать один [1..1] элемент low</assert>
			<assert test="count(high)=1">У3-14.1.2.2: Элемент effectiveTime ДОЛЖЕН содержать один [1..1] элемент high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12006']/observation/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-14.1.2.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-14.1.2.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12006']/observation/effectiveTime/high[not(@nullFlavor)]">
			<assert test="@value!=''">У3-14.1.2.2: Элемент high должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12006']/observation/effectiveTime/high[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12006']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-14.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-14.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1044','1.2.643.5.1.13.2.1.1.121']">У3-14.1.3: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1044"</assert>
			<assert test="@codeSystemName!=''">У3-14.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-14.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-14.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-14.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='812']">
			<assert test="count(@nullFlavor)=0">У3-15: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-15.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='812']/observation">
			<assert test="count(@nullFlavor)=0">У3-15.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-15.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-15.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-15.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-15.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='812']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-15.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='812'">У3-15.1.1: Элемент code обязан содержать один атрибут @code со значением "812"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-15.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-15.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-15.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-15.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='812']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-15.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-15.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1059','1.2.643.5.1.13.2.1.1.713']">У3-15.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1059"</assert>
			<assert test="@codeSystemName!=''">У3-15.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-15.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-15.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-15.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='9052']">
			<assert test="count(@nullFlavor)=0">У3-16: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-16.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='9052']/observation">
			<assert test="count(@nullFlavor)=0">У3-16.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-16.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-16.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-16.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-16.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='9052']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-16.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='9052'">У3-16.1.1: Элемент code обязан содержать один атрибут @code со значением "9052"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-16.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-16.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-16.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-16.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='9052']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-16.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-16.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1060','1.2.643.5.1.13.2.1.1.714']">У3-16.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1060"</assert>
			<assert test="@codeSystemName!=''">У3-16.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-16.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-16.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-16.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='9053']">
			<assert test="count(@nullFlavor)=0">У3-17: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-17.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='9053']/observation">
			<assert test="count(@nullFlavor)=0">У3-17.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-17.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-17.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-17.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-17.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='9053']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-17.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='9053'">У3-17.1.1: Элемент code обязан содержать один атрибут @code со значением "9053"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-17.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-17.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-17.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-17.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='9053']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-17.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-17.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1058','1.2.643.5.1.13.2.1.1.701']">У3-17.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1058"</assert>
			<assert test="@codeSystemName!=''">У3-17.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-17.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-17.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-17.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12524']">
			<assert test="count(@nullFlavor)=0">У3-18: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-18.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12524']/observation">
			<assert test="count(@nullFlavor)=0">У3-18.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-18.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-18.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-18.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-18.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(value)=1">У3-18.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12524']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-18.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12524'">У3-18.1.1: Элемент code обязан содержать один атрибут @code со значением "12524"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-18.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-18.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-18.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-18.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12524']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-18.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-18.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SOCANAM']/section/entry[observation/code/@code='12524']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-18.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-18.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1038'">У3-18.1.3: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1038"</assert>
			<assert test="@codeSystemName!=''">У3-18.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-18.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-18.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-18.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']">
			<assert test="count(@nullFlavor)=0">У2-8: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-8.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section">
			<assert test="count(@nullFlavor)=0">У2-8.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-8.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='7006'])=1">У3-19: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
			<assert test="count(entry[observation/code/@code='12310'])=1">У3-20: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/code">
			<assert test="count(@nullFlavor)=0">У2-8.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='OBSTETRICANAMN'">У2-8.1.1: Элемент code обязан содержать один атрибут @code со значением "OBSTETRICANAMN"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-8.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-8.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-8.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-8.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='7006']">
			<assert test="count(@nullFlavor)=0">У3-19: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-19.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='7006']/observation">
			<assert test="count(@nullFlavor)=0">У3-19.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-19.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-19.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-19.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-19.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='7006']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-19.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7006'">У3-19.1.1: Элемент code обязан содержать один атрибут @code со значением "7006"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-19.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-19.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-19.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-19.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='7006']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='ST'">У3-19.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-19.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='7006']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='ST'">У3-19.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='12310']">
			<assert test="count(@nullFlavor)=0">У3-20: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-20.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='12310']/observation">
			<assert test="count(@nullFlavor)=0">У3-20.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-20.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-20.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-20.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-20.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='12310']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-20.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12310'">У3-20.1.1: Элемент code обязан содержать один атрибут @code со значением "12310"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-20.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-20.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-20.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-20.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='12310']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='INT'">У3-20.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "INT"</assert>
			<assert test="@value!=''">У3-20.1.2: Элемент value должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='OBSTETRICANAMN']/section/entry[observation/code/@code='12310']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='INT'">У3-20.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "INT"</assert>
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']">
			<assert test="count(@nullFlavor)=0">У2-9: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-9.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section">
			<assert test="count(@nullFlavor)=0">У2-9.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-9.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='7006'])>=0 and count(entry[observation/code/@code='7006'])&lt;=1">У3-21: Элемент section МОЖЕТ содержать не более одного [0..1] элемента entry</assert>
			<assert test="count(entry[observation/code/@code='11036'])>=0">У3-22: Элемент section МОЖЕТ содержать произвольное количество [0..*] элементов entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/code">
			<assert test="count(@nullFlavor)=0">У2-9.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='ALL'">У2-9.1.1: Элемент code обязан содержать один атрибут @code со значением "ALL"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-9.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-9.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-9.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-9.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='7006']">
			<assert test="count(@nullFlavor)=0">У3-21: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-21.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='7006']/observation">
			<assert test="count(@nullFlavor)=0">У3-21.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-21.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-21.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-21.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-21.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='7006']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-21.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7006'">У3-21.1.1: Элемент code обязан содержать один атрибут @code со значением "7006"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-21.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-21.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-21.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-21.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='7006']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-21.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-21.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-21.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']">
			<assert test="count(@nullFlavor)=0">У3-22: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-22.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation">
			<assert test="count(@nullFlavor)=0">У3-22.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-22.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-22.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-22.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-22.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-22.1.3: Элемент observation ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-22.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(participant[@typeCode='IND'])=1">У3-22.1.5: Элемент observation ОБЯЗАН содержать один [1..1] элемент participant</assert>
			<assert test="count(entryRelationship[observation/code/@code='12328'])>=1">У3-22.1.6: Элемент observation ОБЯЗАН содержать не менее одного [1..*] элемента entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-22.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='11036'">У3-22.1.1: Элемент code обязан содержать один атрибут @code со значением "11036"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-22.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-22.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-22.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-22.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-22.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-22.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/effectiveTime[not(@nullFlavor)]">
			<assert test="@value!=''">У3-22.1.3: Элемент effectiveTime должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/effectiveTime[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-22.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-22.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1064','1.2.643.5.1.13.2.1.1.709']">У3-22.1.4: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1064"</assert>
			<assert test="@codeSystemName!=''">У3-22.1.4: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-22.1.4: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-22.1.4: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-22.1.4: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']">
			<assert test="count(@nullFlavor)=0">У3-22.1.5: Элемент participant не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='IND'">У3-22.1.5: Элемент participant обязан содержать один атрибут @typeCode со значением "IND"</assert>
			<assert test="count(participantRole)=1">У3-22.1.5.1: Элемент participant ОБЯЗАН содержать один [1..1] элемент participantRole</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']/participantRole">
			<assert test="count(@nullFlavor)=0">У3-22.1.5.1: Элемент participantRole не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode!=''">У3-22.1.5.1: Элемент participantRole обязан содержать один атрибут @classCode с не пустым значением</assert>
			<assert test="count(playingEntity)=1">У3-22.1.5.1.1: Элемент participantRole ОБЯЗАН содержать один [1..1] элемент playingEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']/participantRole/playingEntity">
			<assert test="count(@nullFlavor)=0">У3-22.1.5.1.1: Элемент playingEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode!=''">У3-22.1.5.1.1: Элемент playingEntity обязан содержать один атрибут @classCode с не пустым значением</assert>
			<assert test="count(code)=1">У3-22.1.5.1.1.1: Элемент playingEntity ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(desc)>=0 and count(desc)&lt;=1">У3-22.1.5.1.1.2: Элемент playingEntity МОЖЕТ содержать не более одного [0..1] элемента desc</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-22.1.5.1.1.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']/participantRole/playingEntity[code[@nullFlavor='OTH']]">
			<assert test="count(desc)=[1]">У3-22.1.5.1.1.2: Элемент playingEntity МОЖЕТ содержать не более одного [0..1] элемента desc; code/@nullFlavor=="OTH": элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-22.1.5.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']/participantRole[@classCode='MANU']/playingEntity">
			<assert test="@classCode='MMAT'">У3-22.1.5.1.1: Элемент playingEntity обязан содержать один атрибут @classCode с не пустым значением; participantRole/@classCode=="MANU": playingEntity/@classCode="MMAT"</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-22.1.5.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']/participantRole[@classCode='SPEC']/playingEntity">
			<assert test="@classCode='MAT'">У3-22.1.5.1.1: Элемент playingEntity обязан содержать один атрибут @classCode с не пустым значением; participantRole/@classCode=="SPEC": playingEntity/@classCode="MAT"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']/participantRole/playingEntity/code[not(@nullFlavor)]">
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1367','1.2.643.5.1.13.2.1.1.644']">У3-22.1.5.1.1.1: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1367"</assert>
			<assert test="@codeSystemName!=''">У3-22.1.5.1.1.1: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-22.1.5.1.1.1: Элемент code должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-22.1.5.1.1.1: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-22.1.5.1.1.1: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']/participantRole/playingEntity/code[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/participant[@typeCode='IND']/participantRole/playingEntity/desc">
			<assert test="count(@nullFlavor)=0">У3-22.1.5.1.1.2: Элемент desc не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-22.1.5.1.1.2: Элемент desc должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/entryRelationship[observation/code/@code='12328']">
			<assert test="count(@nullFlavor)=0">У3-22.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='MFST'">У3-22.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "MFST"</assert>
			<assert test="count(observation)=1">У3-22.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/entryRelationship[observation/code/@code='12328']/observation">
			<assert test="count(@nullFlavor)=0">У3-22.1.6.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-22.1.6.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-22.1.6.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-22.1.6.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-22.1.6.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(value)=1">У3-22.1.6.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-22.1.6.1.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/entryRelationship[observation/code/@code='12328']/observation[value/@code='15']">
			<assert test="count(text)=[1]">У3-22.1.6.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text; value/@code=="15": элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/entryRelationship[observation/code/@code='12328']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-22.1.6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12328'">У3-22.1.6.1.1: Элемент code обязан содержать один атрибут @code со значением "12328"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-22.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-22.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-22.1.6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-22.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/entryRelationship[observation/code/@code='12328']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-22.1.6.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-22.1.6.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ALL']/section/entry[observation/code/@code='11036']/observation/entryRelationship[observation/code/@code='12328']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-22.1.6.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-22.1.6.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1063','1.2.643.5.1.13.2.1.1.705']">У3-22.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1063"</assert>
			<assert test="@codeSystemName!=''">У3-22.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-22.1.6.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-22.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-22.1.6.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='EPIDEM']">
			<assert test="count(@nullFlavor)=0">У2-10: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-10.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='EPIDEM']/section">
			<assert test="count(@nullFlavor)=0">У2-10.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-10.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='7006'])=1">У3-23: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='EPIDEM']/section/code">
			<assert test="count(@nullFlavor)=0">У2-10.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='EPIDEM'">У2-10.1.1: Элемент code обязан содержать один атрибут @code со значением "EPIDEM"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-10.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-10.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-10.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-10.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='EPIDEM']/section/entry[observation/code/@code='7006']">
			<assert test="count(@nullFlavor)=0">У3-23: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-23.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='EPIDEM']/section/entry[observation/code/@code='7006']/observation">
			<assert test="count(@nullFlavor)=0">У3-23.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-23.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-23.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-23.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-23.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='EPIDEM']/section/entry[observation/code/@code='7006']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-23.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7006'">У3-23.1.1: Элемент code обязан содержать один атрибут @code со значением "7006"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-23.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-23.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-23.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-23.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='EPIDEM']/section/entry[observation/code/@code='7006']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-23.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-23.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-23.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']">
			<assert test="count(@nullFlavor)=0">У2-11: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-11.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section">
			<assert test="count(@nullFlavor)=0">У2-11.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-11.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002'])>=1">У3-24: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/code">
			<assert test="count(@nullFlavor)=0">У2-11.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='RESCONS'">У2-11.1.1: Элемент code обязан содержать один атрибут @code со значением "RESCONS"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-11.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-11.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-11.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-11.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']">
			<assert test="count(@nullFlavor)=0">У3-24: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-24.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation">
			<assert test="count(@nullFlavor)=0">У3-24.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-24.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-24.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-24.1.1: Элемент observation ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-24.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-24.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-24.1.4: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
			<assert test="count(performer)=1">У3-24.1.5: Элемент observation ОБЯЗАН содержать один [1..1] элемент performer</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-24.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/code">
			<assert test="@nullFlavor='NI'">У3-24.1.1: Элемент code обязан содержать один атрибут @nullFlavor со значением "NI"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-24.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-24.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-24.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-24.1.3: Элемент effectiveTime обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='ST'">У3-24.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-24.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='ST'">У3-24.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-24.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-24.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-24.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-24.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-24.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-24.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-24.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-24.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[1])=1">У3-24.1.5.2.1: Элемент assignedEntity ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор медицинского работника в МИС)</assert>
			<assert test="count(code)=1">У3-24.1.5.2.2: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(telecom)>=0 and count(telecom)&lt;=1">У3-24.1.5.2.3: Элемент assignedEntity МОЖЕТ содержать не более одного [0..1] элемента telecom</assert>
			<assert test="count(assignedPerson)=1">У3-24.1.5.2.4: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент assignedPerson</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/id[1][not(@nullFlavor)]">
			<assert test="@root!=''">У3-24.1.5.2.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-24.1.5.2.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-24.1.5.2.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/id[1][@nullFlavor]">
			<assert test="count(@root)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @root</assert>
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/code">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.2.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1002','1.2.643.5.1.13.2.1.1.733']">У3-24.1.5.2.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1002"</assert>
			<assert test="@codeSystemName!=''">У3-24.1.5.2.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-24.1.5.2.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-24.1.5.2.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-24.1.5.2.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/telecom">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.2.3: Элемент telecom не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(@use!='')=[0,1]">У3-24.1.5.2.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="if (@use) then @use!='' else(not(@use))">У3-24.1.5.2.3: Элемент telecom должен содержать один атрибут @use с не пустым значением</assert>
			<assert test="@value!=''">У3-24.1.5.2.3: Элемент telecom обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/assignedPerson">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.2.4: Элемент assignedPerson не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(name)=1">У3-24.1.5.2.4.1: Элемент assignedPerson ОБЯЗАН содержать один [1..1] элемент name</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/assignedPerson/name">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.2.4.1: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(family)=1">У3-24.1.5.2.4.1.1: Элемент name ОБЯЗАН содержать один [1..1] элемент family</assert>
			<assert test="count(given)=1">У3-24.1.5.2.4.1.2: Элемент name ОБЯЗАН содержать один [1..1] элемент given</assert>
			<assert test="count(identity:Patronymic)>=0 and count(identity:Patronymic)&lt;=1">У3-24.1.5.2.4.1.3: Элемент name МОЖЕТ содержать не более одного [0..1] элемента identity:Patronymic</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/assignedPerson/name/family">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.2.4.1.1: Элемент family не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-24.1.5.2.4.1.1: Элемент family должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/assignedPerson/name/given">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.2.4.1.2: Элемент given не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-24.1.5.2.4.1.2: Элемент given должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/performer/assignedEntity/assignedPerson/name/identity:Patronymic">
			<assert test="count(@nullFlavor)=0">У3-24.1.5.2.4.1.3: Элемент identity:Patronymic не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-24.1.5.2.4.1.3: Элемент identity:Patronymic должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-24.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-24.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-24.1.6: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-24.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-24.1.6.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-24.1.6.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-24.1.6.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-24.1.6.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-24.1.6.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-24.1.6.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-24.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-24.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-24.1.6.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESCONS']/section/entry[observation/performer/assignedEntity/code/@codeSystem='1.2.643.5.1.13.13.11.1002']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-24.1.6.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-24.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-24.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-24.1.6.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-24.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-24.1.6.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']">
			<assert test="count(@nullFlavor)=0">У2-12: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-12.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section">
			<assert test="count(@nullFlavor)=0">У2-12.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-12.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780'])>=1">У3-25: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/code">
			<assert test="count(@nullFlavor)=0">У2-12.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='CONSILIUMDECISION'">У2-12.1.1: Элемент code обязан содержать один атрибут @code со значением "CONSILIUMDECISION"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-12.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-12.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-12.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-12.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']">
			<assert test="count(@nullFlavor)=0">У3-25: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-25.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation">
			<assert test="count(@nullFlavor)=0">У3-25.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-25.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-25.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-25.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-25.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-25.1.3: Элемент observation ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-25.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(performer)>=0">У3-25.1.5: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[observation/code/@code='6026'])=1">У3-25.1.6: Элемент observation ОБЯЗАН содержать один [1..1] элемент entryRelationship</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-25.1.7: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-25.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.780'">У3-25.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.780"</assert>
			<assert test="@codeSystemName!=''">У3-25.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-25.1.1: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-25.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-25.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-25.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-25.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/effectiveTime[not(@nullFlavor)]">
			<assert test="@value!=''">У3-25.1.3: Элемент effectiveTime должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/effectiveTime[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-25.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-25.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-25.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-25.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-25.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-25.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-25.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-25.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-25.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-25.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-25.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-25.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-25.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-25.1.5.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-25.1.5.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-25.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-25.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-25.1.5.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[observation/code/@code='6026']">
			<assert test="count(@nullFlavor)=0">У3-25.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-25.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-25.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[observation/code/@code='6026']/observation">
			<assert test="count(@nullFlavor)=0">У3-25.1.6.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-25.1.6.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-25.1.6.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-25.1.6.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-25.1.6.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(value)=1">У3-25.1.6.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-25.1.6.1.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[observation/code/@code='6026']/observation[value/@code='10']">
			<assert test="count(text)=[1]">У3-25.1.6.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text; value/@code=="15": элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[observation/code/@code='6026']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-25.1.6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='6026'">У3-25.1.6.1.1: Элемент code обязан содержать один атрибут @code со значением "6026"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-25.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-25.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-25.1.6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-25.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[observation/code/@code='6026']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-25.1.6.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-25.1.6.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[observation/code/@code='6026']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-25.1.6.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-25.1.6.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1506'">У3-25.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1506"</assert>
			<assert test="@codeSystemName!=''">У3-25.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-25.1.6.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-25.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-25.1.6.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-25.1.7: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-25.1.7: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-25.1.7: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-25.1.7.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-25.1.7.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-25.1.7.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-25.1.7.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-25.1.7.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-25.1.7.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-25.1.7.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-25.1.7.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-25.1.7.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-25.1.7.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='CONSILIUMDECISION']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.780']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-25.1.7.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-25.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-25.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-25.1.7.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-25.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-25.1.7.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']">
			<assert test="count(@nullFlavor)=0">У2-13: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-13.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section">
			<assert test="count(@nullFlavor)=0">У2-13.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-13.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/entryRelationship/observation/code/@code='12475'])>=1">У3-26: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/code">
			<assert test="count(@nullFlavor)=0">У2-13.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='COMMISSION'">У2-13.1.1: Элемент code обязан содержать один атрибут @code со значением "COMMISSION"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-13.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-13.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-13.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-13.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']">
			<assert test="count(@nullFlavor)=0">У3-26: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-26.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation">
			<assert test="count(@nullFlavor)=0">У3-26.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-26.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-26.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-26.1.1: Элемент observation ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-26.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-26.1.3: Элемент observation ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-26.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(performer)>=0">У3-26.1.5: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[observation/code/@code='12475'])=1">У3-26.1.6: Элемент observation ОБЯЗАН содержать один [1..1] элемент entryRelationship</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-26.1.7: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/code[not(@nullFlavor)]">
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.941'">У3-26.1.1: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.941"</assert>
			<assert test="@codeSystemName!=''">У3-26.1.1: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-26.1.1: Элемент code должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-26.1.1: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-26.1.1: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(originalText)>=0 and count(originalText)&lt;=1">У3-26.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-26.1.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/code[@nullFlavor='OTH']">
			<assert test="count(originalText)=[1]">У3-26.1.1.1: Элемент value МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/code[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
			<!-- Альтернатива У3-26.1.1 -->
			<assert test="@nullFlavor = ['OTH', 'NA']">У3-26.1.1: Допустимые значения для атрибута  nullFlavor: 'OTH', 'NA'</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/code/originalText">
			<assert test="count(@nullFlavor)=0">У3-26.1.1.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-26.1.1.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-26.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-26.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/effectiveTime[not(@nullFlavor)]">
			<assert test="@value!=''">У3-26.1.3: Элемент effectiveTime должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/effectiveTime[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-26.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-26.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-26.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-26.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-26.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-26.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-26.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-26.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-26.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-26.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-26.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-26.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-26.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-26.1.5.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-26.1.5.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-26.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-26.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-26.1.5.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[observation/code/@code='12475']">
			<assert test="count(@nullFlavor)=0">У3-26.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-26.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-26.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[observation/code/@code='12475']/observation">
			<assert test="count(@nullFlavor)=0">У3-26.1.6.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-26.1.6.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-26.1.6.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-26.1.6.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-26.1.6.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(value)=1">У3-26.1.6.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-26.1.6.1.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/code[@nullFlavor='OTH']">
			<assert test="count(originalText)=[1]">У3-26.1.6.1.2: Элемент value МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[observation/code/@code='12475']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-26.1.6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12475'">У3-26.1.6.1.1: Элемент code обязан содержать один атрибут @code со значением "12475"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-26.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-26.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-26.1.6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-26.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-26.1.6.1.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[observation/code/@code='12475']/observation[value/@code='10']">
			<assert test="count(text)=[1]">У3-26.1.6.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text; value/@code=="15": элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[observation/code/@code='12475']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-26.1.6.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-26.1.6.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[observation/code/@code='12475']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-26.1.6.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-26.1.6.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1506'">У3-26.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1506"</assert>
			<assert test="@codeSystemName!=''">У3-26.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-26.1.6.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-26.1.6.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-26.1.6.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-26.1.7: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-26.1.7: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-26.1.7: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-26.1.7.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-26.1.7.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-26.1.7.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-26.1.7.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-26.1.7.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-26.1.7.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-26.1.7.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-26.1.7.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-26.1.7.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-26.1.7.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='COMMISSION']/section/entry[observation/entryRelationship/observation/code/@code='12475']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-26.1.7.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-26.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-26.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-26.1.7.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-26.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-26.1.7.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']">
			<assert test="count(@nullFlavor)=0">У2-14: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-14.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section">
			<assert test="count(@nullFlavor)=0">У2-14.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-14.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry)>=1">У3-27: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/code">
			<assert test="count(@nullFlavor)=0">У2-14.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='RESLAB'">У2-14.1.1: Элемент code обязан содержать один атрибут @code со значением "RESLAB"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-14.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-14.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-14.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-14.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry">
			<assert test="count(@nullFlavor)=0">У3-27: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-27.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation">
			<assert test="count(@nullFlavor)=0">У3-27.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-27.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-27.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-27.1.1: Элемент observation ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-27.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-27.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)>=0 and count(value)&lt;=1">У3-27.1.4: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента value</assert>
			<assert test="count(performer)>=0">У3-27.1.5: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[observation/code/@code='7028'])>=0">У3-27.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-27.1.7: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/code[not(@nullFlavor)]">
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1437','1.2.643.5.1.13.13.11.10043']">У3-27.1.1: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1437"</assert>
			<assert test="@codeSystemName!=''">У3-27.1.1: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-27.1.1: Элемент code должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-27.1.1: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-27.1.1: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(originalText)>=0 and count(originalText)&lt;=1">У3-27.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-27.1.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/code[@nullFlavor='OTH']">
			<assert test="count(originalText)=[1]">У3-27.1.1.1: Элемент value МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/code[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/code/originalText">
			<assert test="count(@nullFlavor)=0">У3-27.1.1.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-27.1.1.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/text">
			<assert test="count(@nullFlavor)=0">У3-27.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-27.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-27.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)>=0 and count(low)&lt;=1">У3-27.1.3.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low</assert>
			<assert test="count(high)>=0 and count(high)&lt;=1">У3-27.1.3.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-27.1.3 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/effectiveTime[low][high]">
			<assert test="not(@value)">У3-27.1.3: Элемент effectiveTime может содержать не более одного атрибута @value с не пустым значением; если элементы low и high представлены, то атрибут не должен быть представлен</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-27.1.3.1, У3-27.1.3.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/effectiveTime[@value]">
			<assert test="count(low)=0">У3-27.1.3.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low; если атрибут effectiveTime/@value представлен, то элемент не должен быть представлен</assert>
			<assert test="count(high)=0">У3-27.1.3.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high; если атрибут effectiveTime/@value представлен, то элемент не должен быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-27.1.3.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-27.1.3.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/effectiveTime/high">
			<assert test="count(@nullFlavor)=0">У3-27.1.3.2: Элемент high не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-27.1.3.2: Элемент high обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/value">
			<assert test="count(@nullFlavor)=0">У3-27.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-27.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-27.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-27.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-27.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-27.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-27.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-27.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-27.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-27.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-27.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-27.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-27.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-27.1.5.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-27.1.5.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-27.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-27.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-27.1.5.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']">
			<assert test="count(@nullFlavor)=0">У3-27.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-27.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-27.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-27.1.6.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-27.1.6.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-27.1.6.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)=1">У3-27.1.6.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент text</assert>
			<assert test="count(value)=1">У3-27.1.6.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(entryRelationship[observation/code/@code='8102'])>=0 and count(entryRelationship[observation/code/@code='8102'])&lt;=1">У3-27.1.6.1.4: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7028'">У3-27.1.6.1.1: Элемент code обязан содержать один атрибут @code со значением "7028"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-27.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-27.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-27.1.6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-27.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-27.1.6.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-27.1.6.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-27.1.6.1.3: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/entryRelationship[observation/code/@code='8102']">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.4: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-27.1.6.1.4: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-27.1.6.1.4.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/entryRelationship[observation/code/@code='8102']/observation">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.4.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-27.1.6.1.4.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-27.1.6.1.4.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-27.1.6.1.4.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-27.1.6.1.4.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(value)>=0 and count(value)&lt;=1">У3-27.1.6.1.4.1.3: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента value</assert>
			<assert test="count(referenceRange)>=0 and count(referenceRange)&lt;=1">У3-27.1.6.1.4.1.4: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента referenceRange</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/entryRelationship[observation/code/@code='8102']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.4.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8102'">У3-27.1.6.1.4.1.1: Элемент code обязан содержать один атрибут @code со значением "8102"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-27.1.6.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-27.1.6.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-27.1.6.1.4.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-27.1.6.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/entryRelationship[observation/code/@code='8102']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.4.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-27.1.6.1.4.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/entryRelationship[observation/code/@code='8102']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.4.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-27.1.6.1.4.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-27.1.6.1.4.1.3: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/entryRelationship[observation/code/@code='8102']/observation/referenceRange">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.4.1.4: Элемент referenceRange не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observationRange)=1">У3-27.1.6.1.4.1.4.1: Элемент referenceRange ОБЯЗАН содержать один [1..1] элемент observationRange</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/entryRelationship[observation/code/@code='8102']/observation/referenceRange/observationRange">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.4.1.4.1: Элемент observationRange не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(text)=1">У3-27.1.6.1.4.1.4.1.1: Элемент observationRange ОБЯЗАН содержать один [1..1] элемент text</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[observation/code/@code='7028']/observation/entryRelationship[observation/code/@code='8102']/observation/referenceRange/observationRange/text">
			<assert test="count(@nullFlavor)=0">У3-27.1.6.1.4.1.4.1.1: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-27.1.6.1.4.1.4.1.1: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-27.1.7: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-27.1.7: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-27.1.7: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-27.1.7.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-27.1.7.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-27.1.7.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-27.1.7.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-27.1.7.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-27.1.7.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-27.1.7.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-27.1.7.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-27.1.7.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-27.1.7.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESLAB']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-27.1.7.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-27.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-27.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-27.1.7.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-27.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-27.1.7.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']">
			<assert test="count(@nullFlavor)=0">У2-15: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-15.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section">
			<assert test="count(@nullFlavor)=0">У2-15.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-15.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471'])>=1">У3-28: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/code">
			<assert test="count(@nullFlavor)=0">У2-15.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='RESINSTR'">У2-15.1.1: Элемент code обязан содержать один атрибут @code со значением "RESINSTR"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-15.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-15.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-15.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-15.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']">
			<assert test="count(@nullFlavor)=0">У3-28: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-28.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation">
			<assert test="count(@nullFlavor)=0">У3-28.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-28.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-28.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-28.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-28.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-28.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-28.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(performer)>=0">У3-28.1.5: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-28.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-28.1.3 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/effectiveTime[low][high]">
			<assert test="not(@value)">У3-28.1.3: Элемент effectiveTime может содержать не более одного атрибута @value с не пустым значением; если элементы low и high представлены, то атрибут не должен быть представлен</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-28.1.3.1, У3-28.1.3.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/effectiveTime[@value]">
			<assert test="count(low)=0">У3-28.1.3.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low; если атрибут effectiveTime/@value представлен, то элемент не должен быть представлен</assert>
			<assert test="count(high)=0">У3-28.1.3.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high; если атрибут effectiveTime/@value представлен, то элемент не должен быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-28.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1471'">У3-28.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1471"</assert>
			<assert test="@codeSystemName!=''">У3-28.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-28.1.1: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@displayName!=''">У3-28.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-28.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-28.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-28.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-28.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)>=0 and count(low)&lt;=1">У3-28.1.3.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low</assert>
			<assert test="count(high)>=0 and count(high)&lt;=1">У3-28.1.3.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-28.1.3.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-28.1.3.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/effectiveTime/high">
			<assert test="count(@nullFlavor)=0">У3-28.1.3.2: Элемент high не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-28.1.3.2: Элемент high обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-28.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-28.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-28.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-28.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-28.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-28.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-28.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-28.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-28.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-28.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-28.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-28.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-28.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-28.1.5.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-28.1.5.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-28.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-28.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-28.1.5.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-28.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-28.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-28.1.6: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-28.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-28.1.6.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-28.1.6.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-28.1.6.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-28.1.6.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-28.1.6.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-28.1.6.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-28.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-28.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-28.1.6.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='RESINSTR']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1471']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-28.1.6.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-28.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-28.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-28.1.6.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-28.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-28.1.6.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']">
			<assert test="count(@nullFlavor)=0">У2-16: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-16.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section">
			<assert test="count(@nullFlavor)=0">У2-16.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-16.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@nullFlavor='OTH'])>=1">У3-29: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/code">
			<assert test="count(@nullFlavor)=0">У2-16.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='GISTRESULT'">У2-16.1.1: Элемент code обязан содержать один атрибут @code со значением "GISTRESULT"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-16.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-16.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-16.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-16.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']">
			<assert test="count(@nullFlavor)=0">У3-29: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-29.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation">
			<assert test="count(@nullFlavor)=0">У3-29.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-29.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-29.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-29.1.1: Элемент observation ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-29.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-29.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-29.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(performer)>=0">У3-29.1.5: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-29.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-29.1.3 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/effectiveTime[low][high]">
			<assert test="not(@value)">У3-29.1.3: Элемент effectiveTime может содержать не более одного атрибута @value с не пустым значением; если элементы low и high представлены, то атрибут не должен быть представлен</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-29.1.3.1, У3-29.1.3.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULTE']/section/entry[observation/code/@nullFlavor='OTH']/observation/effectiveTime[@value]">
			<assert test="count(low)=0">У3-29.1.3.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low; если атрибут effectiveTime/@value представлен, то элемент не должен быть представлен</assert>
			<assert test="count(high)=0">У3-29.1.3.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high; если атрибут effectiveTime/@value представлен, то элемент не должен быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/code">
			<assert test="@nullFlavor='OTH'">У3-29.1.1: Элемент code обязан содержать один атрибут @nullFlavor со значением "OTH"</assert>
			<assert test="count(originalText)>=0 and count(originalText)&lt;=1">У3-29.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/code/originalText">
			<assert test="count(@nullFlavor)=0">У3-29.1.1.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-29.1.1.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-29.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-29.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-29.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)>=0 and count(low)&lt;=1">У3-29.1.3.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low</assert>
			<assert test="count(high)>=0 and count(high)&lt;=1">У3-29.1.3.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-29.1.3.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-29.1.3.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/effectiveTime/high">
			<assert test="count(@nullFlavor)=0">У3-29.1.3.2: Элемент high не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-29.1.3.2: Элемент high обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-29.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-29.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-29.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-29.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-29.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-29.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-29.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-29.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-29.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-29.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-29.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-29.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-29.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-29.1.5.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-29.1.5.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-29.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-29.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-29.1.5.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-29.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-29.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-29.1.6: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-29.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-29.1.6.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-29.1.6.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-29.1.6.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-29.1.6.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-29.1.6.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-29.1.6.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-29.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-29.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-29.1.6.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='GISTRESULT']/section/entry[observation/code/@nullFlavor='OTH']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-29.1.6.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-29.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-29.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-29.1.6.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-29.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-29.1.6.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']">
			<assert test="count(@nullFlavor)=0">У2-17: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-17.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section">
			<assert test="count(@nullFlavor)=0">У2-17.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-17.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry)>=1">У3-30: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/code">
			<assert test="count(@nullFlavor)=0">У2-17.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='SUR'">У2-17.1.1: Элемент code обязан содержать один атрибут @code со значением "SUR"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-17.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-17.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-17.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-17.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry">
			<assert test="count(@nullFlavor)=0">У3-30: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-30.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation">
			<assert test="count(@nullFlavor)=0">У3-30.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-30.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-30.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-30.1.1: Элемент observation ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-30.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-30.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-30.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(performer)>=0">У3-30.1.5: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[typeCode='COMP'])>=0">У3-30.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
			<assert test="count(entryRelationship[typeCode='REFR'])>=0">У3-30.1.7: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/code[not(@nullFlavor)]">
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1070','1.2.643.5.1.13.2.1.1.473']">У3-30.1.1: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1070"</assert>
			<assert test="@codeSystemName!=''">У3-30.1.1: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-30.1.1: Элемент code должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-30.1.1: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-30.1.1: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(originalText)=1">У3-30.1.1.1: Элемент code ОБЯЗАН содержать один [1..1] элемент originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/code[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/code/originalText">
			<assert test="count(@nullFlavor)=0">У3-30.1.1.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-30.1.1.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/text">
			<assert test="count(@nullFlavor)=0">У3-30.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-30.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-30.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)=1">У3-30.1.3.1: Элемент effectiveTime ОБЯЗАН содержать один [1..1] элемент low</assert>
			<assert test="count(high)=1">У3-30.1.3.2: Элемент effectiveTime ДОЛЖЕН содержать один [1..1] элемент high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-30.1.3.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-30.1.3.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/effectiveTime/high[not(@nullFlavor)]">
			<assert test="@value!=''">У3-30.1.3.2: Элемент high должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/effectiveTime/high[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/value">
			<assert test="count(@nullFlavor)=0">У3-30.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-30.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-30.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-30.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-30.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-30.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-30.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-30.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-30.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-30.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-30.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-30.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-30.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-30.1.5.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-30.1.5.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-30.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-30.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-30.1.5.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship[typeCode='COMP']">
			<assert test="count(@nullFlavor)=0">У3-30.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-30.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(substanceAdministration)=1">У3-30.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент substanceAdministration</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship/substanceAdministration">
			<assert test="count(@nullFlavor)=0">У3-30.1.6.1: Элемент substanceAdministration не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='SBADM'">У3-30.1.6.1: Элемент substanceAdministration обязан содержать один атрибут @classCode со значением "SBADM"</assert>
			<assert test="@moodCode='EVN'">У3-30.1.6.1: Элемент substanceAdministration обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(consumable)=1">У3-30.1.6.1.1: Элемент substanceAdministration ОБЯЗАН содержать один [1..1] элемент consumable</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship/substanceAdministration/consumable">
			<assert test="count(@nullFlavor)=0">У3-30.1.6.1.1: Элемент consumable не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='CSM'">У3-30.1.6.1.1: Элемент consumable обязан содержать один атрибут @typeCode со значением "CSM"</assert>
			<assert test="count(manufacturedProduct)=1">У3-30.1.6.1.1.1: Элемент consumable ОБЯЗАН содержать один [1..1] элемент manufacturedProduct</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship/substanceAdministration/consumable/manufacturedProduct">
			<assert test="count(@nullFlavor)=0">У3-30.1.6.1.1.1: Элемент manufacturedProduct не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='MANU'">У3-30.1.6.1.1.1: Элемент manufacturedProduct обязан содержать один атрибут @classCode со значением "MANU"</assert>
			<assert test="count(manufacturedLabeledDrug)=1">У3-30.1.6.1.1.1.1: Элемент manufacturedProduct ОБЯЗАН содержать один [1..1] элемент manufacturedLabeledDrug</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship/substanceAdministration/consumable/manufacturedProduct/manufacturedLabeledDrug">
			<assert test="count(@nullFlavor)=0">У3-30.1.6.1.1.1.1: Элемент manufacturedLabeledDrug не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У3-30.1.6.1.1.1.1.1: Элемент manufacturedLabeledDrug ДОЛЖЕН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship/substanceAdministration/consumable/manufacturedProduct/manufacturedLabeledDrug/code[not(@nullFlavor)]">
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1033'">У3-30.1.6.1.1.1.1.1: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1033"</assert>
			<assert test="@codeSystemName!=''">У3-30.1.6.1.1.1.1.1: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-30.1.6.1.1.1.1.1: Элемент code должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-30.1.6.1.1.1.1.1: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-30.1.6.1.1.1.1.1: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(originalText)>=0 and count(originalText)&lt;=1">У3-30.1.6.1.1.1.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship/substanceAdministration/consumable/manufacturedProduct/manufacturedLabeledDrug/code[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship/substanceAdministration/consumable/manufacturedProduct/manufacturedLabeledDrug/code/originalText">
			<assert test="count(@nullFlavor)=0">У3-30.1.6.1.1.1.1.1.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-30.1.6.1.1.1.1.1.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship[typeCode='REFR']">
			<assert test="count(@nullFlavor)=0">У3-30.1.7: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-30.1.7: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-30.1.7: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-30.1.7.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship[typeCode='REFR']/act">
			<assert test="count(@nullFlavor)=0">У3-30.1.7.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-30.1.7.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-30.1.7.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-30.1.7.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-30.1.7.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship[typeCode='REFR']/act/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-30.1.7.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-30.1.7.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-30.1.7.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-30.1.7.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SUR']/section/entry/observation/entryRelationship[typeCode='REFR']/act/code">
			<assert test="count(@nullFlavor)=0">У3-30.1.7.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-30.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-30.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-30.1.7.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-30.1.7.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-30.1.7.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']">
			<assert test="count(@nullFlavor)=0">У2-18: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-18.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section">
			<assert test="count(@nullFlavor)=0">У2-18.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-18.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386'])>=1">У3-31: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/code">
			<assert test="count(@nullFlavor)=0">У2-18.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='TRANSFUSINFO'">У2-18.1.1: Элемент code обязан содержать один атрибут @code со значением "TRANSFUSINFO"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-18.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-18.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-18.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-18.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']">
			<assert test="count(@nullFlavor)=0">У3-31: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-31.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation">
			<assert test="count(@nullFlavor)=0">У3-31.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-31.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-31.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-31.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-31.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-31.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-31.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(performer)>=0">У3-31.1.5: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-31.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-31.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1386'">У3-31.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1386"</assert>
			<assert test="@codeSystemName!=''">У3-31.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-31.1.1: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-31.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-31.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-31.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-31.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-31.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)=1">У3-31.1.3.1: Элемент effectiveTime ОБЯЗАН содержать один [1..1] элемент low</assert>
			<assert test="count(high)=1">У3-31.1.3.2: Элемент effectiveTime ОБЯЗАН содержать один [1..1] элемент high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-31.1.3.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-31.1.3.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/effectiveTime/high">
			<assert test="count(@nullFlavor)=0">У3-31.1.3.2: Элемент high не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-31.1.3.2: Элемент high обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-31.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-31.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-31.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-31.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-31.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-31.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-31.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-31.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-31.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-31.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-31.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-31.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-31.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-31.1.5.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-31.1.5.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-31.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-31.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-31.1.5.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-31.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-31.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-31.1.6: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-31.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-31.1.6.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-31.1.6.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-31.1.6.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-31.1.6.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-31.1.6.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-31.1.6.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-31.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-31.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-31.1.6.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='TRANSFUSINFO']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1386']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-31.1.6.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-31.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-31.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-31.1.6.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-31.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-31.1.6.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']">
			<assert test="count(@nullFlavor)=0">У2-19: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-19.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section">
			<assert test="count(@nullFlavor)=0">У2-19.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-19.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry)>=1">У3-32: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/code">
			<assert test="count(@nullFlavor)=0">У2-19.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='ELSEPROCEDURE'">У2-19.1.1: Элемент code обязан содержать один атрибут @code со значением "ELSEPROCEDURE"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-19.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-19.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-19.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-19.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry">
			<assert test="count(@nullFlavor)=0">У3-32: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-32.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation">
			<assert test="count(@nullFlavor)=0">У3-32.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-32.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-32.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-32.1.1: Элемент observation ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-32.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-32.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)>=0 and count(value)&lt;=1">У3-32.1.4: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента value</assert>
			<assert test="count(performer)>=0">У3-32.1.5: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-32.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/code[not(@nullFlavor)]">
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.785'">У3-32.1.1: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.785"</assert>
			<assert test="@codeSystemName!=''">У3-32.1.1: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-32.1.1: Элемент code должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-32.1.1: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-32.1.1: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(originalText)>=0 and count(originalText)&lt;=1">У3-32.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-32.1.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/code[@nullFlavor='OTH']">
			<assert test="count(originalText)=1">У3-32.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента originalText; если атрибут code/@nullFlavor представлен со значением 'OTH', то элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/code[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
			<!-- Альтернатива У3-32.1.1 -->
			<assert test="@nullFlavor= 'OTH'">У3-32.1.1: Допустимые значения для атрибута  nullFlavor: 'OTH'</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/code/originalText">
			<assert test="count(@nullFlavor)=0">У3-32.1.1.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-32.1.1.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/text">
			<assert test="count(@nullFlavor)=0">У3-32.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-32.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-32.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(low)>=0 and count(low)&lt;=1">У3-32.1.3.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low</assert>
			<assert test="count(high)>=0 and count(high)&lt;=1">У3-32.1.3.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-32.1.3 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/effectiveTime[low][high]">
			<assert test="not(@value)">У3-32.1.3: Элемент effectiveTime может содержать не более одного атрибута @value с не пустым значением; если элементы low и high представлены, то атрибут не должен быть представлен</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-32.1.3.1, У3-32.1.3.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/effectiveTime[@value]">
			<assert test="count(low)=0">У3-32.1.3.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low; если атрибут effectiveTime/@value представлен, то элемент не должен быть представлен</assert>
			<assert test="count(high)=0">У3-32.1.3.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high; если атрибут effectiveTime/@value представлен, то элемент не должен быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-32.1.3.1: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-32.1.3.1: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/effectiveTime/high">
			<assert test="count(@nullFlavor)=0">У3-32.1.3.2: Элемент high не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-32.1.3.2: Элемент high обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/value">
			<assert test="count(@nullFlavor)=0">У3-32.1.4: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-32.1.4: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-32.1.4: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-32.1.5: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)=1">У3-32.1.5.1: Элемент performer ОБЯЗАН содержать один [1..1] элемент modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-32.1.5.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-32.1.5.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-32.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-32.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-32.1.5.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-32.1.5.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-32.1.5.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-32.1.5.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-32.1.5.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-32.1.5.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-32.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-32.1.5.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-32.1.5.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-32.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-32.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-32.1.6: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-32.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-32.1.6.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-32.1.6.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-32.1.6.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-32.1.6.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-32.1.6.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-32.1.6.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-32.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-32.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-32.1.6.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='ELSEPROCEDURE']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-32.1.6.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-32.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-32.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-32.1.6.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-32.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-32.1.6.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']">
			<assert test="count(@nullFlavor)=0">У2-20: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-20.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section">
			<assert test="count(@nullFlavor)=0">У2-20.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-20.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry)>=1">У3-33: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/code">
			<assert test="count(@nullFlavor)=0">У2-20.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='IMM'">У2-20.1.1: Элемент code обязан содержать один атрибут @code со значением "IMM"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-20.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-20.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-20.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-20.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry">
			<assert test="count(@nullFlavor)=0">У3-33: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-33.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation">
			<assert test="count(@nullFlavor)=0">У3-33.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-33.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-33.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-33.1.1: Элемент observation ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-33.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-33.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-33.1.4: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/code[not(@nullFlavor)]">
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1078'">У3-33.1.1: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1078"</assert>
			<assert test="@codeSystemName!=''">У3-33.1.1: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-33.1.1: Элемент code должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-33.1.1: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-33.1.1: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(originalText)>=0 and count(originalText)&lt;=1">У3-33.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/code[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/code/originalText">
			<assert test="count(@nullFlavor)=0">У3-33.1.1.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-33.1.1.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/text">
			<assert test="count(@nullFlavor)=0">У3-33.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-33.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-33.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-33.1.3: Элемент effectiveTime обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-33.1.4: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-33.1.4: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-33.1.4: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-33.1.4.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-33.1.4.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-33.1.4.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-33.1.4.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-33.1.4.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-33.1.4.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-33.1.4.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-33.1.4.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-33.1.4.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-33.1.4.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='IMM']/section/entry/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-33.1.4.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-33.1.4.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-33.1.4.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-33.1.4.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-33.1.4.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-33.1.4.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']">
			<assert test="count(@nullFlavor)=0">У2-21: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-21.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section">
			<assert test="count(@nullFlavor)=0">У2-21.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-21.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT'])>=1">У3-34: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/code">
			<assert test="count(@nullFlavor)=0">У2-21.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='DRUG'">У2-21.1.1: Элемент code обязан содержать один атрибут @code со значением "DRUG"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-21.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-21.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-21.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-21.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']">
			<assert test="count(@nullFlavor)=0">У3-34: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(substanceAdministration)=1">У3-34.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент substanceAdministration</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration">
			<assert test="count(@nullFlavor)=0">У3-34.1: Элемент substanceAdministration не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='SBADM'">У3-34.1: Элемент substanceAdministration обязан содержать один атрибут @classCode со значением "SBADM"</assert>
			<assert test="@moodCode='EVN'">У3-34.1: Элемент substanceAdministration обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-34.1.1: Элемент substanceAdministration ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-34.1.2: Элемент substanceAdministration ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-34.1.3: Элемент substanceAdministration МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime[@xsi:type='IVL_TS'])=1">У3-34.1.4: Элемент substanceAdministration ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(effectiveTime[@xsi:type='PIVL_TS'])=1">У3-34.1.5: Элемент substanceAdministration ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(routeCode)=1">У3-34.1.6: Элемент substanceAdministration ОБЯЗАН содержать один [1..1] элемент routeCode</assert>
			<assert test="count(doseQuantity)=1">У3-34.1.7: Элемент substanceAdministration ОБЯЗАН содержать один [1..1] элемент doseQuantity</assert>
			<assert test="count(administrationUnitCode)>=0 and count(administrationUnitCode)&lt;=1">У3-34.1.8: Элемент substanceAdministration МОЖЕТ содержать не более одного [0..1] элемента administrationUnitCode</assert>
			<assert test="count(consumable)=1">У3-34.1.9: Элемент substanceAdministration ОБЯЗАН содержать один [1..1] элемент consumable</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-34.1.10: Элемент substanceAdministration МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
			<assert test="count(precondition)>=0 and count(precondition)&lt;=1">У3-34.1.11: Элемент substanceAdministration МОЖЕТ содержать не более одного [0..1] элемента precondition</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.8 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration[consumable/manufacturedProduct/manufacturedMaterial/code[@nullFlavor]]">
			<assert test="count(administrationUnitCode)=1">У3-34.1.8: Элемент substanceAdministration МОЖЕТ содержать не более одного [0..1] элемента administrationUnitCode; если атрибут consumable/manufacturedProduct/manufacturedMaterial/code/@nullFlavor представлен, элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-34.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-34.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-34.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-34.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/code">
			<assert test="@nullFlavor='NI'">У3-34.1.2: Элемент code обязан содержать один атрибут @nullFlavor со значением "NI"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/text">
			<assert test="count(@nullFlavor)=0">У3-34.1.3: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-34.1.3: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[not(@nullFlavor)][not(@xsi:type='PIVL_TS')]">
			<assert test="@xsi:type='IVL_TS'">У3-34.1.4: Элемент effectiveTime обязан содержать один атрибут @xsi:type со значением "IVL_TS"</assert>
			<assert test="count(width)>=0 and count(width)&lt;=1">У3-34.1.4.1: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента width</assert>
			<assert test="count(low)>=0 and count(low)&lt;=1">У3-34.1.4.2: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента low</assert>
			<assert test="count(high)>=0 and count(high)&lt;=1">У3-34.1.4.3: Элемент effectiveTime МОЖЕТ содержать не более одного [0..1] элемента high</assert>
			<!-- Альтернатива У3-34.1.4 -->
			<assert test="count(width|low)=1">У3-34.1.4: Элемент effectiveTime должен иметь 1 элемент width или 1 элемент low</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@nullFlavor][not(@xsi:type='PIVL_TS')]">
			<assert test="@xsi:type='IVL_TS'">У3-34.1.4: Элемент effectiveTime обязан содержать один атрибут @xsi:type со значением "IVL_TS"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime/width">
			<assert test="count(@nullFlavor)=0">У3-34.1.4.1: Элемент width не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-34.1.4.1: Элемент width обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@unit!=''">У3-34.1.4.1: Элемент width обязан содержать один атрибут @unit с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])=1">У3-34.1.4.1.1: Элемент width ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime/width/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-34.1.4.1.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-34.1.4.1.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-34.1.4.1.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-34.1.4.1.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-34.1.4.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@displayName!=''">У3-34.1.4.1.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-34.1.4.1.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime/low">
			<assert test="count(@nullFlavor)=0">У3-34.1.4.2: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-34.1.4.2: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime/high">
			<assert test="count(@nullFlavor)=0">У3-34.1.4.3: Элемент high не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-34.1.4.3: Элемент high обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.4.3 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@xsi:type='IVL_TS'][low]">
			<assert test="count(high)=1">У3-34.1.4.3: Элемент high обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[not(@nullFlavor)][not(@xsi:type='IVL_TS')]">
			<assert test="@xsi:type='PIVL_TS'">У3-34.1.5: Элемент effectiveTime обязан содержать один атрибут @xsi:type со значением "PIVL_TS"</assert>
			<assert test="@institutionSpecified!=''">У3-34.1.5: Элемент effectiveTime должен содержать один атрибут @institutionSpecified с не пустым значением</assert>
			<assert test="count(period)=1">У3-34.1.5.1: Элемент effectiveTime ОБЯЗАН содержать один [1..1] элемент period</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@nullFlavor][not(@xsi:type='IVL_TS')]">
			<assert test="@xsi:type='PIVL_TS'">У3-34.1.5: Элемент effectiveTime обязан содержать один атрибут @xsi:type со значением "PIVL_TS"</assert>
			<assert test="count(@institutionSpecified)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @institutionSpecified</assert>
			<!-- Альтернатива У3-34.1.5 -->
			<assert test="@nullFlavor='NA'">У3-34.1.5: Допустимые значения для атрибута  nullFlavor: 'NA'</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime/period">
			<assert test="count(@nullFlavor)=0">У3-34.1.5.1: Элемент period не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-34.1.5.1: Элемент period обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@unit!=''">У3-34.1.5.1: Элемент period обязан содержать один атрибут @unit с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])=1">У3-34.1.5.1.1: Элемент period ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.5.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@xsi:type='PIVL_TS']/period[@unit='min']/translation">
			<assert test="@code='22'">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением; если атрибут value/@unit представлен со значением 'min', то атрибут @code должен быть представлен со значением '22'</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.5.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@xsi:type='PIVL_TS']/period[@unit='h']/translation">
			<assert test="@code='23'">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением; если атрибут value/@unit представлен со значением 'h', то атрибут @code должен быть представлен со значением '23'</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.5.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@xsi:type='PIVL_TS']/period[@unit='d']/translation">
			<assert test="@code='24'">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением; если атрибут value/@unit представлен со значением 'd', то атрибут @code должен быть представлен со значением '24'</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.5.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@xsi:type='PIVL_TS']/period[@unit='wk']/translation">
			<assert test="@code='520'">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением; если атрибут value/@unit представлен со значением 'wk', то атрибут @code должен быть представлен со значением '520'</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.5.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@xsi:type='PIVL_TS']/period[@unit='mo']/translation">
			<assert test="@code='521'">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением; если атрибут value/@unit представлен со значением 'mo', то атрибут @code должен быть представлен со значением '521'</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.5.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime[@xsi:type='PIVL_TS']/period[@unit='a']/translation">
			<assert test="@code='522'">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением; если атрибут value/@unit представлен со значением 'a', то атрибут @code должен быть представлен со значением '522'</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/effectiveTime/period/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-34.1.5.1.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@displayName!=''">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-34.1.5.1.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/routeCode">
			<assert test="count(@nullFlavor)=0">У3-34.1.6: Элемент routeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1468'">У3-34.1.6: Элемент routeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1468"</assert>
			<assert test="@codeSystemName!=''">У3-34.1.6: Элемент routeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-34.1.6: Элемент routeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-34.1.6: Элемент routeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-34.1.6: Элемент routeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/doseQuantity">
			<assert test="count(@nullFlavor)=0">У3-34.1.7: Элемент doseQuantity не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-34.1.7: Элемент doseQuantity обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="count(@unit!='')=[0,1]">У3-34.1.7: Элемент doseQuantity должен содержать один атрибут @unit с не пустым значением</assert>
			<assert test="if (@unit) then @unit!='' else(not(@unit))">У3-34.1.7: Элемент doseQuantity должен содержать один атрибут @unit с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])>=0 and count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])&lt;=1">У3-34.1.7.1: Элемент doseQuantity МОЖЕТ содержать не более одного [0..1] элемента translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/doseQuantity/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-34.1.7.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-34.1.7.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-34.1.7.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-34.1.7.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-34.1.7.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-34.1.7.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-34.1.7.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/administrationUnitCode">
			<assert test="count(@nullFlavor)=0">У3-34.1.8: Элемент administrationUnitCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1466'">У3-34.1.8: Элемент administrationUnitCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1466"</assert>
			<assert test="@codeSystemName!=''">У3-34.1.8: Элемент administrationUnitCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-34.1.8: Элемент administrationUnitCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-34.1.8: Элемент administrationUnitCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-34.1.8: Элемент administrationUnitCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.7 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration[consumable/manufacturedProduct/manufacturedMaterial/code[@nullFlavor]]/doseQuantity">
			<assert test="count(@unit)=1">У3-34.1.7: Элемент doseQuantity может содержать один атрибут @unit с не пустым значением; если атрибут consumable/manufacturedProduct/manufacturedMaterial/code/@nullFlavor представлен, то атрибут обязан быть представлен</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.7 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration[consumable/manufacturedProduct/manufacturedMaterial/code[not(@nullFlavor)]]/doseQuantity">
			<assert test="count(@unit)=0">У3-34.1.7: Элемент doseQuantity может содержать один атрибут @unit с не пустым значением; если атрибут consumable/manufacturedProduct/manufacturedMaterial/code/@nullFlavor не представлен, то атрибут должен отсутствовать</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.7.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/doseQuantity[@unit]">
			<assert test="count(translation)=1">У3-34.1.7.1: Элемент doseQuantity МОЖЕТ содержать не более одного [0..1] элемента translation; если атрибут doseQuantity/@unit представлен, то элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.7.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/doseQuantity[not(@unit)]">
			<assert test="count(translation)=0">У3-34.1.7.1: Элемент doseQuantity МОЖЕТ содержать не более одного [0..1] элемента translation; если атрибут doseQuantity/@unit не представлен, то элемент должен отсутствовать</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/consumable">
			<assert test="count(@nullFlavor)=0">У3-34.1.9: Элемент consumable не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='CSM'">У3-34.1.9: Элемент consumable обязан содержать один атрибут @typeCode со значением "CSM"</assert>
			<assert test="count(manufacturedProduct)=1">У3-34.1.9.1: Элемент consumable ОБЯЗАН содержать один [1..1] элемент manufacturedProduct</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/consumable/manufacturedProduct">
			<assert test="count(@nullFlavor)=0">У3-34.1.9.1: Элемент manufacturedProduct не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='MANU'">У3-34.1.9.1: Элемент manufacturedProduct обязан содержать один атрибут @classCode со значением "MANU"</assert>
			<assert test="count(manufacturedMaterial)=1">У3-34.1.9.1.1: Элемент manufacturedProduct ОБЯЗАН содержать один [1..1] элемент manufacturedMaterial</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial">
			<assert test="count(@nullFlavor)=0">У3-34.1.9.1.1: Элемент manufacturedMaterial не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='MMAT'">У3-34.1.9.1.1: Элемент manufacturedMaterial обязан содержать один атрибут @classCode со значением "MMAT"</assert>
			<assert test="@determinerCode='KIND'">У3-34.1.9.1.1: Элемент manufacturedMaterial обязан содержать один атрибут @determinerCode со значением "KIND"</assert>
			<assert test="count(code)=1">У3-34.1.9.1.1.1: Элемент manufacturedMaterial ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(name)>=0 and count(name)&lt;=1">У3-34.1.9.1.1.2: Элемент manufacturedMaterial МОЖЕТ содержать не более одного [0..1] элемента name</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code[not(@nullFlavor)]">
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.611'">У3-34.1.9.1.1.1: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.611"</assert>
			<assert test="@codeSystemName!=''">У3-34.1.9.1.1.1: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-34.1.9.1.1.1: Элемент code должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-34.1.9.1.1.1: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-34.1.9.1.1.1: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1367'])>=0 and count(translation[@codeSystem='1.2.643.5.1.13.13.11.1367'])&lt;=1">У3-34.1.9.1.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента translation</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-34.1.9.1.1.1.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial[not(name) and code[@nullFlavor]]">
			<assert test="count(code/translation)=1">У3-34.1.9.1.1.1.1: Элемент code МОЖЕТ содержать не более одного [0..1] элемента translation; Если элемент name не представлен и атрибут code/@nullFlavor представлен, то элемент обязан быть представлен</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code[@nullFlavor]">
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/code/translation[@codeSystem='1.2.643.5.1.13.13.11.1367']">
			<assert test="count(@nullFlavor)=0">У3-34.1.9.1.1.1.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1367','1.2.643.5.1.13.2.1.1.644']">У3-34.1.9.1.1.1.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1367"</assert>
			<assert test="@codeSystemName!=''">У3-34.1.9.1.1.1.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-34.1.9.1.1.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-34.1.9.1.1.1.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-34.1.9.1.1.1.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/name">
			<assert test="count(@nullFlavor)=0">У3-34.1.9.1.1.2: Элемент name не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-34.1.9.1.1.2: Элемент name должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-34.1.10: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-34.1.10: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-34.1.10: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-34.1.10.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-34.1.10.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-34.1.10.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-34.1.10.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-34.1.10.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-34.1.10.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-34.1.10.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-34.1.10.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-34.1.10.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-34.1.10.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-34.1.10.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-34.1.10.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-34.1.10.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-34.1.10.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-34.1.10.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-34.1.10.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/precondition">
			<assert test="count(@nullFlavor)=0">У3-34.1.11: Элемент precondition не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='PRCN'">У3-34.1.11: Элемент precondition обязан содержать один атрибут @typeCode со значением "PRCN"</assert>
			<assert test="count(criterion)=1">У3-34.1.11.1: Элемент precondition ОБЯЗАН содержать один [1..1] элемент criterion</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/precondition/criterion">
			<assert test="count(@nullFlavor)=0">У3-34.1.11.1: Элемент criterion не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У3-34.1.11.1.1: Элемент criterion ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-34.1.11.1.2: Элемент criterion ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/precondition/criterion/code">
			<assert test="count(@nullFlavor)=0">У3-34.1.11.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='ASSERTION'">У3-34.1.11.1.1: Элемент code обязан содержать один атрибут @code со значением "ASSERTION"</assert>
			<assert test="@codeSystem='2.16.840.1.113883.5.4'">У3-34.1.11.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "2.16.840.1.113883.5.4"</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DRUG']/section/entry[substanceAdministration/consumable/manufacturedProduct/manufacturedMaterial/@classCode='MMAT']/substanceAdministration/precondition/criterion/value">
			<assert test="count(@nullFlavor)=0">У3-34.1.11.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-34.1.11.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-34.1.11.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']">
			<assert test="count(@nullFlavor)=0">У2-22: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-22.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section">
			<assert test="count(@nullFlavor)=0">У2-22.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-22.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/entryRelationship/observation/code/@code='9078'])>=1">У3-35: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/code">
			<assert test="count(@nullFlavor)=0">У2-22.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='MEDDEVICE'">У2-22.1.1: Элемент code обязан содержать один атрибут @code со значением "MEDDEVICE"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-22.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-22.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-22.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-22.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']">
			<assert test="count(@nullFlavor)=0">У3-35: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-35.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation">
			<assert test="count(@nullFlavor)=0">У3-35.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-35.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-35.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-35.1.1: Элемент observation ДОЛЖЕН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-35.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-35.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(entryRelationship[observation/code/@code='12154'])>=0 and count(entryRelationship[observation/code/@code='12154'])&lt;=1">У3-35.1.4: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='9078'])=1">У3-35.1.5: Элемент observation ОБЯЗАН содержать один [1..1] элемент entryRelationship</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-35.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/code">
			<assert test="@nullFlavor='OTH'">У3-35.1.1: Элемент code обязан содержать один атрибут @nullFlavor со значением "OTH"</assert>
			<assert test="count(originalText)=1">У3-35.1.1.1: Элемент code ОБЯЗАН содержать один [1..1] элемент originalText</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/code/originalText">
			<assert test="count(@nullFlavor)=0">У3-35.1.1.1: Элемент originalText не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-35.1.1.1: Элемент originalText должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-35.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-35.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-35.1.3: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-35.1.3: Элемент effectiveTime обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[observation/code/@code='12154']">
			<assert test="count(@nullFlavor)=0">У3-35.1.4: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-35.1.4: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-35.1.4.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[observation/code/@code='12154']/observation">
			<assert test="count(@nullFlavor)=0">У3-35.1.4.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-35.1.4.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-35.1.4.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-35.1.4.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-35.1.4.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[observation/code/@code='12154']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-35.1.4.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12154'">У3-35.1.4.1.1: Элемент code обязан содержать один атрибут @code со значением "12154"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-35.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-35.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-35.1.4.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-35.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[observation/code/@code='12154']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-35.1.4.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-35.1.4.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-35.1.4.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[observation/code/@code='9078']">
			<assert test="count(@nullFlavor)=0">У3-35.1.5: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-35.1.5: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-35.1.5.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[observation/code/@code='9078']/observation">
			<assert test="count(@nullFlavor)=0">У3-35.1.5.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-35.1.5.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-35.1.5.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-35.1.5.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-35.1.5.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[observation/code/@code='9078']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-35.1.5.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='9078'">У3-35.1.5.1.1: Элемент code обязан содержать один атрибут @code со значением "9078"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-35.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-35.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-35.1.5.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-35.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[observation/code/@code='9078']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-35.1.5.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='INT'">У3-35.1.5.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "INT"</assert>
			<assert test="@value!=''">У3-35.1.5.1.2: Элемент value обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-35.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-35.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-35.1.6: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-35.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-35.1.6.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-35.1.6.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-35.1.6.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-35.1.6.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-35.1.6.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-35.1.6.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-35.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-35.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-35.1.6.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='MEDDEVICE']/section/entry[observation/entryRelationship/observation/code/@code='9078']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-35.1.6.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-35.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-35.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-35.1.6.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-35.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-35.1.6.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']">
			<assert test="count(@nullFlavor)=0">У2-23: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-23.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section">
			<assert test="count(@nullFlavor)=0">У2-23.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-23.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262'])>=1">У3-36: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/code">
			<assert test="count(@nullFlavor)=0">У2-23.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='VITALPARAM'">У2-23.1.1: Элемент code обязан содержать один атрибут @code со значением "VITALPARAM"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-23.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-23.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-23.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-23.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']">
			<assert test="count(@nullFlavor)=0">У3-36: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-36.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation">
			<assert test="count(@nullFlavor)=0">У3-36.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-36.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-36.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-36.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-36.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-36.1.3: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-36.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-36.1.5: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(entryRelationship[observation/code/@code='6034'])>=0 and count(entryRelationship[observation/code/@code='6034'])&lt;=1">У3-36.1.6: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='8034'])>=0 and count(entryRelationship[observation/code/@code='8034'])&lt;=1">У3-36.1.7: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(referenceRange)>=0 and count(referenceRange)&lt;=1">У3-36.1.8: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента referenceRange</assert>
		</rule>
	</pattern>
	
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-36.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-36.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-36.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-36.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-36.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.262','1.2.643.5.1.13.13.11.1010']">У3-36.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.262"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-36.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-36.1.3: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-36.1.3: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-36.1.4: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-36.1.4: Элемент effectiveTime обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-36.1.5: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type!=''">У3-36.1.5: Элемент value обязан содержать один атрибут @xsi:type с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])>=0 and count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])&lt;=1">У3-36.1.5.1: Элемент value МОЖЕТ содержать не более одного [0..1] элемента translation</assert>
			<assert test="count(low)>=0 and count(low)&lt;=1">У3-36.1.5.2: Элемент value МОЖЕТ содержать не более одного [0..1] элемента low</assert>
			<assert test="count(high)>=0 and count(high)&lt;=1">У3-36.1.5.3: Элемент value МОЖЕТ содержать не более одного [0..1] элемента high</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-36.1.5.1.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[organizer/component/observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/organizer[component/observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/component[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/value[@xsi:type='PQ']">
			<assert test="count(translation)=1">У3-36.1.5.1.2: Элемент value МОЖЕТ содержать не более одного [0..1] элемента translation; если атрибут value/@xsi:type имеет значение 'PQ', то элемент обязан быть представлен]</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-36.1.5.1.2 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[organizer/component/observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/organizer[component/observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/component[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/value[@xsi:type!='PQ']">
			<assert test="count(translation)=0">У3-36.1.5.1.2: Элемент value МОЖЕТ содержать не более одного [0..1] элемента translation; если атрибут value/@xsi:type имеет значение 'PQ', то элемент обязан быть представлен]</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/value/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-36.1.5.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-36.1.5.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.5.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-36.1.5.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-36.1.5.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.5.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.5.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/value/low">
			<assert test="count(@nullFlavor)=0">У3-36.1.5.2: Элемент low не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-36.1.5.2: Элемент low обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@unit!=''">У3-36.1.5.2: Элемент low обязан содержать один атрибут @unit с не пустым значением</assert>
			<assert test="@inclusive!=''">У3-36.1.5.2: Элемент low обязан содержать один атрибут @inclusive с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])=1">У3-36.1.5.2.1: Элемент low ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/value/low/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-36.1.5.2.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-36.1.5.2.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.5.2.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-36.1.5.2.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-36.1.5.2.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.5.2.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.5.2.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/value/high">
			<assert test="count(@nullFlavor)=0">У3-36.1.5.3: Элемент high не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-36.1.5.3: Элемент high обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@unit!=''">У3-36.1.5.3: Элемент high обязан содержать один атрибут @unit с не пустым значением</assert>
			<assert test="@inclusive!=''">У3-36.1.5.3: Элемент high обязан содержать один атрибут @inclusive с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])=1">У3-36.1.5.3.1: Элемент high ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/value/high/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-36.1.5.3.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-36.1.5.3.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.5.3.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-36.1.5.3.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-36.1.5.3.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.5.3.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.5.3.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='6034']">
			<assert test="count(@nullFlavor)=0">У3-36.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-36.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-36.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='6034']/observation">
			<assert test="count(@nullFlavor)=0">У3-36.1.6.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-36.1.6.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-36.1.6.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-36.1.6.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-36.1.6.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='6034']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-36.1.6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='6034'">У3-36.1.6.1.1: Элемент code обязан содержать один атрибут @code со значением "6034"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-36.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='6034']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='CD'">У3-36.1.6.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.778'">У3-36.1.6.1.2: Элемент value должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.778"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.6.1.2: Элемент value должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-36.1.6.1.2: Элемент value должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.6.1.2: Элемент value должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.6.1.2: Элемент value должен содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='6034']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='CD'">У3-36.1.6.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='8034']">
			<assert test="count(@nullFlavor)=0">У3-36.1.7: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-36.1.7: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-36.1.7.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='8034']/observation">
			<assert test="count(@nullFlavor)=0">У3-36.1.7.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-36.1.7.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-36.1.7.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-36.1.7.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-36.1.7.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='8034']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-36.1.7.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8034'">У3-36.1.7.1.1: Элемент code обязан содержать один атрибут @code со значением "8034"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-36.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.7.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/entryRelationship[observation/code/@code='8034']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-36.1.7.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='INT'">У3-36.1.7.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "INT"</assert>
			<assert test="@value!=''">У3-36.1.7.1.2: Элемент value обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange">
			<assert test="count(@nullFlavor)=0">У3-36.1.8: Элемент referenceRange не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observationRange)=1">У3-36.1.8.1: Элемент referenceRange ОБЯЗАН содержать один [1..1] элемент observationRange</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange/observationRange">
			<assert test="count(@nullFlavor)=0">У3-36.1.8.1: Элемент observationRange не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(value)=1">У3-36.1.8.1.1: Элемент observationRange ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange/observationRange/value">
			<assert test="count(@nullFlavor)=0">У3-36.1.8.1.1: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='IVL_PQ'">У3-36.1.8.1.1: Элемент value обязан содержать один атрибут @xsi:type со значением "IVL_PQ"</assert>
			<assert test="count(low)=1">У3-36.1.8.1.1.1: Элемент value ДОЛЖЕН содержать один [1..1] элемент low</assert>
			<assert test="count(high)=1">У3-36.1.8.1.1.2: Элемент value ДОЛЖЕН содержать один [1..1] элемент high</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange/observationRange/value/low[not(@nullFlavor)]">
			<assert test="@value!=''">У3-36.1.8.1.1.1: Элемент low должен содержать один атрибут @value с не пустым значением</assert>
			<assert test="@unit!=''">У3-36.1.8.1.1.1: Элемент low должен содержать один атрибут @unit с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])=1">У3-36.1.8.1.2.1.1: Элемент low ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange/observationRange/value/low[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
			<assert test="count(@unit)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @unit</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange/observationRange/value/low/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-36.1.8.1.1.1.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-36.1.8.1.1.1.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.8.1.1.1.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-36.1.8.1.1.1.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-36.1.8.1.1.1.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.8.1.1.1.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.8.1.1.1.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange/observationRange/value/high[not(@nullFlavor)]">
			<assert test="@value!=''">У3-36.1.8.1.1.2: Элемент high должен содержать один атрибут @value с не пустым значением</assert>
			<assert test="@unit!=''">У3-36.1.8.1.1.2: Элемент high должен содержать один атрибут @unit с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])=1">У3-36.1.8.1.2.2.1: Элемент high ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange/observationRange/value/high[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
			<assert test="count(@unit)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @unit</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='VITALPARAM']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.99.2.262']/observation/referenceRange/observationRange/value/high/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-36.1.8.1.1.2.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-36.1.8.1.2.2.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-36.1.8.1.1.2.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-36.1.8.1.1.2.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-36.1.8.1.1.2.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@displayName!=''">У3-36.1.8.1.1.2.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-36.1.8.1.1.2.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']">
			<assert test="count(@nullFlavor)=0">У2-24: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-24.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section">
			<assert test="count(@nullFlavor)=0">У2-24.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-24.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514'])>=1">У3-37: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/code">
			<assert test="count(@nullFlavor)=0">У2-24.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='SCORES'">У2-24.1.1: Элемент code обязан содержать один атрибут @code со значением "SCORES"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-24.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-24.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-24.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-24.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']">
			<assert test="count(@nullFlavor)=0">У3-37: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-37.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation">
			<assert test="count(@nullFlavor)=0">У3-37.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-37.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-37.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-37.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-37.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-37.1.3: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-37.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)>=0 and count(value)&lt;=1">У3-37.1.5: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента value</assert>
			<assert test="count(performer)>=0">У3-37.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов performer</assert>
			<assert test="count(entryRelationship[observation/code/@code='8019'])>=0 and count(entryRelationship[observation/code/@code='8019'])&lt;=1">У3-37.1.7: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='8020'])>=0">У3-37.1.8: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='8037'])>=0 and count(entryRelationship[observation/code/@code='8037'])&lt;=1">У3-37.1.9: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-37.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-37.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-37.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-37.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-37.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1514'">У3-37.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1514"</assert>
			<assert test="@codeSystemName!=''">У3-37.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-37.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-37.1.3: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-37.1.3: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-37.1.4: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-37.1.4: Элемент effectiveTime обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-37.1.5: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='PQ'">У3-37.1.5: Элемент value обязан содержать один атрибут @xsi:type со значением "PQ"</assert>
			<assert test="@value!=''">У3-37.1.5: Элемент value обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@unit!=''">У3-37.1.5: Элемент value обязан содержать один атрибут @unit с не пустым значением</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])=1">У3-37.1.5.1: Элемент value ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/value/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-37.1.5.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-37.1.5.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-37.1.5.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-37.1.5.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-37.1.5.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.5.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.5.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/performer">
			<assert test="count(@nullFlavor)=0">У3-37.1.6: Элемент performer не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(modeCode)>=0 and count(modeCode)&lt;=1">У3-37.1.6.1: Элемент performer МОЖЕТ содержать не более одного [0..1] элемента modeCode</assert>
			<assert test="count(assignedEntity)=1">У3-37.1.6.2: Элемент performer ОБЯЗАН содержать один [1..1] элемент assignedEntity</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/performer/modeCode">
			<assert test="count(@nullFlavor)=0">У3-37.1.6.1: Элемент modeCode не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.368','1.2.643.5.1.13.2.1.1.734']">У3-37.1.6.1: Элемент modeCode обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.368"</assert>
			<assert test="@codeSystemName!=''">У3-37.1.6.1: Элемент modeCode обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-37.1.6.1: Элемент modeCode обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.6.1: Элемент modeCode обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.6.1: Элемент modeCode обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/performer/assignedEntity">
			<assert test="count(@nullFlavor)=0">У3-37.1.6.2: Элемент assignedEntity не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.70'])=1">У3-37.1.6.2.1: Элемент assignedEntity ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/performer/assignedEntity/id[substring(@root, string-length(@root) - 2)='.70']">
			<assert test="count(@nullFlavor)=0">У3-37.1.6.2.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-37.1.6.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.70$')">У3-37.1.6.2.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.70</assert>
			<assert test="@extension!=''">У3-37.1.6.2.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8019']">
			<assert test="count(@nullFlavor)=0">У3-37.1.7: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-37.1.7: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-37.1.7.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8019']/observation">
			<assert test="count(@nullFlavor)=0">У3-37.1.7.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-37.1.7.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-37.1.7.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-37.1.7.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-37.1.7.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(value)=1">У3-37.1.7.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8019']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-37.1.7.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8019'">У3-37.1.7.1.1: Элемент code обязан содержать один атрибут @code со значением "8019"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-37.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-37.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.7.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8019']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-37.1.7.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-37.1.7.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8019']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-37.1.7.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-37.1.7.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@code!=''">У3-37.1.7.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystem!=''">У3-37.1.7.1.3: Элемент value обязан содержать один атрибут @codeSystem с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.7.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@codeSystemName!=''">У3-37.1.7.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.7.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']">
			<assert test="count(@nullFlavor)=0">У3-37.1.8: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-37.1.8: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-37.1.8.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation">
			<assert test="count(@nullFlavor)=0">У3-37.1.8.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-37.1.8.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-37.1.8.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-37.1.8.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(effectiveTime)=1">У3-37.1.8.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-37.1.8.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(entryRelationship)>=0">У3-37.1.8.1.4: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-37.1.8.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8020'">У3-37.1.8.1.1: Элемент code обязан содержать один атрибут @code со значением "8020"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-37.1.8.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-37.1.8.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.8.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.8.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation/effectiveTime[not(@nullFlavor)]">
			<assert test="@value!=''">У3-37.1.8.1.2: Элемент effectiveTime должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation/effectiveTime[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-37.1.8.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-37.1.8.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@code!=''">У3-37.1.8.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystem!=''">У3-37.1.8.1.3: Элемент value обязан содержать один атрибут @codeSystem с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.8.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@codeSystemName!=''">У3-37.1.8.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.8.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation/entryRelationship">
			<assert test="count(@nullFlavor)=0">У3-37.1.8.1.4: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-37.1.8.1.4: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-37.1.8.1.4: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act)=1">У3-37.1.8.1.4.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation/entryRelationship/act">
			<assert test="count(@nullFlavor)=0">У3-37.1.8.1.4.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-37.1.8.1.4.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-37.1.8.1.4.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-37.1.8.1.4.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-37.1.8.1.4.1.2: Элемент act ДОЛЖЕН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation/entryRelationship/act/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-37.1.8.1.4.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-37.1.8.1.4.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-37.1.8.1.4.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-37.1.8.1.4.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8020']/observation/entryRelationship/act/code[not(@nullFlavor)]">
			<assert test="@code='VITALPARAM'">У3-37.1.8.1.4.1.2: Элемент code должен содержать один атрибут @code со значением "VITALPARAM"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-37.1.8.1.4.1.2: Элемент code должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-37.1.8.1.4.1.2: Элемент code должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.8.1.4.1.2: Элемент code должен содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.8.1.4.1.2: Элемент code должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8037']">
			<assert test="count(@nullFlavor)=0">У3-37.1.9: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-37.1.9: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-37.1.9.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8037']/observation">
			<assert test="count(@nullFlavor)=0">У3-37.1.9.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-37.1.9.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-37.1.9.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-37.1.9.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-37.1.9.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8037']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-37.1.9.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8037'">У3-37.1.9.1.1: Элемент code обязан содержать один атрибут @code со значением "8037"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-37.1.9.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-37.1.9.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.9.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.9.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SCORES']/section/entry[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1514']/observation/entryRelationship[observation/code/@code='8037']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-37.1.9.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-37.1.9.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.11.1477'">У3-37.1.9.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1477"</assert>
			<assert test="@codeSystemName!=''">У3-37.1.9.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-37.1.9.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-37.1.9.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-37.1.9.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']">
			<assert test="count(@nullFlavor)=0">У2-25: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-25.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section">
			<assert test="count(@nullFlavor)=0">У2-25.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-25.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='838'])>=1">У3-38: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/code">
			<assert test="count(@nullFlavor)=0">У2-25.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='DGN'">У2-25.1.1: Элемент code обязан содержать один атрибут @code со значением "DGN"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-25.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-25.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-25.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-25.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']">
			<assert test="count(@nullFlavor)=0">У3-38: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-38.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-38.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-38.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-38.1.3: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-38.1.4: Элемент observation ДОЛЖЕН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077'])>=1">У3-38.1.5: Элемент observation ОБЯЗАН содержать не менее одного [1..*] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-38.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
			<!-- Альтернатива У3-38.1.5.1.1 -->
			<assert test="count(entryRelationship[observation/code[@codeSystem='1.2.643.5.1.13.13.11.1077'][@code='1']])=1">У3-38.1.5.1.1: Каждый элемент entry/observation[code/@code="838"] (сведения об установленном диагнозе) должен содержать один элемент entry/observation[code/@code="838"]/entryRelationship/observation[code/@code="1"] (сведения о диагнозе основного заболевания)</assert>
			<assert test="count(entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])>=0">У3-38.1.6: Элемент observation МОЖЕТ содержать произвольное количество [0..*] элементов entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-38.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-38.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-38.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-38.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-38.1.1 -->
	<pattern>
		<rule context="ClinicalDocument">
			<let name="dgnIds"
				value="component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/id"/>
			<assert test="count(distinct-values(for $id in $dgnIds return concat($id/@root,'|',$id/@extension))) = 1 or
				count(distinct-values(for $id in $dgnIds return 
				if (not(exists(//entryRelationship[@typeCode='REFR']/act/id[@root = $id/@root and @extension = $id/@extension]))) then concat($id/@root,'|',$id/@extension) else ())) = 1">У3-38.1.1: В секции диагнозов обнаружено несколько несвязанных блоков entry. В рамках консультации может быть указан только один установленный диагноз.</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-38.1.1 -->
	<pattern>
		<rule context="ClinicalDocument">
			<let name="dgnEntries"
				value="component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation"/>
			<let name="dgnIds" value="$dgnEntries/id"/>
			<assert test="not(count($dgnEntries) = 1 and exists( //entryRelationship[@typeCode='REFR']/act/id[some $id in $dgnIds satisfies (@root = $id/@root and @extension = $id/@extension)]))">
				У3-38.1.1: В секции диагнозов должен быть указан один диагноз, не связанный с другими событиями, описанными в других секциях того же экземпляра.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='838'">У3-38.1.2: Элемент code обязан содержать один атрибут @code со значением "838"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-38.1.3: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-38.1.3: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/effectiveTime[not(@nullFlavor)]">
			<assert test="@value!=''">У3-38.1.4: Элемент effectiveTime должен содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/effectiveTime[@nullFlavor]">
			<assert test="count(@value)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-38.1.5.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(value)=1">У3-38.1.5.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(entryRelationship[observation/code/@code='7026'])>=0 and count(entryRelationship[observation/code/@code='7026'])&lt;=1">У3-38.1.5.1.4: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='12014'])>=0 and count(entryRelationship[observation/code/@code='12014'])&lt;=1">У3-38.1.5.1.5: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='823'])>=0 and count(entryRelationship[observation/code/@code='823'])&lt;=1">У3-38.1.5.1.6: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='824'])>=0 and count(entryRelationship[observation/code/@code='824'])&lt;=1">У3-38.1.5.1.7: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='12120'])>=0 and count(entryRelationship[observation/code/@code='12120'])&lt;=1">У3-38.1.5.1.8: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='8004'])>=0 and count(entryRelationship[observation/code/@code='8004'])&lt;=1">У3-38.1.5.1.9: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='8045'])>=0 and count(entryRelationship[observation/code/@code='8045'])&lt;=1">У3-38.1.5.1.10: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1077','1.2.643.5.1.13.2.1.1.1504.4']">У3-38.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1077"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.5.1.1: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.2: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-38.1.5.1.2: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-38.1.5.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1005','1.2.643.5.1.13.2.1.1.641','1.2.643.5.1.13.2.1.1.718']">У3-38.1.5.1.3: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1005"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.5.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='7026']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.4: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5.1.4: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1.4.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='7026']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.4.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1.4.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1.4.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.4.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-38.1.5.1.4.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='7026']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.4.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7026'">У3-38.1.5.1.4.1.1: Элемент code обязан содержать один атрибут @code со значением "7026"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.5.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.4.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='7026']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.4.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-38.1.5.1.4.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.795','1.2.643.5.1.13.13.11.1076']">У3-38.1.5.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.795"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.5.1.4.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.4.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.4.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12014']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.5: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5.1.5: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1.5.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12014']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.5.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1.5.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1.5.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.5.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-38.1.5.1.5.1.2: Элемент observation ДОЛЖЕН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12014']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.5.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12014'">У3-38.1.5.1.5.1.1: Элемент code обязан содержать один атрибут @code со значением "12014"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.5.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.5.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12014']/observation/value[not(@nullFlavor)]">
			<assert test="@xsi:type='CD'">У3-38.1.5.1.5.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1049','1.2.643.5.1.13.2.1.1.586']">У3-38.1.5.1.5.1.2: Элемент value должен содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1049"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.5.1.2: Элемент value должен содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.5.1.5.1.2: Элемент value должен содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.5.1.2: Элемент value должен содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.5.1.2: Элемент value должен содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12014']/observation/value[@nullFlavor]">
			<assert test="@xsi:type='CD'">У3-38.1.5.1.5.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="count(@code)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @code</assert>
			<assert test="count(@displayName)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @displayName</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='823']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='823']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.6.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1.6.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1.6.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.6.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-38.1.5.1.6.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='823']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='823'">У3-38.1.5.1.6.1.1: Элемент code обязан содержать один атрибут @code со значением "823"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.5.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='823']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.6.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-38.1.5.1.6.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1005','1.2.643.5.1.13.2.1.1.641','1.2.643.5.1.13.2.1.1.718']">У3-38.1.5.1.6.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1005"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.6.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.5.1.6.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.6.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.6.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='824']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.7: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5.1.7: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1.7.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='824']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.7.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1.7.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1.7.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.7.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-38.1.5.1.7.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='824']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.7.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='824'">У3-38.1.5.1.7.1.1: Элемент code обязан содержать один атрибут @code со значением "824"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.5.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.7.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='824']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.7.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-38.1.5.1.7.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1036','1.2.643.5.1.13.2.1.1.105']">У3-38.1.5.1.7.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1036"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.7.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.5.1.7.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.7.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.7.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5.1.8: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1.8.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1.8.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1.8.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.8.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(effectiveTime)>=0 and count(effectiveTime)&lt;=1">У3-38.1.5.1.8.1.2: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента effectiveTime</assert>
			<assert test="count(value)=1">У3-38.1.5.1.8.1.3: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
			<assert test="count(entryRelationship[observation/code/@code='12393'])>=0 and count(entryRelationship[observation/code/@code='12393'])&lt;=1">У3-38.1.5.1.8.1.4: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12120'">У3-38.1.5.1.8.1.1: Элемент code обязан содержать один атрибут @code со значением "12120"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.5.1.8.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.8.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.8.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.8.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8.1.2: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-38.1.5.1.8.1.2: Элемент effectiveTime обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8.1.3: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-38.1.5.1.8.1.3: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.770'">У3-38.1.5.1.8.1.3: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.770"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.8.1.3: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.5.1.8.1.3: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.8.1.3: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.8.1.3: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']/observation/entryRelationship[observation/code/@code='12393']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8.1.4: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5.1.8.1.4: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1.8.1.4.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']/observation/entryRelationship[observation/code/@code='12393']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8.1.4.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1.8.1.4.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1.8.1.4.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.8.1.4.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-38.1.5.1.8.1.4.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']/observation/entryRelationship[observation/code/@code='12393']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8.1.4.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12393'">У3-38.1.5.1.8.1.4.1.1: Элемент code обязан содержать один атрибут @code со значением "12393"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.5.1.8.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.8.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.8.1.4.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.8.1.4.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='12120']/observation/entryRelationship[observation/code/@code='12393']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.8.1.4.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='INT'">У3-38.1.5.1.8.1.4.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "INT"</assert>
			<assert test="@value!=''">У3-38.1.5.1.8.1.4.1.2: Элемент value обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8004']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.9: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5.1.9: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1.9.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8004']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.9.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1.9.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1.9.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.9.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-38.1.5.1.9.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8004']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.9.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8004'">У3-38.1.5.1.9.1.1: Элемент code обязан содержать один атрибут @code со значением "8004"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.5.1.9.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.9.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.9.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.9.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8004']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.9.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='PQ'">У3-38.1.5.1.9.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "PQ"</assert>
			<assert test="@value!=''">У3-38.1.5.1.9.1.2: Элемент value обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@unit!=''">У3-38.1.5.1.9.1.2: Элемент value обязан содержать один атрибут @unit с не пустым значением; допустимые значения: "d", "wk"</assert>
			<assert test="count(translation[@codeSystem='1.2.643.5.1.13.13.11.1358'])=1">У3-38.1.5.1.9.1.2.1: Элемент value ОБЯЗАН содержать один [1..1] элемент translation</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-38.1.5.1.9.1.2.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8004']/observation/value[@unit='wk']/translation">
			<assert test="@code='520'">У3-38.1.5.1.9.1.2.1: Элемент translation обязан содержать один атрибут @code с не пустым значением; если атрибут value/@unit представлен со значением 'wk', то атрибут @code должен быть представлен со значением '520'</assert>
		</rule>
	</pattern>
	<!-- Альтернатива У3-38.1.6.1.9.1.2.1 -->
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8004']/observation/value[@unit='d']/translation">
			<assert test="@code='24'">У3-38.1.5.1.9.1.2.1: Элемент translation обязан содержать один атрибут @code с не пустым значением; если атрибут value/@unit представлен со значением 'd', то атрибут @code должен быть представлен со значением '24'</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8004']/observation/value/translation[@codeSystem='1.2.643.5.1.13.13.11.1358']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.9.1.2.1: Элемент translation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1358','1.2.643.5.1.13.13.11.1031']">У3-38.1.5.1.9.1.2.1: Элемент translation обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1358"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.9.1.2.1: Элемент translation обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@value!=''">У3-38.1.5.1.9.1.2.1: Элемент translation обязан содержать один атрибут @value с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.5.1.9.1.2.1: Элемент translation обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.9.1.2.1: Элемент translation обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.9.1.2.1: Элемент translation обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8045']">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.10: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-38.1.5.1.10: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-38.1.5.1.10.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8045']/observation">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.10.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-38.1.5.1.10.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.5.1.10.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-38.1.5.1.10.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-38.1.5.1.10.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8045']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.10.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='8045'">У3-38.1.5.1.10.1.1: Элемент code обязан содержать один атрибут @code со значением "8045"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-38.1.5.1.10.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.5.1.10.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.5.1.10.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.5.1.10.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[observation/code/@codeSystem='1.2.643.5.1.13.13.11.1077']/observation/entryRelationship[observation/code/@code='8045']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-38.1.5.1.10.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-38.1.5.1.10.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-38.1.5.1.10.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-38.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-38.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="@inversionInd='false'">У3-38.1.6: Элемент entryRelationship обязан содержать один атрибут @inversionInd со значением "false"</assert>
			<assert test="count(act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197'])=1">У3-38.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']">
			<assert test="count(@nullFlavor)=0">У3-38.1.6.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-38.1.6.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-38.1.6.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-38.1.6.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-38.1.6.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-38.1.6.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-38.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-38.1.6.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-38.1.6.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='DGN']/section/entry[observation/code/@code='838']/observation/entryRelationship[act/code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/act[code/@codeSystem='1.2.643.5.1.13.13.99.2.197']/code">
			<assert test="count(@nullFlavor)=0">У3-38.1.6.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У3-38.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У3-38.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-38.1.6.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-38.1.6.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-38.1.6.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='REGIME']">
			<assert test="count(@nullFlavor)=0">У2-26: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-26.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='REGIME']/section">
			<assert test="count(@nullFlavor)=0">У2-26.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-26.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='7006'])=1">У3-39: Элемент section ОБЯЗАН содержать один [1..1] элемент entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='REGIME']/section/code">
			<assert test="count(@nullFlavor)=0">У2-26.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='REGIME'">У2-26.1.1: Элемент code обязан содержать один атрибут @code со значением "REGIME"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-26.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-26.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-26.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-26.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='REGIME']/section/entry[observation/code/@code='7006']">
			<assert test="count(@nullFlavor)=0">У3-39: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-39.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='REGIME']/section/entry[observation/code/@code='7006']/observation">
			<assert test="count(@nullFlavor)=0">У3-39.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-39.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-39.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-39.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-39.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='REGIME']/section/entry[observation/code/@code='7006']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-39.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='7006'">У3-39.1.1: Элемент code обязан содержать один атрибут @code со значением "7006"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-39.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-39.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-39.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-39.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='REGIME']/section/entry[observation/code/@code='7006']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-39.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-39.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-39.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']">
			<assert test="count(@nullFlavor)=0">У2-27: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-27.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section">
			<assert test="count(@nullFlavor)=0">У2-27.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-27.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[observation/code/@code='12168'])>=1">У3-40: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section/code">
			<assert test="count(@nullFlavor)=0">У2-27.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='SERVICES'">У2-27.1.1: Элемент code обязан содержать один атрибут @code со значением "SERVICES"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-27.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-27.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-27.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-27.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section/entry[observation/code/@code='12168']">
			<assert test="count(@nullFlavor)=0">У3-40: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(observation)=1">У3-40.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section/entry[observation/code/@code='12168']/observation">
			<assert test="count(@nullFlavor)=0">У3-40.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-40.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-40.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-40.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-40.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-40.1.3: Элемент observation МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-40.1.4: Элемент observation ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(value)=1">У3-40.1.5: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section/entry[observation/code/@code='12168']/observation/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-40.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-40.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-40.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-40.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section/entry[observation/code/@code='12168']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-40.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='12168'">У3-40.1.2: Элемент code обязан содержать один атрибут @code со значением "12168"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-40.1.2: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-40.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-40.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-40.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section/entry[observation/code/@code='12168']/observation/text">
			<assert test="count(@nullFlavor)=0">У3-40.1.3: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-40.1.3: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section/entry[observation/code/@code='12168']/observation/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-40.1.4: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-40.1.4: Элемент effectiveTime обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='SERVICES']/section/entry[observation/code/@code='12168']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-40.1.5: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-40.1.5: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.11.1070','1.2.643.5.1.13.2.1.1.473']">У3-40.1.5: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.11.1070"</assert>
			<assert test="@codeSystemName!=''">У3-40.1.5: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-40.1.5: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-40.1.5: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-40.1.5: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']">
			<assert test="count(@nullFlavor)=0">У2-28: Элемент component не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(section)=1">У2-28.1: Элемент component ОБЯЗАН содержать один [1..1] элемент section</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section">
			<assert test="count(@nullFlavor)=0">У2-28.1: Элемент section не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(code)=1">У2-28.1.1: Элемент section ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']])>=1">У3-41: Элемент section ОБЯЗАН содержать не менее одного [1..*] элемента entry</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/code">
			<assert test="count(@nullFlavor)=0">У2-28.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='LINKDOCS'">У2-28.1.1: Элемент code обязан содержать один атрибут @code со значением "LINKDOCS"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.197','1.2.643.5.1.13.2.1.1.1504.23','1.2.643.5.1.13.13.11.1379']">У2-28.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.197"</assert>
			<assert test="@codeSystemName!=''">У2-28.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У2-28.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У2-28.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]">
			<assert test="count(@nullFlavor)=0">У3-41: Элемент entry не должен иметь атрибут @nullFlavor</assert>
			<assert test="count(act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']])=1">У3-41.1: Элемент entry ОБЯЗАН содержать один [1..1] элемент act</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]">
			<assert test="count(@nullFlavor)=0">У3-41.1: Элемент act не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='ACT'">У3-41.1: Элемент act обязан содержать один атрибут @classCode со значением "ACT"</assert>
			<assert test="@moodCode='EVN'">У3-41.1: Элемент act обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[substring(@root, string-length(@root) - 2)='.52'])=1">У3-41.1.1: Элемент act ОБЯЗАН содержать один [1..1] элемент id (Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52)</assert>
			<assert test="count(code)=1">У3-41.1.2: Элемент act ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(text)>=0 and count(text)&lt;=1">У3-41.1.3: Элемент act МОЖЕТ содержать не более одного [0..1] элемента text</assert>
			<assert test="count(effectiveTime)=1">У3-41.1.4: Элемент act ОБЯЗАН содержать один [1..1] элемент effectiveTime</assert>
			<assert test="count(entryRelationship[observation/code/@code='11002'])>=0 and count(entryRelationship[observation/code/@code='11002'])&lt;=1">У3-41.1.5: Элемент act МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='11003'])>=0 and count(entryRelationship[observation/code/@code='11003'])&lt;=1">У3-41.1.6: Элемент act МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(entryRelationship[observation/code/@code='6058'])>=0 and count(entryRelationship[observation/code/@code='6058'])&lt;=1">У3-41.1.7: Элемент act МОЖЕТ содержать не более одного [0..1] элемента entryRelationship</assert>
			<assert test="count(reference)=1">У3-41.1.8: Элемент act ОБЯЗАН содержать один [1..1] элемент reference</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/id[substring(@root, string-length(@root) - 2)='.52']">
			<assert test="count(@nullFlavor)=0">У3-41.1.1: Элемент id не должен иметь атрибут @nullFlavor</assert>
			<assert test="@root!=''">У3-41.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.52$')">У3-41.1.1: Элемент id обязан содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.52</assert>
			<assert test="@extension!=''">У3-41.1.1: Элемент id обязан содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/code">
			<assert test="count(@nullFlavor)=0">У3-41.1.2: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code!=''">У3-41.1.2: Элемент code обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystem!=''">У3-41.1.2: Элемент code обязан содержать один атрибут @codeSystem с не пустым значением; допустимые значения: "1.2.643.5.1.13.13.99.2.1079", "1.2.643.5.1.13.13.11.1522"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.1079', '1.2.643.5.1.13.13.11.1522']">У3-41.1.2: Элемент code обязан содержать один атрибут @codeSystem с не пустым значением; допустимые значения: "1.2.643.5.1.13.13.99.2.1079", "1.2.643.5.1.13.13.11.1522"</assert>
			<assert test="@codeSystemVersion!=''">У3-41.1.2: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@codeSystemName!=''">У3-41.1.2: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-41.1.2: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/text">
			<assert test="count(@nullFlavor)=0">У3-41.1.3: Элемент text не должен иметь атрибут @nullFlavor</assert>
			<assert test=".!=''">У3-41.1.3: Элемент text должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/effectiveTime">
			<assert test="count(@nullFlavor)=0">У3-41.1.4: Элемент effectiveTime не должен иметь атрибут @nullFlavor</assert>
			<assert test="@value!=''">У3-41.1.4: Элемент effectiveTime обязан содержать один атрибут @value с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='11002']">
			<assert test="count(@nullFlavor)=0">У3-41.1.5: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-41.1.5: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-41.1.5.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='11002']/observation">
			<assert test="count(@nullFlavor)=0">У3-41.1.5.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-41.1.5.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-41.1.5.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-41.1.5.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-41.1.5.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='11002']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-41.1.5.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='11002'">У3-41.1.5.1.1: Элемент code обязан содержать один атрибут @code со значением "11002"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-41.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-41.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-41.1.5.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-41.1.5.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='11002']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-41.1.5.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-41.1.5.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-41.1.5.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='11003']">
			<assert test="count(@nullFlavor)=0">У3-41.1.6: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-41.1.6: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-41.1.6.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='11003']/observation">
			<assert test="count(@nullFlavor)=0">У3-41.1.6.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-41.1.6.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-41.1.6.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-41.1.6.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-41.1.6.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='11003']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-41.1.6.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='11003'">У3-41.1.6.1.1: Элемент code обязан содержать один атрибут @code со значением "11003"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-41.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-41.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-41.1.6.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-41.1.6.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='11003']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-41.1.6.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='ST'">У3-41.1.6.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "ST"</assert>
			<assert test=".!=''">У3-41.1.6.1.2: Элемент value должен содержать не пустое текстовое наполнение</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='6058']">
			<assert test="count(@nullFlavor)=0">У3-41.1.7: Элемент entryRelationship не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='COMP'">У3-41.1.7: Элемент entryRelationship обязан содержать один атрибут @typeCode со значением "COMP"</assert>
			<assert test="count(observation)=1">У3-41.1.7.1: Элемент entryRelationship ОБЯЗАН содержать один [1..1] элемент observation</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='6058']/observation">
			<assert test="count(@nullFlavor)=0">У3-41.1.7.1: Элемент observation не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='OBS'">У3-41.1.7.1: Элемент observation обязан содержать один атрибут @classCode со значением "OBS"</assert>
			<assert test="@moodCode='EVN'">У3-41.1.7.1: Элемент observation обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(code)=1">У3-41.1.7.1.1: Элемент observation ОБЯЗАН содержать один [1..1] элемент code</assert>
			<assert test="count(value)=1">У3-41.1.7.1.2: Элемент observation ОБЯЗАН содержать один [1..1] элемент value</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='6058']/observation/code">
			<assert test="count(@nullFlavor)=0">У3-41.1.7.1.1: Элемент code не должен иметь атрибут @nullFlavor</assert>
			<assert test="@code='6058'">У3-41.1.7.1.1: Элемент code обязан содержать один атрибут @code со значением "6058"</assert>
			<assert test="@codeSystem=['1.2.643.5.1.13.13.99.2.166','1.2.643.5.1.13.2.1.1.1504.41','1.2.643.5.1.13.13.11.1380']">У3-41.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.166"</assert>
			<assert test="@codeSystemName!=''">У3-41.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@displayName!=''">У3-41.1.7.1.1: Элемент code обязан содержать один атрибут @displayName с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-41.1.7.1.1: Элемент code обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/entryRelationship[observation/code/@code='6058']/observation/value">
			<assert test="count(@nullFlavor)=0">У3-41.1.7.1.2: Элемент value не должен иметь атрибут @nullFlavor</assert>
			<assert test="@xsi:type='CD'">У3-41.1.7.1.2: Элемент value обязан содержать один атрибут @xsi:type со значением "CD"</assert>
			<assert test="@codeSystem='1.2.643.5.1.13.13.99.2.1008'">У3-41.1.7.1.2: Элемент value обязан содержать один атрибут @codeSystem со значением "1.2.643.5.1.13.13.99.2.1008"</assert>
			<assert test="@codeSystemName!=''">У3-41.1.7.1.2: Элемент value обязан содержать один атрибут @codeSystemName с не пустым значением</assert>
			<assert test="@code!=''">У3-41.1.7.1.2: Элемент value обязан содержать один атрибут @code с не пустым значением</assert>
			<assert test="@codeSystemVersion!=''">У3-41.1.7.1.2: Элемент value обязан содержать один атрибут @codeSystemVersion с не пустым значением</assert>
			<assert test="@displayName!=''">У3-41.1.7.1.2: Элемент value обязан содержать один атрибут @displayName с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/reference">
			<assert test="count(@nullFlavor)=0">У3-41.1.8: Элемент reference не должен иметь атрибут @nullFlavor</assert>
			<assert test="@typeCode='REFR'">У3-41.1.8: Элемент reference обязан содержать один атрибут @typeCode со значением "REFR"</assert>
			<assert test="count(externalDocument)=1">У3-41.1.8.1: Элемент reference ОБЯЗАН содержать один [1..1] элемент externalDocument</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/reference/externalDocument">
			<assert test="count(@nullFlavor)=0">У3-41.1.8.1: Элемент externalDocument не должен иметь атрибут @nullFlavor</assert>
			<assert test="@classCode='DOCCLIN'">У3-41.1.8.1: Элемент externalDocument обязан содержать один атрибут @classCode со значением "DOCCLIN"</assert>
			<assert test="@moodCode='EVN'">У3-41.1.8.1: Элемент externalDocument обязан содержать один атрибут @moodCode со значением "EVN"</assert>
			<assert test="count(id[1])=1">У3-41.1.8.1.1: Элемент externalDocument ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор документа в МИС)</assert>
			<assert test="count(id[2])=1">У3-41.1.8.1.2: Элемент externalDocument ДОЛЖЕН содержать один [1..1] элемент id (Уникальный идентификатор документа в РЭМД)</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/reference/externalDocument/id[1][not(@nullFlavor)]">
			<assert test="@root!=''">У3-41.1.8.1.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.51</assert>
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+\.51$')">У3-41.1.8.1.1: Элемент id должен содержать один атрибут @root с не пустым значением; допустимый формат значения: OID_медицинской_организации.100.НомерМИС.НомерЭкзМИС.51</assert>
			<assert test="@extension!=''">У3-41.1.8.1.1: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/reference/externalDocument/id[1][@nullFlavor]">
			<assert test="count(@root)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @root</assert>
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/reference/externalDocument/id[2][not(@nullFlavor)]">
			<assert test="@root='1.2.643.5.1.13.13.17.1.1'">У3-41.1.8.1.2: Элемент id должен содержать один атрибут @root со значением "1.2.643.5.1.13.13.17.1.1"</assert>
			<assert test="@extension!=''">У3-41.1.8.1.2: Элемент id должен содержать один атрибут @extension с не пустым значением</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument/component/structuredBody/component[section/code/@code='LINKDOCS']/section/entry[act/code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/act[code/@codeSystem=['1.2.643.5.1.13.13.99.2.1079','1.2.643.5.1.13.13.11.1522']]/reference/externalDocument/id[2][@nullFlavor]">
			<assert test="count(@extension)=0">Атрибут @nullFlavor не должен быть представлен совместно с атрибутом @extension</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//id[not(@nullFlavor)]">
			<assert test="matches(@root,'^[0-2](\.([1-9][0-9]*|0))+$')">Элемент //id должен иметь синтаксически корректное значение атрибута @root, соответствующее регулярному выражению '([0-2])([.]([1-9][0-9]*|0))+'.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//id[@root='1.2.643.100.3'][not(@nullFlavor)]">
			<assert test="matches(@extension,'^([0-9]{3}[-\s]{0,1}){3}[0-9]{2}$')">Элемент //id[@root='1.2.643.100.3'] должен иметь синтаксически корректное значение атрибута @extension, соответствующее СНИЛС: должно состоять из 11 цифр, цифры могут группироваться по 3+3+3+2, между группами может ставиться пробел или тире.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//postalCode[not(@nullFlavor)]">
			<assert test="matches(.,'^[0-9]{6}$')">Элемент //postalCode должен иметь синтаксически корректное значение, соответствующее почтовому индексу: должно состоять из 6 цифр без разделителей.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//id[not(@nullFlavor)][@root='1.2.643.5.1.13.13.17.1.1']">
			<assert test="matches(@extension,'(^[0-9]{2}[.][0-9]{2}[.][0-9]{3,4}[.][0-9]{9}$|^[0-9]{1,3}[.][0-9]{2}[.][0-9]{2}[.][0-9]{2}[.][0-9]{9}$)')">Элемент //id[@root='1.2.643.5.1.13.13.17.1.1'] должен иметь синтаксически корректное значение атрибута @extension, соответствующее регулярному выражению '^[0-9]{2}[.][0-9]{2}[.][0-9]{3,4}[.][0-9]{9}$' или '^[0-9]{1,3}[.][0-9]{2}[.][0-9]{2}[.][0-9]{2}[.][0-9]{9}$'.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//effectiveTime[not(low|high|width)][not(@nullFlavor)][not(@xsi:type=['IVL_TS','PIVL_TS'])]">
			<assert test="matches(@value,'^[1-2]{1}[0-9]{3}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//birthTime[not(@nullFlavor)]|//time[not(@nullFlavor)]|//effectiveTime/low[not(@nullFlavor)]|//effectiveTime/high[not(@nullFlavor)]|//value[@xsi:type='TS'][not(@nullFlavor)]">
			<assert test="matches(@value,'^[1-2]{1}[0-9]{3}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//identity:effectiveTime/identity:low[not(@nullFlavor)]">
			<assert test="matches(@value,'^[1-2]{1}[0-9]{3}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//identity:effectiveTime/identity:high[not(@nullFlavor)]">
			<assert test="matches(@value,'^[1-2]{1}[0-9]{3}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//identity:IssueDate[not(@nullFlavor)]">
			<assert test="matches(@value,'^[1-2]{1}[0-9]{3}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//identity:IssueDate[not(@nullFlavor)]">
			<assert test="matches(@value,'^[1-2]{1}[0-9]{3}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="ClinicalDocument[id/@root][setId/@root]">
			<assert test="id/@root != setId/@root">Значения атрибута @root элементов ClinicalDocument/id и ClinicalDocument/setId должны различаться.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//identity:Props[not(@nullFlavor)][identity:Ogrn or identity:Ogrnip]">
			<assert test="(identity:Ogrn and not(identity:Ogrnip)) or (identity:Ogrnip and not(identity:Ogrn)) or (identity:Ogrn and identity:Ogrnip/@nullFlavor) or (identity:Ogrn/@nullFlavor and identity:Ogrnip)">ОГРН и ОГРНИП не могут быть указаны совместно.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//*[@xsi:type='PQ'][not(@nullFlavor)]">
			<assert test="@value!=''">Элемент, содержащий @xsi:type='PQ', должен иметь не пустое значение атрибута @value.</assert>
			<assert test="@unit!=''">Элемент, содержащий @xsi:type='PQ', должен иметь не пустое значение атрибута @unit.</assert>
			<assert test="count(translation)&lt;=1">Элемент, содержащий @xsi:type='PQ', должен иметь не более 1 элемента translation.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//*[@xsi:type='ST'][not(@nullFlavor)]">
			<assert test=".!=''">Элемент, содержащий @xsi:type='ST', должен иметь не пустое значение.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//*[@xsi:type='BL'][not(@nullFlavor)]">
			<assert test="@value=['true','false']">Элемент, содержащий @xsi:type='BL', должен иметь значение атрибута @value равное 'true' или 'false'.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//*[@xsi:type='CD'][not(@nullFlavor)]">
			<assert test="@codeSystem!=''">Элемент, содержащий @xsi:type='CD', должен иметь не пустое значение атрибута @codeSystem.</assert>
			<assert test="@codeSystemName!=''">Элемент, содержащий @xsi:type='CD', должен иметь не пустое значение атрибута @codeSystemName.</assert>
			<assert test="@code!=''">Элемент, содержащий @xsi:type='CD', должен иметь не пустое значение атрибута @code.</assert>
			<assert test="@codeSystemVersion!=''">Элемент, содержащий @xsi:type='CD', должен иметь не пустое значение атрибута @codeSystemVersion.</assert>
			<assert test="@displayName!=''">Элемент, содержащий @xsi:type='CD', должен иметь не пустое значение атрибута @displayName.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//*[@xsi:type='INT'][not(@nullFlavor)]">
			<assert test="@value!=''">Элемент, содержащий @xsi:type='INT', должен иметь не пустое значение атрибута @value.</assert>
		</rule>
	</pattern>
	<pattern>
		<rule context="//*[@xsi:type='TS'][not(@nullFlavor)]">
			<assert test="@value!=''">Элемент, содержащий @xsi:type='TS', должен иметь не пустое значение атрибута @value.</assert>
			<assert test="matches(@value,'^[1-2]{1}[0-9]{3}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(@value,'^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
		</rule>
	</pattern>
    <!-- Проверка наличия корневого элемента -->
    
    <pattern>
        <rule context="/">
            <assert test="count(ClinicalDocument)=1">Main01-1. Документ должен иметь 1 корневой элемент ClinicalDocument.</assert>
        </rule>
    </pattern>
    
    <!-- Для периода времени -->
    
    <pattern>
        <rule context="//*[@xsi:type = 'IVL_TS'][not(@nullFlavor)]">
            <assert test="count(low)&lt;= 1">Элемент, содержащий @xsi:type='IVL_TS', обязан иметь 1 элемент low.</assert>
            <assert test="count(high)&lt;= 1">Элемент, содержащий @xsi:type='IVL_TS', обязан иметь 1 элемент high.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="//*[@xsi:type = 'IVL_TS'][not(@nullFlavor)][high][low]">
            <assert test="low[not(@nullFlavor)]/@value != ''">Элемент, содержащий @xsi:type='IVL_TS', должен иметь не пустое значение атрибута low/@value.</assert>
            <assert test="matches(low[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}$') or matches(low[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(low[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(low[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(low[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
            <assert test="high[not(@nullFlavor)]/@value != ''">Элемент, содержащий @xsi:type='IVL_TS', должен иметь не пустое значение атрибута high/@value.</assert>
            <assert test="matches(high[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}$') or matches(high[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}$') or matches(high[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}$') or matches(high[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$') or matches(high[not(@nullFlavor)]/@value, '^[1-2]{1}[0-9]{3}[0-1]{1}[0-9]{1}[0-3]{1}[0-9]{1}[0-2]{1}[0-9]{1}[0-5]{1}[0-9]{1}[0-5]{1}[0-9]{1}\+[0-2]{1}[0-9]{1}[0-5]{1}[0]{1}$')">Дата должна соответствовать формату "YYYYMMDDHHmmSS +| ZZZZ", где "YYYY" – год, "ММ" – месяц, "HH" - часы, "mm" - минуты, "SS" - секунды, " +| ZZZZ" - указатель временной зоны.</assert>
        </rule>
    </pattern>
    
    <!-- Дополнительные правила для блока "Сведения об источнике оплаты" -->
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo][code/@code = ['8', '9', '10', '11', '12']]">
            <assert test="identity:DocInfo/@nullFlavor = ['NA', 'NAV']">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo должен иметь значение атрибута @nullFlavor равное 'NA' или 'NAV'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo/identity:IdentityDocType][code/@code = '1']">
            <assert test="identity:DocInfo/identity:IdentityDocType/@code = '1'">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:IdentityDocType должен иметь значение атрибута @code равное '1'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo/identity:IdentityDocType][code/@code = '3']">
            <assert test="identity:DocInfo/identity:IdentityDocType/@code = '2'">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:IdentityDocType должен иметь значение атрибута @code равное '2'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo/identity:IdentityDocType][code/@code = ['4', '5', '6']]">
            <assert test="identity:DocInfo/identity:IdentityDocType/@code = '3'">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:IdentityDocType должен иметь значение атрибута @code равное '3'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo/identity:InsurancePolicyType/@nullFlavor][identity:DocInfo/identity:IdentityDocType/@code = '1']">
            <assert test="identity:DocInfo/identity:InsurancePolicyType/@nullFlavor = 'NAV'">Main07-1. Элемент
                ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:InsurancePolicyType должен иметь значение атрибута @nullFlavor равное 'NAV'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo/identity:InsurancePolicyType][identity:DocInfo/identity:IdentityDocType/@code = ['2', '3']]">
            <assert test="identity:DocInfo/identity:InsurancePolicyType/@nullFlavor = 'NA'">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:InsurancePolicyType должен иметь значение атрибута @nullFlavor равное 'NA'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo/identity:Number][identity:DocInfo/identity:InsurancePolicyType/@nullFlavor = 'NAV']">
            <assert test="identity:DocInfo/identity:Number/@nullFlavor = 'NAV'">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:Number должен иметь значение атрибута @nullFlavor равное 'NAV'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo/identity:Number][identity:DocInfo/identity:InsurancePolicyType[not(@nullFlavor = 'NAV')]]">
            <assert test="identity:DocInfo/identity:Number != ''">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:Number должен иметь не пустое значение.</assert>
            <assert test="count(identity:DocInfo/identity:Number[@nullFlavor])=0">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:Number не должен иметь атрибут @nullFlavor.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo/identity:effectiveTime][identity:DocInfo/identity:InsurancePolicyType/@nullFlavor = 'NAV']">
            <assert test="identity:DocInfo/identity:effectiveTime/@nullFlavor = ['NAV', 'NASK']">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo/identity:effectiveTime должен иметь значение атрибута @nullFlavor равное 'NAV' или 'NASK'.</assert>
        </rule>
    </pattern>
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity/scopingOrganization/id[@nullFlavor]">
            <assert test="@nullFlavor = 'NA'">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/scopingOrganization/id должен иметь значение атрибута @nullFlavor равное 'NA'.</assert>
        </rule>
    </pattern>
    <pattern>
		<rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[code/@code = '1']/scopingOrganization/id">
			<assert test="count(@nullFlavor)=0">Main07-1. Элемент ClinicalDocument/participant/associatedEntity/scopingOrganization/id не должен иметь атрибут @nullFlavor</assert>
		</rule>
	</pattern>
    
    <!-- Соответствие наполнения таблице для блока "Сведения об источнике оплаты" --> 
    
    <pattern>
        <rule context="ClinicalDocument/participant[@typeCode = 'IND']/associatedEntity[identity:DocInfo][code/@code = ['1', '3', '4', '5', '6']]">
            <assert test="count(identity:DocInfo[@nullFlavor])=0"> Элемент ClinicalDocument/participant/associatedEntity/identity:DocInfo не должен иметь атрибут @nullFlavor при указании данного типа источника оплаты в соответствии с Таблицей "Обязательность заполнения элементов в зависимости от источника оплаты", представленной в руководстве по реализации в разделе "Сведения об источнике оплаты".</assert>
        </rule>
    </pattern>
</schema>
