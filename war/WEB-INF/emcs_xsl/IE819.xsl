<?xml version="1.0" encoding="utf-8" ?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" xmlns:fo="http://www.w3.org/1999/XSL/Format">
	<xsl:include href="style.xsl" />
	<xsl:include href="enums.xsl" />
  <xsl:template match="//te2:TraderToEMCSRequest" xmlns:te2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:TRADER-EMCS:REQUEST:V1.00">
    <xsl:for-each select="te2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
  <xsl:template match="//et2:EMCSToTrader" xmlns:et2="urn:publicid:-:PL:GOV:MF:EMCS:PHASE3:EMCS-TRADER:REQUEST:V1.00">
    <xsl:for-each select="et2:Message">
      <xsl:apply-templates />
    </xsl:for-each>
  </xsl:template>
	<xsl:template match="ie2:IE819" xmlns:ie2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:IE819:V1.51" xmlns:tms2="urn:publicid:-:EC:DGTAXUD:EMCS:PHASE3:TMS:V1.51">
		<fo:root>
			<xsl:call-template name="ukladA4" />
			<fo:page-sequence master-reference="single" language="pl" initial-page-number="auto">
                <xsl:variable name="CzyOdrzucenie">
                    <xsl:choose>
                        <xsl:when test="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:AlertOrRejection/ie2:EadRejectedFlag = 1">1</xsl:when>
                        <xsl:otherwise>0</xsl:otherwise>
                    </xsl:choose>
                </xsl:variable>
                <xsl:variable name="tekst">
                  <xsl:choose>
                    <xsl:when test="$CzyOdrzucenie = 0">
                        Ostrzeżenie dla przemieszczenia
                    </xsl:when>
                    <xsl:otherwise>
                        Odrzucenie przemieszczenia
                    </xsl:otherwise>
                  </xsl:choose>
                </xsl:variable>
				<xsl:call-template name="StopkaStrony">
                  <xsl:with-param name="napisStopki">
                    <xsl:value-of select="$tekst" />
                  </xsl:with-param>
				</xsl:call-template>
				<fo:flow flow-name="xsl-region-body">
					<xsl:call-template name="naglowek-strony">
                      <xsl:with-param name="napisNaglowka">
                        <xsl:value-of select="$tekst" />
                      </xsl:with-param>
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
											<xsl:with-param name="stringIn">
                                              <xsl:choose>
                                                <xsl:when test="$CzyOdrzucenie = 0">
                                                    1a Data i czas zatwierdzenia ostrzeżenia dla przemieszczenia
                                                </xsl:when>
                                                <xsl:otherwise>
                                                    1a Data i czas zatwierdzenia odrzucenia przemieszczenia
                                                </xsl:otherwise>
                                              </xsl:choose>
                                            </xsl:with-param>
										</xsl:call-template>
										<xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:Attributes/ie2:DateAndTimeOfValidationOfAlertRejection" />
									</fo:block>
								</fo:table-cell>
							</fo:table-row>
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                    <fo:block>
                      2 PODMIOT Odbierający
                    </fo:block>
                  </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2a Identyfikacja podmiotu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ConsigneeTrader/ie2:Traderid" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2b Nazwa podmiotu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ConsigneeTrader/ie2:TraderName" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2c Ulica</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ConsigneeTrader/ie2:StreetName" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2d Numer domu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ConsigneeTrader/ie2:StreetNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2e Kod pocztowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ConsigneeTrader/ie2:Postcode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2f Miejscowość</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ConsigneeTrader/ie2:City" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">2g Kod języka</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ConsigneeTrader/@language" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    3 PRZEMIESZCZENIE WYROBÓW AKCYZOWYCH - Dokument e-AD
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3a Numer ARC</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ExciseMovementEad/ie2:AdministrativeReferenceCode" />
                  </fo:block>
                </fo:table-cell>
                <fo:table-cell number-columns-spanned="2" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">3b Numer porządkowy</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:ExciseMovementEad/ie2:SequenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    4 URZĄD – właściwy urząd w miejscu dostawy
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label">
                      <xsl:with-param name="stringIn">4a Numer referencyjny urzędu</xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:DestinationOffice/ie2:ReferenceNumber" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    <xsl:choose>
                      <xsl:when test="$CzyOdrzucenie = 0">
                          5 Ostrzeżenie
                      </xsl:when>
                      <xsl:otherwise>
                          5 Odrzucenie
                      </xsl:otherwise>
                    </xsl:choose>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                  <fo:block>
                    <xsl:call-template name="label"><xsl:with-param name="stringIn"><xsl:choose>
                          <xsl:when test="$CzyOdrzucenie = 0">5a Data ostrzeżenia</xsl:when>
                          <xsl:otherwise>5a Data odrzucenia</xsl:otherwise>
                        </xsl:choose></xsl:with-param>
                    </xsl:call-template>
                    <xsl:value-of select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:AlertOrRejection/ie2:DateOfAlertOrRejection" />
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <fo:table-row>
                <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-szary">
                  <fo:block>
                    <xsl:choose>
                      <xsl:when test="$CzyOdrzucenie = 0">
                          6 Powód ostrzeżenia
                      </xsl:when>
                      <xsl:otherwise>
                          6 Powód odrzucenia
                      </xsl:otherwise>
                    </xsl:choose>
                  </fo:block>
                </fo:table-cell>
              </fo:table-row>
              <xsl:for-each select="ie2:Body/ie2:AlertOrRejectionOfEAD/ie2:AlertOrRejectionOfEadReason">
                <fo:table-row>
                  <fo:table-cell number-columns-spanned="4" xsl:use-attribute-sets="glowna-tabela-wiersz-bialy">
                    <fo:block>
                      <xsl:call-template name="label">
                        <xsl:with-param name="stringIn"><xsl:choose>
                            <xsl:when test="$CzyOdrzucenie = 0">6a Kod przyczyny ostrzeżenia</xsl:when>
                            <xsl:otherwise>6a Kod przyczyny odrzucenia</xsl:otherwise>
                          </xsl:choose></xsl:with-param>
                      </xsl:call-template>
                      <xsl:value-of select="ie2:AlertOrRejectionOfEadReasonCode" />
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