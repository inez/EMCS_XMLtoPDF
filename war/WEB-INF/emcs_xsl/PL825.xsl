<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="style.xsl" />
	<xsl:include href="enums.xsl" />
  <xsl:template match="//te2:TraderToEMCSRequest" xmlns:te2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:TRADER-EMCS:REQUEST:V1.00">
    <xsl:for-each select="te2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
	<xsl:template match="ie2:PL825" xmlns:ie2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:PL825:V1.00" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Projekt podziału przemieszczenia</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Projekt podziału przemieszczenia</xsl:with-param>
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
                    1 Dzielone e-AD
                  </fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1a Dzielone ARC</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:SplittingEad/ie2:UpstreamArc" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
              <xsl:for-each select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:SplitDetailsEad">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      2 Wydzielone e-AD
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2a Lokalny numer referencyjny</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:LocalReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2b Czas przewozu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:JourneyTime" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2c Zmieniona organizacja przewozu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:ChangedTransportArrangement" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      2.1 ZMIENIONE Miejsce Przeznaczenia
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2.1a Kod rodzaju miejsca przeznaczenia</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:DestinationChanged/ie2:DestinationTypeCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <xsl:if test="ie2:NewConsigneeTrader">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        2.2 PODMIOT Nowy Odbiorca
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.2a Identyfikacja podmiotu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewConsigneeTrader/ie2:Traderid" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.2b Nazwa podmiotu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewConsigneeTrader/ie2:TraderName" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.2c Ulica</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewConsigneeTrader/ie2:StreetName" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.2d Numer domu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewConsigneeTrader/ie2:StreetNumber" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.2e Kod pocztowy</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewConsigneeTrader/ie2:Postcode" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.2f Miejscowość</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewConsigneeTrader/ie2:City" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.2g Kod języka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewConsigneeTrader/@language" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                <xsl:if test="ie2:DeliveryPlaceTrader">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        2.3 PODMIOT Miejsce Dostawy
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.3a Identyfikacja podmiotu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DeliveryPlaceTrader/ie2:Traderid" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.3b Nazwa podmiotu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DeliveryPlaceTrader/ie2:TraderName" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.3c Ulica</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DeliveryPlaceTrader/ie2:StreetName" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.3d Numer domu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DeliveryPlaceTrader/ie2:StreetNumber" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.3e Kod pocztowy</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DeliveryPlaceTrader/ie2:Postcode" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.3f Miejscowość</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DeliveryPlaceTrader/ie2:City" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.3g Kod języka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DeliveryPlaceTrader/@language" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                <xsl:if test="ie2:DeliveryPlaceCustomsOffice">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        2.4 URZĄD Miejsce Dostawy – Urząd Celny
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.4a Numer referencyjny urzędu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DeliveryPlaceCustomsOffice/ie2:ReferenceNumber" />
                      </fo:block>
                    </fo:table-cell>                  
                  </fo:table-row>
                </xsl:if>
                <xsl:if test="ie2:NewTransportArrangerTrader">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        2.5 PODMIOT Nowy Organizator Transportu
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.5a Numer VAT</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransportArrangerTrader/ie2:VatNumber" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.5b Nazwa podmiotu gospodarczego</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransportArrangerTrader/ie2:TraderName" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.5c Ulica</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransportArrangerTrader/ie2:StreetName" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.5d Numer domu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransportArrangerTrader/ie2:StreetNumber" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.5e Kod pocztowy</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransportArrangerTrader/ie2:Postcode" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.5f Miejscowość</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransportArrangerTrader/ie2:City" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.5g Kod języka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransportArrangerTrader/@language" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                <xsl:if test="ie2:NewTransporterTrader">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        2.6 PODMIOT Nowy Przewoźnik
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.6a Numer VAT</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransporterTrader/ie2:VatNumber" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.6b Nazwa podmiotu gospodarczego</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransporterTrader/ie2:TraderName" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.6c Ulica</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransporterTrader/ie2:StreetName" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.6d Numer domu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransporterTrader/ie2:StreetNumber" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.6e Kod pocztowy</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransporterTrader/ie2:Postcode" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.6f Miejscowość</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransporterTrader/ie2:City" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.6g Kod języka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NewTransporterTrader/@language" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                </xsl:if>
                <xsl:for-each select="ie2:TransportDetails">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        2.7 SZCZEGÓŁY DOTYCZĄCE TRANSPORTU
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.7a Kod jednostki transportowej</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:TransportUnitCode" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.7b Oznaczenie jednostek transportowych</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:IdentityOfTransportUnits" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.7c Oznaczenie pieczęci handlowej (zabezpieczenia urzędowego)</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:CommercialSealIdentification" />
                      </fo:block>
                    </fo:table-cell>
                   </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.7d Informacje o pieczęci (zabezpieczeniu urzędowym)</xsl:with-param>
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
                          <xsl:with-param name="stringIn">2.7e Dodatkowe informacje</xsl:with-param>
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
                <xsl:for-each select="ie2:BodyEad">
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                      <fo:block>
                        2.8 e-AD Wyroby
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8a Numer identyfikacyjny pozycji towarowej</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:BodyRecordUniqueReference" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8b Kod wyrobu akcyzowego</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:ExciseProductCode" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8c Kod CN</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:CnCode" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8d Ilość</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:Quantity" />
                      </fo:block>
                    </fo:table-cell>                  
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8e Masa brutto</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:GrossWeight" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8f Masa netto</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NetWeight" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8g Zawartość alkoholu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:AlcoholicStrength" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8h Stopień Plato</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:DegreePlato" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8i Znaki akcyzy</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:FiscalMark" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:FiscalMark/@language" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8j Znak akcyzy</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:FiscalMarkUsedFlag" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8k Wielkość producenta</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:SizeOfProducer" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8l Gęstość</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:Density" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8m Opis handlowy</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:CommercialDescription" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:CommercialDescription/@language" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8n Marka wyrobów</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:BrandNameOfProducts" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">Kod języka</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:BrandNameOfProducts/@language" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8o Oleje opałowe niepodlegające barwieniu i oznaczeniu</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:NotColouredAndMarkedFuelOils" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <fo:table-row>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8p Ilość w dodatkowej jednostce miary</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:AdditionalQuantity" />
                      </fo:block>
                    </fo:table-cell>
                    <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                      <fo:block>
                        <xsl:call-template name="label">
                          <xsl:with-param name="stringIn">2.8q Rodzaj paliwa</xsl:with-param>
                        </xsl:call-template>
                        <xsl:value-of select="ie2:FuelType" />
                      </fo:block>
                    </fo:table-cell>
                  </fo:table-row>
                  <xsl:for-each select="ie2:Package">
                    <fo:table-row>
                      <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                        <fo:block>
                          2.8.1 OPAKOWANIE
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                      <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                        <fo:block>
                          <xsl:call-template name="label">
                            <xsl:with-param name="stringIn">2.8.1a Kod rodzaju opakowań</xsl:with-param>
                          </xsl:call-template>
                          <xsl:value-of select="ie2:KindOfPackages" />
                        </fo:block>
                      </fo:table-cell>
                      <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                        <fo:block>
                          <xsl:call-template name="label">
                            <xsl:with-param name="stringIn">2.8.1b Liczba opakowań</xsl:with-param>
                          </xsl:call-template>
                          <xsl:value-of select="ie2:NumberOfPackages" />
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                      <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                        <fo:block>
                          <xsl:call-template name="label">
                            <xsl:with-param name="stringIn">2.8.1c Oznaczenie pieczęci handlowej (zabezpieczenia urzędowego)</xsl:with-param>
                          </xsl:call-template>
                          <xsl:value-of select="ie2:CommercialSealIdentification" />
                        </fo:block>
                      </fo:table-cell>
                    </fo:table-row>
                    <fo:table-row>
                      <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                        <fo:block>
                          <xsl:call-template name="label">
                            <xsl:with-param name="stringIn">2.8.1d Informacje o pieczęci (zabezpieczeniu urzędowym)</xsl:with-param>
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
                  </xsl:for-each>
                </xsl:for-each>
              </xsl:for-each>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 Kraj członkowski podziału
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3a Kod państwa członkowskiego</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:MsaOfSplitting/ie2:MemberStateCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      4 Szczegóły dotyczące przeładunku wyrobów
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4a Numer referencyjny właściwego urzędu w miejscu przeładunku</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails/ie2:CompetentAuthorityReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4b Data i czas planowanego przeładunku</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails/ie2:DateAndTimeOfTranshipment" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4c Dodatkowe informacje</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails/ie2:ComplementaryInformation" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      4.1 Miejsce przeładunku wyrobów
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4.1a Nazwa miejsca przeładunku</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:PlaceName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4.1b Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4.1c Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4.1d Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4.1e Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:SubmittedDraftOfSplittingOperation/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
						</fo:table-body>
					</fo:table>
					<fo:block id="last-page_{position()}"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>