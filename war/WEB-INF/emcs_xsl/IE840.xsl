<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="style.xsl" />
	<xsl:include href="enums.xsl" />
  <xsl:template match="//et2:EMCSToTrader" xmlns:et2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:EMCS-TRADER:REQUEST:V1.00">
    <xsl:for-each select="et2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
	<xsl:template match="ie2:IE840" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE840:V1.51" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Raport ze zdarzenia</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Raport ze zdarzenia</xsl:with-param>
					</xsl:call-template>
					<fo:table xsl:use-attribute-sets="glowna-tabela">
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
                    1 CECHA
                  </fo:block>
								</fo:table-cell>
							</fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1a Typ raportu ze zdarzenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:Attributes/ie2:EventReportMessageType" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1b Data i czas zatwierdzenia raportu ze zdarzenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:Attributes/ie2:DateAndTimeOfValidationOfEventReport" />
                  </fo:block>
                </fo:table-cell>
							</fo:table-row>
              <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      2 NAGŁÓWEK Raportu ze zdarzenia
                    </fo:block>
                  </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Numer raportu ze zdarzenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:HeaderEventReport/ie2:EventReportNumber" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                    <xsl:with-param name="stringIn">2b Lokalny numer raportu ze zdarzenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:HeaderEventReport/ie2:MsOfSubmissionEventReportReference" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:HeaderEventReport/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2d Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:HeaderEventReport/ie2:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2e Numer referencyjny urzędu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:HeaderEventReport/ie2:ReferenceNumberOfExciseOffice" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2f Państwo członkowskie zdarzenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:HeaderEventReport/ie2:MemberStateOfEvent" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      3 Raport ze zdarzenia
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3a Data zdarzenia</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:DateOfEvent" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3b Miejsce zdarzenia</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:PlaceOfEvent" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:PlaceOfEvent/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3c Identyfikator urzędnika</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:ExciseOfficerIdentification" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3d Osoba zgłaszająca zdarzenie</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:SubmittingPerson" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3e Kod osoby zgłaszająca zdarzenie</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:SubmittingPersonCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3f Dodatkowe informacje o osobie zgłaszającej zdarzenie</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:SubmittingPersonComplement" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:SubmittingPersonComplement/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3g Zmieniona organizacja przewozu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:ChangedTransportArrangement" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3h Komentarz</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:Comments" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:EventReport/ie2:Comments/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:for-each select="ie2:Body/ie2:EventReportEnvelope/ie2:EvidenceOfEvent">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      4 Dowód dotyczący zdarzenia
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4a Urząd dostarczający dowód</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:IssuingAuthority" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:IssuingAuthority/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4b Kod typu dowodu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:EvidenceTypeCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4c Dodatkowe informacje</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:EvidenceTypeComplement" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:EvidenceTypeComplement/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4d Numer identyfikacyjny dowodu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ReferenceOfEvidence" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ReferenceOfEvidence/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
              <xsl:if test="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransportArrangerTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      5 PODMIOT Nowy Organizator Transportu
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5a Numer VAT</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransportArrangerTrader/ie2:VatNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5b Nazwa podmiotu gospodarczego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransportArrangerTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransportArrangerTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransportArrangerTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransportArrangerTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransportArrangerTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransportArrangerTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransporterTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      6 PODMIOT Nowy Przewoźnik
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6a Numer VAT</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransporterTrader/ie2:VatNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6b Nazwa podmiotu gospodarczego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransporterTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransporterTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransporterTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransporterTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransporterTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:EventReportEnvelope/ie2:NewTransporterTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:for-each select="ie2:Body/ie2:EventReportEnvelope/ie2:TransportDetails">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      7 SZCZEGÓŁY DOTYCZĄCE TRANSPORTU
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7a Kod jednostki transportowej</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:TransportUnitCode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7b Oznaczenie jednostek transportowych</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:IdentityOfTransportUnits" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7c Oznaczenie pieczęci handlowej (zabezpieczenia urzędowego)</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:CommercialSealIdentification" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7d Informacje o pieczęci (zabezpieczeniu urzędowym)</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:SealInformation" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:SealInformation/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">7e Dodatkowe informacje</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ComplementaryInformation" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ComplementaryInformation/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>                
              </xsl:for-each>
              <xsl:for-each select="ie2:Body/ie2:EventReportEnvelope/ie2:BodyEventReport">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      8 SZCZEGÓŁY raportu ze zdarzenia
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8a Kod rodzaju zdarzenia</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:EventTypeCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8b Informacje powiązane</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:AssociatedInformation" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:AssociatedInformation/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8c Numer identyfikacyjny pozycji towarowej</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:BodyRecordUniqueReference" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8d Niedobór lub nadwyżka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:IndicatorOfShortageOrExcess" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">8e Stwierdzony niedobór lub nadwyżka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ObservedShortageOrExcess" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
						</fo:table-body>
					</fo:table>
					<fo:block id="last-page_{position()}"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>