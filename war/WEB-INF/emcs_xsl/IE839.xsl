<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="style.xsl" />
	<xsl:template match="//et:EMCSToTrader" xmlns:et="urn:publicid:-:PL:GOV:MF:EMCS:PHASE2:EMCS-TRADER:REQUEST:V1.00">
	    <xsl:for-each select="et:Message">
	      <xsl:apply-templates />
	    </xsl:for-each>
  </xsl:template>
  <xsl:template match="//et2:EMCSToTrader" xmlns:et2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:EMCS-TRADER:REQUEST:V1.00">
    <xsl:for-each select="et2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
	<xsl:template match="ie:CD839A" xmlns:ie="http://emcs.dgtaxud.ec/v10/cd839/ie" xmlns:tms="http://emcs.dgtaxud.ec/v10/tms">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
				<xsl:call-template name="StopkaStrony">
					<xsl:with-param name="napisStopki">Powiadomienie o odrzuceniu procedury zawieszenia poboru akcyzy przy wywozie lub przywozie</xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
						<xsl:with-param name="napisNaglowka">Powiadomienie o odrzuceniu procedury zawieszenia poboru akcyzy przy wywozie lub przywozie</xsl:with-param>
					</xsl:call-template>
					<fo:table xsl:use-attribute-sets="glowna-tabela">
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-column column-width="proportional-column-width(1)"/>
						<fo:table-body>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										1 Dane odrzucenia
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">1a Data i czas wystosowania</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="formatDate">
											<xsl:with-param name="stringIn" select="ie:Body/ie:RefusalByCustoms/ie:Attributes/ie:DateAndTimeOfIssuance" />
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:if test="ie:Body/ie:RefusalByCustoms/ie:ConsigneeTrader">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											2 PODMIOT odbierający
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">Język elementu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ConsigneeTrader/@language" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">2a Identyfikacja podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ConsigneeTrader/ie:Traderid" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">2b Nazwa podmiotu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ConsigneeTrader/ie:TraderName" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">2c Ulica</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ConsigneeTrader/ie:StreetName" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">2d Numer domu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ConsigneeTrader/ie:StreetNumber" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">2e Kod pocztowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ConsigneeTrader/ie:Postcode" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">2f Miejscowość</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ConsigneeTrader/ie:City" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:RefusalByCustoms/ie:ExportPlaceCustomsOffice/ie:ReferenceNumber">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											3 Urząd wywozu
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">3a Numer referencyjny urzędu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ExportPlaceCustomsOffice/ie:ReferenceNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:RefusalByCustoms/ie:ExportCrossCheckingDiagnoses">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											4 Wynik sprawdzenia z deklaracją eksportową
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4a Lokalny numer referencyjny</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ExportCrossCheckingDiagnoses/ie:LocalReferenceNumber" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4b Numer referencyjny dokumentu</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:ExportCrossCheckingDiagnoses/ie:DocumentReferenceNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:if test="ie:Body/ie:RefusalByCustoms/ie:ExportCrossCheckingDiagnoses/ie:Diagnosis">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
										<fo:block>
											4.1 Diagnoza
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:if>
							<xsl:for-each select="ie:Body/ie:RefusalByCustoms/ie:ExportCrossCheckingDiagnoses/ie:Diagnosis">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy czcionka-tabela-naglowek">
										<fo:block>
											Diagnoza <xsl:value-of select="position()" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4.1a ARC</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:AadReferenceCode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4.1b Unikalny numer referencyjny</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:BodyRecordUniqueReference" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">4.1c Kod diagnozy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:DiagnosisCode" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
										5 Odrzucenie
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">5a Data i czas odrzucenia</xsl:with-param>
										</xsl:call-template>
										<xsl:call-template name="formatDate">
											<xsl:with-param name="stringIn" select="ie:Body/ie:RefusalByCustoms/ie:Rejection/ie:RejectionDateAndTime" />
										</xsl:call-template>
									</fo:block>
								</fo:table-cell>
								<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">5b Kod powodu odrzucenia</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:Rejection/ie:RejectionReasonCode" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
                    6 Odrzucenie przy wywozie
                  </fo:block>
								</fo:table-cell>
							</fo:table-row>
							<xsl:for-each select="ie:Body/ie:RefusalByCustoms/ie:CAadVal">
								<fo:table-row>
									<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy czcionka-tabela-naglowek">
										<fo:block>
                      Odrzucenie przy wywozie <xsl:value-of select="position()" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
								<fo:table-row>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6a ARC</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:AadReferenceCode" />
										</fo:block>
									</fo:table-cell>
									<fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
										<fo:block>
											<xsl:call-template name="label">
												<xsl:with-param name="stringIn">6b Numer porządkowy</xsl:with-param>
											</xsl:call-template>
											<xsl:value-of select="ie:SequenceNumber" />
										</fo:block>
									</fo:table-cell>
								</fo:table-row>
							</xsl:for-each>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
									<fo:block>
                    7 Odrzucenie przy przywozie
                  </fo:block>
								</fo:table-cell>
							</fo:table-row>
							<fo:table-row>
								<fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
									<fo:block>
										<xsl:call-template name="label">
											<xsl:with-param name="stringIn">7a Lokalny numer referencyjny</xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie:Body/ie:RefusalByCustoms/ie:NAadSub/ie:LocalReferenceNumber" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
						</fo:table-body>
					</fo:table>
				  <fo:block id="last-page_{position()}"/>
				</fo:flow>	
			</fo:page-sequence>	
		</fo:root>
	</xsl:template>
  <xsl:template match="ie2:IE839" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE839:V1.51" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
    <fo:root>
      <xsl:call-template name="ukladA4" />
      <fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
        <xsl:call-template name="StopkaStrony">
          <xsl:with-param name="napisStopki">Powiadomienie o odrzuceniu procedury zawieszenia poboru akcyzy przy wywozie lub przywozie</xsl:with-param>
        </xsl:call-template>
        <fo:flow flow-name="xsl-region-body">
          <xsl:call-template name="naglowek-strony">
            <xsl:with-param name="napisNaglowka">Powiadomienie o odrzuceniu procedury zawieszenia poboru akcyzy przy wywozie lub przywozie</xsl:with-param>
          </xsl:call-template>
          <fo:table xsl:use-attribute-sets="glowna-tabela">
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-column column-width="proportional-column-width(1)"/>
            <fo:table-body>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    1 Dane odrzucenia
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">1a Data i czas wystosowania</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="stringIn" select="ie2:Body/ie2:RefusalByCustoms/ie2:Attributes/ie2:DateAndTimeOfIssuance" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:if test="ie2:Body/ie2:RefusalByCustoms/ie2:ConsigneeTrader">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      2 PODMIOT odbierający
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">Język elementu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ConsigneeTrader/@language" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2a Identyfikacja podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ConsigneeTrader/ie2:Traderid" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2b Nazwa podmiotu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ConsigneeTrader/ie2:TraderName" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2c Ulica</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ConsigneeTrader/ie2:StreetName" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2d Numer domu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ConsigneeTrader/ie2:StreetNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2e Kod pocztowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ConsigneeTrader/ie2:Postcode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">2f Miejscowość</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ConsigneeTrader/ie2:City" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:RefusalByCustoms/ie2:ExportPlaceCustomsOffice/ie2:ReferenceNumber">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      3 Urząd wywozu
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">3a Numer referencyjny urzędu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ExportPlaceCustomsOffice/ie2:ReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:RefusalByCustoms/ie2:ExportCrossCheckingDiagnoses">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      4 Wynik sprawdzenia z deklaracją eksportową
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4a Lokalny numer referencyjny</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ExportCrossCheckingDiagnoses/ie2:LocalReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4b Numer referencyjny dokumentu</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:ExportCrossCheckingDiagnoses/ie2:DocumentReferenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:if test="ie2:Body/ie2:RefusalByCustoms/ie2:ExportCrossCheckingDiagnoses/ie2:Diagnosis">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      4.1 Diagnoza
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:if>
              <xsl:for-each select="ie2:Body/ie2:RefusalByCustoms/ie2:ExportCrossCheckingDiagnoses/ie2:Diagnosis">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy czcionka-tabela-naglowek">
                    <fo:block>
                      Diagnoza <xsl:value-of select="position()" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4.1a ARC</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:AdministrativeReferenceCode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4.1b Unikalny numer referencyjny</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:BodyRecordUniqueReference" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">4.1c Kod diagnozy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:DiagnosisCode" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    5 Odrzucenie
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">5a Data i czas odrzucenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:call-template name="formatDate">
                      <xsl:with-param name="stringIn" select="ie2:Body/ie2:RefusalByCustoms/ie2:Rejection/ie2:RejectionDateAndTime" />
                    </xsl:call-template>
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">5b Kod powodu odrzucenia</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:Rejection/ie2:RejectionReasonCode" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    6 Odrzucenie przy wywozie
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:for-each select="ie2:Body/ie2:RefusalByCustoms/ie2:CEadVal">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy czcionka-tabela-naglowek">
                    <fo:block>
                      Odrzucenie przy wywozie <xsl:value-of select="position()" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6a ARC</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:AdministrativeReferenceCode" />
                    </fo:block>
                  </fo:table-cell>
                  <fo:table-cell number-columns-spanned="1" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn">6b Numer porządkowy</xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:SequenceNumber" />
                    </fo:block>
                  </fo:table-cell>
                </fo:table-row>
              </xsl:for-each>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    7 Odrzucenie przy przywozie
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">7a Lokalny numer referencyjny</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:RefusalByCustoms/ie2:NEadSub/ie2:LocalReferenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
            </fo:table-body>
          </fo:table>
          <fo:block id="last-page_{position()}"/>
        </fo:flow>
      </fo:page-sequence>
    </fo:root>
  </xsl:template>
</xsl:stylesheet>