<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="style.xsl" />
	<xsl:include href="enums.xsl" />
  <xsl:template match="//te2:TraderToEMCSRequest" xmlns:te2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:TRADER-EMCS:REQUEST:V1.00">
    <xsl:for-each select="te2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
	<xsl:template match="ie2:PL812" xmlns:ie2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:PL812:V1.00" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Powiadomienie o przeładunku wyrobów</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Powiadomienie o przeładunku wyrobów</xsl:with-param>
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
                    1 PRZEMIESZCZENIE WYROBÓW AKCYZOWYCH - Dokument e-AD
                  </fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1a Numer ARC</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:ExciseMovementEad/ie2:AdministrativeReferenceCode" />
									</fo:block>
								</fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1b Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:ExciseMovementEad/ie2:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
							</fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2 Szczegóły dotyczące przeładunku wyrobów
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Numer referencyjny właściwego urzędu w miejscu przeładunku</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:CompetentAuthorityReferenceNumber" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Data i czas planowanego przeładunku</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:DateAndTimeOfTranshipment" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Dodatkowe informacje</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:ComplementaryInformation" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2d Zmieniona organizacja przewozu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:ChangedTransportArrangement" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2e Kod rodzaju transportu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:TransportModeCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    2.1 Miejsce przeładunku wyrobów
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2.1a Nazwa miejsca przeładunku</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:PlaceName" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2.1b Ulica</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:StreetName" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2.1c Numer domu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:StreetNumber" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2.1d Kod pocztowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:Postcode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2.1e Miejscowość</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TranshipmentDetails/ie2:PlaceOfTranshipment/ie2:City" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>              
              <xsl:if test="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransportArrangerTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      3 PODMIOT Nowy Organizator Transportu
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3a Numer VAT</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransportArrangerTrader/ie2:VatNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3b Nazwa podmiotu gospodarczego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransportArrangerTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransportArrangerTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransportArrangerTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransportArrangerTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransportArrangerTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransportArrangerTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransporterTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      4 PODMIOT Nowy Przewoźnik
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4a Numer VAT</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransporterTrader/ie2:VatNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4b Nazwa podmiotu gospodarczego</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransporterTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransporterTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransporterTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransporterTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransporterTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4g Kod języka</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:TranshipmentOfProducts/ie2:NewTransporterTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              
              
              
              <xsl:for-each select="ie2:Body/ie2:TranshipmentOfProducts/ie2:TransportDetails">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      5 SZCZEGÓŁY DOTYCZĄCE TRANSPORTU
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5a Kod jednostki transportowej</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:TransportUnitCode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5b Oznaczenie jednostek transportowych</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:IdentityOfTransportUnits" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5c Oznaczenie pieczęci handlowej (zabezpieczenia urzędowego)</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:CommercialSealIdentification" />
                    </fo:block>
                  </fo:table-cell>
                 </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="3" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">5d Informacje o pieczęci (zabezpieczeniu urzędowym)</xsl:with-param>
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
                        <xsl:with-param name="stringIn">5e Dodatkowe informacje</xsl:with-param>
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
						</fo:table-body>
					</fo:table>
					<fo:block id="last-page_{position()}"/>
				</fo:flow>
			</fo:page-sequence>
		</fo:root>
	</xsl:template>
</xsl:stylesheet>