<?xml version="1.0"?>
<xsl:transform version="2.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
	xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:n1="urn:hl7-org:v3"
    xmlns:fn="http://www.w3.org/2005/xpath-functions"
    xmlns:xs="http://www.w3.org/2001/XMLSchema"
    xmlns:n2="urn:hl7-org:v3/meta/voc"
    xmlns:voc="urn:hl7-org:v3/voc"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:fias="urn:hl7-ru:fias"
	xmlns:medService="urn:hl7-ru:medService"
    xmlns:identity="urn:hl7-ru:identity"
    xmlns:address="urn:hl7-ru:address"
	xmlns:PII="urn:hl7-ru:PII">
    <xsl:output method="html" indent="yes" encoding="utf-8"/>
    <xsl:template match="/">
        <xsl:apply-templates select="n1:ClinicalDocument"/>
    </xsl:template>
    <xsl:template match="n1:ClinicalDocument">
	    <html>
		<!-- Файл для трансформации XML->HTML->PDF при помощи библиотек iText Core, iText XMLWorker или аналогичных
             Данный файл должен использоваться только для трансформации документа СЭМД (290) Протокол консультации (CDA) Редакция 7, v1.4
	         Разработан по заказу Минздрава РФ компанией ООО "Цифромед" 10.04.2025
	         Замечания по данному файлу можно направить на почту egisz@stp-egisz.ru
			 Тема сообщения: замечания и вопросы по файлам визуализации -->
            <head>
                <style>
                    @page {
                        size: A4 portrait;
					    margin-top: 20pt;
					    margin-bottom: 130pt;
					    margin-left: 10pt;
					    margin-right: 20pt;
                    }
					
                    table {
                        table-layout: fixed;
                        width: 98%;
                        border-collapse: collapse;
					    
                        font-family: Arial, sans-serif;
                        word-wrap: break-word;
					    margin-top: 0;
                        margin-bottom: 10pt;
					    margin-left: 20pt;
                    }
					
                    td {
					    vertical-align: top;
					    padding: 2;
                    }
					
					.table-break {
					    margin-left: 0;
						border-collapse: collapse;
						margin-bottom: 0;
					}
					
					.param {
					    font-size: 15px;
					    border: 1pt solid gray;
						
						word-wrap: none;
					}
					
					.paramuslugi {
					    font-size: 14px;
					    border: 1pt solid gray;
						
						word-wrap: none;
					}
					
					.created {
					    vertical-align: middle;
					}
					
                    .medorg {
                        text-align: left;
                        font-size: 15px;
                        font-weight: 400;
                        color: #000000;
                        margin-top: 5pt;
                        margin-bottom: 5pt;
                        white-space: normal;
                    }
					
                    .address {
                        text-align: left;
                        font-size: 15px;
                        font-weight: 100;
                        color: #000000;
                        margin-top: 5pt;
                        margin-bottom: 5pt;
                        white-space: normal;
                    }
					
                    .emd {
                        text-align: center;
                        font-size: 18px;
                        font-weight: 400;
                        color: #000000;
                        margin-top: 25pt;
                        margin-bottom: 25pt;
                        white-space: normal;
                    }
					
                    .date {
                        text-align: center;
                        font-size: 15px;
                        font-weight: 400;
                        color: #000000;
                        margin-top: 5pt;
                        margin-bottom: 5pt;
                        white-space: normal;
                    }
					
					.tablegray {
                        text-align: left;
                        font-size: 15px;
                        font-weight: bold;
                        color: #000000;
                        margin-top: 5pt;
                        margin-bottom: 5pt;
                    }
					
					.tablegrayhead {
                        text-align: left;
                        font-size: 15px;
                        font-weight: bold;
                        color: #aaaaaa;
						margin-top: 5pt;
                        margin-bottom: 5pt;
                    }
					
					.tableblack {
                        text-align: left;
                        font-size: 15px;
                        font-weight: normal;
                        color: #000000;
                        margin-top: 0;
                        margin-bottom: 3pt;
                        white-space: normal;
                    }
					
					.tableresult {
						text-align: left;
                        font-size: 15px;
                        font-weight: 100;
                        color: #000000;
                        margin-top: 2pt;
						margin-bottom: 2pt;
                        white-space: normal;
					}
					
					.tableresultuslugi {
						text-align: left;
                        font-size: 14px;
                        font-weight: 100;
                        color: #000000;
                        margin-top: 2pt;
						margin-bottom: 2pt;
                        white-space: normal;
					}
					
					.createdate {
                        text-align: right;
                        font-size: 15px;
                        font-weight: 100;
                        color: #aaaaaa;
					    margin-right: 10pt;
                    }
					
					.pagenumber {
                        text-align: center;
					    valign: center;
                        font-size: 15px;
                        font-weight: 100;
                        color: #aaaaaa;
					    margin-right: 10pt;
                    }
					
					h2+p {
                        page-break-inside: avoid;
                    }
					
					th {
					    text-align: left;
					    font-size: 15px;
						padding: 5pt;
						background-color: #D9D9D6;
					}
					
					.first-block-form {
					    margin-top: -10pt;
					}
					
					.block-form {
					    border-collapse: collapse;
						margin-top: 0;
						margin-bottom: 0;
					    border-bottom: 1pt solid #e0e0e0;
					}
					
					.end-block-form {
					}
                </style>
            </head>
			<body>
			        <table class="first-block-form">
			            <tr>
                            <td colspan="8">
                                <p class="medorg">
                                    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization[not(@nullFlavor)]">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:name"/>
                                        </xsl:when>
                                    </xsl:choose>
									<xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Dept[not(@nullFlavor)]">
                                            <br/><xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Dept"/>
                                        </xsl:when>
                                    </xsl:choose>
                                    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:addr[not(@nullFlavor)]">
										    <br/><xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:addr/n1:postalCode[not(@nullFlavor)]">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:addr/n1:postalCode"/>
													<xsl:text>, </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:addr/address:stateCode[not(@nullFlavor)]">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:addr/address:stateCode/@displayName"/>
													<xsl:text>, </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:addr/n1:streetAddressLine"/>
                                        </xsl:when>
                                    </xsl:choose>
									<xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props[not(@nullFlavor)]">
									        <br/>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props/identity:Ogrn[not(@nullFlavor)]">
									            	<xsl:text>ОГРН: </xsl:text>
									            	<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props/identity:Ogrn"/>
									        		<xsl:text>; </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
								            <xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props/identity:Ogrnip[not(@nullFlavor)]">
								            		<xsl:text>ОГРНИП: </xsl:text>
								            		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props/identity:Ogrnip"/>
									        		<xsl:text>; </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
									        <xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props/identity:Okpo[not(@nullFlavor)]">
								            		<xsl:text>ОКПО: </xsl:text>
								            		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props/identity:Okpo"/>
									        		<xsl:text>; </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
								            <xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props/identity:Okato[not(@nullFlavor)]">
								            		<xsl:text>ОКАТО: </xsl:text>
								            		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/identity:Props/identity:Okato"/>
									        		<xsl:text>; </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
										</xsl:when>
                                    </xsl:choose>	
								    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:id[2][not(@nullFlavor)]">
								    		<br/><xsl:text>Лицензия на осуществление медицинской деятельности: </xsl:text>
								    		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:id[2]/@extension"/>
								    		<xsl:text> </xsl:text>
								    		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:id[2]/@assigningAuthorityName"/>
                                        </xsl:when>
                                    </xsl:choose>
								    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:telecom[not(@nullFlavor)]">
								    		<br/>
											<xsl:for-each select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:providerOrganization/n1:telecom">
								    		    <xsl:call-template name="formatContact">
                                                    <xsl:with-param name="contact" select="./@value"/>
                                                </xsl:call-template>
												<xsl:text> </xsl:text>
								    		</xsl:for-each>
                                        </xsl:when>
                                    </xsl:choose>
                                </p>
						    </td>
                        </tr>
						<xsl:choose>
                            <xsl:when test="/n1:ClinicalDocument/n1:informationRecipient[position()>1]/n1:intendedRecipient/n1:receivedOrganization/n1:name">
						        <tr>
                                    <td colspan="8">
									    <xsl:for-each select="/n1:ClinicalDocument/n1:informationRecipient[position()>1]">
                                            <p class="tableblack">
						        		        <xsl:text>Для предоставления в: </xsl:text>
										    	<xsl:value-of select="./n1:intendedRecipient/n1:receivedOrganization/n1:name"/>
                                            </p>
										</xsl:for-each>
                                    </td>
					            </tr>
						    </xsl:when>
                        </xsl:choose>
					</table>
					<table class="block-form">	
				        <tr>
                            <td colspan="8">
                                <h1 class="emd">
                                    <b>
                                    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:title[not(@nullFlavor)]">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:title"/>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:effectiveTime[not(@nullFlavor)]">
												    <xsl:text> от </xsl:text>
                                                    <xsl:call-template name="formatDate">
                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:effectiveTime/@value"/>
                                                    </xsl:call-template>
                                                </xsl:when>
                                            </xsl:choose>
                                        </xsl:when>
                                        <xsl:otherwise>
                                            <xsl:text>[Название вида медицинского документа]</xsl:text>
                                        </xsl:otherwise>
                                     </xsl:choose>
                                    </b>
                                </h1>
                             </td>
                        </tr>
                        <tr>
                            <td colspan="8">
						    	<p class="tableblack">
								    <b><xsl:text>ФИО пациента: </xsl:text></b>
                                    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[not(@nullFlavor)] and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[not(@nullFlavor)] and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/identity:Patronymic[not(@nullFlavor)]">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family"/>
                                    		<xsl:text> </xsl:text>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given"/>
                                            <xsl:text> </xsl:text>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/identity:Patronymic"/>
                                        </xsl:when>
                                    	<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family/@nullFlavor and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[not(@nullFlavor)] and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/identity:Patronymic[not(@nullFlavor)]">
                                    		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given"/>
                                    		<xsl:text> </xsl:text>
                                    		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/identity:Patronymic"/>
                                        </xsl:when>
                                    	<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[not(@nullFlavor)] and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given/@nullFlavor and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/identity:Patronymic[not(@nullFlavor)]">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family"/>
                                    		<xsl:text> </xsl:text>
                                    		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/identity:Patronymic"/>
                                        </xsl:when>
										<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family/@nullFlavor and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given/@nullFlavor and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/identity:Patronymic[not(@nullFlavor)]">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/identity:Patronymic"/>	
                                        </xsl:when>
                                    	<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[not(@nullFlavor)] and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[not(@nullFlavor)]">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family"/>
                                    		<xsl:text> </xsl:text>
                                    		<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given"/>
                                        </xsl:when>
                                    	<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family/@nullFlavor and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given[not(@nullFlavor)]">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given"/>	
                                        </xsl:when>
                                    	<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family[not(@nullFlavor)] and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given/@nullFlavor">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family"/>	
                                        </xsl:when>
                                    	<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:family/@nullFlavor and /n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given/@nullFlavor">
                                            <xsl:call-template name="formatNullFlavor">
                                                <xsl:with-param name="nullflavor" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:name/n1:given/@nullFlavor"/>
                                            </xsl:call-template>
                                        </xsl:when>
                                    </xsl:choose>
									<b><xsl:text>&#8195;Дата рождения: </xsl:text></b>
                                    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime[not(@nullFlavor)]">
                                            <xsl:call-template name="formatDate">
                                                <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
                                            </xsl:call-template>
											<xsl:text> </xsl:text>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:effectiveTime/n1:low[not(@nullFlavor)]">
                                                    <xsl:text> (</xsl:text>
					    					        <xsl:call-template name="getAge">
                                                        <xsl:with-param name="birthdate" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@value"/>
					    					            <xsl:with-param name="deathdate" select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:effectiveTime/n1:low/@value"/>
					    					            <xsl:with-param name="withtext" select="1"/>
                                                    </xsl:call-template>
					    					        <xsl:text>)</xsl:text>
												</xsl:when>
											</xsl:choose>	
					    				</xsl:when>
										<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@nullFlavor">
										    <xsl:call-template name="formatNullFlavor">
                                                <xsl:with-param name="nullflavor" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:birthTime/@nullFlavor"/>
                                            </xsl:call-template>
										</xsl:when>
                                    </xsl:choose>
                                </p>
						    	<p class="tableblack">
                                    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:InsurancePolicy[not(@nullFlavor)]">
										    <xsl:text>Полис ОМС: </xsl:text>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:InsurancePolicy/identity:Series"/>
											<xsl:text> </xsl:text>
						    				<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:InsurancePolicy/identity:Number"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </p>
								<p class="tableblack">
                                    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id[2]/@extension[not(@nullFlavor)]">
										    <xsl:text>СНИЛС: </xsl:text>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:id[2]/@extension"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </p>
								<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/medService:DocNumber[not(@nullFlavor)]">
					                    <p class="tableblack">
							                <xsl:text>Номер медицинской карты: </xsl:text>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:componentOf/n1:encompassingEncounter/medService:DocNumber"/>
                                        </p>
						            </xsl:when>
                                </xsl:choose>
                            </td>
                        </tr>
						<xsl:choose>
                            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='1']/n1:streetAddressLine">
						        <tr>
                                    <td colspan="8">
                                        <p class="tableblack">
						        		    <xsl:text>Адрес по месту жительства (постоянной регистрации): </xsl:text>
                                            <xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='1']/n1:postalCode[not(@nullFlavor)]">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='1']/n1:postalCode"/>
													<xsl:text>, </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='1']/address:stateCode[not(@nullFlavor)]">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='1']/address:stateCode/@displayName"/>
													<xsl:text>, </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
											<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='1']/n1:streetAddressLine"/>
                                        </p>
                                    </td>
					            </tr>
						    </xsl:when>
                        </xsl:choose>
						<xsl:choose>
                            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='2']/n1:streetAddressLine">
						        <tr>
                                    <td colspan="8">
                                        <p class="tableblack">
						        		    <xsl:text>Адрес по месту пребывания (временной регистрации): </xsl:text>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='2']/n1:postalCode[not(@nullFlavor)]">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='2']/n1:postalCode"/>
													<xsl:text>, </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='2']/address:stateCode[not(@nullFlavor)]">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='2']/address:stateCode/@displayName"/>
													<xsl:text>, </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='2']/n1:streetAddressLine"/>
                                        </p>
                                    </td>
					            </tr>
						    </xsl:when>
                        </xsl:choose>
						<xsl:choose>
                            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='3']/n1:streetAddressLine">
						        <tr>
                                    <td colspan="8">
                                        <p class="tableblack">
						        		    <xsl:text>Адрес фактического проживания (пребывания): </xsl:text>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='3']/n1:postalCode[not(@nullFlavor)]">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='3']/n1:postalCode"/>
													<xsl:text>, </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
											<xsl:choose>
                                                <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='3']/address:stateCode[not(@nullFlavor)]">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='3']/address:stateCode/@displayName"/>
													<xsl:text>, </xsl:text>
                                                </xsl:when>
                                            </xsl:choose>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:addr[address:Type/@code='3']/n1:streetAddressLine"/>
                                        </p>
                                    </td>
					            </tr>
						    </xsl:when>
                        </xsl:choose>
						<xsl:choose>
					    	<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc[not(@nullFlavor)]">
					            <tr>
                                    <td colspan="8">
                                        <p class="tableblack">
											<xsl:choose>
					    	                    <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc[not(@nullFlavor)]">
					            			        <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:IdentityCardType/@displayName"/>
											        <xsl:text>: </xsl:text>
					            			        <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:Series[not(@nullFlavor)]">
                                                            <xsl:text>серия </xsl:text>
															<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:Series"/>
											        		<xsl:text> </xsl:text>
					            			            </xsl:when>
					            			        </xsl:choose>
													<xsl:text>номер </xsl:text>
					            			        <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:Number"/>
											        <xsl:text> от </xsl:text>
					            			        <xsl:call-template name="formatDate">
                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:IssueDate/@value"/>
                                                    </xsl:call-template>
					            			        <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:IssueOrgName[not(@nullFlavor)]">	
					            			            	<xsl:text> выдан </xsl:text>
															<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:IssueOrgName"/>
					            			            </xsl:when>
					            			        </xsl:choose>
					            			        <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:IssueOrgCode[not(@nullFlavor)]">
					            			            	<xsl:text>, код подразделения </xsl:text>
															<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/identity:IdentityDoc/identity:IssueOrgCode"/>
					            			            </xsl:when>
					            			        </xsl:choose>
												</xsl:when>
					            			</xsl:choose>	
                                        </p>
                                    </td>
					            </tr>
							</xsl:when>
						</xsl:choose>	
					    <xsl:choose>
					        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:telecom[not(@nullFlavor)]">
					            <tr>	
                                    <td colspan="8">
									    <p class="tableblack">
					                        <xsl:for-each select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:telecom">
						    	            	<xsl:call-template name="formatContact">
                                                    <xsl:with-param name="contact" select="./@value"/>
                                                </xsl:call-template>
												<xsl:text> </xsl:text>
						    	            </xsl:for-each>
										</p>
                                    </td>
				                </tr>
			                </xsl:when>
			            </xsl:choose>
						<xsl:choose>
					        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='800']/n1:value[not(@nullFlavor)]">
					            <tr>	
                                    <td colspan="8">
									    <p class="tableblack">
										   <xsl:text>Вид обращения: </xsl:text> 
										   <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='800']/n1:value/@displayName"/>
										</p>
                                    </td>
				                </tr>
			                </xsl:when>
			            </xsl:choose>
						<xsl:choose>
                            <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='7003']/n1:value[not(@nullFlavor)]">
								<tr>   
								    <td colspan="8">
                                        <p class="tableblack">
										    <xsl:text>Способ выявления заболевания: </xsl:text>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='7003']/n1:value/@displayName"/>
                                        </p>
                                    </td>	
								</tr>
							</xsl:when>
                        </xsl:choose>
						<xsl:choose>
					        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='801']/n1:value[not(@nullFlavor)]">
					            <tr>	
                                    <td colspan="8">
									    <p class="tableblack">
										   <xsl:text>Место проведения: </xsl:text> 
										   <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='801']/n1:value/@displayName"/>
										</p>
                                    </td>
				                </tr>
			                </xsl:when>
			            </xsl:choose>
						<xsl:choose>
					        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='BENEFITS']/n1:entry/n1:observation[n1:code/@code='811'][not(@nullFlavor)]">
					            <tr>	
                                    <td colspan="8">
										<h2 class="tablegray">
                                            <xsl:text>Льготы</xsl:text>
                                        </h2>
										<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='BENEFITS']/n1:entry/n1:observation[n1:code/@code='811']">
						                  	<p class="tableblack">
						                  		<xsl:value-of select="./n1:value/@displayName"/>
						                  		<xsl:choose>
						                  			<xsl:when test="./n1:effectiveTime/n1:high[not(@nullFlavor)] and ./n1:effectiveTime/n1:low[not(@nullFlavor)]">
                                                        <xsl:text> (</xsl:text>
						                  				<xsl:call-template name="formatDate">
                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                        </xsl:call-template>
						                  				<xsl:text> &#8212; </xsl:text>
						                  				<xsl:call-template name="formatDate">
                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                        </xsl:call-template>
						                  	        	<xsl:text>)</xsl:text>
                                                    </xsl:when>
                                                    <xsl:when test="./n1:effectiveTime/n1:high[not(@nullFlavor)]">
                                                        <xsl:text> (действует до </xsl:text>
						                  				<xsl:call-template name="formatDate">
                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                        </xsl:call-template>
						                  	        	<xsl:text>)</xsl:text>
                                                    </xsl:when>
						                  			<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
                                                        <xsl:text> (с </xsl:text>
						                  				<xsl:call-template name="formatDate">
                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                        </xsl:call-template>
						                  	        	<xsl:text>)</xsl:text>
                                                    </xsl:when>
                                                </xsl:choose>
						                  	</p>
										</xsl:for-each>
                                    </td>
				                </tr>
			                </xsl:when>
			            </xsl:choose>
					</table>
					<xsl:choose>
                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian[not(@nullFlavor)]">
					        <table class="block-form">
							    <tr>
                                    <td colspan="8">
                                        <h2 class="tablegray">
                                            <xsl:text>Законный (уполномоченный) представитель пациента</xsl:text>
                                        </h2>
						        		<xsl:choose>
                                            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:guardianPerson/n1:name[not(@nullFlavor)]">
						        		        <p class="tableblack">
							    		            <xsl:text>ФИО: </xsl:text>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:guardianPerson/n1:name"/>
													<xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:code[not(@nullFlavor)]">
                                                            <xsl:text> (</xsl:text>
															<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:code/@displayName"/>
							        						<xsl:text>)</xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                </p>
											</xsl:when>
                                        </xsl:choose>
										<xsl:choose>
                                            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:guardianOrganization/n1:name[not(@nullFlavor)]">
						        		        <p class="tableblack">
							    		            <xsl:text>Наименование организации: </xsl:text>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:guardianOrganization/n1:name"/>
                                                </p>
											</xsl:when>
                                        </xsl:choose>
							    		<xsl:choose>
                                            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/PII:birthTime[not(@nullFlavor)]">
					                            <p class="tableblack">
							    		        	<xsl:text>Дата рождения: </xsl:text>
                                                    <xsl:call-template name="formatDate">
                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/PII:birthTime/@value"/>
                                                    </xsl:call-template>
                                                </p>
						                    </xsl:when>
                                        </xsl:choose>
						                <xsl:choose>
                                            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:id/@extension[not(@nullFlavor)]">
					                            <p class="tableblack">
							            		    <xsl:text>СНИЛС: </xsl:text>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:id/@extension"/>
                                                </p>
						                    </xsl:when>
                                        </xsl:choose>
                                    </td>
						        </tr>
							    <xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='1']/n1:streetAddressLine">
						                <tr>
                                            <td colspan="8">
                                                <p class="tableblack">
						                		    <xsl:text>Адрес по месту жительства (постоянной регистрации): </xsl:text>
                                                    <xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='1']/n1:postalCode[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='1']/n1:postalCode"/>
							        						<xsl:text>, </xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
							        				<xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='1']/address:stateCode[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='1']/address:stateCode/@displayName"/>
							        						<xsl:text>, </xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
							        				<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='1']/n1:streetAddressLine"/>
                                                </p>
                                            </td>
					                    </tr>
						            </xsl:when>
                                </xsl:choose>
						        <xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='2']/n1:streetAddressLine">
						                <tr>
                                            <td colspan="8">
                                                <p class="tableblack">
						                		    <xsl:text>Адрес по месту пребывания (временной регистрации): </xsl:text>
						        					<xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='2']/n1:postalCode[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='2']/n1:postalCode"/>
						        							<xsl:text>, </xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
						        					<xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='2']/address:stateCode[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='2']/address:stateCode/@displayName"/>
						        							<xsl:text>, </xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='2']/n1:streetAddressLine"/>
                                                </p>
                                            </td>
					                    </tr>
						            </xsl:when>
                                </xsl:choose>
						        <xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='3']/n1:streetAddressLine[not(@nullFlavor)]">
						                <tr>
                                            <td colspan="8">
						                		<p class="tableblack">
							    				    <xsl:text>Адрес фактического проживания (пребывания): </xsl:text>
							    					<xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='3']/n1:postalCode[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='3']/n1:postalCode"/>
							    					    	<xsl:text>, </xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
							    				    <xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='3']/address:stateCode[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='3']/address:stateCode/@displayName"/>
							    				    		<xsl:text>, </xsl:text>
                                                        </xsl:when>
                                                    </xsl:choose>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:addr[address:Type/@code='3']/n1:streetAddressLine"/>
                                                </p>
                                            </td>
                                        </tr>
						            </xsl:when>
                                </xsl:choose>
						        <tr>
                                    <td colspan="8">
						        		<p class="tableblack">
					            		    <xsl:choose>
					            			    <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc[not(@nullFlavor)]">
							    					<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:IdentityCardType/@displayName"/>
						        					<xsl:text>: </xsl:text>
					            				    <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:Series[not(@nullFlavor)]">
                                                            <xsl:text>серия </xsl:text>
															<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:Series"/>
						        							<xsl:text> </xsl:text>
					            				        </xsl:when>
					            				    </xsl:choose>
													<xsl:text>номер </xsl:text>
					            					<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:Number"/>
													<xsl:text> от </xsl:text>
					            					<xsl:call-template name="formatDate">
                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:IssueDate/@value"/>
                                                    </xsl:call-template>
					            				    <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:IssueOrgName[not(@nullFlavor)]">
					            				        	<xsl:text> выдан </xsl:text>
															<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:IssueOrgName"/>
					            				        </xsl:when>
					            				    </xsl:choose>
					            				    <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:IssueOrgCode[not(@nullFlavor)]">
					            				        	<xsl:text>, код подразделения </xsl:text>
															<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/identity:IssueOrgCode"/>
					            				        </xsl:when>
					            				    </xsl:choose>
                                                </xsl:when>
							    				<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:IdentityDoc/@nullFlavor">
						                            <xsl:text>Документ, удостоверяющий личность: </xsl:text>
							    					<xsl:call-template name="formatNullFlavor">
                                                        <xsl:with-param name="nullflavor" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian /identity:IdentityDoc/@nullFlavor"/>
                                                    </xsl:call-template>
						 	                    </xsl:when>
                                            </xsl:choose>
                                        </p>
                                    </td>
					            </tr>
						        <tr>
                                    <td colspan="8">
						        		<p class="tableblack">
					            		    <xsl:choose>
					            			    <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian /identity:AuthorityDoc[not(@nullFlavor)]">
					            				    <xsl:text>Документ, удостоверяющий полномочия: </xsl:text>
							    					<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:IdentityCardType/@displayName"/>
						        					<xsl:text> </xsl:text>
					            				    <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:Series[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:Series"/>
						        							<xsl:text> </xsl:text>
					            				        </xsl:when>
					            				    </xsl:choose>
					            					<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:Number"/>
						        					<xsl:text> </xsl:text>
					            				    <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:IssueOrgName[not(@nullFlavor)]">
					            				        	<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:IssueOrgName"/>
						        							<xsl:text> </xsl:text>
					            				        </xsl:when>
					            				    </xsl:choose>
					            				    <xsl:choose>
					            			            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:IssueOrgCode[not(@nullFlavor)]">
					            				        	<xsl:value-of select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:IssueOrgCode"/>
						        							<xsl:text> </xsl:text>
					            				        </xsl:when>
					            				    </xsl:choose>
					            					<xsl:text>Дата выдачи: </xsl:text>
					            					<xsl:call-template name="formatDate">
                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/identity:AuthorityDoc/identity:IssueDate/@value"/>
                                                    </xsl:call-template>
                                                </xsl:when>
					            				<xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian /identity:AuthorityDoc/@nullFlavor">
						                            <xsl:text>Документ, удостоверяющий полномочия: </xsl:text>
							    					<xsl:call-template name="formatNullFlavor">
                                                        <xsl:with-param name="nullflavor" select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian /identity:AuthorityDoc/@nullFlavor"/>
                                                    </xsl:call-template>
						 	                    </xsl:when>
                                            </xsl:choose>
                                        </p>
                                    </td>
					            </tr>
						        <xsl:choose>
				    	            <xsl:when test="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:telecom[not(@nullFlavor)]">
				    	                <tr>	
                                            <td colspan="8">
						        				<p class="tableblack">
				    	                            <xsl:for-each select="/n1:ClinicalDocument/n1:recordTarget/n1:patientRole/n1:patient/n1:guardian/n1:telecom">
				    	         	        	        <xsl:call-template name="formatContact">
                                                            <xsl:with-param name="contact" select="./@value"/>
                                                        </xsl:call-template>
														<xsl:text> </xsl:text>
				    	         	                </xsl:for-each>
						        				</p>
                                            </td>
				                        </tr>
			                        </xsl:when>
			                    </xsl:choose>
							</table>	
					    </xsl:when>
                    </xsl:choose>
					<xsl:choose>
                        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='COMPLNTS']/n1:entry/n1:observation[n1:code/@code='835']/n1:value[not(@nullFlavor)] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ANAM']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value[not(@nullFlavor)] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='LANAM']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value[not(@nullFlavor)] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DISABILITY']/n1:entry/n1:observation[n1:code/@code='814']">
					        <table class="block-form">
					            <xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='COMPLNTS']/n1:entry/n1:observation[n1:code/@code='835']/n1:value[not(@nullFlavor)]">
					                    <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
                                                    <xsl:text>Жалобы</xsl:text>
                                                </h2>
					        	        		<p class="tableblack">
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='COMPLNTS']/n1:entry/n1:observation[n1:code/@code='835']/n1:value"/>
                                                </p>
                                            </td>
                                        </tr>
					        	    </xsl:when>
					            </xsl:choose>
					        	<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ANAM']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value[not(@nullFlavor)]">
					                    <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
                                                    <xsl:text>Анамнез заболевания</xsl:text>
                                                </h2>
					        	        		<p class="tableblack">
					        	        		    <xsl:text>Описание: </xsl:text>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ANAM']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value"/>
                                                </p>
                                            </td>
                                        </tr>
					        	    </xsl:when>
                                </xsl:choose>
					        	<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='LANAM']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value[not(@nullFlavor)]">
					        	        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
                                                    <xsl:text>Анамнез жизни</xsl:text>
                                                </h2>
					        	        		<p class="tableblack">
					        	        		    <xsl:text>Описание: </xsl:text>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='LANAM']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value"/>
                                                </p>
                                            </td>
                                        </tr>
					        		</xsl:when>
                                </xsl:choose>	
					        	<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DISABILITY']/n1:entry/n1:observation[n1:code/@code='814'][not(@nullFlavor)]">
					        	        <tr>
					                        <td colspan="8">
					        	     		    <h2 class="tablegray">
					        	                  	<xsl:text>Инвалидность</xsl:text>
                                                </h2>
					        		            <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DISABILITY']/n1:entry/n1:observation[n1:code/@code='814']"> 
					                              	<p class="tableblack">
					        	                    	<xsl:text>Группа инвалидности: </xsl:text>
					        	     				    <xsl:value-of select="./n1:value/@displayName"/>
					        	                    	<xsl:choose>
                                                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='815']/n1:value/@displayName">
					        	                    		    <br/><xsl:text>Установлена: </xsl:text>
					        	                    		    <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='815']/n1:value/@displayName"/>
					        	                    		</xsl:when>
                                                        </xsl:choose>
					        	     				    <br/><xsl:text>Дата установления инвалидности: </xsl:text>
					        	     				    <xsl:call-template name="formatDate">
                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                        </xsl:call-template>
					        							<xsl:choose>
					        			         		    <xsl:when test="./n1:effectiveTime/n1:high/@value">
					        			         		        <xsl:text> &#8212; </xsl:text>
					        									<xsl:call-template name="formatDate">
                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                </xsl:call-template>
					        			         		        <xsl:text> (Установлена: </xsl:text>
					        	                    		    <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='815']/n1:value/@displayName"/>
					        									<xsl:text>)</xsl:text>
					        			         			</xsl:when>
					        								<xsl:when test="./n1:effectiveTime/n1:high/@nullFlavor='PINF'">
					        			         		        <xsl:text> (бессрочно)</xsl:text>
					        			         			</xsl:when>
					        			         		</xsl:choose>
					        				            <xsl:choose>
                                                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:value/@displayName and ./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:value/n1:originalText">
					        	                    	        <br/><xsl:text>Причина инвалидности: </xsl:text>
					        						            <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:value/@displayName"/>
					        						            <xsl:text> (</xsl:text>
					        	                   			    <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:value/n1:originalText"/>
					        	                   	       	    <xsl:text>)</xsl:text>
					        					            </xsl:when>
					        					            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:value/n1:originalText">
					        	                    	        <br/><xsl:text>Причина инвалидности: </xsl:text>
					        					            	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:value/n1:originalText"/>
					        					            </xsl:when>
					        					            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:value/@displayName">
					        	                    	        <br/><xsl:text>Причина инвалидности: </xsl:text>
					        						            <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:value/@displayName"/>
					        					            </xsl:when>
                                                        </xsl:choose>
					        				            <xsl:choose>
					        					            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:entryRelationship/n1:observation[n1:code/@code='8041']/n1:value/@displayName">
					        	                    		    <br/><xsl:text>Дополнительная запись к причине инвалидности: </xsl:text>
					        						            <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8040']/n1:entryRelationship/n1:observation[n1:code/@code='8041']/n1:value/@displayName"/>
					        					            </xsl:when>
                                                        </xsl:choose>
					        		            	</p>
					        		            </xsl:for-each>
					        	     	    </td>	
					        	        </tr>
					        	    </xsl:when>
                                </xsl:choose>
					        </table>
						</xsl:when>
                    </xsl:choose>	
					<xsl:choose>
                        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ALL'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DISABILITY'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='OBSTETRICANAMN']">
					        <table class="block-form">
								<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']">
							            <tr>
					                        <td colspan="8">
                                                <h2 class="tablegray">
                                                    <xsl:text>Социальный анамнез</xsl:text>
                                                </h2>
												<xsl:choose>
				                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='4058'][not(@nullFlavor)]">
								                		<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='4058']">
                                                            <p class="tableblack">
                                                                <xsl:text>Степень утраты профессиональной трудоспособности: </xsl:text>
										         				<xsl:value-of select="./n1:value/@value"/>
                                                                <xsl:text>% (</xsl:text>
								                			    <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='4083']/n1:value/@displayName"/>
																<xsl:text>)</xsl:text>
								                			    <xsl:choose>
					                               	     	        <xsl:when test="./n1:effectiveTime[not(@nullFlavor)]">
																        <xsl:text> до </xsl:text>
								                			            <xsl:call-template name="formatDate">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                        </xsl:call-template>
																	</xsl:when>
					                               	     	    </xsl:choose>	
								                		    </p>
								                		</xsl:for-each>
					                                </xsl:when>
					                            </xsl:choose>
								        		<xsl:choose>
                                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation/n1:code[@code='812'][not(@nullFlavor)]">
                                                        <p class="tableblack">
										        		    <xsl:text>Потенциально-опасные для здоровья социальные факторы: </xsl:text>
						                              	    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry[n1:observation/n1:code/@code='812'][1]/n1:observation[n1:code/@code='812']/n1:value/@displayName"/>
										        		    <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry[n1:observation/n1:code/@code='812'][position()>1]/n1:observation[n1:code/@code='812']"> 
										        			    <xsl:text>; </xsl:text>
										        				<xsl:value-of select="./n1:value/@displayName"/>
										        			</xsl:for-each>	
                                                        </p>		
						                            </xsl:when>
                                                </xsl:choose>
								                <xsl:choose>
                                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation/n1:code[@code='9052'][not(@nullFlavor)]">
                                                        <p class="tableblack">
						                                    <xsl:text>Вредные производственные факторы: </xsl:text>
						                               	    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry[n1:observation/n1:code/@code='9052'][1]/n1:observation[n1:code/@code='9052']/n1:value/@displayName"/>
										        			<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry[n1:observation/n1:code/@code='9052'][position()>1]/n1:observation[n1:code/@code='9052']">
                                                                <xsl:text>; </xsl:text>
										        				<xsl:value-of select="./n1:value/@displayName"/>
										        			</xsl:for-each>	
										        		</p>	
						                            </xsl:when>
                                                </xsl:choose>
								                <xsl:choose>
                                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation/n1:code[@code='9053'][not(@nullFlavor)]">
                                                        <p class="tableblack">
										        		    <xsl:text>Вредные привычки или зависимости: </xsl:text>
						                              	    <xsl:value-of select=  "/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry[n1:observation/n1:code/@code='9053'][1]/n1:observation[n1:code/@code='9053']/n1:value/@displayName"/>
										        			<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry[n1:observation/n1:code/@code='9053'][position()>1]/n1:observation[n1:code/@code='9053']"> 
										        			    <xsl:text>; </xsl:text>
										        				<xsl:value-of select="./n1:value/@displayName"/>
										        			</xsl:for-each>	
                                                        </p>	
						                            </xsl:when>
                                                </xsl:choose>
												<xsl:choose>
                                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12524']/n1:value[not(@nullFlavor)]">
					                                    <p class="tableblack">
										        	        <xsl:text>Сведения о занятости: </xsl:text>
						                             		<xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12524']/n1:value/@displayName"/>
								                		    <xsl:choose>
					                               	     	    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12524']/n1:text[not(@nullFlavor)]">
								                			        <xsl:text> (</xsl:text>
					                               	     	        <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12524']/n1:text"/>
								                			        <xsl:text>)</xsl:text> 
								                	     	   	</xsl:when>
					                               	     	</xsl:choose>
                                                        </p>	
						                            </xsl:when>
                                                </xsl:choose>
												<xsl:choose>
                                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:value[not(@nullFlavor)]">
                                                        <p class="tableblack">
										        		    <xsl:text>Причина нетрудоспособности: </xsl:text>
						                              	    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:value/@displayName"/>
                                                        </p>
														<p class="tableblack">
										        		    <xsl:text>Даты временной нетрудоспособности: </xsl:text>
						                              	    <xsl:choose>
						                  		                <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:effectiveTime/n1:high[not(@nullFlavor)] and /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:effectiveTime/n1:low[not(@nullFlavor)]">
						                  		                  	<xsl:call-template name="formatDate">
                                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:effectiveTime/n1:low/@value"/>
                                                                    </xsl:call-template>
						                  		                  	<xsl:text> &#8212; </xsl:text>
						                  		                  	<xsl:call-template name="formatDate">
                                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:effectiveTime/n1:high/@value"/>
                                                                    </xsl:call-template>
                                                                </xsl:when>
                                                                <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:effectiveTime/n1:high[not(@nullFlavor)]">
                                                                    <xsl:text>действует до </xsl:text>
						                  		                  	<xsl:call-template name="formatDate">
                                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:effectiveTime/n1:high/@value"/>
                                                                    </xsl:call-template>
                                                                </xsl:when>
						                  		                <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:effectiveTime/n1:low[not(@nullFlavor)]">
                                                                    <xsl:text>с </xsl:text>
						                  		                  	<xsl:call-template name="formatDate">
                                                                        <xsl:with-param name="newdate" select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SOCANAM']/n1:entry/n1:observation[n1:code/@code='12006']/n1:effectiveTime/n1:low/@value"/>
                                                                    </xsl:call-template>
                                                                </xsl:when>
                                                            </xsl:choose>
                                                        </p>	
						                            </xsl:when>
                                                </xsl:choose>
							            	</td>	
							            </tr>
									</xsl:when>
                                </xsl:choose>
								<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='OBSTETRICANAMN'][not(@nullFlavor)]">
					                    <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
                                                    <xsl:text>Акушерский анамнез</xsl:text>
                                                </h2>
						                 		<p class="tableblack">
                                                    <xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='OBSTETRICANAMN']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='OBSTETRICANAMN']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:call-template name="formatNullFlavor">
                                                                <xsl:with-param name="nullflavor" select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='OBSTETRICANAMN']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value/@nullFlavor"/>
                                                            </xsl:call-template>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </p>
												<p class="tableblack">
												    <xsl:text>Текущая беременность по счёту: </xsl:text>
													<xsl:choose>
                                                        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='OBSTETRICANAMN']/n1:entry/n1:observation[n1:code/@code='12310']/n1:value[not(@nullFlavor)]">
                                                            <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='OBSTETRICANAMN']/n1:entry/n1:observation[n1:code/@code='12310']/n1:value/@value"/>
                                                        </xsl:when>
                                                        <xsl:otherwise>
                                                            <xsl:call-template name="formatNullFlavor">
                                                                <xsl:with-param name="nullflavor" select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='OBSTETRICANAMN']/n1:entry/n1:observation[n1:code/@code='12310']/n1:value/@nullFlavor"/>
                                                            </xsl:call-template>
                                                        </xsl:otherwise>
                                                    </xsl:choose>
                                                </p>
                                            </td>
                                        </tr>
						             </xsl:when>
					            </xsl:choose>
								<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ALL'][not(@nullFlavor)]">
						                <tr>
					                        <td colspan="8">
                                                <h2 class="tablegray">
						                      	    <xsl:text>Аллергологический анамнез</xsl:text>
                                                </h2>
						                		<xsl:choose>
					                                <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ALL'][not(@nullFlavor)]">
						                		        <p class="tableblack">
						                		            <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ALL']/n1:entry/n1:observation[n1:code/@code='11036']/n1:value"/>
						                		        </p>	
						                		    </xsl:when>
						                		</xsl:choose>
						                		<xsl:choose>
					                                <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ALL']/n1:entry/n1:observation[n1:code/@code='11036'][not(@nullFlavor)]">
						                		        <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ALL']/n1:entry/n1:observation[n1:code/@code='11036']"> 
					                                        <p class="tableblack">
						                						<xsl:choose>
					                                                <xsl:when test="./n1:value/@displayName">
						                		            	   		<xsl:text>Тип реакции: </xsl:text>
						                		            			<xsl:value-of select="./n1:value/@displayName"/>
						        										<br/>
					                    	                        </xsl:when>
					                    	                    </xsl:choose>
						        								<xsl:text>Описание агента: </xsl:text>
						                		            	<xsl:choose>
						                						    <xsl:when test="./n1:participant/n1:participantRole/n1:playingEntity/n1:code[not(@nullFlavor)] and ./n1:participant/n1:participantRole/n1:playingEntity/n1:desc">
						                		            	        <xsl:value-of select="./n1:participant/n1:participantRole/n1:playingEntity/n1:code/@displayName"/>
						                								<xsl:text> (</xsl:text>
						                								<xsl:value-of select="./n1:participant/n1:participantRole/n1:playingEntity/n1:desc"/>
						                								<xsl:text>)</xsl:text>
						                		            	    </xsl:when>
					                                                <xsl:when test="./n1:participant/n1:participantRole/n1:playingEntity/n1:code[not(@nullFlavor)]">
						                		            	        <xsl:value-of select="./n1:participant/n1:participantRole/n1:playingEntity/n1:code/@displayName"/>
						                		            	    </xsl:when>
						                		            		<xsl:when test="./n1:participant/n1:participantRole/n1:playingEntity/n1:code/@nullFlavor">
						                		            	        <xsl:value-of select="./n1:participant/n1:participantRole/n1:playingEntity/n1:desc"/>
						                		            	    </xsl:when>
						                		            	</xsl:choose>
						                		            	<xsl:choose>
					                                                <xsl:when test="./n1:effectiveTime/@value">
						                		            	      	<br/><xsl:text>Дата выявления: </xsl:text>
						                		            	   		<xsl:call-template name="formatDate">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                        </xsl:call-template>
					                    	                        </xsl:when>
					                    	                    </xsl:choose>
						                		                <xsl:choose>
					                                                <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='12328']">
						                		            	       	<br/><xsl:text>Клинические проявления патологической реакции: </xsl:text>
						                		            			<xsl:choose>
						                									<xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='12328'][1]/n1:text and ./n1:entryRelationship/n1:observation[n1:code/@code='12328'][1]/n1:value/@displayName">
						                									    <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12328'][1]/n1:value/@displayName"/>
						                									    <xsl:text> (</xsl:text>
						                		            				    <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12328'][1]/n1:text"/>
						                									    <xsl:text>)</xsl:text>
						                		            				</xsl:when>
					                                                        <xsl:when test="../n1:observation[n1:code/@code='12328'][1]/n1:text">
						                		            				    <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12328'][1]/n1:text"/>
						                		            				</xsl:when>
						                		            				<xsl:otherwise>
						                		            	    		    <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12328'][1]/n1:value/@displayName"/>
						                		            				</xsl:otherwise>
						                		            			</xsl:choose>	
						                		            			<xsl:for-each select="./n1:entryRelationship[n1:observation/n1:code/@code='12328'][position()>1]/n1:observation[n1:code/@code='12328']">
						                		            	    		<xsl:choose>
						                										<xsl:when test="./n1:text and ./n1:value/@displayName">
						                		            						<xsl:text>; </xsl:text>
						                											<xsl:value-of select="./n1:value/@displayName"/>
						                											<xsl:text> (</xsl:text>
						                		            				        <xsl:value-of select="./n1:text"/>
						                											<xsl:text>)</xsl:text>
						                		           				        </xsl:when>
					                                                            <xsl:when test="./n1:text">
						                		           						    <xsl:text>; </xsl:text>
						                		           				            <xsl:value-of select="./n1:text"/>
						                		           				        </xsl:when>
						                		           				        <xsl:otherwise>
						                		           						    <xsl:text>; </xsl:text>
						                		           	    		            <xsl:value-of select="./n1:value/@displayName"/>
						                		           				        </xsl:otherwise>
						                		           					</xsl:choose>
						                		           				</xsl:for-each>	
					                    	                        </xsl:when>
					                    	                    </xsl:choose>
						                		           		<xsl:choose>
					                                                <xsl:when test="./n1:text">
						                		           	       		<br/><xsl:text>Комментарий: </xsl:text>
						                		           	    		<xsl:value-of select="./n1:text"/>
					                    	                        </xsl:when>
					                    	                    </xsl:choose>
                                                            </p>
						                		        </xsl:for-each>	
						                		   	</xsl:when>
						                		</xsl:choose>
						                    </td>	
						                </tr>
						        	</xsl:when>
						        </xsl:choose>	
								<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='EPIDEM']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value[not(@nullFlavor)]">
					                    <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
                                                    <xsl:text>Эпидемиологический анамнез</xsl:text>
                                                </h2>
						                 		<p class="tableblack">
												    <xsl:text>Описание: </xsl:text>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='EPIDEM']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value"/>
                                                </p>
                                            </td>
                                        </tr>
						             </xsl:when>
					            </xsl:choose>
					        </table>
						</xsl:when>
                    </xsl:choose>
					<xsl:choose>
				        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESCONS'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='CONSILIUMDECISION'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='COMMISSION'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESLAB'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESINSTR'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='GISTRESULT'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SUR'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='TRANSFUSINFO'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ELSEPROCEDURE']">
					        <table class="block-form">
					            <xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESCONS'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Результаты консультации/осмотра врача</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESCONS']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
															<xsl:choose>
                                                                <xsl:when test="./n1:code[not(@nullFlavor)]">
															        <p class="tableblack">
					        					                    	<xsl:value-of select="./n1:code/@displayName"/>
                                                                    </p>
																</xsl:when>
                                                            </xsl:choose>
					        					            <p class="tableblack">
					        					                <xsl:text>Описание: </xsl:text>
					        					            	<xsl:choose>
                                                                    <xsl:when test="./n1:value[not(@nullFlavor)]">
                                                                        <xsl:copy-of select="./n1:value"/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:call-template name="formatNullFlavor">
                                                                            <xsl:with-param name="nullflavor" select="./n1:value/@nullFlavor"/>
                                                                        </xsl:call-template>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </p>
															<p class="tableblack">
					        					                <xsl:text>Дата формирования документа: </xsl:text>
					        					            	<xsl:call-template name="formatDate">
                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                </xsl:call-template>
                                                            </p>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <p class="tableblack">
					        					                <xsl:text>Врач-специалист: </xsl:text>
					        		                        	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                            	<xsl:text>, </xsl:text>
					        	                            	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                <xsl:text> </xsl:text>
					        					                <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                <xsl:text> </xsl:text>
					        					                <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                            		<xsl:text>; </xsl:text>
					        					            	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                            		<xsl:text>, </xsl:text>
					        	                                    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					            	    <xsl:text> </xsl:text>
					        					            	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					            	    <xsl:text> </xsl:text>
					        					            	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                            	</xsl:for-each>
                                                            </p>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='CONSILIUMDECISION'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Решение консилиума</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='CONSILIUMDECISION']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
					        					    	    <h2 class="tablegray">
					        					    		    <xsl:choose>
                                                                    <xsl:when test="./n1:code[not(@nullFlavor)]">
					        					    				    <xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:choose>
                                                                            <xsl:when test="./n1:effectiveTime[not(@nullFlavor)]">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
					        										<xsl:otherwise>
					        					    				    <xsl:text>Консилиум</xsl:text>
					        											<xsl:choose>
                                                                            <xsl:when test="./n1:effectiveTime[not(@nullFlavor)]">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:otherwise>
                                                                </xsl:choose>
                                                            </h2>
					        								<p class="tableblack">
					                							<xsl:choose>
					                							    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:text and ./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:value/@displayName">
                                                                        <xsl:text>Цель проведения консилиума: </xsl:text>
					                									<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:value/@displayName"/>
					                									<xsl:text> (</xsl:text>
					                									<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:text"/>
					                									<xsl:text>)</xsl:text><br/>
                                                                    </xsl:when>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:text">
                                                                        <xsl:text>Цель проведения консилиума: </xsl:text>
					                									<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:text"/><br/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:text>Цель проведения консилиума: </xsl:text>
					                									<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:value/@displayName"/><br/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
					                						</p>
					        					            <p class="tableblack">
					        					                <xsl:text>Описание: </xsl:text>
					        					            	<xsl:copy-of select="./n1:value"/>
                                                            </p>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:performer/n1:assignedEntity/n1:code[not(@nullFlavor)]">
					        					                    <p class="tableblack">
					        					                        <xsl:text>Врач-специалист: </xsl:text>
					        		                                	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                                    	<xsl:text>, </xsl:text>
					        	                                    	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                        <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                                    		<xsl:text>; </xsl:text>
					        					                    	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                                    		<xsl:text>, </xsl:text>
					        	                                            <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                                    	</xsl:for-each>
                                                                    </p>
					        									</xsl:when>
                                                            </xsl:choose>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='COMMISSION'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Решение врачебной комиссии</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='COMMISSION']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
					        					    	    <h2 class="tablegray">
					        					    		    <xsl:choose>
					        									    <xsl:when test="./n1:code/n1:originalText and ./n1:code/@displayName">
					        					    				    <xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:text> (</xsl:text>
					        											<xsl:value-of select="./n1:code/n1:originalText"/>
					        											<xsl:text>)</xsl:text>
					        											<xsl:choose>
                                                                            <xsl:when test="./n1:effectiveTime[not(@nullFlavor)]">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
					        									    <xsl:when test="./n1:code/n1:originalText">
					        					    				    <xsl:value-of select="./n1:code/n1:originalText"/>
					        											<xsl:choose>
                                                                            <xsl:when test="./n1:effectiveTime[not(@nullFlavor)]">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
                                                                    <xsl:when test="./n1:code[not(@nullFlavor)]">
					        					    				    <xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:choose>
                                                                            <xsl:when test="./n1:effectiveTime[not(@nullFlavor)]">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
					        										<xsl:otherwise>
					        					    				    <xsl:text>Врачебная комиссия</xsl:text>
					        											<xsl:choose>
                                                                            <xsl:when test="./n1:effectiveTime[not(@nullFlavor)]">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:otherwise>
                                                                </xsl:choose>
                                                            </h2>
					        								<p class="tableblack">
					                							<xsl:choose>
					                							    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:text and ./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:value/@displayName">
                                                                        <xsl:text>Цель проведения врачебной комиссии: </xsl:text>
					                									<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:value/@displayName"/>
					                									<xsl:text> (</xsl:text>
					                									<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:text"/>
					                									<xsl:text>)</xsl:text><br/>
                                                                    </xsl:when>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:text">
                                                                        <xsl:text>Цель проведения врачебной комиссии: </xsl:text>
					                									<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:text"/><br/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:text>Цель проведения врачебной комиссии: </xsl:text>
					                									<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6026']/n1:value/@displayName"/><br/>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
					                						</p>
					        					            <p class="tableblack">
					        					                <xsl:text>Описание: </xsl:text>
					        					            	<xsl:copy-of select="./n1:value"/>
                                                            </p>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:performer/n1:assignedEntity/n1:code[not(@nullFlavor)]">
					        					                    <p class="tableblack">
					        					                        <xsl:text>Врач-специалист: </xsl:text>
					        		                                	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                                    	<xsl:text>, </xsl:text>
					        	                                    	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                        <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                                    		<xsl:text>; </xsl:text>
					        					                    	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                                    		<xsl:text>, </xsl:text>
					        	                                            <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                                    	</xsl:for-each>
                                                                    </p>
					        									</xsl:when>
                                                            </xsl:choose>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESLAB'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Результаты лабораторного исследования</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESLAB']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
															<xsl:choose>
                                                                <xsl:when test="./n1:code[not(@nullFlavor)]">
															        <p class="tableblack">
					        					                        <xsl:text>Профиль лабораторного исследования: </xsl:text>
					        					                    	<xsl:value-of select="./n1:code/@displayName"/>
                                                                    </p>
																</xsl:when>
                                                            </xsl:choose>	
					        					            <p class="tableblack">
					        					                <xsl:text>Результат лабораторного исследования: </xsl:text>
					        					            	<xsl:choose>
                                                                    <xsl:when test="./n1:value[not(@nullFlavor)]">
                                                                        <xsl:copy-of select="./n1:value"/>
                                                                    </xsl:when>
                                                                    <xsl:otherwise>
                                                                        <xsl:call-template name="formatNullFlavor">
                                                                            <xsl:with-param name="nullflavor" select="./n1:value/@nullFlavor"/>
                                                                        </xsl:call-template>
                                                                    </xsl:otherwise>
                                                                </xsl:choose>
                                                            </p>
															<p class="tableblack">
					        					                <xsl:text>Дата формирования документа: </xsl:text>
					        					            	<xsl:choose>
					        										<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        					    			        <xsl:call-template name="formatDate">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                        </xsl:call-template>
					        											<xsl:text> &#8212; </xsl:text>
					        											<xsl:call-template name="formatDate">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                        </xsl:call-template>
					        										</xsl:when>
					        										<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        											<xsl:call-template name="formatDate">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                        </xsl:call-template>
					        										</xsl:when>
					        										<xsl:when test="./n1:effectiveTime/@value">
					        					    			        <xsl:call-template name="formatDate">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                        </xsl:call-template>
					        										</xsl:when>
                                                                </xsl:choose>
                                                            </p>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        								<xsl:choose>
                                                                <xsl:when test="./n1:performer/n1:assignedEntity/n1:code[not(@nullFlavor)]">
					        					                    <p class="tableblack">
					        					                        <xsl:text>Врач-специалист: </xsl:text>
					        		                                	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                                    	<xsl:text>, </xsl:text>
					        	                                    	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                        <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                                    		<xsl:text>; </xsl:text>
					        					                    	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                                    		<xsl:text>, </xsl:text>
					        	                                            <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                                    	</xsl:for-each>
                                                                    </p>
					        									</xsl:when>
                                                            </xsl:choose>
					        								<xsl:choose>
                                                                <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='7028']">
					        								        <p class="tableblack">
					        								            <table class="table-break">
					        											    <xsl:choose>
					        													<xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='7028']/n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:referenceRange/n1:observationRange/n1:text and ./n1:entryRelationship/n1:observation[n1:code/@code='7028']/n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:text">
					        			                                            <tr>
					                                                                    <th class="param">Показатель</th>
					        					                                        <th class="param">Значение</th>
					        								        		         	<th class="param">Референтный интервал</th>
					        					                                        <th class="param">Комментарий</th>
					        			                                            </tr>
					                          	                                    <xsl:for-each select="./n1:entryRelationship/n1:observation[n1:code/@code='7028']">
					                          	                                        <tr>
					        			                                                    <td class="param">
                                                                                                <p class="tableresult">
					                          	                                                    <xsl:value-of select="./n1:text"/>
					                          	                                                </p>
                                                                                            </td>
					                          	                                            <td class="param">
                                                                                                <p class="tableresult">
					                          	                                           	        <xsl:value-of select="./n1:value"/>
					        								        		         				<xsl:choose>
                                                                                                        <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:value[not(@nullFlavor)]">
                                                                                                            <xsl:text> </xsl:text>
				            		                                                                		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:value"/>
                                                                                                        </xsl:when>
                                                                                                    </xsl:choose>
					                          	                                                </p>
                                                                                            </td>
					        					                                        	<td class="param">
                                                                                                <p class="tableresult">
					                          	                                                 	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:referenceRange/n1:observationRange/n1:text"/>
					                          	                                                </p>
                                                                                            </td>
					        								        		         		<td class="param">
                                                                                                <p class="tableresult">
					                          	                                                 	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:text"/>
					                          	                                                </p>
                                                                                            </td>
					                          	                                        </tr>
					                          	                                    </xsl:for-each>
					        													</xsl:when>
					        													<xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='7028']/n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:referenceRange/n1:observationRange/n1:text">
					        			                                            <tr>
					                                                                    <th class="param">Показатель</th>
					        					                                        <th class="param">Значение</th>
					        								        		         	<th class="param">Референтный интервал</th>
					        			                                            </tr>
					                          	                                    <xsl:for-each select="./n1:entryRelationship/n1:observation[n1:code/@code='7028']">
					                          	                                        <tr>
					        			                                                    <td class="param">
                                                                                                <p class="tableresult">
					                          	                                                    <xsl:value-of select="./n1:text"/>
					                          	                                                </p>
                                                                                            </td>
					                          	                                            <td class="param">
                                                                                                <p class="tableresult">
					                          	                                           	        <xsl:value-of select="./n1:value"/>
					        								        		         				<xsl:choose>
                                                                                                        <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:value[not(@nullFlavor)]">
                                                                                                            <xsl:text> </xsl:text>
				            		                                                                		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:value"/>
                                                                                                        </xsl:when>
                                                                                                    </xsl:choose>
					                          	                                                </p>
                                                                                            </td>
					        					                                        	<td class="param">
                                                                                                <p class="tableresult">
					                          	                                                 	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:referenceRange/n1:observationRange/n1:text"/>
					                          	                                                </p>
                                                                                            </td>
					                          	                                        </tr>
					                          	                                    </xsl:for-each>
					        													</xsl:when>
					        													<xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='7028']/n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:text">
					        			                                            <tr>
					                                                                    <th class="param">Показатель</th>
					        					                                        <th class="param">Значение</th>
					        					                                        <th class="param">Комментарий</th>
					        			                                            </tr>
					                          	                                    <xsl:for-each select="./n1:entryRelationship/n1:observation[n1:code/@code='7028']">
					                          	                                        <tr>
					        			                                                    <td class="param">
                                                                                                <p class="tableresult">
					                          	                                                    <xsl:value-of select="./n1:text"/>
					                          	                                                </p>
                                                                                            </td>
					                          	                                            <td class="param">
                                                                                                <p class="tableresult">
					                          	                                           	        <xsl:value-of select="./n1:value"/>
					        								        		         				<xsl:choose>
                                                                                                        <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:value[not(@nullFlavor)]">
                                                                                                            <xsl:text> </xsl:text>
				            		                                                                		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:value"/>
                                                                                                        </xsl:when>
                                                                                                    </xsl:choose>
					                          	                                                </p>
                                                                                            </td>
					        								        		         		<td class="param">
                                                                                                <p class="tableresult">
					                          	                                                 	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:text"/>
					                          	                                                </p>
                                                                                            </td>
					                          	                                        </tr>
					                          	                                    </xsl:for-each>
					        													</xsl:when>
					        													<xsl:otherwise>
					        			                                            <tr>
					                                                                    <th class="param">Показатель</th>
					        					                                        <th class="param">Значение</th>
					        			                                            </tr>
					                          	                                    <xsl:for-each select="./n1:entryRelationship/n1:observation[n1:code/@code='7028']">
					                          	                                        <tr>
					        			                                                    <td class="param">
                                                                                                <p class="tableresult">
					                          	                                                    <xsl:value-of select="./n1:text"/>
					                          	                                                </p>
                                                                                            </td>
					                          	                                            <td class="param">
                                                                                                <p class="tableresult">
					                          	                                           	        <xsl:value-of select="./n1:value"/>
					        								        		         				<xsl:choose>
                                                                                                        <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:value[not(@nullFlavor)]">
                                                                                                            <xsl:text> </xsl:text>
				            		                                                                		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8102']/n1:value"/>
                                                                                                        </xsl:when>
                                                                                                    </xsl:choose>
					                          	                                                </p>
                                                                                            </td>
					                          	                                        </tr>
					                          	                                    </xsl:for-each>
					        													</xsl:otherwise>
                                                                            </xsl:choose>	
					        								        	</table>
					        								        </p>
					        								    </xsl:when>
                                                            </xsl:choose>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESINSTR'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Результаты инструментального исследования</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='RESINSTR']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
					        					    	    <xsl:choose>
                                                                <xsl:when test="./n1:code[not(@nullFlavor)]">
															        <p class="tableblack">
					        					                        <xsl:text>Вид инструментального исследования: </xsl:text>
					        					                    	<xsl:value-of select="./n1:code/@displayName"/>
                                                                    </p>
																</xsl:when>
                                                            </xsl:choose>
					        					            <p class="tableblack">
					        					                <xsl:text>Заключение инструментального исследования: </xsl:text>
					        					            	<xsl:copy-of select="./n1:value"/>
                                                            </p>
															<p class="tableblack">
					        					                <xsl:text>Дата формирования документа: </xsl:text>
					        					            	<xsl:call-template name="formatDate">
                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                </xsl:call-template>
                                                            </p>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:performer/n1:assignedEntity/n1:code[not(@nullFlavor)]">
					        					                    <p class="tableblack">
					        					                        <xsl:text>Врач-специалист: </xsl:text>
					        		                                	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                                    	<xsl:text>, </xsl:text>
					        	                                    	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                        <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                                    		<xsl:text>; </xsl:text>
					        					                    	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                                    		<xsl:text>, </xsl:text>
					        	                                            <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                                    	</xsl:for-each>
                                                                    </p>
					        									</xsl:when>
                                                            </xsl:choose>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='GISTRESULT'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Результаты прижизненного патолого-анатомического исследования</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='GISTRESULT']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
					        					    	    <h2 class="tablegray">
					        					    		    <xsl:choose>
					        									    <xsl:when test="./n1:code/n1:originalText and ./n1:code/@displayName">
					        					    				    <xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:text> (</xsl:text>
					        											<xsl:value-of select="./n1:code/n1:originalText"/>
					        											<xsl:text>)</xsl:text>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
					        									    <xsl:when test="./n1:code/n1:originalText">
					        					    				    <xsl:value-of select="./n1:code/n1:originalText"/>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
                                                                    <xsl:when test="./n1:code[not(@nullFlavor)]">
					        					    				    <xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
                                                                </xsl:choose>
                                                            </h2>
					        					            <p class="tableblack">
					        					                <xsl:text>Описание: </xsl:text>
					        					            	<xsl:copy-of select="./n1:value"/>
                                                            </p>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:performer/n1:assignedEntity/n1:code[not(@nullFlavor)]">
					        					                    <p class="tableblack">
					        					                        <xsl:text>Врач-специалист: </xsl:text>
					        		                                	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                                    	<xsl:text>, </xsl:text>
					        	                                    	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                        <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                                    		<xsl:text>; </xsl:text>
					        					                    	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                                    		<xsl:text>, </xsl:text>
					        	                                            <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                                    	</xsl:for-each>
                                                                    </p>
					        									</xsl:when>
                                                            </xsl:choose>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SUR'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Оперативное вмешательство</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SUR']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
					        					    	    <h2 class="tablegray">
					        					    		    <xsl:choose>
					        									    <xsl:when test="./n1:code/n1:originalText and ./n1:code/@displayName">
					        					    				    <xsl:value-of select="./n1:code/@code"/>
					        											<xsl:text> </xsl:text>
					        											<xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:text> (</xsl:text>
					        											<xsl:value-of select="./n1:code/n1:originalText"/>
					        											<xsl:text>)</xsl:text>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
					        									    <xsl:when test="./n1:code/n1:originalText">
					        					    				    <xsl:value-of select="./n1:code/n1:originalText"/>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
                                                                    <xsl:when test="./n1:code[not(@nullFlavor)]">
					        										    <xsl:value-of select="./n1:code/@code"/>
					        											<xsl:text> </xsl:text>
					        					    				    <xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
                                                                </xsl:choose>
                                                            </h2>
					        					            <p class="tableblack">
					        					                <xsl:text>Описание: </xsl:text>
					        					            	<xsl:copy-of select="./n1:value"/>
                                                            </p>
					        								<xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Анестезиологическое пособие: </xsl:text>
					        											<xsl:choose>
					        												<xsl:when test="./n1:entryRelationship[n1:substanceAdministration][1]/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code[not(@nullFlavor)] and ./n1:entryRelationship[n1:substanceAdministration][1]/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/n1:originalText">
					        												    <xsl:value-of select="./n1:entryRelationship[n1:substanceAdministration][1]/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/@displayName"/>
					        													<xsl:text> (</xsl:text>
					        					    				            <xsl:value-of select="./n1:entryRelationship[n1:substanceAdministration][1]/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/n1:originalText"/>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:entryRelationship[n1:substanceAdministration][1]/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/n1:originalText">
					        					    				            <xsl:value-of select="./n1:entryRelationship[n1:substanceAdministration][1]/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/n1:originalText"/>
					        												</xsl:when>
					        												<xsl:when test="./n1:entryRelationship[n1:substanceAdministration][1]/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code[not(@nullFlavor)]">
					        												    <xsl:value-of select="./n1:entryRelationship[n1:substanceAdministration][1]/n1:substanceAdministration/n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/@displayName"/>
					        												</xsl:when>
                                                                        </xsl:choose>
					        											<xsl:for-each select="./n1:entryRelationship[n1:substanceAdministration][position()>1]/n1:substanceAdministration">
					        											    <xsl:text>; </xsl:text>
					        												<xsl:choose>
					        											    	<xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code[not(@nullFlavor)] and ./n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/n1:originalText">
					        											    	    <xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/@displayName"/>
					        											    		<xsl:text> (</xsl:text>
					        					    				                <xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/n1:originalText"/>
					        											    		<xsl:text>)</xsl:text>
					        											    	</xsl:when>
					        											    	<xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/n1:originalText">
					        					    				                <xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/n1:originalText"/>
					        											    	</xsl:when>
					        											    	<xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code[not(@nullFlavor)]">
					        											    	    <xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedLabeledDrug/n1:code/@displayName"/>
					        											    	</xsl:when>
                                                                            </xsl:choose>
					        											</xsl:for-each>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:performer/n1:assignedEntity/n1:code[not(@nullFlavor)]">
					        					                    <p class="tableblack">
					        					                        <xsl:text>Врач-специалист: </xsl:text>
					        		                                	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                                    	<xsl:text>, </xsl:text>
					        	                                    	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                        <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                                    		<xsl:text>; </xsl:text>
					        					                    	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                                    		<xsl:text>, </xsl:text>
					        	                                            <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                                    	</xsl:for-each>
                                                                    </p>
					        									</xsl:when>
                                                            </xsl:choose>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='TRANSFUSINFO'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Сведения о трансфузии</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='TRANSFUSINFO']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
					        					    	    <h2 class="tablegray">
					        								    <xsl:value-of select="./n1:code/@displayName"/>
					        									<xsl:text> (</xsl:text>
					        									<xsl:call-template name="formatDate">
                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                </xsl:call-template>
					        									<xsl:text> &#8212; </xsl:text>
					        									<xsl:call-template name="formatDate">
                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                </xsl:call-template>
					        									<xsl:text>)</xsl:text>
                                                            </h2>
					        					            <p class="tableblack">
					        					                <xsl:text>Описание: </xsl:text>
					        					            	<xsl:copy-of select="./n1:value"/>
                                                            </p>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:performer/n1:assignedEntity/n1:code[not(@nullFlavor)]">
					        					                    <p class="tableblack">
					        					                        <xsl:text>Врач-специалист: </xsl:text>
					        		                                	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                                    	<xsl:text>, </xsl:text>
					        	                                    	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                        <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                                    		<xsl:text>; </xsl:text>
					        					                    	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                                    		<xsl:text>, </xsl:text>
					        	                                            <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                                    	</xsl:for-each>
                                                                    </p>
					        									</xsl:when>
                                                            </xsl:choose>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ELSEPROCEDURE'][not(@nullFlavor)]">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Прочие медицинские процедуры и манипуляции</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='ELSEPROCEDURE']/n1:entry/n1:observation">
					        					    <tr>
                                                        <td colspan="8">
					        					    	    <h2 class="tablegray">
					        					    		    <xsl:choose>
					        									    <xsl:when test="./n1:code/n1:originalText and ./n1:code/@displayName">
					        					    				    <xsl:value-of select="./n1:code/@code"/>
					        											<xsl:text> </xsl:text>
					        											<xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:text> (</xsl:text>
					        											<xsl:value-of select="./n1:code/n1:originalText"/>
					        											<xsl:text>)</xsl:text>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
					        									    <xsl:when test="./n1:code/n1:originalText">
					        					    				    <xsl:value-of select="./n1:code/n1:originalText"/>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
                                                                    <xsl:when test="./n1:code[not(@nullFlavor)]">
					        										    <xsl:value-of select="./n1:code/@code"/>
					        											<xsl:text> </xsl:text>
					        					    				    <xsl:value-of select="./n1:code/@displayName"/>
					        											<xsl:choose>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)] and ./n1:effectiveTime/n1:high[not(@nullFlavor)]">
					        												    <xsl:text> (</xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text> &#8212; </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                </xsl:call-template>
					        													<xsl:text>)</xsl:text>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/n1:low[not(@nullFlavor)]">
					        					    				            <xsl:text> от </xsl:text>
					        													<xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
					        												<xsl:when test="./n1:effectiveTime/@value">
					        					    					        <xsl:text> от </xsl:text>
					        					    				            <xsl:call-template name="formatDate">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
					        												</xsl:when>
                                                                        </xsl:choose>	
					        					    				</xsl:when>
                                                                </xsl:choose>
                                                            </h2>
					        								<xsl:choose>
                                                                <xsl:when test="./n1:value[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Описание: </xsl:text>
					        					            	        <xsl:copy-of select="./n1:value"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:text[not(@nullFlavor)]">
					        					                	<p class="tableblack">
                                                                        <xsl:text>Примечание: </xsl:text>
					        	                                        <xsl:value-of select="./n1:text"/>
					        					                	</p>	
                                                                </xsl:when>
                                                            </xsl:choose>
					        					            <xsl:choose>
                                                                <xsl:when test="./n1:performer/n1:assignedEntity/n1:code[not(@nullFlavor)]">
					        					                    <p class="tableblack">
					        					                        <xsl:text>Врач-специалист: </xsl:text>
					        		                                	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:code/@displayName"/>
					        	                                    	<xsl:text>, </xsl:text>
					        	                                    	<xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:family"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/n1:given"/>
					        					                        <xsl:text> </xsl:text>
					        					                        <xsl:value-of select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:assignedPerson/n1:name/identity:Patronymic"/>
					        					                        <xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        	                                    		<xsl:text>; </xsl:text>
					        					                    	    <xsl:value-of select="./n1:code/@displayName"/>
					        	                                    		<xsl:text>, </xsl:text>
					        	                                            <xsl:value-of select="./n1:assignedPerson/n1:name/n1:family"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/n1:given"/>
					        					                    	    <xsl:text> </xsl:text>
					        					                    	    <xsl:value-of select="./n1:assignedPerson/n1:name/identity:Patronymic"/>
					        	                                    	</xsl:for-each>
                                                                    </p>
					        									</xsl:when>
                                                            </xsl:choose>
					        					    	</td>
                                                    </tr>
					        					</xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        </table>
					    </xsl:when>
			        </xsl:choose>
					<xsl:choose>
				        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='IMM'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DRUG'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='VITALPARAM'] or /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SCORES']">
					        <table class="block-form">
                                <xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='IMM']">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Иммунизация</xsl:text>
                                                </h2>
					            	            <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='IMM']/n1:entry/n1:observation">
					                                <p class="tableblack">
					            			            <xsl:choose>
					            				            <xsl:when test="./n1:code/n1:originalText and ./n1:code/@displayName">
					            				            	<xsl:value-of select="./n1:code/@displayName"/>
					            				            	<xsl:text> (</xsl:text>
					            				            	<xsl:value-of select="./n1:code/n1:originalText"/>
					            				            	<xsl:text>)</xsl:text>	
					            	    		            </xsl:when>
					            				            <xsl:when test="./n1:code/n1:originalText">
					            	    	                    <xsl:value-of select="./n1:code/n1:originalText"/>	
					            	    	                </xsl:when>
                                                            <xsl:when test="./n1:code[not(@nullFlavor)]">
					            	    	                    <xsl:value-of select="./n1:code/@displayName"/>	
					            	    	                </xsl:when>
                                                        </xsl:choose>
					            			            <xsl:text> от </xsl:text>
					            	    	            <xsl:call-template name="formatDate">
                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                        </xsl:call-template>
					            	            	</p>
					            	            </xsl:for-each>
                                            </td>
                                        </tr>
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
		                        	<xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DRUG']/n1:entry/n1:substanceAdministration[@classCode='SBADM']">
	                                    <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Проведенное лечение</xsl:text>
                                                </h2>
												<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DRUG']/n1:entry/n1:substanceAdministration[@classCode='SBADM']">
					        					    <p class="tableblack">
													    <xsl:choose>
		                                                    <xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName and ./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name and ./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName">
		                                                    	<xsl:value-of select="substring-before(./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName,'|')"/>
		                                                        <xsl:text> торговое наименование: </xsl:text>
		                                                        <xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name"/>
		                                                        <xsl:text> действующее вещество: </xsl:text>
		                                                        <xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName"/>
		                                                    </xsl:when>
		                                                    <xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName and ./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name">
		                                                        <xsl:value-of select="substring-before(./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName,'|')"/>
		                                                        <xsl:text> торговое наименование: </xsl:text>
		                                                    	<xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name"/>
		                                                    </xsl:when>
		                                                    <xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName and ./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName">
		                                                        <xsl:value-of select="substring-before(./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName,'|')"/>
		                                                    	<xsl:text> действующее вещество: </xsl:text>
		                                                        <xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName"/>
		                                                    </xsl:when>
		                                                    <xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name and ./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName">
		                                                    	<xsl:text> торговое наименование: </xsl:text>
		                                                        <xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name"/>
		                                                    	<xsl:text> действующее вещество: </xsl:text>
		                                                    	<xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName"/>
		                                                    </xsl:when>
		                                                    <xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName">
		                                                    	<xsl:value-of select="substring-before(./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName,'|')"/>
		                                                    </xsl:when>
		                                                    <xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name">
		                                                    	<xsl:text> торговое наименование: </xsl:text>
		                                                    	<xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:name"/>
		                                                    </xsl:when>
		                                                    <xsl:when test="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName">
		                                                    	<xsl:text> действующее вещество: </xsl:text>
		                                                    	<xsl:value-of select="./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/n1:translation/@displayName"/>
		                                                    </xsl:when>
		                                                </xsl:choose>
													    <xsl:choose>
		                                                    <xsl:when test="./n1:administrationUnitCode/@displayName">
		                                                        <xsl:text> лекарственная форма: </xsl:text>
		                                                        <xsl:value-of select="./n1:administrationUnitCode/@displayName"/>
		                                                    </xsl:when>
		                                                </xsl:choose>
													    <xsl:choose>
		                                                    <xsl:when test="./n1:routeCode/@displayName">
		                                                        <xsl:text>, путь введения: </xsl:text>
		                                                        <xsl:value-of select="./n1:routeCode/@displayName"/>
		                                                    </xsl:when>
		                                                </xsl:choose>
		                                                <xsl:text> по </xsl:text>
		                                                <xsl:value-of select="./n1:doseQuantity/@value"/>
		                                                <xsl:text> </xsl:text>
		                                                <xsl:value-of select="./n1:doseQuantity/n1:translation/@displayName"/>
		                                                <xsl:text> </xsl:text>
		                                                <xsl:value-of select="substring-after(./n1:consumable/n1:manufacturedProduct/n1:manufacturedMaterial/n1:code/@displayName,'|')"/>
		                                                <xsl:choose>
		                                                    <xsl:when test="./n1:effectiveTime[@xsi:type='PIVL_TS']/n1:period/@value &lt; 1">
		                                                		<xsl:text> </xsl:text>
		                                                		<xsl:value-of select="round(1 div ./n1:effectiveTime[@xsi:type='PIVL_TS']/n1:period/@value)"/>
		                                                		<xsl:choose>
		                                                			<xsl:when test="(round(1 div ./n1:effectiveTime[@xsi:type='PIVL_TS']/n1:period/@value) mod 10)=2 or (round(1 div ./n1:effectiveTime[@xsi:type='PIVL_TS']/n1:period/@value) mod 10)=3 or (round(1 div ./n1:effectiveTime[@xsi:type='PIVL_TS']/n1:period/@value) mod 10)=4">
		                                                			    <xsl:text> раза в </xsl:text>
		                                                			</xsl:when>
		                                                			<xsl:otherwise>
		                                                			    <xsl:text> раз в </xsl:text>
		                                                			</xsl:otherwise>
		                                                		</xsl:choose>
		                                                		<xsl:value-of select="./n1:effectiveTime[@xsi:type='PIVL_TS']/n1:period/n1:translation/@displayName"/>
		                                                	</xsl:when>
		                                                	<xsl:when test="./n1:effectiveTime[@xsi:type='PIVL_TS'][not(@nullFlavor)]">
		                                                		<xsl:text> 1 раз в </xsl:text>
		                                                		<xsl:value-of select="./n1:effectiveTime[@xsi:type='PIVL_TS']/n1:period/@value"/>
		                                                		<xsl:text> </xsl:text>
		                                                		<xsl:value-of select="./n1:effectiveTime[@xsi:type='PIVL_TS']/n1:period/n1:translation/@displayName"/>
		                                                	</xsl:when>
		                                                </xsl:choose>	
		                                                <xsl:choose>
		                                                	<xsl:when test="../../n1:effectiveTime/n1:low[not(@nullFlavor)]">
		                                                		<xsl:text> в течение </xsl:text>
		                                                		<xsl:call-template name="getDays">
                                                                    <xsl:with-param name="birthdate" select="../../n1:effectiveTime/n1:low/@value"/>
		                                                			<xsl:with-param name="deathdate" select="../../n1:effectiveTime/n1:high/@value"/>
                                                                </xsl:call-template>
		                                                		<xsl:text> дней</xsl:text>
		                                                	</xsl:when>
		                                                	<xsl:otherwise>
		                                                	    <xsl:value-of select="./n1:effectiveTime/n1:width/@value"/>
		                                                		<xsl:text> </xsl:text>
		                                                		<xsl:value-of select="./n1:effectiveTime/n1:width/n1:translation/@displayName"/>
		                                                	</xsl:otherwise>
		                                                </xsl:choose>
														<xsl:text>, продолжительность приема с </xsl:text>
														<xsl:call-template name="formatDatewithTime">
                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                        </xsl:call-template>
		                        	                    <xsl:choose>
                                                            <xsl:when test="./n1:effectiveTime/n1:high[not(@nullFlavor)]">
                                                                <xsl:text> по </xsl:text>
		                        	                            <xsl:call-template name="formatDatewithTime">
                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                </xsl:call-template>
                                                            </xsl:when>
                                                        </xsl:choose>
														<xsl:choose>
                                                            <xsl:when test="./n1:precondition/n1:criterion[n1:code/@code='ASSERTION']/n1:value[not(@nullFlavor)]">
                                                                <xsl:text>, особые указания: </xsl:text>
		                        	                            <xsl:value-of select="./n1:precondition/n1:criterion[n1:code/@code='ASSERTION']/n1:value"/>
                                                            </xsl:when>
                                                        </xsl:choose>
														<xsl:choose>
                                                            <xsl:when test="./n1:text[not(@nullFlavor)]">
                                                                <xsl:text>, примечание: </xsl:text>
		                        	                            <xsl:value-of select="./n1:text"/>
                                                            </xsl:when>
                                                        </xsl:choose>
													</p>
		                                        </xsl:for-each>
					        	            </td>
		                                </tr>
					        	    </xsl:when>
		                        </xsl:choose>
					        	<xsl:choose>
		                        	<xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation">
	                                    <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Медицинские изделия</xsl:text>
                                                </h2>
					        					<p class="tableblack">
					                          	    <table class="table-break">
					        					        <xsl:choose>
		                        	                        <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation/n1:entryRelationship/n1:observation[n1:code/@code='12154']/n1:value[not(@nullFlavor)] and /n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation/n1:text">
					        			                        <tr>
		                                                        	<th class="param">Дата и время применения</th>
		                                                        	<th class="param">Наименование медицинского изделия</th>
		                                                        	<th class="param">Серийный номер</th>
		                                                        	<th class="param">Количество использованных единиц</th>
		                                                            <th class="param">Примечание</th>
		                                                        </tr>
		                                                        <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation">
		                                                            <tr>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:call-template name="formatDatewithTime">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>	
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
					        												    <xsl:value-of select="./n1:code/n1:originalText"/>	
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12154']/n1:value"/>		
		                                                        		    </p>
                                                                        </td>
					        											<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='9078']/n1:value/@value"/>		
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:text"/>	
		                                                        		    </p>
                                                                        </td>
		                                                        	</tr>
		                                                        </xsl:for-each>
					        	                            </xsl:when>
					        								<xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation/n1:entryRelationship/n1:observation[n1:code/@code='12154']/n1:value[not(@nullFlavor)]">
					        			                        <tr>
		                                                        	<th class="param">Дата и время применения</th>
		                                                        	<th class="param">Наименование медицинского изделия</th>
		                                                        	<th class="param">Серийный номер</th>
		                                                        	<th class="param">Количество использованных единиц</th>
		                                                        </tr>
		                                                        <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation">
		                                                            <tr>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:call-template name="formatDatewithTime">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>	
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
					        												    <xsl:value-of select="./n1:code/n1:originalText"/>	
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12154']/n1:value"/>		
		                                                        		    </p>
                                                                        </td>
					        											<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='9078']/n1:value/@value"/>		
		                                                        		    </p>
                                                                        </td>
		                                                        	</tr>
		                                                        </xsl:for-each>
					        	                            </xsl:when>
					        								<xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation/n1:text">
					        			                        <tr>
		                                                        	<th class="param">Дата и время применения</th>
		                                                        	<th class="param">Наименование медицинского изделия</th>
		                                                        	<th class="param">Количество использованных единиц</th>
		                                                            <th class="param">Примечание</th>
		                                                        </tr>
		                                                        <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation">
		                                                            <tr>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:call-template name="formatDatewithTime">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>	
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
					        												    <xsl:value-of select="./n1:code/n1:originalText"/>	
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12154']/n1:value"/>		
		                                                        		    </p>
                                                                        </td>
					        											<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='9078']/n1:value/@value"/>		
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:text"/>	
		                                                        		    </p>
                                                                        </td>
		                                                        	</tr>
		                                                        </xsl:for-each>
					        	                            </xsl:when>
		                                                    <xsl:otherwise>
					        								    <tr>
		                                                        	<th class="param">Дата и время применения</th>
		                                                        	<th class="param">Наименование медицинского изделия</th>
		                                                        	<th class="param">Количество использованных единиц</th>
		                                                        </tr>
		                                                        <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='MEDDEVICE']/n1:entry/n1:observation">
		                                                            <tr>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:call-template name="formatDatewithTime">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>	
		                                                        		    </p>
                                                                        </td>
		                                                        		<td class="param">
                                                                            <p class="tableresult">
					        												    <xsl:value-of select="./n1:code/n1:originalText"/>	
		                                                        		    </p>
                                                                        </td>
					        											<td class="param">
                                                                            <p class="tableresult">
		                                                        		        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='9078']/n1:value/@value"/>		
		                                                        		    </p>
                                                                        </td>
		                                                        	</tr>
		                                                        </xsl:for-each>
					        	                            </xsl:otherwise>
		                                                </xsl:choose>
					        					    </table>
					        					</p>
					        	            </td>
		                                </tr>
					        	    </xsl:when>
		                        </xsl:choose>
					            <xsl:choose>
				                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='VITALPARAM']">
                                        <tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Витальные параметры</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='VITALPARAM']/n1:entry/n1:observation">
					                                <p class="tableblack">
					        					        <xsl:value-of select="./n1:code/@displayName"/>
					        							<xsl:choose>
                                                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='6034']/n1:value[not(@nullFlavor)]">
                                                                <xsl:text> (</xsl:text>
				            		                    		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='6034']/n1:value/@displayName"/>
				            		                    		<xsl:text>) </xsl:text>
                                                            </xsl:when>
                                                        </xsl:choose>
				            		                    <xsl:choose>
				            				            	<xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8034']/n1:value[not(@nullFlavor)]">
                                                                <xsl:text> [</xsl:text>
				            		                    		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8034']/n1:value/@value"/>
				            		                    		<xsl:text>]</xsl:text>
                                                            </xsl:when>
                                                        </xsl:choose>
					        							<xsl:text>: </xsl:text>
					        							<xsl:choose>
				            	                        	<xsl:when test="./n1:value[not(@nullFlavor)]">
				            		                    		<xsl:if test="./n1:value/@xsi:type='ST'">
				            		                    		    <xsl:value-of select="./n1:value"/>
				            		                    		</xsl:if>
				            		                    		<xsl:if test="./n1:value/@xsi:type='PQ'">
				            		                    		    <xsl:value-of select="./n1:value/@value"/>
				            		                    		</xsl:if>
				            		                    		<xsl:if test="./n1:value/@xsi:type='CD'">
				            		                    		    <xsl:value-of select="./n1:value/@displayName"/>
				            		                    		</xsl:if>
				            		                               <xsl:if test="./n1:value/@xsi:type='INT'">
				            		                    		    <xsl:value-of select="./n1:value/@value"/>
				            		                    		</xsl:if>
				            		                    		<xsl:if test="./n1:value/@xsi:type='BL'">
				            		                    		    <xsl:if test="./n1:value/@value='true'">
				            		                    		        <xsl:text>&#9745;</xsl:text>
				            		                    		    </xsl:if>
				            		                    		    <xsl:if test="./n1:value/@value='false'">
				            		                    		        <xsl:text>&#9744;</xsl:text>
				            		                    		    </xsl:if>
				            		                    		</xsl:if>
				            		                            <xsl:if test="./n1:value/@xsi:type='IVL_TS'">
				            		                                <xsl:call-template name="formatDate">
                                                                        <xsl:with-param name="newdate" select="./n1:value/n1:low/@value"/>
                                                                    </xsl:call-template>
				            		                                <xsl:choose>
                                                                        <xsl:when test="./n1:value/n1:high">
				            		                                        <xsl:text> &#8212; </xsl:text>
				            		                                        <xsl:call-template name="formatDate">
                                                                                <xsl:with-param name="newdate" select="./n1:value/n1:high/@value"/>
                                                                            </xsl:call-template>
				            		                                    </xsl:when>	
				            		                                </xsl:choose> 
				            		                            </xsl:if>
				            		                            <xsl:if test="./n1:value/@xsi:type='TS'">
				            		                                <xsl:call-template name="formatDate">
                                                                        <xsl:with-param name="newdate" select="./n1:value/@value"/>
                                                                    </xsl:call-template>
				            		                            </xsl:if>
				            		                        </xsl:when>
				            		                        <xsl:when test="./n1:value/@nullFlavor">
				            		                          	<xsl:call-template name="formatNullFlavor">
                                                                    <xsl:with-param name="nullflavor" select="./n1:value/@nullFlavor"/>
                                                                </xsl:call-template>
				            		                        </xsl:when>
				            	                        </xsl:choose>
					        							<xsl:text> </xsl:text>
					        							<xsl:value-of select="./n1:value/n1:translation/@displayName"/>
					        							<xsl:choose>
				            	    	                    <xsl:when test="./n1:referenceRange/n1:observationRange/n1:value/n1:low[not(@nullFlavor)] or ./n1:referenceRange/n1:observationRange/n1:value/n1:high[not(@nullFlavor)]">
					        								    <xsl:text> [</xsl:text>
				            	    	                   	    <xsl:choose>
                                                                    <xsl:when test="./n1:referenceRange/n1:observationRange/n1:value/n1:low[not(@nullFlavor)] and ./n1:referenceRange/n1:observationRange/n1:value/n1:high[not(@nullFlavor)]">    
																	    <xsl:value-of select="./n1:referenceRange/n1:observationRange/n1:value/n1:low/@value"/>   
																		<xsl:text> &#8212; </xsl:text>
																		<xsl:value-of select="./n1:referenceRange/n1:observationRange/n1:value/n1:high/@value"/>
																		<xsl:text> </xsl:text>
																		<xsl:value-of select="./n1:referenceRange/n1:observationRange/n1:value/n1:high/n1:translation/@displayName"/>
						              	                	        </xsl:when>
																	<xsl:when test="./n1:referenceRange/n1:observationRange/n1:value/n1:low[not(@nullFlavor)]">    
																	    <xsl:text>&gt; </xsl:text>
																		<xsl:value-of select="./n1:referenceRange/n1:observationRange/n1:value/n1:low/@value"/>
																		<xsl:text> </xsl:text>
																		<xsl:value-of select="./n1:referenceRange/n1:observationRange/n1:value/n1:low/n1:translation/@displayName"/>
						              	                	        </xsl:when>
																	<xsl:when test="./n1:referenceRange/n1:observationRange/n1:value/n1:high[not(@nullFlavor)]">
																		<xsl:text>&lt; </xsl:text>
																		<xsl:value-of select="./n1:referenceRange/n1:observationRange/n1:value/n1:high/@value"/>
																		<xsl:text> </xsl:text>
																		<xsl:value-of select="./n1:referenceRange/n1:observationRange/n1:value/n1:high/n1:translation/@displayName"/>
						              	                	        </xsl:when>
						                                        </xsl:choose>
					        									<xsl:text>]</xsl:text>
				            			                    </xsl:when>
				            	    	                </xsl:choose>
					        							<xsl:choose>
				            	    	                    <xsl:when test="../../n1:effectiveTime/@value">
					        								    <xsl:text> (</xsl:text>
				            	    	                   	    <xsl:call-template name="formatDatewithTime">
                                                                    <xsl:with-param name="newdate" select="../../n1:effectiveTime/@value"/>
                                                                </xsl:call-template>
					        									<xsl:text>)</xsl:text>
				            			                    </xsl:when>
				            	    	                </xsl:choose>
					                                </p>
					        					</xsl:for-each>
					        			    </td>
					                    </tr>		
				                    </xsl:when>
			                    </xsl:choose>
					        	<xsl:choose>
                                    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SCORES'][not(@nullFlavor)]">
					        			<tr>
                                            <td colspan="8">
                                                <h2 class="tablegray">
 					                    		    <xsl:text>Объективизированная оценка состояния пациента</xsl:text>
                                                </h2>
					        					<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SCORES']/n1:entry/n1:observation">
												    <xsl:choose>
                                                        <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:value/@displayName and ./n1:value/@value">
					        					            <p class="tableblack">
					        					                <xsl:choose>
                                                                    <xsl:when test="./n1:effectiveTime/@value">
					        						        	        <xsl:call-template name="formatDatewithTime">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                        </xsl:call-template>
					        						        			<xsl:text> </xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:value-of select="./n1:code/@displayName"/>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:value/@value">
					        						        		    <xsl:text> &#8212; </xsl:text>
					        						        	        <xsl:value-of select="./n1:value/@value"/>
																		<xsl:choose>
                                                                            <xsl:when test="./n1:value/n1:translation/@code='128'">
					        						        	        	    <xsl:text> б.</xsl:text>
					        						        	            </xsl:when>
																			<xsl:otherwise> 
																			    <xsl:text> </xsl:text>
																				<xsl:value-of select="./n1:value/n1:translation/@displayName"/>
																			</xsl:otherwise> 
                                                                        </xsl:choose>
					        						        	    </xsl:when>
                                                                </xsl:choose>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:value/@displayName">
					        						        		    <xsl:text> (</xsl:text>
					        						        	        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:value/@displayName"/>
					                                                   	<xsl:choose>
                                                                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:text">
                                                                                <xsl:text> [</xsl:text>
					                                                   	        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:text"/>
					                                                   	        <xsl:text>]</xsl:text>
                                                                            </xsl:when>
                                                                        </xsl:choose>
														    			<xsl:text>)</xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8037']/n1:value/@displayName">
					        						        		    <xsl:text> (</xsl:text>
					        						        	        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8037']/n1:value/@displayName"/>
														    			<xsl:text>)</xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8020']/n1:value/@displayName">
					        						        		    <xsl:text> ПАРАМЕТРЫ: </xsl:text>
					        						        	        <xsl:for-each select="./n1:entryRelationship/n1:observation[n1:code/@code='8020']">
					                                                        <xsl:value-of select="./n1:value/@displayName"/>
					                                                        <xsl:text>. </xsl:text>
					                                                    </xsl:for-each>
					        						        	    </xsl:when>
                                                                </xsl:choose>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:text">
					        						        		    <xsl:text> ПРИМЕЧАНИЯ: </xsl:text>
					        						        	        <xsl:value-of select="./n1:text"/>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:choose>
                                                                    <xsl:when test="./n1:performer/n1:assignedEntity/n1:id/@extension">
					        						        		    <xsl:text> МЕДИЦИНСКИЙ РАБОТНИК: </xsl:text>
					        						        	        <xsl:call-template name="formatFIO">
                                                                            <xsl:with-param name="formatfio" select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:id/@extension"/>
                                                                        </xsl:call-template>
					        						        			<xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        						        			    <xsl:text>; </xsl:text>
					        						        				<xsl:call-template name="formatFIO">
                                                                                <xsl:with-param name="formatfio" select="./n1:id/@extension"/>
                                                                            </xsl:call-template>
					        						        			</xsl:for-each>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        </p>
														</xsl:when>
														<xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:value/@displayName">
					        					            <p class="tableblack">
					        					                <xsl:choose>
                                                                    <xsl:when test="./n1:effectiveTime/@value">
					        						        	        <xsl:call-template name="formatDatewithTime">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                        </xsl:call-template>
					        						        			<xsl:text> </xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:value-of select="./n1:code/@displayName"/>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:value/@displayName">
					        						        		    <xsl:text> &#8212; </xsl:text>
					        						        	        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:value/@displayName"/>
					                                                   	<xsl:choose>
                                                                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:text">
                                                                                <xsl:text> [</xsl:text>
					                                                   	        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8019']/n1:text"/>
					                                                   	        <xsl:text>]</xsl:text>
                                                                            </xsl:when>
                                                                        </xsl:choose>
					        						        	    </xsl:when>
                                                                </xsl:choose>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8037']/n1:value/@displayName">
					        						        		    <xsl:text> (</xsl:text>
					        						        	        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8037']/n1:value/@displayName"/>
														    			<xsl:text>)</xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8020']/n1:value/@displayName">
					        						        		    <xsl:text> ПАРАМЕТРЫ: </xsl:text>
					        						        	        <xsl:for-each select="./n1:entryRelationship/n1:observation[n1:code/@code='8020']">
					                                                        <xsl:value-of select="./n1:value/@displayName"/>
					                                                        <xsl:text>. </xsl:text>
					                                                    </xsl:for-each>
					        						        	    </xsl:when>
                                                                </xsl:choose>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:text">
					        						        		    <xsl:text> ПРИМЕЧАНИЯ: </xsl:text>
					        						        	        <xsl:value-of select="./n1:text"/>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:choose>
                                                                    <xsl:when test="./n1:performer/n1:assignedEntity/n1:id/@extension">
					        						        		    <xsl:text> МЕДИЦИНСКИЙ РАБОТНИК: </xsl:text>
					        						        	        <xsl:call-template name="formatFIO">
                                                                            <xsl:with-param name="formatfio" select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:id/@extension"/>
                                                                        </xsl:call-template>
					        						        			<xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        						        			    <xsl:text>; </xsl:text>
					        						        				<xsl:call-template name="formatFIO">
                                                                                <xsl:with-param name="formatfio" select="./n1:id/@extension"/>
                                                                            </xsl:call-template>
					        						        			</xsl:for-each>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        </p>
														</xsl:when>
														<xsl:when test="./n1:value/@value">
					        					            <p class="tableblack">
					        					                <xsl:choose>
                                                                    <xsl:when test="./n1:effectiveTime/@value">
					        						        	        <xsl:call-template name="formatDatewithTime">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                        </xsl:call-template>
					        						        			<xsl:text> </xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:value-of select="./n1:code/@displayName"/>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:value/@value">
					        						        		    <xsl:text> &#8212; </xsl:text>
					        						        	        <xsl:value-of select="./n1:value/@value"/>
																		<xsl:choose>
                                                                            <xsl:when test="./n1:value/n1:translation/@code='128'">
					        						        	        	    <xsl:text> б.</xsl:text>
					        						        	            </xsl:when>
																			<xsl:otherwise> 
																			    <xsl:text> </xsl:text>
																				<xsl:value-of select="./n1:value/n1:translation/@displayName"/>
																			</xsl:otherwise> 
                                                                        </xsl:choose>
					        						        	    </xsl:when>
                                                                </xsl:choose>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8037']/n1:value/@displayName">
					        						        		    <xsl:text> (</xsl:text>
					        						        	        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8037']/n1:value/@displayName"/>
														    			<xsl:text>)</xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8020']/n1:value/@displayName">
					        						        		    <xsl:text> ПАРАМЕТРЫ: </xsl:text>
					        						        	        <xsl:for-each select="./n1:entryRelationship/n1:observation[n1:code/@code='8020']">
					                                                        <xsl:value-of select="./n1:value/@displayName"/>
					                                                        <xsl:text>. </xsl:text>
					                                                    </xsl:for-each>
					        						        	    </xsl:when>
                                                                </xsl:choose>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:text">
					        						        		    <xsl:text> ПРИМЕЧАНИЯ: </xsl:text>
					        						        	        <xsl:value-of select="./n1:text"/>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:choose>
                                                                    <xsl:when test="./n1:performer/n1:assignedEntity/n1:id/@extension">
					        						        		    <xsl:text> МЕДИЦИНСКИЙ РАБОТНИК: </xsl:text>
					        						        	        <xsl:call-template name="formatFIO">
                                                                            <xsl:with-param name="formatfio" select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:id/@extension"/>
                                                                        </xsl:call-template>
					        						        			<xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        						        			    <xsl:text>; </xsl:text>
					        						        				<xsl:call-template name="formatFIO">
                                                                                <xsl:with-param name="formatfio" select="./n1:id/@extension"/>
                                                                            </xsl:call-template>
					        						        			</xsl:for-each>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        </p>
														</xsl:when>
														<xsl:otherwise>
					        					            <p class="tableblack">
					        					                <xsl:choose>
                                                                    <xsl:when test="./n1:effectiveTime/@value">
					        						        	        <xsl:call-template name="formatDatewithTime">
                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                        </xsl:call-template>
					        						        			<xsl:text> </xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:value-of select="./n1:code/@displayName"/>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8037']/n1:value/@displayName">
					        						        		    <xsl:text> (</xsl:text>
					        						        	        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8037']/n1:value/@displayName"/>
														    			<xsl:text>)</xsl:text>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:choose>
                                                                    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8020']/n1:value/@displayName">
					        						        		    <xsl:text> ПАРАМЕТРЫ: </xsl:text>
					        						        	        <xsl:for-each select="./n1:entryRelationship/n1:observation[n1:code/@code='8020']">
					                                                        <xsl:value-of select="./n1:value/@displayName"/>
					                                                        <xsl:text>. </xsl:text>
					                                                    </xsl:for-each>
					        						        	    </xsl:when>
                                                                </xsl:choose>
														    	<xsl:choose>
                                                                    <xsl:when test="./n1:text">
					        						        		    <xsl:text> ПРИМЕЧАНИЯ: </xsl:text>
					        						        	        <xsl:value-of select="./n1:text"/>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        	<xsl:choose>
                                                                    <xsl:when test="./n1:performer/n1:assignedEntity/n1:id/@extension">
					        						        		    <xsl:text> МЕДИЦИНСКИЙ РАБОТНИК: </xsl:text>
					        						        	        <xsl:call-template name="formatFIO">
                                                                            <xsl:with-param name="formatfio" select="./n1:performer[n1:assignedEntity][1]/n1:assignedEntity/n1:id/@extension"/>
                                                                        </xsl:call-template>
					        						        			<xsl:for-each select="./n1:performer[n1:assignedEntity][position()>1]/n1:assignedEntity">
					        						        			    <xsl:text>; </xsl:text>
					        						        				<xsl:call-template name="formatFIO">
                                                                                <xsl:with-param name="formatfio" select="./n1:id/@extension"/>
                                                                            </xsl:call-template>
					        						        			</xsl:for-each>
					        						        	    </xsl:when>
                                                                </xsl:choose>
					        						        </p>
														</xsl:otherwise>
                                                    </xsl:choose>
					        				    </xsl:for-each>
					        			    </td>
					                    </tr>				
					        		</xsl:when>
					        	</xsl:choose>
					        </table>
						</xsl:when>
					</xsl:choose>	
					<xsl:choose>
						<xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']">
						    <table class="block-form">
						        <tr>   
								 	<td colspan="8">
								 		<h2 class="tablegray">
										    <xsl:text>Сведения о консультации</xsl:text>
										</h2>
					                    <tr>   
								        	<td colspan="8">
                                                <p class="tableblack">
												    <xsl:text>Состояние пациента: </xsl:text>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='804']/n1:value/@displayName"/>
                                                </p>
                                            </td>	
								        </tr>
										<xsl:choose>
                                            <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='836']/n1:value[not(@nullFlavor)]">
										        <tr>   
								                	<td colspan="8">
                                                        <p class="tableblack">
														    <xsl:text>Объективно: </xsl:text>
                                                            <xsl:copy-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='836']/n1:value"/>
                                                        </p>
                                                    </td>	
								                </tr>
											</xsl:when>
                                        </xsl:choose>
										<tr>   
								        	<td colspan="8">
                                                <p class="tableblack">
												    <xsl:text>Заключение: </xsl:text>
                                                    <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='806']/n1:value"/>
                                                </p>
                                            </td>	
								        </tr>
										<xsl:choose>
                                            <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='808'][not(@nullFlavor)]">
										        <tr>   
								                	<td colspan="8">
								                	    <h2 class="tablegray">
								                			<xsl:text>Выявленные патологии</xsl:text>
                                                        </h2>
														<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DOCINFO']/n1:entry/n1:observation[n1:code/@code='808']">
                                                            <p class="tableblack">
															    <xsl:choose>
					                                                <xsl:when test="./n1:value/n1:originalText[not(@nullFlavor)] and ./n1:value/@displayName">
                                                                        <xsl:value-of select="./n1:value/@displayName"/>
																		<xsl:text> (</xsl:text>
											                        	<xsl:value-of select="./n1:value/n1:originalText"/>
																		<xsl:text>)</xsl:text>
					    	                                        </xsl:when>
																	<xsl:when test="./n1:value/n1:originalText[not(@nullFlavor)]">
											                        	<xsl:value-of select="./n1:value/n1:originalText"/>
					    	                                        </xsl:when>
																	<xsl:when test="./n1:value/@displayName">
                                                                        <xsl:value-of select="./n1:value/@displayName"/>
					    	                                        </xsl:when>
					    	                                    </xsl:choose>
                                                            </p>
														</xsl:for-each>
                                                    </td>	
								                </tr>
											</xsl:when>
                                        </xsl:choose>
									</td>	
								</tr>	
							</table>	
						</xsl:when>	
					</xsl:choose>
					<table class="block-form">
					    <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='DGN']/n1:entry/n1:observation[n1:code/@code='838']">
					        <tr>
                                <td colspan="8">
                                    <h2 class="tablegray">
						    			<xsl:text>Диагноз</xsl:text>
									    <xsl:choose>
						                    <xsl:when test="./n1:effectiveTime/@value">
						                        <xsl:text> от </xsl:text>
						                        <xsl:call-template name="formatDatewithTime">
                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                </xsl:call-template>
						                 	</xsl:when>
						                </xsl:choose>
                                    </h2>
								    <xsl:for-each select="./n1:entryRelationship/n1:observation">
								        <p class="tableblack">
										    <xsl:value-of select="./n1:code/@displayName"/>
											<xsl:text>: </xsl:text>
											<xsl:choose>
					                            <xsl:when test="./n1:text">
												    <xsl:value-of select="./n1:value/@code"/>
													<xsl:text> </xsl:text>
											    	<xsl:value-of select="./n1:text"/>
					    	                    </xsl:when>
											    <xsl:otherwise>
												    <xsl:value-of select="./n1:value/@code"/>
													<xsl:text> </xsl:text>
											        <xsl:value-of select="./n1:value/@displayName"/>
											    </xsl:otherwise>
					    	                </xsl:choose>
								            <xsl:choose>
					                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='7026']">
									    	    	<xsl:text> Степень обоснованности диагноза: </xsl:text>
											    	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='7026']/n1:value/@displayName"/>
					    	                    </xsl:when>
					    	                </xsl:choose>
											<xsl:choose>
					                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='12014']">
									    	        <xsl:text> Характер заболевания: </xsl:text>
											        <xsl:choose>
					                                   <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='12014']/n1:value/@displayName">
												        	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12014']/n1:value/@displayName"/>
												        </xsl:when>
												        <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='12014']/n1:value/@nullFlavor">
														    <xsl:call-template name="formatNullFlavor">
                                                               <xsl:with-param name="nullflavor" select="./n1:entryRelationship/n1:observation[n1:code/@code='12014']/n1:value/@nullFlavor"/>
                                                            </xsl:call-template>
														</xsl:when>
					    	                        </xsl:choose>
												</xsl:when>
					    	                </xsl:choose>
											<xsl:choose>
					                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='823']">
												    <xsl:text> Внешняя причина: </xsl:text>
											        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='823']/n1:value/@displayName"/>
											    </xsl:when>
					    	                </xsl:choose>
											<xsl:choose>
					                            <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='824']">
												    <xsl:text> Вид травмы по способу получения: </xsl:text>
											        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='824']/n1:value/@displayName"/>
											    </xsl:when>
					    	                </xsl:choose>
											<xsl:choose>
                                                <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='12120']">
											        <xsl:text> Дата установления диагноза впервые в жизни: </xsl:text>
											   		<xsl:call-template name="formatDate">
                                                        <xsl:with-param name="newdate" select="./n1:entryRelationship/n1:observation[n1:code/@code='12120']/n1:effectiveTime/@value"/>
                                                    </xsl:call-template>
											    </xsl:when>
						                    </xsl:choose>
											<xsl:choose>
                                                <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='12120']">
											   		<xsl:text> Достоверность подтверждения даты установления диагноза впервые в жизни: </xsl:text>
											   		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12120']/n1:value/@displayName"/>
											    </xsl:when>
						                    </xsl:choose>	
											<xsl:choose>
                                                <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='12120']/n1:entryRelationship/n1:observation[n1:code/@code='12393']">
											   		<xsl:text> Возраст пациента на дату установления диагноза впервые в жизни: </xsl:text>
											   		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='12120']/n1:entryRelationship/n1:observation[n1:code/@code='12393']/n1:value/@value"/>
											    </xsl:when>
						                    </xsl:choose>
											<xsl:choose>
                                                <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8004']">
											   		<xsl:text> Срок беременности: </xsl:text>
											   		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8004']/n1:value/@value"/>
											        <xsl:text> </xsl:text>
											   		<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8004']/n1:value/n1:translation/@displayName"/>
											    </xsl:when>
						                    </xsl:choose>
											<xsl:choose>
                                                <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8045']">
												    <xsl:text> </xsl:text>
											        <xsl:choose>
                                                        <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8045']/n1:entryRelationship/n1:observation[n1:code/@code='6047']">
											                <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8045']/n1:entryRelationship/n1:observation[n1:code/@code='6047']/n1:value/@displayName"/>
											            	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8045']/n1:entryRelationship/n1:observation[n1:code/@code='6048']/n1:value/@displayName"/>
											            	<xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8045']/n1:entryRelationship/n1:observation[n1:code/@code='6049']/n1:value/@displayName"/>
											            </xsl:when>	
						                            </xsl:choose>
											        <xsl:choose>
                                                        <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='8045']/n1:entryRelationship/n1:observation[n1:code/@code='6050']">
											        		<xsl:text>, стадия </xsl:text>
											                <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='8045']/n1:entryRelationship/n1:observation[n1:code/@code='6050']/n1:value/@displayName"/>
											            </xsl:when>	
						                            </xsl:choose>
												</xsl:when>	
						                    </xsl:choose>
										</p>
									</xsl:for-each>
								</td>
                            </tr>	
						</xsl:for-each>
						<xsl:choose>
                            <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='REGIME']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value[not(@nullFlavor)]">
					            <tr>
                                    <td colspan="8">
                                        <h2 class="tablegray">
                                            <xsl:text>Рекомендации по дальнейшему наблюдению, дообследованию, лечению и медицинской реабилитации</xsl:text>
                                        </h2>
					               		<p class="tableblack">
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='REGIME']/n1:entry/n1:observation[n1:code/@code='7006']/n1:value"/>
                                        </p>
                                    </td>
                                </tr>
					        </xsl:when>
                        </xsl:choose>
						<xsl:choose>
						    <xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='LINKDOCS']">
						        <tr> 	
						        	<td colspan="8">
						         		<h2 class="tablegray">
						        		    <xsl:text>Связанные документы</xsl:text>
						        		</h2>
						                <xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='LINKDOCS']/n1:entry/n1:act">
					                        <tr>   
						                 		<td colspan="8">
                                                    <p class="tableblack">
													    <xsl:value-of select="./n1:code/@displayName"/>
						                	            <xsl:choose>
						                 				    <xsl:when test="./n1:effectiveTime/@value">
						                 				        <xsl:text> от </xsl:text>
						                 				        <xsl:call-template name="formatDate">
                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                </xsl:call-template>
						                 					</xsl:when>
						                 				</xsl:choose>
						                 				<xsl:choose>
						                 				    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='11002']/n1:value">
						                 				        <xsl:text> (</xsl:text>
						                 				        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='11002']/n1:value"/>
						                			            <xsl:text>)</xsl:text>
						                 					</xsl:when>
						                 				</xsl:choose>
						                 				<xsl:choose>
						                 				    <xsl:when test="./n1:entryRelationship/n1:observation[n1:code/@code='11003']/n1:value">
						                 				        <xsl:text> № </xsl:text>
						                 				        <xsl:value-of select="./n1:entryRelationship/n1:observation[n1:code/@code='11003']/n1:value"/>
						                 					</xsl:when>
						                 				</xsl:choose>
														<xsl:choose>
						                 				    <xsl:when test="./n1:text">
						                 				        <xsl:text>. </xsl:text>
						                 				        <xsl:value-of select="./n1:text"/>
						                 					</xsl:when>
						                 				</xsl:choose>
                                                    </p>
                                                </td>	
						                 	</tr>
						                </xsl:for-each>
						        	</td>	
						        </tr>	
						    </xsl:when>
						</xsl:choose>	
					</table>
					<xsl:choose>
						<xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SERVICES']">
						    <table class="block-form">
					            <tr>   
								    <td colspan="8">
								        <h2 class="tablegray">
                                            <xsl:text>Оказанные услуги</xsl:text>
										</h2>
										<xsl:choose>
											<xsl:when test="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SERVICES']/n1:entry/n1:observation/n1:text">
										        <p class="tableblack">
										        	<table class="table-break">
					                                    <tr>
					                                        <th class="paramuslugi">Дата</th>
						                                    <th class="paramuslugi">Услуга</th>
															<th class="paramuslugi">Код</th>
						                        			<th class="paramuslugi">Примечание</th>
						                                </tr>
						                        		<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SERVICES']/n1:entry/n1:observation[n1:code/@code='12168']">
						                                    <tr>
								                	            <td class="param">
                                                                    <p class="tableresultuslugi">
																		<xsl:choose>
																		    <xsl:when test="./n1:effectiveTime/@value">
								         		                                <xsl:call-template name="formatDatewithTime">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
								         		                        	</xsl:when>
								         		                            <xsl:when test="./n1:effectiveTime/n1:low/@value">
								         		                                <xsl:text> </xsl:text>
								         		                                <xsl:call-template name="formatDatewithTime">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
												                        		<xsl:choose>
								         		                                    <xsl:when test="./n1:effectiveTime/n1:high/@value">
								         		                                        <xsl:text> &#8212; </xsl:text>
								         		                                        <xsl:call-template name="formatDatewithTime">
                                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                        </xsl:call-template>
								         		                                	</xsl:when>
								         		                                </xsl:choose>
								         		                        	</xsl:when>
								         		                        </xsl:choose>
						                                            </p>
                                                                </td>
								                	            <td class="param">
								                	            	<p class="tableresultuslugi">
										        		                <xsl:value-of select="./n1:value/@displayName"/>	
						                                            </p>
								                	            </td>
																<td class="param">
								                	            	<p class="tableresultuslugi">
								                			    	    <xsl:value-of select="./n1:value/@code"/>
						                                            </p>
								                	            </td>
								                	            <td class="param">
                                                                    <p class="tableresultuslugi">
						                                               	<xsl:value-of select="../../n1:text"/>	
						                                            </p>
                                                                </td>
								                	        </tr>
						                                </xsl:for-each>
						                            </table>
										        </p>
											</xsl:when>
											<xsl:otherwise>
										        <p class="tableblack">
										        	<table class="table-break">
					                                    <tr>
					                                        <th class="paramuslugi">Дата</th>
						                                    <th class="paramuslugi">Услуга</th>
															<th class="paramuslugi">Код</th>
						                                </tr>
						                        		<xsl:for-each select="/n1:ClinicalDocument/n1:component/n1:structuredBody/n1:component/n1:section[n1:code/@code='SERVICES']/n1:entry/n1:observation[n1:code/@code='12168']">
						                                    <tr>
								                	            <td class="param">
                                                                    <p class="tableresultuslugi">
																		<xsl:choose>
																		    <xsl:when test="./n1:effectiveTime/@value">
								         		                                <xsl:call-template name="formatDatewithTime">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/@value"/>
                                                                                </xsl:call-template>
								         		                        	</xsl:when>
								         		                            <xsl:when test="./n1:effectiveTime/n1:low/@value">
								         		                                <xsl:text> </xsl:text>
								         		                                <xsl:call-template name="formatDatewithTime">
                                                                                    <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:low/@value"/>
                                                                                </xsl:call-template>
												                        		<xsl:choose>
								         		                                    <xsl:when test="./n1:effectiveTime/n1:high/@value">
								         		                                        <xsl:text> &#8212; </xsl:text>
								         		                                        <xsl:call-template name="formatDatewithTime">
                                                                                            <xsl:with-param name="newdate" select="./n1:effectiveTime/n1:high/@value"/>
                                                                                        </xsl:call-template>
								         		                                	</xsl:when>
								         		                                </xsl:choose>
								         		                        	</xsl:when>
								         		                        </xsl:choose>
						                                            </p>
                                                                </td>
								                	            <td class="param">
								                	            	<p class="tableresultuslugi">
										        		                <xsl:value-of select="./n1:value/@displayName"/>	
						                                            </p>
								                	            </td>
																<td class="param">
								                	            	<p class="tableresultuslugi">
								                			    	    <xsl:value-of select="./n1:value/@code"/>	
						                                            </p>
								                	            </td>
								                	        </tr>
						                                </xsl:for-each>
						                            </table>
										        </p>
											</xsl:otherwise>	
					                    </xsl:choose>
                                    </td>	
								</tr>
							</table>	
						</xsl:when>	
					</xsl:choose>
					<table class="end-block-form">	
			            <tr>
                            <td colspan="8">
                                <h2 class="tablegray">
                                    <xsl:text>Документ составил</xsl:text>
                                </h2>
					    		<p class="tableblack">
                                    <xsl:choose>
                                        <xsl:when test="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:code[not(@nullFlavor)]">
										    <xsl:value-of select="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:code/@displayName"/>
											<xsl:text>, </xsl:text>
                                            <xsl:value-of select="/n1:ClinicalDocument/n1:author/n1:assignedAuthor/n1:assignedPerson/n1:name"/>
                                        </xsl:when>
                                    </xsl:choose>
                                </p>
                            </td>
                        </tr>
                    </table>
            </body>
		</html>
	</xsl:template>	
	<xsl:template name="getR">
        <xsl:param name="templateId"/>
        <xsl:variable name="templateIdLength" select="string-length($templateId)"/>
        <xsl:value-of select="substring ($templateId, $templateIdLength, 1)"/>
    </xsl:template>
    <xsl:template name="getYear">
        <xsl:param name="date"/>
        <xsl:variable name="dateLength" select="string-length($date)"/>
                <xsl:value-of select="substring ($date, 1, 4)"/>
    </xsl:template>
    <xsl:template name="getMonth">
        <xsl:param name="date"/>
        <xsl:variable name="dateLength" select="string-length($date)"/>
        <xsl:variable name="month" select="substring ($date, 5, 2)"/>
        <xsl:choose>
            <xsl:when test="$dateLength>=6">
                <xsl:value-of select="substring ($date, 5, 2)"/>
			    <xsl:text>&#46;</xsl:text>
			</xsl:when>
        </xsl:choose>
    </xsl:template>
	<xsl:template name="getTextMonth">
        <xsl:param name="date"/>
        <xsl:variable name="dateLength" select="string-length($date)"/>
        <xsl:variable name="month" select="substring ($date, 5, 2)"/>
        <xsl:choose>
            <xsl:when test="$dateLength>=6">
                <xsl:choose>
                    <xsl:when test="$month='01'">
                        <xsl:text>января</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='02'">
                        <xsl:text>Февраля</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='03'">
                        <xsl:text>марта</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='04'">
                        <xsl:text>апреля</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='05'">
                        <xsl:text>мая</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='06'">
                        <xsl:text>июня</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='07'">
                        <xsl:text>июля</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='08'">
                        <xsl:text>августа</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='09'">
                        <xsl:text>сентября</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='10'">
                        <xsl:text>октября</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='11'">
                        <xsl:text>ноября</xsl:text>
                    </xsl:when>
                    <xsl:when test="$month='12'">
                        <xsl:text>декабря</xsl:text>
                    </xsl:when>
                </xsl:choose>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getDay">
        <xsl:param name="date"/>
        <xsl:variable name="dateLength" select="string-length($date)"/>
        <xsl:choose>
            <xsl:when test="$dateLength>=8">
                <xsl:value-of select="substring ($date, 7, 2)"/>
				<xsl:text>&#46;</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getName">
        <xsl:param name="name"/>
        <xsl:choose>
            <xsl:when test="$name/n1:family">
                <xsl:if test="$name/n1:prefix">
                    <xsl:value-of select="$name/n1:prefix"/>
                    <xsl:text></xsl:text>
                </xsl:if>
                <xsl:value-of select="$name/n1:family"/>
                <xsl:text></xsl:text>
                <xsl:value-of select="$name/n1:given[1]"/>
                <xsl:text></xsl:text>
                <xsl:value-of select="$name/n1:given[2]"/>
                <xsl:text></xsl:text>
                <xsl:if test="$name/n1:suffix">
                    <xsl:value-of select="$name/n1:suffix"/>
                </xsl:if>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="$name"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getHour">
        <xsl:param name="date"/>
        <xsl:variable name="dateLength" select="string-length($date)"/>
        <xsl:choose>
            <xsl:when test="$dateLength>=10">
			    <xsl:text> </xsl:text>
                <xsl:value-of select="substring ($date, 9, 2)"/>
				<xsl:text>&#58;</xsl:text>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getMinute">
        <xsl:param name="date"/>
        <xsl:variable name="dateLength" select="string-length($date)"/>
        <xsl:choose>
            <xsl:when test="$dateLength>=12">
                <xsl:value-of select="substring ($date, 11, 2)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getSecond">
        <xsl:param name="date"/>
        <xsl:variable name="dateLength" select="string-length($date)"/>
        <xsl:choose>
            <xsl:when test="$dateLength>=14">
                <xsl:value-of select="substring ($date, 13, 5)"/>
            </xsl:when>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getMKB">
        <xsl:param name="code"/>
        <xsl:param name="pos"/>
        <xsl:value-of select="substring ($code, $pos, 1)"/>
    </xsl:template>
	<xsl:template name="getAges">
	    <xsl:param name="age"/>
		<xsl:variable name="agestr" select="string($age)"/>
        <xsl:variable name="agebefore100" select="substring($agestr, 2, 1)"/>
		<xsl:variable name="ageafter100" select="substring($agestr, 3, 1)"/>
		<xsl:variable name="age1234" select="substring($agestr, 1, 1)"/>
            <xsl:if test="string-length($agestr)=2">
                <xsl:choose>
                    <xsl:when test="($agebefore100='1') and (number($agestr)&gt;20)">
                        <xsl:text> год</xsl:text>
                    </xsl:when>
					<xsl:when test="(($agebefore100='2') or ($agebefore100='3') or ($agebefore100='4')) and (number($agestr)&gt;20)">
                        <xsl:text> года</xsl:text>
                    </xsl:when>
			        <xsl:otherwise>
                        <xsl:text> лет</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
			</xsl:if>
			<xsl:if test="string-length($agestr)=1">
                <xsl:choose>
                    <xsl:when test="$age1234='1'">
                        <xsl:text> год</xsl:text>
                    </xsl:when>
					<xsl:when test="($age1234='2') or ($age1234='3') or ($age1234='4')">
                        <xsl:text> года</xsl:text>
                    </xsl:when>
			        <xsl:otherwise>
                        <xsl:text> лет</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
			</xsl:if>
			<xsl:if test="(number($agestr)&gt;100) and (number($agestr)&lt;110)">
                 <xsl:choose>
                     <xsl:when test="($ageafter100='1')">
                         <xsl:text> год</xsl:text>
                     </xsl:when>
					 <xsl:when test="($ageafter100='2') or ($ageafter100='3') or ($ageafter100='4')">
                         <xsl:text> года</xsl:text>
                     </xsl:when>
			        <xsl:otherwise>
                        <xsl:text> лет</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
			<xsl:if test="(number($agestr)&gt;120)">
                 <xsl:choose>
				 <xsl:when test="($ageafter100='1')">
                         <xsl:text> год</xsl:text>
                     </xsl:when>
					 <xsl:when test="($ageafter100='2') or ($ageafter100='3') or ($ageafter100='4')">
                        <xsl:text> года</xsl:text>
                     </xsl:when>
			        <xsl:otherwise>
                        <xsl:text> лет</xsl:text>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:if>
	</xsl:template>
    <xsl:template name="getAge">
        <xsl:param name="birthdate"/>
        <xsl:param name="deathdate"/>
        <xsl:param name="withtext"/>
        <xsl:variable name="bDay" select="substring ($birthdate, 7, 2)"/>
        <xsl:variable name="dDay" select="substring ($deathdate, 7, 2)"/>
        <xsl:variable name="bMonth" select="substring ($birthdate, 5, 2)"/>
        <xsl:variable name="dMonth" select="substring ($deathdate, 5, 2)"/>
        <xsl:variable name="bYear" select="substring ($birthdate, 1, 4)"/>
        <xsl:variable name="dYear" select="substring ($deathdate, 1, 4)"/>
		<xsl:variable name="age1" select="number($dYear)-number($bYear)"/>
		<xsl:variable name="age2" select="number($dYear)-number($bYear)-1"/>
        <xsl:choose>
            <xsl:when test="number($dDay)-number($bDay)&gt;=0">
                <xsl:choose>
                    <xsl:when test="number($dMonth)-number($bMonth)&gt;=0">
                        <xsl:value-of select="$age1"/>
						<xsl:if test="$withtext=1">
						    <xsl:call-template name="getAges">
                                <xsl:with-param name="age" select="$age1"/>
                            </xsl:call-template>
						</xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$age2"/>
						<xsl:if test="$withtext=1">
							<xsl:call-template name="getAges">
                                <xsl:with-param name="age" select="$age2"/>
                            </xsl:call-template>
						</xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="number($dMonth)-number($bMonth)-1&gt;=0">
                        <xsl:value-of select="$age1"/>
						<xsl:if test="$withtext=1">
							<xsl:call-template name="getAges">
                                <xsl:with-param name="age" select="$age1"/>
                            </xsl:call-template>
						</xsl:if>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:value-of select="$age2"/>
						<xsl:if test="$withtext=1">
							<xsl:call-template name="getAges">
                                <xsl:with-param name="age" select="$age2"/>
                            </xsl:call-template>
						</xsl:if>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getMonths">
        <xsl:param name="birthdate"/>
        <xsl:param name="deathdate"/>
        <xsl:variable name="bDay" select="substring ($birthdate, 7, 2)"/>
        <xsl:variable name="dDay" select="substring ($deathdate, 7, 2)"/>
        <xsl:variable name="bMonth" select="substring ($birthdate, 5, 2)"/>
        <xsl:variable name="dMonth" select="substring ($deathdate, 5, 2)"/>
        <xsl:variable name="bYear" select="substring ($birthdate, 1, 4)"/>
        <xsl:variable name="dYear" select="substring ($deathdate, 1, 4)"/>
        <xsl:choose>
            <xsl:when test="number($dYear)=number($bYear)">
                <xsl:choose>
                    <xsl:when test="(string-length($birthdate)>=8) and (string-length($deathdate)>=8)">
                        <xsl:choose>
                            <xsl:when test="number($dDay)&gt;=number($bDay)">
                                <xsl:value-of select="number($dMonth)-number($bMonth)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="number($dMonth)-number($bMonth)-1"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="(string-length($birthdate)&lt;6) or (string-length($deathdate)&lt;6)">
                                <xsl:value-of select="0"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="number($dMonth)-number($bMonth)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:choose>
                    <xsl:when test="(string-length($birthdate)>=8) and (string-length($deathdate)>=8)">
                        <xsl:choose>
                            <xsl:when test="number($dDay)&gt;=number($bDay)">
                                <xsl:value-of select="number($dMonth)+12-number($bMonth)"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="number($dMonth)+12-number($bMonth)-1"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="(string-length($birthdate)&lt;6) or (string-length($deathdate)&lt;6)">
                                <xsl:value-of select="12"/>
                            </xsl:when>
                            <xsl:otherwise>
                                <xsl:value-of select="number($dMonth)+12-number($bMonth)"/>
                            </xsl:otherwise>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="getDays">
        <xsl:param name="birthdate"/>
        <xsl:param name="deathdate"/>
        <xsl:variable name="bDay" select="substring ($birthdate, 7, 2)"/>
        <xsl:variable name="dDay" select="substring ($deathdate, 7, 2)"/>
        <xsl:variable name="bMonth" select="substring ($birthdate, 5, 2)"/>
        <xsl:variable name="dMonth" select="substring ($deathdate, 5, 2)"/>
        <xsl:variable name="dYear" select="substring ($deathdate, 1, 4)"/>
        <xsl:choose>
            <xsl:when test="(string-length($birthdate)>=8) and (string-length($deathdate)>=8)">
                <xsl:choose>
                    <xsl:when test="number($dDay)&gt;=number($bDay)">
                        <xsl:value-of select="number($dDay)-number($bDay)"/>
                    </xsl:when>
                    <xsl:otherwise>
                        <xsl:choose>
                            <xsl:when test="number($dMonth)=1">
                                <xsl:value-of select="number($dDay)+31-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=2">
                                <xsl:value-of select="number($dDay)+31-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=3">
                                <xsl:choose>
                                    <xsl:when test="number($dYear) mod 4=0">
                                        <xsl:choose>
                                            <xsl:when test="(number($dYear) mod 100)=0">
                                                <xsl:choose>
                                                    <xsl:when test="(number($dYear) mod 400)=0">
                                                        <xsl:value-of select="number($dDay)+28-number($bDay)"/>
                                                    </xsl:when>
                                                    <xsl:otherwise>
                                                        <xsl:value-of select="number($dDay)+29-number($bDay)"/>
                                                    </xsl:otherwise>
                                                </xsl:choose>
                                            </xsl:when>
                                            <xsl:otherwise>
                                                <xsl:value-of select="number($dDay)+29-number($bDay)"/>
                                            </xsl:otherwise>
                                        </xsl:choose>
                                    </xsl:when>
                                    <xsl:otherwise>
                                        <xsl:value-of select="number($dDay)+28-number($bDay)"/>
                                    </xsl:otherwise>
                                </xsl:choose>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=4">
                                <xsl:value-of select="number($dDay)+31-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=5">
                                <xsl:value-of select="number($dDay)+30-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=6">
                                <xsl:value-of select="number($dDay)+31-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=7">
                                <xsl:value-of select="number($dDay)+30-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=8">
                                <xsl:value-of select="number($dDay)+31-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=9">
                                <xsl:value-of select="number($dDay)+31-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=10">
                                <xsl:value-of select="number($dDay)+30-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=11">
                                <xsl:value-of select="number($dDay)+31-number($bDay)"/>
                            </xsl:when>
                            <xsl:when test="number($dMonth)=12">
                                <xsl:value-of select="number($dDay)+30-number($bDay)"/>
                            </xsl:when>
                        </xsl:choose>
                    </xsl:otherwise>
                </xsl:choose>
            </xsl:when>
            <xsl:otherwise>
                <xsl:value-of select="0"/>
            </xsl:otherwise>
        </xsl:choose>
    </xsl:template>
    <xsl:template name="formatDate">
        <xsl:param name="newdate"/>
			<xsl:call-template name="getDay">
                <xsl:with-param name="date" select="$newdate"/>
            </xsl:call-template>
			<xsl:call-template name="getMonth">
                <xsl:with-param name="date" select="$newdate"/>
            </xsl:call-template>
			<xsl:call-template name="getYear">
                <xsl:with-param name="date" select="$newdate"/>
            </xsl:call-template>
	</xsl:template>
	<xsl:template name="formatDatewithTime">
        <xsl:param name="newdate"/>
		<xsl:call-template name="getDay">
            <xsl:with-param name="date" select="$newdate"/>
        </xsl:call-template>
		<xsl:call-template name="getMonth">
            <xsl:with-param name="date" select="$newdate"/>
        </xsl:call-template>
		<xsl:call-template name="getYear">
            <xsl:with-param name="date" select="$newdate"/>
        </xsl:call-template>
		<xsl:call-template name="getHour">
            <xsl:with-param name="date" select="$newdate"/>
        </xsl:call-template>
		<xsl:call-template name="getMinute">
            <xsl:with-param name="date" select="$newdate"/>
        </xsl:call-template>
	</xsl:template>
	<xsl:template name="formatContact">
        <xsl:param name="contact"/>
		    <xsl:choose>
			    <xsl:when test="substring($contact,1,4)='tel:'">
				    <xsl:text>Тел: </xsl:text>
					<xsl:choose>
			            <xsl:when test="substring-after(substring-before($contact[1], '='), ';')='ext'">
					        <xsl:value-of select="substring-after(substring-before($contact[1], ';'), ':')"/>
							<xsl:text> доб.[</xsl:text>
					        <xsl:value-of select="substring-after($contact[1], '=')"/>
					        <xsl:text>]</xsl:text>
						</xsl:when>
						<xsl:otherwise>
						    <xsl:value-of select="substring-after($contact[1], ':')"/> 
						</xsl:otherwise>
					</xsl:choose>	 
				    <xsl:for-each select="$contact[position()>1]">
					    <xsl:text>; </xsl:text>
                        <xsl:value-of select="substring-after($contact[position()>1], ':')"/>
					</xsl:for-each>	
                </xsl:when>
                <xsl:when test="substring($contact,1,7)='mailto:'">
				    <xsl:text>E-mail: </xsl:text>
					<xsl:value-of select="substring-after($contact[1], ':')"/>
				    <xsl:for-each select="$contact[position()>1]">
					    <xsl:text>; </xsl:text>
                        <xsl:value-of select="substring-after($contact[position()>1], ':')"/>
					</xsl:for-each>	
                </xsl:when>
				<xsl:when test="substring($contact,1,5)='http:'">
				    <xsl:text>Сайт: </xsl:text>
					<xsl:value-of select="substring-after($contact[1], ':')"/>
				    <xsl:for-each select="$contact[position()>1]">
					    <xsl:text>; </xsl:text>
                        <xsl:value-of select="substring-after($contact[position()>1], ':')"/>
					</xsl:for-each>	
                </xsl:when>
				<xsl:when test="substring($contact,1,4)='fax:'">
				    <xsl:text>Факс: </xsl:text>
					<xsl:value-of select="substring-after($contact[1], ':')"/>
				    <xsl:for-each select="$contact[position()>1]">
					    <xsl:text>; </xsl:text>
                        <xsl:value-of select="substring-after($contact[position()>1], ':')"/>
					</xsl:for-each>	
                </xsl:when>
			</xsl:choose>
	</xsl:template>
	<xsl:template name="formatMedCard">
        <xsl:param name="medcard"/>
		    <xsl:choose>
			    <xsl:when test="$medcard='1'">
                    <xsl:text>Номер	амбулаторной карты: </xsl:text>
                </xsl:when>
                <xsl:when test="$medcard='2'">
                    <xsl:text>Номер	стационарной карты: </xsl:text>
                </xsl:when>
                <xsl:when test="$medcard='3'">
                    <xsl:text>Номер	медицинской карты: </xsl:text>
                </xsl:when>
				<xsl:otherwise>
                    <xsl:text>Номер	медицинской карты: </xsl:text>
                </xsl:otherwise>
			</xsl:choose>	
	</xsl:template>
	<xsl:template name="formatNullFlavor">
        <xsl:param name="nullflavor"/>
		    <xsl:choose>
			    <xsl:when test="$nullflavor='INV'">
                    <xsl:text>Недопустимое значение</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='NI'">
                    <xsl:text>Нет информации</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='OTH'">
                    <xsl:text>Другое</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='NINF'">
                    <xsl:text>Минус бесконечность</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='PINF'">
                    <xsl:text>Плюс бесконечность</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='NA'">
                    <xsl:text>Неприменимо</xsl:text>
                </xsl:when>
				<xsl:when test="$nullflavor='UNK'">
                    <xsl:text>Неизвестно</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='ASKU'">
                    <xsl:text>Запрошено, но неизвестно</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='NAV'">
                    <xsl:text>Временно недоступно</xsl:text>
                </xsl:when>
				<xsl:when test="$nullflavor='NASK'">
                    <xsl:text>Не запрашивалось</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='TRC'">
                    <xsl:text>Трудноразличимо</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='MSK'">
                    <xsl:text>Скрыто</xsl:text>
                </xsl:when>
				<xsl:when test="$nullflavor='DER'">
                    <xsl:text>Извлекаемое значение</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='UNC'">
                    <xsl:text>Кодирование не проводилось</xsl:text>
                </xsl:when>
                <xsl:when test="$nullflavor='QS'">
                    <xsl:text>Достаточное количество</xsl:text>
                </xsl:when>
			</xsl:choose>	
	</xsl:template>
	<xsl:template name="formatFIO">
        <xsl:param name="formatfio"/>
		    <xsl:choose>
			    <xsl:when test="$formatfio=/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity/n1:id/@extension">
                    <xsl:value-of select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity[n1:id/@extension=$formatfio]/n1:assignedPerson/n1:name/n1:family"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity[n1:id/@extension=$formatfio]/n1:assignedPerson/n1:name/n1:given"/>
					<xsl:text> </xsl:text>
					<xsl:value-of select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity[n1:id/@extension=$formatfio]/n1:assignedPerson/n1:name/identity:Patronymic"/>
					<xsl:text>, </xsl:text>
					<xsl:value-of select="/n1:ClinicalDocument/n1:documentationOf/n1:serviceEvent/n1:performer/n1:assignedEntity[n1:id/@extension=$formatfio]/n1:code/@displayName"/>
                </xsl:when>
			</xsl:choose>	
	</xsl:template>
</xsl:transform>

<!-- Список изменений:

v1.0: первичная разработка

v1.1: Удалено название секции "Пациент"
      Блоки "Пол", "Дата рождения" перенесены в блок "ФИО пациента"
	  Блоки "Полис ОМС", "СНИЛС" и "Номер медицинской карты" перенесены под блок "ФИО пациента" 
	  Скорректированы стили для изменения вида заголовков
	  Исправлена ошибка отображения в секции "Льготная категория"
	  Секция "Льготная категория" переименована на "Льготы"
	  Секция "Жалобы пациента" переименована на "Жалобы"
	  Добавлен блок "Описание" в секции "Анамнез заболевания", "Анамнез жизни" и "Эпидемиологический анамнез"
	  Блок "Степень утраты профессиональной трудоспособности в процентах" переименован на "Степень утраты профессиональной трудоспособности"
	  Исправлена ошибка отображения в блоках "Потенциально-опасные для здоровья социальные факторы", "Вредные производственные факторы" и "Вредные привычки или зависимости"
	  Блок "Занятость" переименован на "Сведения о занятости"
	  Блок "Клинические проявления" переименована на "Клинические проявления патологической реакции"
	  Дата перенесена в блок "Дата формирования документа" в секциях "Результаты инструментального исследования", "Результаты лабораторного исследования" и "Результаты консультации/осмотра врача"
	  Название лабораторных исследований перенесено в блок "Профиль лабораторного исследования" в секции "Результаты лабораторного исследования"
	  Название инструментального исследования перенесено в блок "Вид инструментального исследования" в секции "Результаты инструментального исследования"
	  Скорректирована секция "Проведенное лечение" для отображения в строку
	  Добавлена обработка nullFlavor в блок "Дата рождения"
	  Исправлена ошибка отображения блока "Место проведения"
	  Исправлена ошибка отображения блока "Дата установления инвалидности"
	  Исправлена ошибка отображения секции "Выявленные патологии"
	  Скорректированы секции "Связанные документы" и "Сведения о консультации" в соответствии с формой

v1.2: Изменено название секции "Рекомендации по дальнейшему наблюдению, дообследованию и лечению" на "Рекомендации по дальнейшему наблюдению, дообследованию, лечению и медицинской реабилитации"
      Скорректированы секции "Анамнез заболевания" и "Анамнез жизни" в связи с изменениями в руководстве
	  Скорректирована секция "Объективизированная оценка состояния пациента" по присланным требованиям, добавлена анатомическая локализация
	  Удален код льготы из секции "Льготы"
	  Скорректирована секция "Витальные параметры" в связи с изменениями в руководстве, скорректирован референтный интервал на отображение границ
	  Удален зазор под подписи, удален зазор после таблиц

v1.3: Скорректирован блок "ФИО пациента" под изменения в руководстве

v1.4: Скорректирован блок "ФИО пациента" для правильного отображения при отсутствии информации -->